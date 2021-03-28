using System.Collections.Generic;
using System.Threading.Tasks;
using AtmaVer.Entities;

namespace AtmaVer.Core.Services
{
    public interface IUserImageService
    {
        Task<UserImage> CreateUserImage(int userId, string imageUrl);
        Task DeleteUserImage(UserImage userImage);
    }
}