using System;
using System.Threading.Tasks;
using AtmaVer.Core.Repositories;
namespace AtmaVer.Core
{
    public interface IUnitOfWork : IDisposable
    {
        IUserRepository Users { get; }
        IUserRoleRepository UserRoles { get; }
        IUserImageRepository UserImages { get; }
        IRoleRepository Roles { get; }
        IAdvertisementRepository Advertisements { get; }
        IProductRepository Products { get; }
        Task<int> CommitAsync();
    }
}