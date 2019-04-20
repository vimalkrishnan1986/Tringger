using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public class clsTime_Sheet_Master : BasePage
{
    public DateTime GetIstDate()
    {
        DateTime T = DateTime.UtcNow.AddHours(5).AddMinutes(30);
        string TT = T.ToString("yyyy-MM-dd HH:mm:ss");
        return Convert.ToDateTime(TT);
    }




    public void Department_Master_Department_Name(DropDownList Department_Name, HtmlTableCell tdMessage, string strValue)
    {
        try
        {
            BindDropDownList
            (
                "select [Department_Id], [Department_Name]  from Department_Master where Entered_Unit='" + Session["Unit_Id"].ToString() + "' ",
                Department_Name
            );

            Department_Name.SelectedValue = strValue;
        }
        catch (ArgumentOutOfRangeException)
        {
            //
        }
        catch (Exception err)
        {
            WarningMessage("Error occurred in method of 'Department_Master_Department_Name' error details:" + Convert.ToString(err.Message), tdMessage);
        }
    }

    public void Designation_Master_Designation_Name(DropDownList Designation_Name, HtmlTableCell tdMessage, string strValue)
    {
        try
        {
            BindDropDownList
            (
                "select [Designation_Id], [Designation_Name]  from Designation_Master where Entered_Unit='" + Session["Unit_Id"].ToString() + "'",
                Designation_Name
            );

            Designation_Name.SelectedValue = strValue;
        }
        catch (ArgumentOutOfRangeException)
        {
            //
        }
        catch (Exception err)
        {
            WarningMessage("Error occurred in method of 'Designation_Master_Designation_Name' error details:" + Convert.ToString(err.Message), tdMessage);
        }
    }

    public void Login_DedailsUpdate(string User_Log_Id, string User_Id, string Latitude, string Longitude, string Location)
    {

        using (SqlConnection con = new SqlConnection(connectionstring))
        {
            con.Open();
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
        }

    }
}