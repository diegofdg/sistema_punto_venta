using Sol_PuntoVenta.Datos;
using Sol_PuntoVenta.Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sol_PuntoVenta.Negocio
{
    public class N_Familias
    {
        public static DataTable Listado_fa(string cTexto)
        {
            D_Familias Datos = new D_Familias();
            return Datos.Listado_fa(cTexto);
        }

        public static string Guardar_fa(int nOpcion, E_Familias oPropiedad)
        {
            D_Familias Datos = new D_Familias();
            return Datos.Guardar_fa(nOpcion, oPropiedad);
        }

        public static string Eliminar_fa(int Ncodigo)
        {
            D_Familias Datos = new D_Familias();
            return Datos.Eliminar_fa(Ncodigo);
        }
    }
}
