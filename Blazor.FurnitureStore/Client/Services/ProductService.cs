using Blazor.FurnitureStore.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace Blazor.FurnitureStore.Client.Services
{
    public class ProductService : IProductService
    {
        private readonly HttpClient _httpClient;
        public ProductService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }
        public async Task<IEnumerable<Product>> GetByCategory(int productCategoryId)
        {
            return await _httpClient.GetFromJsonAsync<IEnumerable<Product>>($"api/product/GetByCategory/{productCategoryId}");
        }

        public async Task<Product> GetDetails(int id)
        {
            return await _httpClient.GetFromJsonAsync<Product>($"api/product/{id}");
        }
    }
}
