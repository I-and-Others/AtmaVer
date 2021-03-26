using System.Collections.Generic;
using System.Threading.Tasks;
using AtmaVer.Entities;

namespace AtmaVer.Core.Services
{
    public interface IUserRoleService
    {
        Task<UserRole> CreateUserRole(int userId, int roleId);
        Task DeleteUserRole(UserRole userRole);
    }
}