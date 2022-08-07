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
    public class N_Productos
    {
        public static DataTable Listado_pr(string cTexto)
        {
            D_Productos Datos = new D_Productos();
            return Datos.Listado_pr(cTexto);
        }

        public static string Guardar_pr(int nOpcion, E_Productos oPropiedad, DataTable DT)
        {
            D_Productos Datos = new D_Productos();
            return Datos.Guardar_pr(nOpcion, oPropiedad, DT);
        }

        public static string Eliminar_pr(int Ncodigo)
        {
            D_Productos Datos = new D_Productos();
            return Datos.Eliminar_pr(Ncodigo);
        }
        public static DataTable Listado_ma(string cTexto)
        {
            D_Productos Datos = new D_Productos();
            return Datos.Listado_ma(cTexto);
        }

        public static DataTable Listado_um(string cTexto)
        {
            D_Productos Datos = new D_Productos();
            return Datos.Listado_um(cTexto);
        }

        public static DataTable Listado_sf(string cTexto)
        {
            D_Productos Datos = new D_Productos();
            return Datos.Listado_sf(cTexto);
        }

        public static DataTable Listado_ad(string cTexto)
        {
            D_Productos Datos = new D_Productos();
            return Datos.Listado_ad(cTexto);
        }

        public static DataTable Puntos_Ventas_OK(int nOpcion, int nCodigo_pr)
        {
            D_Productos Datos = new D_Productos();
            return Datos.Puntos_Ventas_OK(nOpcion, nCodigo_pr);
        }

        public static Byte[] Mostrar_img(int nCodigo_pr)
        {
            D_Productos Datos = new D_Productos();
            return Datos.Mostrar_img(nCodigo_pr);
        }

        public static Byte[] Mostrar_img_prod_pred()
        {
            D_Productos Datos = new D_Productos();
            return Datos.Mostrar_img_prod_pred();
        }
    }
}
