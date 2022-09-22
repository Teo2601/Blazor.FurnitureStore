using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using EntityFw.Models;

namespace EntityFw.Data
{
    public class EntityFwContext : DbContext
    {
        public EntityFwContext (DbContextOptions<EntityFwContext> options)
            : base(options)
        {
        }

        public DbSet<EntityFw.Models.clientes> clientes { get; set; }
    }
}
