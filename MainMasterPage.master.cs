using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;

public partial class MainMasterPage : System.Web.UI.MasterPage
{
    const string _adminKey = "Admin";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SessionHelper.AddtoSession<bool>(_adminKey, true);
            FnMenu();
        }
    }
    protected void FnMenu()
    {

        SqlConnection con = new SqlConnection(Constants.ConnectionString);
        con.Open();
        DataTable dataTable = new DataTable();
        DataSet ds = new DataSet();
        SqlDataAdapter ad = new SqlDataAdapter();
        SqlCommand cmd;
        if (SessionHelper.GetSessionValue<bool>(_adminKey))
        {
            cmd = new SqlCommand("select Module_Name,Module_Id from Module_Master where Is_Active=1 and Module_Name != 'Time Sheet Page' ", con);
        }
        else
        {
            cmd = new SqlCommand("select  Module_Name,Module_Id from Module_Master where Is_Active=1  and Module_Name != 'Time Sheet Page' and  Module_Id IN (select Module_Name from Sub_Module  where " +
                                      " [SubModule_Id] IN (SELECT [Sub_Module_Name] FROM Module_Access_Rights WHERE Staff_Id=" + Convert.ToString(Session["Login_Id"]) + " AND Is_Active=1 )) ", con);
            //  cmd = new SqlCommand("select Module_Name,Module_Id from Module_Master where Module_Name NOT IN ('Administration','Human Resource')", con);
        }
        ad.SelectCommand = cmd;
        ad.Fill(ds);
        dataTable = ds.Tables[0];
        string strMenu = "";
        string strSubMenu = "";

        for (int i = 0; i < dataTable.Rows.Count; i++)
        {
            string ModuleID = Convert.ToString(ds.Tables[0].Rows[i]["Module_Id"]);


            DataTable dataTable1 = new DataTable();
            DataSet ds1 = new DataSet();
            SqlDataAdapter ad1 = new SqlDataAdapter();
            SqlCommand cmd1;
            if (SessionHelper.GetSessionValue<bool>(_adminKey))
            {
                cmd1 = new SqlCommand("select  * from Sub_Module where Module_Name='" + ModuleID + "' ", con);
            }
            else
            {

                cmd = new SqlCommand("select  * from Sub_Module where Module_Name='" + ModuleID + "' AND  SubModule_Id IN (SELECT Sub_Module_Name FROM Module_Access_Rights WHERE Staff_Id=" + Convert.ToString(Session["Login_Id"]) + " AND Is_Active=1) ", con);
                //cmd = new SqlCommand("select  * from Sub_Module where Module_Name='" + Convert.ToString(ModuleId) + "' ", con);
            }
            ad1.SelectCommand = cmd;
            ad1.Fill(ds1);
            dataTable1 = ds1.Tables[0];

            strMenu = strMenu + "<div class=\"btn-group dropdown\" > <button style =\"width: 150px; background-color:white; margin-right:5px; margin-bottom:5px; font-size:small; border-radius:5px; " + "type=\"button\" class=\"btn btn-danger \" data-toggle=\"dropdown\">" + ds.Tables[0].Rows[i]["Module_Name"].ToString() + "<span class=\"caret\"></span></button><ul style=\"background-color:#eff0f2; margin-top:5px; padding:10px; border-width:0px;; font-size:small; text-align:left;\" class=\"dropdown-menu\" >";
            for (int k = 0; k < dataTable1.Rows.Count; k++)
            {
                strMenu += "<li><a href =\".." + "/" + ds1.Tables[0].Rows[k]["File_Name"].ToString() + "\" class=\"btn btn-default\" style=\"background-color:white; color:#7c7e82; padding:0px; margin-top:0px; margin-bottom:5px; font-size:small; text-align:left;\">" + ds1.Tables[0].Rows[k]["Sub_Module_Name"].ToString() + "</a></li>";

            }

            strMenu += "</ul></div>";
        }

        string strMenu2 = "<a style=\"text-align:center; vertical-a\" href=\"../Time_Sheet_Master/Time_Sheet_View.aspx?ResponseType=2\"><button class=\"btn btn-danger \" style =\"background-color:#e7e8e6; margin-bottom:5px; font-size:12px; border-radius:5px;\"  type=\"button\" >Task Management</button></a>";
        //strMenu += strMenu2+"</ul></div>";
        //strMenu = strMenu + "</tr></table>";
        //strMenu = "<center>" + strMenu2 + "</center><br />"+ strMenu + "</div>";
        strMenu = strMenu + strMenu2 + "</div>";
        MainMenu.InnerHtml = Convert.ToString(strMenu);
        //SubMenu.InnerHtml = Convert.ToString(strSubMenu);
        con.Close();
    }


}
