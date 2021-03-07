using AtmaVer.Core;
using AtmaVer.Entities;
using AtmaVer.Core.Services;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace AtmaVer.Services
{
    public class ProductService : IProductService
    {
        private readonly IUnitOfWork _unitOfWork;
        public ProductService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }

        public async Task<Product> CreateProduct(Product newProduct)
        {
            await _unitOfWork.Products.AddAsync(newProduct);

            await _unitOfWork.CommitAsync();
            return newProduct;
        }

        public async Task DeleteProduct(Product product)
        {
            _unitOfWork.Products.Remove(product);

            await _unitOfWork.CommitAsync();
        }

        public async Task<IEnumerable<Product>> GetAllProducts()
        {
            return await _unitOfWork.Products.GetAllAsync();
        }

        public async Task<Product> GetProductById(int id)
        {
            return await _unitOfWork.Products.GetByIdAsync(id);
        }

        public async Task UpdateProduct(Product productToBeUpdated, Product product)
        {
            productToBeUpdated = product;
                     

            await _unitOfWork.CommitAsync();
        }
    }
}