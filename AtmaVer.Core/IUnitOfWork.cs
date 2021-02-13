using System;
using System.Threading.Tasks;
using AtmaVer.Core.Repositories;
namespace AtmaVer.Core
{
    public interface IUnitOfWork : IDisposable
    {
        IUserRepository Users { get; }
        IUserRoleRepository UserRoles { get; }
        IRoleRepository Roles { get; }
        Task<int> CommitAsync();
    }
}