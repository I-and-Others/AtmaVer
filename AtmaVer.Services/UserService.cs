using AtmaVer.Core;
using AtmaVer.Entities;
using AtmaVer.Core.Services;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace AtmaVer.Services
{
    public class UserService : IUserService
    {
        private readonly IUnitOfWork _unitOfWork;
        public UserService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public async Task<User> CreateUser(User newUser)
        {
            await _unitOfWork.Users
                .AddAsync(newUser);

            UserRole newUserRole = new UserRole
            {
                UserId = GetUserById(newUser.Id).Id,
                RoleId = _unitOfWork.Roles.SingleOrDefaultAsync(x => x.Name == "user").Id,
                SlugUrl = "user-role",
                UrlId = _unitOfWork.UserRoles.TotalCount() + 1,
                IsActive = true
            };
            await _unitOfWork.UserRoles.AddAsync(newUserRole);

            return newUser;
        }

        public async Task DeleteUser(User user)
        {
            _unitOfWork.Users.Remove(user);

            await _unitOfWork.CommitAsync();
        }

        public async Task<IEnumerable<User>> GetAllUsers()
        {
            return await _unitOfWork.Users.GetAllAsync();
        }

        public async Task<User> GetUserById(int id)
        {
            return await _unitOfWork.Users.GetByIdAsync(id);
        }

        public async Task UpdateUser(User userToBeUpdated, User user)
        {
            userToBeUpdated.FirstName = user.FirstName;

            await _unitOfWork.CommitAsync();
        }
    }
}