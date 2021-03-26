using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using AtmaVer.Api.Models;
using AtmaVer.Core.Services;
using AtmaVer.Entities;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using AtmaVer.Api.DTO.UserDTO;
using AtmaVer.Api.Validators;
using AtmaVer.Services.Helpers;
using AutoMapper;

namespace AtmaVer.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly IUserService _userService;
        private readonly IUserRoleService _userRoleService;
        private readonly IConfiguration _config;
        private readonly IMapper _mapper;
        

        public LoginController(IUserService userService, IConfiguration config, IMapper mapper, IUserRoleService userRoleService)
        {
            this._userService = userService;
            this._config = config;
            this._mapper = mapper;
            this._userRoleService = userRoleService;
        }


        /// <summary>
        /// Kullanıcı Login İşlemi
        /// </summary>
        /// <param name="Email"></param>
        /// <param name="Password"></param>
        /// /// <remarks>
        /// Email ve Password ile Giriş İşlemi yaptıktan sonra geriye Token döner. Bu tokenı Header'a eklemeniz gerekmektedir. User Role tanımlı fonksiyonlara giriş yapmış kullanıcının Rol kontrolu yapılır! (Hasta,Doktor,Hemşire)
        /// </remarks>
        /// <response code="200">
        /// {
        ///     "userId": Id,
        ///     "typeId": TypeId,
        ///     "userType": "TypeName",
        ///     "token": "tokendata"
        /// }
        /// </response>
        /// <response code="401">
        /// {  "type": "",  "title": "Unauthorized",  "status": 401,  "traceId": "|41abad18-40f461b4ab5cbeda." 
        /// </response>
        [HttpPost]
        public async Task<IActionResult> Login(UserLoginModel user)
        {
            try
            {
                IActionResult response = Unauthorized();
                User data = await _userService.UserLogin(user.Email, user.Password);
                if (data!=null)
                {
                    var StrToken = GenerateJSONWebToken(data);
                        response = Ok( new
                        {
                            token = StrToken,
                            message = "Giriş başarılı"
                        });
                }
                return response;
            }
            catch (Exception ex)
            {
                // LogsServices.Log("Login - GenerateJSONWebToken", ex.Message.ToString(), 3);
                return null;
            }            
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
            await _userRoleService.CreateUserRole(user.Id, 2); // Admin => 1, User => 2

            var userResource = _mapper.Map<User, UserDTO>(user);

            return Ok(userResource);
        }

        
        [ApiExplorerSettings(IgnoreApi = true)]//swagger tarafından görüllmesini istemidiğimiz fonksiyonlara yazılmalıdır.
        private string GenerateJSONWebToken(User user)
        {
            try
            {
                var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
                var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

                var claims = new []
                {
                    new Claim(ClaimTypes.Actor, user.Id.ToString()),
                    new Claim(JwtRegisteredClaimNames.Sub, user.UserName),
                    new Claim(JwtRegisteredClaimNames.Email, user.Email),
                    new Claim(ClaimTypes.Role, "user"),
                    new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
                };

                var token = new JwtSecurityToken(
                    issuer: _config["Jwt:Issuer"],
                    audience: _config["Jwt:Issuer"],
                    claims,
                    expires: DateTime.Now.AddMinutes(120),
                    signingCredentials: credentials);

                var encodetoken = new JwtSecurityTokenHandler().WriteToken(token);
                return encodetoken;
            }
            catch (Exception ex)
            {
                // LogsServices.Log("Login - GenerateJSONWebToken", ex.Message.ToString(), 3);
                return ex.ToString();
            }
           
        }
    }
}