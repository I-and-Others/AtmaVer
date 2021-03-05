using Microsoft.EntityFrameworkCore;
using AtmaVer.Entities;
using AtmaVer.Core.Repositories;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using AtmaVer.Data.DAL;
using AtmaVer.Services.Helpers;

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

        public async Task<User> UserLogin(string email, string password)
        {
            var user = await ApplicationDbContext.Users
                .Include(x => x.UserRoles)
                    .ThenInclude(x => x.Role).FirstOrDefaultAsync(x => x.Email == email.Trim().ToLower());
                                                        
            if(user != null)
            {
                if (HashHelper.VerifyPasswordHash(password, user.SecretKey, user.PasswordHash))
                {
                    return user;
                }
            }
            return null;
        }
        
        public ApplicationDbContext ApplicationDbContext
        {
            get { return _context as ApplicationDbContext; }
        }
    }
}