using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DataAccess
/// </summary>
public static class DataAccess
{
    public static string _connectionString
    {

        get
        {
            return Constants.ConnectionString;
        }
    }

    public static int ExecuteNonQuery(string sql, CommandType commandType, SqlParameter[] sqlParameters = null)
    {

        using (SqlConnection sqlConnection = new SqlConnection(_connectionString))
        {

            using (SqlCommand command = new SqlCommand(sql, sqlConnection)
            {
                CommandType = commandType
            })
            {

                if (sqlConnection.State == 0)
                {
                    sqlConnection.Open();
                }

                if (sqlParameters != null)
                {
                    command.Parameters.AddRange(sqlParameters);
                }
                return command.ExecuteNonQuery();
            }
        }

    }


    public static DataSet FillDataSet(string sql, CommandType commandType, SqlParameter[] sqlParameters = null)
    {
        DataSet result = new DataSet();
        using (SqlConnection sqlConnection = new SqlConnection(_connectionString))
        {
            using (SqlCommand command = new SqlCommand(sql, sqlConnection)
            {
                CommandType = commandType
            })
            {
                if (sqlParameters != null)
                {
                    command.Parameters.AddRange(sqlParameters);
                }
                using (SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(command))
                {

                    sqlDataAdapter.Fill(result);
                }
            }
        }

        return result;
    }
}