using System.Collections.Generic;
using System.Threading.Tasks;
using AtmaVer.Entities;

namespace AtmaVer.Core.Services
{
    public interface IUserService
    {
        Task<IEnumerable<User>> GetAllUsers();
        Task<User> GetUserById(int id);
        Task<User> CreateUser(User newUser);
        Task UpdateUser(User userToBeUpdated, User user);
        Task DeleteUser(User user);
        Task<User> UserLogin(string email, string password);
    }
}