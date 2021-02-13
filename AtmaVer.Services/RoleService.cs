using AtmaVer.Core;
using AtmaVer.Entities;
using AtmaVer.Core.Services;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace AtmaVer.Services
{
    public class RoleService : IRoleService
    {
        private readonly IUnitOfWork _unitOfWork;
        
        public RoleService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }

        public async Task<Role> CreateRole(Role newRole)
        {
            newRole.SlugUrl = newRole.Name.Trim();
            newRole.UrlId = _unitOfWork.Roles.TotalCount();
            await _unitOfWork.Roles.AddAsync(newRole);
            return newRole;
        }

        public async Task DeleteRole(Role role)
        {
            _unitOfWork.Roles.Remove(role);

            await _unitOfWork.CommitAsync();
        }

        public async Task<IEnumerable<Role>> GetAllRoles()
        {
            return await _unitOfWork.Roles.GetAllAsync();
        }

        public async Task<Role> GetRoleById(int id)
        {
            return await _unitOfWork.Roles.GetByIdAsync(id);
        }

        public async Task UpdateRole(Role roleToBeUpdated, Role role)
        {
            roleToBeUpdated.Name = role.Name;

            await _unitOfWork.CommitAsync();
        }
    }
}