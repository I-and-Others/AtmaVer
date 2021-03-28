using System.Threading.Tasks;
using AtmaVer.Core;
using AtmaVer.Core.Repositories;
using AtmaVer.Data.DAL;
using AtmaVer.Data.Repositories;

namespace AtmaVer.Data
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly ApplicationDbContext _context;
        private UserRepository _userRepository;
        private UserRoleRepository _userRoleRepository;
        private UserImageRepository _userImageRepository;
        private RoleRepository _roleRepository;
        private AdvertisementRepository _advertisementRepository;
        private ProductRepository _productRepository;

        public UnitOfWork(ApplicationDbContext context)
        {
            this._context = context;
        }

        public IUserRepository Users => _userRepository = _userRepository ?? new UserRepository(_context);
        public IUserRoleRepository UserRoles => _userRoleRepository = _userRoleRepository ?? new UserRoleRepository(_context);
        public IUserImageRepository UserImages => _userImageRepository = _userImageRepository ?? new UserImageRepository(_context);
        public IRoleRepository Roles => _roleRepository = _roleRepository ?? new RoleRepository(_context);
        public IAdvertisementRepository Advertisements => _advertisementRepository = _advertisementRepository ?? new AdvertisementRepository(_context);
        public IProductRepository Products => _productRepository = _productRepository ?? new ProductRepository(_context);

        public async Task<int> CommitAsync()
        {
            return await _context.SaveChangesAsync();
        }

        public void Dispose()
        {
            _context.Dispose();
        }
    }
}