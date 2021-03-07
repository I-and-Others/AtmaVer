using System.Collections.Generic;
using System.Threading.Tasks;
using AtmaVer.Entities;

namespace AtmaVer.Core.Services
{
    public interface IAdvertisementService
    {
        Task<IEnumerable<Advertisement>> GetAllAdvertisements();
        Task<Advertisement> GetAdvertisementById(int id);
        Task<Advertisement> CreateAdvertisement(Advertisement newAdvertisement);
        Task UpdateAdvertisement(Advertisement advertisementToBeUpdated, Advertisement advertisement);
        Task DeleteAdvertisement(Advertisement advertisement);
    }
}