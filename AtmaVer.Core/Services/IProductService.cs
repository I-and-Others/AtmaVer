using System.Collections.Generic;
using System.Threading.Tasks;
using AtmaVer.Entities;

namespace AtmaVer.Core.Services
{
    public interface IProductService
    {
        Task<IEnumerable<Product>> GetAllProducts();
        Task<Product> GetProductById(int id);
        Task<Product> CreateProduct(Product newProduct);
        Task UpdateProduct(Product productToBeUpdated, Product product);
        Task DeleteProduct(Product product);
    }
}