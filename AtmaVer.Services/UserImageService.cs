using AtmaVer.Core;
using AtmaVer.Entities;
using AtmaVer.Core.Services;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace AtmaVer.Services
{
    public class UserImageService : IUserImageService
    {
        private readonly IUnitOfWork _unitOfWork;
        
        public UserImageService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }

        public async Task<UserImage> CreateUserImage(int userId, string imageUrl)
        {
            UserImage newUserImage = new UserImage
            {
                UserId = userId,
                PhotoUrl = imageUrl
            };
            await _unitOfWork.UserImages.AddAsync(newUserImage);
            await _unitOfWork.CommitAsync();
            return newUserImage;
        }

        public async Task DeleteUserImage(UserImage userImage)
        {
            _unitOfWork.UserImages.Remove(userImage);

            await _unitOfWork.CommitAsync();
        }
    }
}