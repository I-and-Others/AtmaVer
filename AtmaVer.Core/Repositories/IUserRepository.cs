using System.Collections.Generic;
using System.Threading.Tasks;
using AtmaVer.Entities;

namespace AtmaVer.Core.Repositories
{
    public interface IUserRepository : IRepository<User>
    {
        Task<IEnumerable<User>> GetAllWithRoleAsync();
    }
}