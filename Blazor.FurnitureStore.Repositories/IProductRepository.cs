using Blazor.FurnitureStore.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blazor.FurnitureStore.Repositories
{
    public interface IProductRepository
    {
        Task<IEnumerable<Product>> GetByCategory(int productCategoryId);
        Task<Product> GetDetails(int productId);
    }
}
