using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Sol_PuntoVenta.Presentacion
{
    internal static class Program
    {
        /// <summary>
        /// Punto de entrada principal para la aplicación.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            //Application.Run(new Frm_Punto_Venta());
            //Application.Run(new Frm_Familias());
            //Application.Run(new Frm_Marcas());
            //Application.Run(new Frm_Unidades_Medidas());
            //Application.Run(new Frm_SubFamilias());
            //Application.Run(new Frm_Mesas());
            //Application.Run(new Frm_Area_Despacho());
            //Application.Run(new Frm_Productos());
            Application.Run(new Frm_DashBoard());
        }
    }
}
