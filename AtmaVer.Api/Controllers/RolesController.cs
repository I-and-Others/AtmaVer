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

namespace AtmaVer.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
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
    }
}