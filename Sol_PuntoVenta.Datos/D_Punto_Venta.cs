using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Sol_PuntoVenta.Entidades;

namespace Sol_PuntoVenta.Datos
{
    public class D_Punto_Venta
    {
        public DataTable Listado_pv(string cTexto) 
        {
            SqlDataReader Resultado;
            DataTable Tabla = new DataTable();
            SqlConnection SqlCon = new SqlConnection();
            try
            {
                SqlCon = Conexion.getInstancia().CrearConexion();
                SqlCommand comando = new SqlCommand("procedimiento", SqlCon);
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                if(SqlCon.State == ConnectionState.Open) SqlCon.Close();
            }
        }
    }
}
