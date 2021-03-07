using AtmaVer.Core;
using AtmaVer.Entities;
using AtmaVer.Core.Services;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace AtmaVer.Services
{
    public class AdvertisementService : IAdvertisementService
    {
        private readonly IUnitOfWork _unitOfWork;
        
        public AdvertisementService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }

        public async Task<Advertisement> CreateAdvertisement(Advertisement newAdvertisement)
        {
            await _unitOfWork.Advertisements.AddAsync(newAdvertisement);

            Product newProduct = new Product
            {
                AdvertisementId = newAdvertisement.Id,
                ProductName = newAdvertisement.Product.ProductName,
                Description = newAdvertisement.Product.Description,
                Condition = newAdvertisement.Product.Condition
            };
            await _unitOfWork.Products.AddAsync(newProduct);
            

            await _unitOfWork.CommitAsync();
            return newAdvertisement;
        }

        public async Task DeleteAdvertisement(Advertisement advertisement)
        {
            _unitOfWork.Advertisements.Remove(advertisement);

            await _unitOfWork.CommitAsync();
        }        

        public async Task<Advertisement> GetAdvertisementById(int id)
        {
            return await _unitOfWork.Advertisements.GetByIdAsync(id);
        }

        public async Task<IEnumerable<Advertisement>> GetAllAdvertisements()
        {
            return await _unitOfWork.Advertisements.GetAllAsync();
        }

        public async Task UpdateAdvertisement(Advertisement advertisementToBeUpdated, Advertisement advertisement)
        {
            advertisementToBeUpdated = advertisement;

            await _unitOfWork.CommitAsync();
        }
    }
}