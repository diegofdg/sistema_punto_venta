﻿using Sol_PuntoVenta.Datos;
using Sol_PuntoVenta.Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sol_PuntoVenta.Negocio
{
    public class N_Marcas
    {
        public static DataTable Listado_ma(string cTexto)
        {
            D_Marcas Datos = new D_Marcas();
            return Datos.Listado_ma(cTexto);
        }

        public static string Guardar_ma(int nOpcion, E_Marcas oPropiedad)
        {
            D_Marcas Datos = new D_Marcas();
            return Datos.Guardar_ma(nOpcion, oPropiedad);
        }

        public static string Eliminar_ma(int Ncodigo)
        {
            D_Marcas Datos = new D_Marcas();
            return Datos.Eliminar_ma(Ncodigo);
        }
    }
}
