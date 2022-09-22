using Blazor.FurnitureStore.Repositories;
using Blazor.FurnitureStore.Shared;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Transactions;

namespace Blazor.FurnitureStore.Server.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        private readonly IOrderRepository _orderRepository;
        private readonly IOrderProductRepository _orderProductRepository;

        public OrderController(IOrderRepository orderRepository,
            IOrderProductRepository orderProductRepository)
        {
            _orderRepository = orderRepository;
            _orderProductRepository = orderProductRepository;
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Order order)
        {
            if (order == null)
                return BadRequest();

            if (order.OrderNumber == 0)
                ModelState.AddModelError("OrderNumber", "Order number can't be empty");

            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            using (TransactionScope scope = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
            {
                order.Id = await _orderRepository.GetNextId();
                await _orderRepository.InsertOrder(order);

                if (order.Products != null && order.Products.Any())
                {
                    foreach (var prd in order.Products)
                    {
                        await _orderProductRepository.InsertOrderProduct(order.Id, prd);
                    }
                }

                scope.Complete();
            }

            return NoContent();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] Order order)
        {
            if (order == null)
                return BadRequest();

            if (order.OrderNumber == 0)
                ModelState.AddModelError("OrderNumber", "Order number can't be empty");

            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            using (TransactionScope scope = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
            {                
                await _orderRepository.UpdateOrder(order);

                await _orderProductRepository.DeleteOrderProductByOrder(order.Id);

                if (order.Products != null && order.Products.Any())
                {
                    foreach (var prd in order.Products)
                    {
                        await _orderProductRepository.InsertOrderProduct(order.Id, prd);
                    }
                }

                scope.Complete();
            }

            return NoContent();
        }


        [HttpGet("GetNextNumber")]
        public async Task<int> GetNextNumber()
        {
            return await _orderRepository.GetNextNumber();
        }

        [HttpGet]
        public async Task<IEnumerable<Order>> Get()
        {
            var orders = await _orderRepository.GetAll();

            foreach (var item in orders)
            {
                item.Products = (List<Product>)await _orderProductRepository.GetByOrder(item.Id);
            }

            return orders;
        }

        [HttpGet("{id}")]
        public async Task<Order> GetDetails(int id)
        {
            var order = await _orderRepository.GetDetails(id);
            var products = await _orderProductRepository.GetByOrder(id);

            if (order != null)
                order.Products = products.ToList();

            return order;
        }

        [HttpDelete("{id}")]
        public async Task Delete(int id)
        {
            await _orderRepository.DeleteOrder(id);
        }
    }
}
