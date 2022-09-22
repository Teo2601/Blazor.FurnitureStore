using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Salonesfw.Models;

namespace Salonesfw.Data
{
    public class SalonesfwContext : DbContext
    {
        public SalonesfwContext (DbContextOptions<SalonesfwContext> options)
            : base(options)
        {
        }

        public DbSet<Salonesfw.Models.Beneficiarios> Beneficiarios { get; set; }

        public DbSet<Salonesfw.Models.salones> salones { get; set; }
    }
}
