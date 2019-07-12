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
    const string _loginKey = "Login_Id";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FnMenu();
        }
    }

    protected void FnMenu()
    {
        const string sql = "GetMenu";
        const string relationName = "MenuSubmenuRelation";
        
        int loginId = 0;
        loginId = SessionHelper.GetSessionValue<int>(_loginKey, loginId);

        SqlParameter[] sqlParameters = new SqlParameter[] {
            new SqlParameter("@isAdmin", SessionHelper.GetSessionValue<bool>(Convert.ToString(_adminKey))),
            new SqlParameter("@loginId",loginId )
        };
        DataSet dataSet = DataAccess.FillDataSet(sql, CommandType.StoredProcedure, sqlParameters);
        if (dataSet.Tables.Count <= 1)
        {
            return;
        }
        string strMenu = "";
        dataSet.Relations.Add(new DataRelation(relationName,
          dataSet.Tables[0].Columns["module_id"],
         dataSet.Tables[1].Columns["module_name"]
         )
         );

        foreach (DataRow parrentRow in dataSet.Tables[0].Rows)
        {
            strMenu = strMenu + "<div class=\"btn-group dropdown\" > <button style =\"width: 150px; background-color:white; margin-right:5px; margin-bottom:5px; font-size:small; border-radius:5px; " + "type=\"button\" class=\"btn btn-danger \" data-toggle=\"dropdown\">" + parrentRow["Module_Name"].ToString() + "<span class=\"caret\"></span></button><ul style=\"background-color:#eff0f2; margin-top:5px; padding:10px; border-width:0px;; font-size:small; text-align:left;\" class=\"dropdown-menu\" >";

            foreach (DataRow childRow in parrentRow.GetChildRows(relationName))
            {
                strMenu += "<li><a href =\".." + "/" + childRow["File_Name"].ToString() + "\" class=\"btn btn-default\" style=\"background-color:white; color:#7c7e82; padding:0px; margin-top:0px; margin-bottom:5px; font-size:small; text-align:left;\">" + childRow["Sub_Module_Name"].ToString() + "</a></li>";

            }
            strMenu += "</ul></div>";
        }

        string strMenu2 = "<a style=\"text-align:center; vertical-a\" href=\"../Time_Sheet_Master/Time_Sheet_View.aspx?ResponseType=2\"><button class=\"btn btn-danger \" style =\"background-color:#e7e8e6; margin-bottom:5px; font-size:12px; border-radius:5px;\"  type=\"button\" >Task Management</button></a>";
        strMenu = strMenu + strMenu2 + "</div>";
        MainMenu.InnerHtml = Convert.ToString(strMenu);

    }
}
