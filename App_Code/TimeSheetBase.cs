using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public class TimeSheetBase : BasePage
{
    public DateTime GetIstDate()
    {
        string TT = CurrentTime.ToString("yyyy-MM-dd HH:mm:ss");
        return Convert.ToDateTime(TT);
    }


 
    public void Login_DedailsUpdate(string User_Log_Id, string User_Id, string Latitude, string Longitude, string Location)
    {

        using (SqlConnection con = new SqlConnection(connectionstring))
        {
            if (con.State == 0)
            {
                con.Open();
            }
            using (SqlCommand cmd = new SqlCommand("SP_User_Log_Master", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@User_Log_Id", ConvertTo<int>(User_Log_Id));
                cmd.Parameters.AddWithValue("@User_Id", ConvertTo<int>(User_Id));
                cmd.Parameters.AddWithValue("@SignInTime", ConvertTo<DateTime>(Convert.ToString(DateTime.UtcNow.AddHours(5).AddMinutes(30))));
                cmd.Parameters.AddWithValue("@Latitude", ConvertTo<string>(Latitude));
                cmd.Parameters.AddWithValue("@Longitude", ConvertTo<string>(Longitude));
                cmd.Parameters.AddWithValue("@Location", ConvertTo<string>(Location));
                cmd.ExecuteScalar();


            }
            con.Close();
        }

    }
}