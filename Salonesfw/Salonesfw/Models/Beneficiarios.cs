using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Salonesfw.Models
{
    public class Beneficiarios
    {
        public int id { get; set; }
        public string Nombre { get; set; }

        public string Apellido { get; set; }

        public string Cc { get; set; }

        public int idSalon { get; set; }
    }
}

