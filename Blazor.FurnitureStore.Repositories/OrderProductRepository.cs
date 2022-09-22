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
    public class OrderProductRepository : IOrderProductRepository
    {
        private readonly IDbConnection _dbConnection;
        public OrderProductRepository(IDbConnection dbConnection)
        {
            _dbConnection = dbConnection;
        }

        public async Task<bool> DeleteOrderProductByOrder(int orderId)
        {
            var sql = @"DELETE FROM OrderProducts 
                        WHERE OrderId = @Id ";
            var result = await _dbConnection.ExecuteAsync(sql,
                new { Id = orderId });

            return result > 0;
        }

        public async Task<IEnumerable<Product>> GetByOrder(int orderId)
        {
            var sql = @" SELECT Id, Name, Price, 
                                CategoryId As ProductCategoryId, Quantity
                            FROM OrderProducts
	                            INNER JOIN Products p ON p.Id = ProductId
                            WHERE OrderId = @Id ";

            return await _dbConnection.QueryAsync<Product>(sql,
                new { Id = orderId });
        }
        public async Task<bool> InsertOrderProduct(int orderId, Product product)
        {
            var sql = @"INSERT INTO OrderProducts (OrderId, ProductId, Quantity)
                        VALUES(@OrderId, @ProductId, @Quantity) ";

            var result = await _dbConnection.ExecuteAsync(sql,
                new
                {
                    OrderId = orderId,
                    ProductId = product.Id,
                    product.Quantity
                });

            return result > 0;
        }
    }
}
