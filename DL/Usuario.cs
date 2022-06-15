using System;
using System.Collections.Generic;

namespace DL
{
    public partial class Usuario


    {

        public Usuario()
        {
            Aseguradoras = new HashSet<Aseguradora>();
        }
        public int IdUsuario { get; set; }
        public string UserName { get; set; } = null!;
        public string? Nombre { get; set; }
        public string? ApellidoPaterno { get; set; }
        public string? ApellidoMaterno { get; set; }
        public string Email { get; set; } = null!;
        public string Sexo { get; set; } = null!;
        public string Telefono { get; set; } = null!;
        public string? Celular { get; set; }
        public DateTime? FechaNacimiento { get; set; }
        public string? Curp { get; set; }
        public int? IdRol { get; set; }

        public virtual Rol? IdRolNavigation { get; set; }
        public virtual ICollection<Aseguradora> Aseguradoras{ get; set; }
        public string RolNombre  { get; set; }  
    }
}
