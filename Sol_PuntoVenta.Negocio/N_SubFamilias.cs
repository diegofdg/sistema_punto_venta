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
    public class N_SubFamilias
    {
        public static DataTable Listado_sf(string cTexto)
        {
            D_SubFamilias Datos = new D_SubFamilias();
            return Datos.Listado_sf(cTexto);
        }

        public static string Guardar_sf(int nOpcion, E_SubFamilias oPropiedad)
        {
            D_SubFamilias Datos = new D_SubFamilias();
            return Datos.Guardar_sf(nOpcion, oPropiedad);
        }

        public static string Eliminar_sf(int Ncodigo)
        {
            D_SubFamilias Datos = new D_SubFamilias();
            return Datos.Eliminar_sf(Ncodigo);
        }
        public static DataTable Listado_fa(string cTexto)
        {
            D_SubFamilias Datos = new D_SubFamilias();
            return Datos.Listado_fa(cTexto);
        }
    }
}
