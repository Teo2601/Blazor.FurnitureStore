using Blazor.FurnitureStore.Shared;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blazor.FurnitureStore.Repositories
{
    public class ProductCategoryRepository : IProductCategoryRepository
    {
        private readonly IDbConnection _dbConnection;
        public ProductCategoryRepository(IDbConnection dbConnection)
        {
            _dbConnection = dbConnection;
        }
        public async Task<IEnumerable<ProductCategory>> GetAll()
        {
            var sql = @" SELECT Id As Id, Name as Name
                         FROM ProductCategories ";                        

            return await _dbConnection.QueryAsync<ProductCategory>(sql, new { });
        }
    }
}
