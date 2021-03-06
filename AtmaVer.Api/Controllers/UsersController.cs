using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using AtmaVer.Core.Services;
using AtmaVer.Entities;
using AutoMapper;
using AtmaVer.Api.DTO.UserDTO;
using AtmaVer.Api.Validators;
using AtmaVer.Api.DTO;
using AtmaVer.Services.Helpers;
using Microsoft.AspNetCore.Authorization;
using AtmaVer.Api.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;

namespace AtmaVer.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = Microsoft.AspNetCore.Authentication.JwtBearer.JwtBearerDefaults.AuthenticationScheme, Roles = "user, admin")]
    public class UsersController : ControllerBase
    {
        private readonly ILogger<UsersController> _logger;
        private readonly IUserService _userService;
        private readonly IMapper _mapper;
        private readonly LoginUser loginUser;
        public UsersController(IUserService userService, 
                                IMapper mapper, 
                                IHttpContextAccessor httpContext,
                                ILogger<UsersController> logger)
        {
            this._userService = userService;
            this._mapper = mapper;
            this._logger = logger;

            var token = httpContext.HttpContext.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();
            if (token != null)
            {
                JwtDecoder jwtHelper = new JwtDecoder();
                loginUser = jwtHelper.DecodeJwt(token);
            }
        }

        [HttpGet("")]
        public async Task<ActionResult<IEnumerable<UserDTO>>> GetAllUsers()
        {
            var users = await _userService.GetAllUsers();
            var usersResources = _mapper.Map<IEnumerable<User>, IEnumerable<UserDTO>>(users);

            return Ok(usersResources);
        }

        [HttpPost("")]
        public async Task<ActionResult<UserDTO>> CreateUser([FromBody] CreateUserDTO createUserResource)
        {
            var validator = new CreateUserResourceValidator();
            var validationResult = await validator.ValidateAsync(createUserResource);

            if (!validationResult.IsValid)
                return BadRequest(validationResult.Errors); // this needs refining, but for demo it is ok

            var userToCreate = _mapper.Map<CreateUserDTO, User>(createUserResource);
            userToCreate.PasswordHash = HashHelper.CreatePasswordHash(createUserResource.Password, userToCreate.SecretKey);
            var newUser = await _userService.CreateUser(userToCreate);

            var user = await _userService.GetUserById(newUser.Id);

            var userResource = _mapper.Map<User, UserDTO>(user);

            return Ok(userResource);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<UserDTO>> GetUserById(int id)
        {
            var user = await _userService.GetUserById(id);
            var userResource = _mapper.Map<User, UserDTO>(user);

            return Ok(userResource);
        }

        [HttpGet("")]
        public async Task<ActionResult<UserDTO>> GetCurrentUser()
        {
            var user = await _userService.GetUserById(loginUser.Id);
            var userResource = _mapper.Map<User, UserDTO>(user);

            return Ok(userResource);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<UserDTO>> UpdateUser(int id, [FromBody] SaveUserDTO saveUserResource)
        {
            /*
                TODO Validator yazılacak
            */
            // var validator = new CreateUserResourceValidator();
            // var validationResult = await validator.ValidateAsync(saveUserResource);

            // if (!validationResult.IsValid)
            //     return BadRequest(validationResult.Errors); // this needs refining, but for demo it is ok

            var userToBeUpdated = await _userService.GetUserById(id);

            if (userToBeUpdated == null)
                return NotFound();

            var user = _mapper.Map<SaveUserDTO, User>(saveUserResource);
            user.PasswordHash = HashHelper.CreatePasswordHash(saveUserResource.Password, userToBeUpdated.SecretKey);
            await _userService.UpdateUser(userToBeUpdated, user);

            var updatedUser = await _userService.GetUserById(id);

            var updatedUserResource = _mapper.Map<User, UserDTO>(updatedUser);

            return Ok(updatedUserResource);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteUser(int id)
        {
            var user = await _userService.GetUserById(id);

            await _userService.DeleteUser(user);

            return NoContent();
        }
    }
}