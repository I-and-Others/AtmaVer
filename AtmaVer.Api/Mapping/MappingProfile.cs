using AutoMapper;
using AtmaVer.Api.DTO.UserDTO;
using AtmaVer.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AtmaVer.Api.DTO.RoleDTO;

namespace AtmaVer.Api.Mapping
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            // Domain to Resource
            CreateMap<User, UserDTO>();
            CreateMap<Role, RoleDTO>();

            // Resource to Domain
            CreateMap<UserDTO, User>();
            CreateMap<RoleDTO, Role>();

            CreateMap<CreateUserDTO, User>();
            CreateMap<CreateRoleDTO, Role>();
        }
    }
}