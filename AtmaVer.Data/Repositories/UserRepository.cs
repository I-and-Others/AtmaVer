using Microsoft.EntityFrameworkCore;
using AtmaVer.Entities;
using AtmaVer.Core.Repositories;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using AtmaVer.Data.DAL;

namespace AtmaVer.Data.Repositories
{
    public class UserRepository : Repository<User>, IUserRepository
    {
        public UserRepository(ApplicationDbContext context) : base(context) { }
        
        public async Task<IEnumerable<User>> GetAllWithRoleAsync()
        {
            return await ApplicationDbContext.Users
                .Include(a => a.UserRoles)
                    .ThenInclude(b => b.Role)
                .ToListAsync();
        }

        public ApplicationDbContext ApplicationDbContext
        {
            get { return _context as ApplicationDbContext; }
        }
    }
}