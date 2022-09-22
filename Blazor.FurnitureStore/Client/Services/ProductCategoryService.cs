using Blazor.FurnitureStore.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace Blazor.FurnitureStore.Client.Services
{
    public class ProductCategoryService : IProductCategoryService
    {
        private readonly HttpClient _httpClient;
        public ProductCategoryService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }
        public async Task<IEnumerable<ProductCategory>> GetProductCategories()
        {
            return await _httpClient.GetFromJsonAsync<IEnumerable<ProductCategory>>($"api/productcategory");
        }
    }
}
