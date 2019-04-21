using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for ObjectDataSet
/// </summary>
public class ObjectDataSet
{
    public ObjectDataSet()
    {
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public DataTable GetCompany()
    {
        const string adminKey = "Admin";
        const string companyKey = "Company_Unit_Name";

        string query = "select [Unit_Id], [Company_Unit_Name] from Company_Unit_Master where ";

        if (!SessionHelper.GetSessionValue<bool>(adminKey))
        {
            query += "unit_id=" + SessionHelper.GetSessionValue<string>("unit_id") + " and ";
        }

        query += "Company_Unit_Name='" + SessionHelper.GetSessionValue<string>(companyKey) + "'";
        return DataAccess.FillDataSet(query, CommandType.Text).Tables[0];
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public DataTable GetStaffs()
    {
        const string adminKey = "Admin";
        const string loginKey = "Login_Id";
        const string unitIdKey = "unit_id";

        string query = "Getstaff";
        return DataAccess.FillDataSet(query, CommandType.StoredProcedure, new SqlParameter[]{
            new SqlParameter("@employeeId",SessionHelper.GetSessionValue<int>(loginKey)),
            new SqlParameter("@isadmin",SessionHelper.GetSessionValue<bool>(adminKey)),
            new SqlParameter("@unit_id",SessionHelper.GetSessionValue<string>(unitIdKey))
        }).Tables[0];
    }
}