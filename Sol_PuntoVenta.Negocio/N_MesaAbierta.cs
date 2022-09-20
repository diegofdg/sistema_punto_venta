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
    public class N_MesaAbierta
    {
        public static DataTable Listar_SubFamilias_RP(int nCodigo_pv)
        {
            D_MesaAbierta Datos = new D_MesaAbierta();
            return Datos.Listar_SubFamilias_RP(nCodigo_pv);
        }

        public static DataTable ListarProductos_SubFamilias_RP(int nCodigo_pv, int nCodigo_sf)
        {
            D_MesaAbierta Datos = new D_MesaAbierta();
            return Datos.ListarProductos_SubFamilias_RP(nCodigo_pv, nCodigo_sf);
        }

        public static DataTable Busquedarapida_pr(string cTexto)
        {
            D_MesaAbierta Datos = new D_MesaAbierta();
            return Datos.Busquedarapida_pr(cTexto);
        }

        public static DataTable Busqueda_cl(string cTexto)
        {
            D_MesaAbierta Datos = new D_MesaAbierta();
            return Datos.Busqueda_cl(cTexto);
        }

        public static DataTable Guardar_RP(E_RegistroPedido oRP, DataTable Detalle_ticket)
        {
            D_MesaAbierta Datos = new D_MesaAbierta();
            return Datos.Guadar_RP(oRP, Detalle_ticket);
        }

        public static DataTable Imprimir_comanda(string cImpresora, int nCodigo_ti)
        {
            D_MesaAbierta Datos = new D_MesaAbierta();
            return Datos.Imprimir_comanda(cImpresora, nCodigo_ti);
        }
    }
}
