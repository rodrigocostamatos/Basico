using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Dados;
using System.ComponentModel;
using System.Data;
using System.Configuration;


namespace Dados
{
    [DataObject]
    public class Predio_DAL
    {

        public static int Cadastrar(string Nome)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Conexao.stringConexao;
            try
            {
                SqlCommand comando = new SqlCommand();
                comando.CommandText = "insert into Predio (Nome) values(@Nome)";
                comando.Parameters.Add(new SqlParameter("@Nome", Nome));
                comando.Connection = con;
                con.Open();
                return comando.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                throw new ApplicationException("Erro ao cadastrar!");
            }
            finally
            {
                con.Close();
            }
        }

        public static int Alterar(int Id, string Nome)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Conexao.stringConexao;
            try
            {
                SqlCommand comando = new SqlCommand();
                comando.CommandText = "update predio set Nome=@Nome where id=@id";
                comando.Parameters.Add(new SqlParameter("@Id", Id));
                comando.Parameters.Add(new SqlParameter("@Nome", Nome));

                comando.Connection = con;
                con.Open();
                return comando.ExecuteNonQuery();

            }
            catch (Exception)
            {
                throw new ApplicationException("Erro ao alterar!");
            }
            finally
            {
                con.Close();
            }
        }

        public static int Excluir(int Id)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Conexao.stringConexao;
            try
            {
                SqlCommand comando = new SqlCommand();
                comando.CommandText = "delete from predio where id=@id";
                comando.Parameters.Add(new SqlParameter("@Id", Id));
                comando.Connection = con;
                con.Open();
                return comando.ExecuteNonQuery();

            }
            catch (Exception)
            {
                throw new ApplicationException("Erro ao deletar!");
            }
            finally
            {
                con.Close();
            }
        }

        public static DataTable Obter(int ID)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Conexao.stringConexao;
            try
            {
                SqlCommand comando = new SqlCommand();
                comando.CommandText = "select * from predio where id=@id";
                comando.Parameters.Add(new SqlParameter("@id", ID));
                comando.Connection = con;
                con.Open();
                DataTable resultado = new DataTable();
                resultado.Load(comando.ExecuteReader());
                return resultado;

            }
            catch (Exception)
            {
                throw new ApplicationException("Falha ao Obter Preio!");
            }
            finally
            {
                con.Close();
            }
        }

        public static DataTable ObterTodos()
        {

            //string constr = "User Id=hr; " +
            //              "Password=hr; " +
            //              "Data Source=liverpool/xe";
            // create connection object
            //OracleConnection con = new OracleConnection(constr);


            SqlConnection con = new SqlConnection();
            con.ConnectionString = Conexao.stringConexao;

            try
            {
                SqlCommand comando = new SqlCommand();
                comando.CommandText = "select id, nome from Predio";
                comando.Connection = con;
                con.Open();
                DataTable resultado = new DataTable();
                resultado.Load(comando.ExecuteReader());
                return resultado;

            }
            catch (Exception ex)
            {
                throw new ApplicationException("Falha ao Obter Predios!");
            }
            finally
            {
                con.Close();
            }
        }


    }
}
