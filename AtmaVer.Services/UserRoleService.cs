using AtmaVer.Core;
using AtmaVer.Entities;
using AtmaVer.Core.Services;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace AtmaVer.Services
{
    public class UserRoleService : IUserRoleService
    {
        private readonly IUnitOfWork _unitOfWork;
        
        public UserRoleService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }

        public async Task<UserRole> CreateUserRole(int userId, int  roleId)
        {
            UserRole newUserRole = new UserRole
            {
                UserId = userId,
                RoleId = roleId,
                SlugUrl = "user-role",
                UrlId = _unitOfWork.UserRoles.TotalCount() + 1,
                IsActive = true
            };
            await _unitOfWork.UserRoles.AddAsync(newUserRole);
            await _unitOfWork.CommitAsync();
            return newUserRole;
        }

        public async Task DeleteUserRole(UserRole userRole)
        {
            _unitOfWork.UserRoles.Remove(userRole);

            await _unitOfWork.CommitAsync();
        }
    }
}