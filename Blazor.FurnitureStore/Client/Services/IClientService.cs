using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Blazor.FurnitureStore.Client.Services
{
    public interface IClientService
    {
        Task<IEnumerable<Blazor.FurnitureStore.Shared.Client>> GetAll();
    }
}
