using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using AtmaVer.Core.Services;
using AtmaVer.Entities;
using AutoMapper;
using AtmaVer.Api.Validators;
using AtmaVer.Api.DTO;
using AtmaVer.Services.Helpers;
using AtmaVer.Api.DTO.RoleDTO;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using AtmaVer.Services.Services;

namespace AtmaVer.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    // [Authorize(AuthenticationSchemes = Microsoft.AspNetCore.Authentication.JwtBearer.JwtBearerDefaults.AuthenticationScheme, Roles = "user, admin")]
    public class ImagesController : ControllerBase
    {
        private readonly IUserImageService _userImageService;
        private readonly IImage _image;
        public ImagesController(IUserImageService userImageService, IImage image)
        {
            this._userImageService = userImageService;
            this._image = image;
        }

        [HttpPost("")]
        public async Task<ActionResult> CreateUserImage(int userId, IFormFile file)
        {

            var newUserImage = await _userImageService.CreateUserImage(userId, await _image.UploadAsync(file, "files", "media"));

            // var role = await _roleService.GetRoleById(newRole.Id);

            return Ok();
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteUserImage(int id)
        {
            // var role = await _roleService.GetRoleById(id);

            // await _roleService.DeleteRole(role);

            return NoContent();
        }
    }
}