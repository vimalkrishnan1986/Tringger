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
    const string _loginKey = "Login_Id;";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FnMenu();
        }
    }

    protected void FnMenu()
    {
        //needs to be altered

        string sql = "GetMenu";
        bool isadmin = false;
        int loginId = 0;
        loginId = SessionHelper.GetSessionValue<int>(_loginKey,  loginId);

        SqlParameter[] sqlParameters = new SqlParameter[] {
            new SqlParameter("@isAdmin", SessionHelper.GetSessionValue<bool>(_adminKey, isadmin)),
            new SqlParameter("@loginId",loginId )
        };
        DataSet dataSet = DataAccess.FillDataSet(sql, CommandType.StoredProcedure, sqlParameters);
        if (dataSet.Tables.Count <= 1)
        {
            return;
        }
        DataRelation dataRelation = new DataRelation("ModuleRelation", dataSet.Tables[0].Columns["module_id"],
            dataSet.Tables[1].Columns["module_name"]);
        dataSet.Relations.Add(dataRelation);
        mainMenu.DataSource = dataSet;
        mainMenu.DataBind();
    }


}
