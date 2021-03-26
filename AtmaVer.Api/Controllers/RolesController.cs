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

namespace AtmaVer.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = Microsoft.AspNetCore.Authentication.JwtBearer.JwtBearerDefaults.AuthenticationScheme, Roles = "admin")]
    public class RolesController : ControllerBase
    {
        private readonly IRoleService _roleService;
        private readonly IMapper _mapper;
        public RolesController(IRoleService roleService, IMapper mapper)
        {
            this._roleService = roleService;
            this._mapper = mapper;
        }

        [HttpGet("")]
        public async Task<ActionResult<IEnumerable<RoleDTO>>> GetAllRoles()
        {
            var roles = await _roleService.GetAllRoles();
            var rolesResources = _mapper.Map<IEnumerable<Role>, IEnumerable<Role>>(roles);

            return Ok(rolesResources);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<RoleDTO>> GetRoleById(int id)
        {
            var role = await _roleService.GetRoleById(id);
            var roleResource = _mapper.Map<Role, RoleDTO>(role);

            return Ok(roleResource);
        }

        [HttpPost("")]
        public async Task<ActionResult<RoleDTO>> CreateRole([FromBody] CreateRoleDTO createRoleResource)
        {
            var validator = new CreateRoleResourceValidator();
            var validationResult = await validator.ValidateAsync(createRoleResource);

            if (!validationResult.IsValid)
                return BadRequest(validationResult.Errors); // this needs refining, but for demo it is ok

            var roleToCreate = _mapper.Map<CreateRoleDTO, Role>(createRoleResource);

            var newRole = await _roleService.CreateRole(roleToCreate);

            var role = await _roleService.GetRoleById(newRole.Id);

            var roleResource = _mapper.Map<Role, RoleDTO>(role);

            return Ok(roleResource);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<RoleDTO>> UpdateRole(int id, [FromBody] CreateRoleDTO saveRoleResource)
        {
            var validator = new CreateRoleResourceValidator();
            var validationResult = await validator.ValidateAsync(saveRoleResource);

            if (!validationResult.IsValid)
                return BadRequest(validationResult.Errors); // this needs refining, but for demo it is ok

            var roleToBeUpdated = await _roleService.GetRoleById(id);

            if (roleToBeUpdated == null)
                return NotFound();

            var role = _mapper.Map<CreateRoleDTO, Role>(saveRoleResource);

            await _roleService.UpdateRole(roleToBeUpdated, role);

            var updatedRole = await _roleService.GetRoleById(id);

            var updatedRoleResource = _mapper.Map<Role, RoleDTO>(updatedRole);

            return Ok(updatedRoleResource);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteRole(int id)
        {
            var role = await _roleService.GetRoleById(id);

            await _roleService.DeleteRole(role);

            return NoContent();
        }
    }
}