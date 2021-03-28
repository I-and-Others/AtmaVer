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
    public class UserImageRepository : Repository<UserImage>, IUserImageRepository
    {
        public UserImageRepository(ApplicationDbContext context) : base(context) { }
        

        public ApplicationDbContext ApplicationDbContext
        {
            get { return _context as ApplicationDbContext; }
        }
    }
}