using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Drawing;

public partial class Leave_Master : BasePage
{
    static clsLeave_Master objclsLeave_Master;
    static string connectionstring;
    public Leave_Master()
    {
        try
        {
            objclsLeave_Master = new clsLeave_Master();
            connectionstring = Convert.ToString(ConfigurationManager.AppSettings["connectionstring"]);
        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in Constructor of 'Leave_Master' error details:" + Convert.ToString(err.Message), tdMessage);
        }
    }
    protected void Company_Master_Company_Name()
    {
        try
        {
            string strQuery = "select [Company_Id], [Company_Name]  from Company_Master ";
            if (!Convert.ToBoolean(Session["Admin"]))
            {
                strQuery = "select [Company_Id], [Company_Name]  from Company_Master Where Company_Id='" + Convert.ToString(Session["Company_Name"]) + "'";
            }
            //Response.Write(strQuery);
            objclsLeave_Master.BindDropDownList
            (
                strQuery,
                Company_Name
            );
        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'Company_Master_Company_Name' error details:" + Convert.ToString(err.Message), tdMessage);
        }
    }


    protected void Approve_Control_Validation(object sender, EventArgs e)
    {

        FnApprove_ControlCheck();

    }

    protected void FnApprove_ControlCheck()
    {
        if (Staff_NameTxt.SelectedValue == Convert.ToString(Session["Login_Id"]) && !Convert.ToBoolean(Session["Admin"]))
        {
            DataTable objDataTable = objclsLeave_Master.ReturnDataTable
         (
             "SELECT * FROM Staff_Master WHERE [Level]='100' and Staff_ID = '" + Convert.ToString(Session["Login_Id"]) + "'"
         );
            if (objDataTable.Rows.Count > 0)
            {
                trApprove.Visible = true;
                Leave_Approve.SelectedValue = "";
                Leave_Approve.Visible = true;
               
            }
            else
            {
                Leave_Approve.SelectedValue = "";
                trApprove.Visible = false;
            }
           
            //SetAllDropDownsOnStaffSelection();
        }
        else
        {
           
            Leave_Approve.SelectedValue = "";
            trApprove.Visible = true;
            //SetAllDropDownsOnStaffSelection();
        }
    }
    //protected void SetDDDesignation()
    //{

    //    try
    //    {
    //        string strQuery1 = "Select * from Staff_Master_FullRootView where Staff_Id = '" + Staff_Name.SelectedValue.ToString() + "'";
    //        objclsLeave_Master.BindDropDownList
    //                  (
    //                  strQuery1,
    //                  Designation_Name
    //                  );
    //       Designation_Name.SelectedValue
    //    }
    //    catch (Exception err)
    //    {
    //        objclsLeave_Master.WarningMessage("Error occurred in method of 'SetDDDesignation' error details:" + Convert.ToString(err.Message), tdMessage);
    //    }
    //}
    protected void SetAllDropDownsOnStaffSelection()
    {
        string ThatStaff = "";
        if (Request.QueryString["ThisStaff_Id"] != "" && Request.QueryString["ThisStaff_Id"] != null)
        {

            ThatStaff = Request.QueryString["ThisStaff_Id"].ToString();
            Staff_NameTxt.SelectedValue = ThatStaff;
        }
        else if (Staff_NameTxt.SelectedValue.ToString() != "")
        {
            ThatStaff = Staff_NameTxt.SelectedValue.ToString();
        }

        try
        {
            string strQuery = "Select * from Staff_Master_FullRootView where Staff_Id = '" + ThatStaff + "'";

            DataTable objDataTable = objclsLeave_Master.ReturnDataTable
             (
                 "Select * from Staff_Master_FullRootView where Staff_Id = '" + ThatStaff + "'"
             );
            string DepartmentID = Convert.ToString(objDataTable.Rows[0]["Department_Id"]);
            string DepartmentName = Convert.ToString(objDataTable.Rows[0]["Department_Name"]);
            string DesignationID = Convert.ToString(objDataTable.Rows[0]["Designation_Id"]);
            string DesignationName = Convert.ToString(objDataTable.Rows[0]["Designation_Name"]);
            string CoUnitID = Convert.ToString(objDataTable.Rows[0]["Unit_Id"]);
            string CoUnitName = Convert.ToString(objDataTable.Rows[0]["Company_Unit_Name"]);
            string CoId = Convert.ToString(objDataTable.Rows[0]["Company_Id"]);
            string CompanyName = Convert.ToString(objDataTable.Rows[0]["Company_Name"]);
            string TeamID = Convert.ToString(objDataTable.Rows[0]["Team_Id"]);
            string TeamName = Convert.ToString(objDataTable.Rows[0]["Team_Name"]);


            objclsLeave_Master.BindDropDownList
                (
                strQuery,
                Company_Name
                );


            objclsLeave_Master.BindDropDownList
              (
              strQuery,
              Department_Name
              );
            objclsLeave_Master.BindDropDownList
            (
            strQuery,
            Team_Name
            );
            objclsLeave_Master.BindDropDownList
           (
           strQuery,
           Company_Unit_Name
           );
            objclsLeave_Master.BindDropDownList
                  (
                  strQuery,
                  Designation_Name
                  );
            Designation_Name.SelectedValue = DesignationID;
            Department_Name.SelectedValue = DepartmentID;
            Team_Name.SelectedValue = TeamID;
            Company_Name.SelectedValue = CoId;
            Company_Unit_Name.SelectedValue = CoUnitID;
            //SetDDDesignation();
        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'SetAllDropDownsOnStaffSelection' error details:" + Convert.ToString(err.Message), tdMessage);
        }
       

    }
    protected bool IsOperationDepartment()
    {
        string strQuery = "select * from Department_Master where Department_Name='Operations' AND Department_Id='" + Convert.ToString(Session["Department_Id"]) + "'";
        return objclsLeave_Master.IsRecordExists(strQuery);
    }
    protected void Company_Unit_Master_Company_Unit_Name()
    {
        try
        {
            Company_Unit_Name.Items.Clear();
            ListItem objList = new ListItem();
            objList.Text = "---Select---";
            objList.Value = "";
            Company_Unit_Name.Items.Add(objList);

            string strQuery = "select [Unit_Id], [Company_Unit_Name]  from Company_Unit_Master Where Company_Name='" + Convert.ToString((Company_Name.SelectedValue == "") ? "0" : Convert.ToString(Company_Name.SelectedValue)) + "'";

            if (!Convert.ToBoolean(Session["Admin"]) && !IsOperationDepartment())
            {
                strQuery += " AND Unit_Id='" + Convert.ToString(Session["Unit_Id"]) + "'";
            }

            objclsLeave_Master.BindDropDownList
            (
                strQuery,
                Company_Unit_Name
            );
            Staff_Master_Staff_Name();
        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'Company_Unit_Master_Company_Unit_Name' error details:" + Convert.ToString(err.Message), tdMessage);
        }
    }
    protected void Department_Master_Department_Name()
    {
        try
        {
            string strQuery = "select [Department_Id], [Department_Name]  from Department_Master  ";
            if (!Convert.ToBoolean(Session["Admin"]) && !IsOperationDepartment())
            {
                strQuery += " WHERE Department_Id='" + Convert.ToString(Session["Department_Id"]) + "' and Entered_Unit = '" + Session["Unit_Id"].ToString() + "'";
            }

            objclsLeave_Master.BindDropDownList
            (
                strQuery,
                Department_Name
            );

        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'Department_Master_Department_Name' error details:" + Convert.ToString(err.Message), tdMessage);
        }
    }
    protected void Team_Master_Team_Name()
    {
        try
        {
            Team_Name.Items.Clear();
            ListItem objList = new ListItem();
            objList.Text = "---Select---";
            objList.Value = "";
            Team_Name.Items.Add(objList);
            objclsLeave_Master.BindDropDownList
            (
                "select [Team_Id], [Team_Name]  from Team_Master  Where Department_Name='" + Convert.ToString((Department_Name.SelectedValue == "") ? "0" : Convert.ToString(Department_Name.SelectedValue)) + "'",
                Team_Name
            );
            Staff_Master_Staff_Name();
        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'Team_Master_Team_Name' error details:" + Convert.ToString(err.Message), tdMessage);
        }
    }

    protected void Search_GridValue(object sender, EventArgs e)
    {
        string strWhere = "";

        if (!Convert.ToBoolean(Session["Admin"]) && !IsOperationDepartment())
        {
            strWhere = " Where Unit_Id=" + Convert.ToString(Session["Unit_Id"]) + " " +
                        " AND Staff_Id IN ( SELECT [Staff_Id] FROM VW_Active_Staff_Master Where Staff_Id='" + Convert.ToString(Session["Login_Id"]) + "' UNION " +
                             " SELECT [Staff_Id] FROM VW_Active_Staff_Master Where Staff_Id IN(SELECT ISNULL(Reporting_Staff,0) FROM Reporting_Master WHERE Responsible_Staff IN('" + Convert.ToString(Session["Login_Id"]) + "') ))";

        }
        if (Search_Value.Text != "")
        {
            strWhere += (strWhere == "") ? " WHERE  " + Search_Field.SelectedValue + " Like('" + Search_Value.Text + "%')" : " AND " + Search_Field.SelectedValue + " Like('" + Search_Value.Text + "%')";
        }

        // Response.Write("select * from VW_Leave_Master " + strWhere);
        // Response.End();
        objclsLeave_Master.BindGridView("select * from VW_Leave_Master " + strWhere, Grid_Leave_Master);
        objclsLeave_Master.GridBottomPagerPosition(Grid_Leave_Master);
    }

    protected void Designation_Master_Designation_Name()
    {
        try
        {
            string strQuery = "select [Designation_Id], [Designation_Name]  from Designation_Master ";

            if (!Convert.ToBoolean(Session["Admin"]) && !IsOperationDepartment())
            {
                strQuery += " WHERE Designation_Id='" + Convert.ToString(Session["Designation_Id"]) + "' and Entered_Unit = '" + Session["Unit_Id"].ToString() + "'";
            }

            objclsLeave_Master.BindDropDownList
            (
                strQuery,
                Designation_Name
            );
        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'Designation_Master_Designation_Name' error details:" + Convert.ToString(err.Message), tdMessage);
        }
    }
    protected void Staff_Master_Staff_Name()
    {
        try
        {
            Staff_NameTxt.Items.Clear();
           
            string strWhere = "";
            string strQuery = "";
            if (!Convert.ToBoolean(Session["Admin"]) && !IsOperationDepartment())
            {
                strWhere = " Where VW_Active_Staff_Master.Staff_Id='" + Convert.ToString(Session["Login_Id"]) + "' AND VW_Active_Staff_Master.Company_Unit_Name=" + Convert.ToString(Session["Unit_Id"]);
                strQuery = " UNION " +
                             " SELECT [Staff_Id], [Staff_Name]  FROM VW_Active_Staff_Master Where Staff_Id IN(SELECT ISNULL(Reporting_Staff,0) FROM Reporting_Master WHERE Responsible_Staff IN('" + Convert.ToString(Session["Login_Id"]) + "') )";
            }


            string strCondition = objclsLeave_Master.FnFormatCondition
                                  (
                                    Company_Name.SelectedValue,
                                    "VW_Active_Staff_Master.Company_Name",
                                    strWhere,
                                    "Company_Name"
                                  );
            objclsLeave_Master.FnFormatCondition
                                  (
                                    Company_Unit_Name.SelectedValue,
                                    "VW_Active_Staff_Master.Company_Unit_Name",
                                    strCondition,
                                    "Company_Unit_Name"
                                  );
            strCondition = objclsLeave_Master.FnFormatCondition
                                  (
                                    Designation_Name.SelectedValue,
                                    "VW_Active_Staff_Master.Designation_Name",
                                    strCondition,
                                    "Designation_Name"
                                  );
            strCondition = objclsLeave_Master.FnFormatCondition
                                  (
                                    Department_Name.SelectedValue,
                                    "VW_Active_Staff_Master.Department_Name",
                                    strCondition,
                                    "Department_Name"
                                  );
            strCondition = objclsLeave_Master.FnFormatCondition
                                  (
                                    Team_Name.SelectedValue,
                                    "VW_Active_Staff_Master.Team_Name",
                                    strCondition,
                                    "Team_Name"
                                  );
            // Response.Write("select [Staff_Id], [Staff_Name]  from VW_Active_Staff_Master " + strCondition);



            objclsLeave_Master.BindDropDownList
            (
                "select [Staff_Id], [Staff_Name]  from VW_Active_Staff_Master " + strCondition + strQuery,
                Staff_NameTxt
            );

          
        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'Staff_Master_Staff_Name' error details:" + Convert.ToString(err.Message), tdMessage);
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (!Page.IsPostBack)
            {

                Bind_Grid_Leave_Master(Grid_Leave_Master);
                Company_Master_Company_Name();
                Company_Unit_Master_Company_Unit_Name();
                Department_Master_Department_Name();
                Team_Master_Team_Name();
                Designation_Master_Designation_Name();
                Staff_Master_Staff_Name();
                bool blnRights = (objclsLeave_Master.ReturnDataTable("SELECT ISNULL(Reporting_Staff,0) FROM Reporting_Master WHERE Responsible_Staff IN('" + Convert.ToString(Session["Login_Id"]) + "') ").Rows.Count > 0);

                if (!Convert.ToBoolean(Session["Admin"]) && !IsOperationDepartment() && !blnRights)
                {
                    Leave_Approve.SelectedValue = "";
                    trApprove.Visible = false;
                }


                //Response.Write(Convert.ToString(Request.QueryString["ThisStaff_Id"])+"....."+ Convert.ToString(Request.QueryString["LeaveDate"]));
                //Response.End();
                Leave_Edit(Convert.ToString(Request.QueryString["Leave_Id"]));


                Leave_Req(Convert.ToString(Request.QueryString["ThisStaff_Id"]), Convert.ToString(Request.QueryString["LeaveDate"]).Replace("'", ""));

               
            }
        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'Page_Load' error details:" + Convert.ToString(err.Message), tdMessage);
        }
    }
    protected void Leave_Master_SaveToSql(object sender, EventArgs e)
    {
        //try
        //{
        if (Convert.ToString(Staff_NameTxt.SelectedValue) == "" || Convert.ToString(Leave_From.Text) == "" || Convert.ToString(Leave_To.Text) == "")
        {
            objclsLeave_Master.WarningMessage("Invalid Leave Entry, make sure you have selected your name, leave from and leave to fields.", tdMessage);
            return;
        }
        string LeaveId = (Convert.ToString(Leave_Id.Text) == "") ? "0" : Convert.ToString(Leave_Id.Text);

        string strQuery = " SELECT * FROM Leave_Master a WHERE Staff_Name='" + Convert.ToString(Staff_NameTxt.SelectedValue) + "' AND  EXISTS(" +
                              " SELECT * FROM DatesBetween('" + Convert.ToString(Leave_From.Text) + "','" + Convert.ToString(Leave_To.Text) + "')" +
                              " WHERE DateValue BETWEEN a.Leave_From and a.Leave_To) AND Leave_Id NOT IN(" + LeaveId + ")";

        if (objclsLeave_Master.IsRecordExists(strQuery))
        {
            objclsLeave_Master.WarningMessage("Leave already exists in the database.", tdMessage);
            return;
        }

        string ThisStaffName = Convert.ToString(Staff_NameTxt.SelectedItem.Text);
        string LeaveFrom = Convert.ToString(Leave_From.Text);
        string LeaveTo = Convert.ToString(Leave_To.Text);
        string datetod = Convert.ToString(CurrentUtcTime);
        string Status = Convert.ToString(Leave_Approve.SelectedValue);


        SaveDataToSql
        (
            objclsLeave_Master.ReturnValue(Convert.ToString(Leave_Id.Text), "int"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Company_Name.SelectedValue), "int"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Company_Unit_Name.SelectedValue), "int"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Department_Name.SelectedValue), "int"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Team_Name.SelectedValue), "int"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Designation_Name.SelectedValue), "int"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Staff_NameTxt.SelectedValue), "int"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Leave_From.Text), "datetime"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Leave_To.Text), "datetime"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Total_Leave.Text), "decimal"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Reason_for_leave.Text), "varchar"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Remarks.Text), "varchar"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Session["Unit_Id"]), "int"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Session["Login_Id"]), "int"),
            objclsLeave_Master.ReturnValue(Convert.ToString(DateTime.UtcNow.AddHours(5).AddMinutes(30)), "datetime"),
            objclsLeave_Master.ReturnValue(Convert.ToString(LeaveType.SelectedValue), "varchar"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Leave_Approve.SelectedValue), "varchar")
        );
        if (trApprove.Visible == true)
        {



            DataTable objDataTable = objclsLeave_Master.ReturnDataTable
            (
                "SELECT top 1 Email_Id FROM Staff_Master WHERE Staff_Name='" + ThisStaffName + "'"
            );
            string LeaveSeeker = Convert.ToString(objDataTable.Rows[0]["Email_Id"]);
            //Response.Write(Status + "...." + datetod + "......" + LeaveSeeker);
            //Response.End();
            string strBody = "<html>" +
                                "<head>" +
                                "</head>" +
                                "<body>" +
                                "<b>Hello " + ThisStaffName + "</b>,<br />" +
                                "<p>Your leave request for dates from " + LeaveFrom + " to " + LeaveTo + " applied on " + datetod + " has been <b><u>" + Status + "</b></u>." +
                                "<br /><br /> " +
                                "Regards,<br>" +
                                "TaskThru Team" +
                                "</body>" +
                                "</html>";

            MailMessage mailObj = new MailMessage(
                "noreply@taskthru.com", LeaveSeeker, "Leave Request Status - " + Status, strBody);
            mailObj.IsBodyHtml = true;
            SmtpClient SMTPServer = new SmtpClient();
            SMTPServer.UseDefaultCredentials = false;
            System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
            NetworkCred.UserName = "noreply@taskthru.com";
            NetworkCred.Password = "mathews.2768";
            SMTPServer.Credentials = NetworkCred;
            SMTPServer.Host = "smtp.1and1.com";
            //SMTPServer.Send(mailObj);
            try
            {
                SMTPServer.Send(mailObj);
            }
            catch (Exception ex)
            {
                // throw ex;
                objclsLeave_Master.WarningMessage("Error occurred in method of 'Email sending' error details:" + Convert.ToString(ex.Message), tdMessage);

            }
        }
        else
        {
        }


        //}
        //catch(Exception err)
        //{
        //    objclsLeave_Master.WarningMessage("Error occurred in method of 'Leave_Master_SaveToSql' error details:"+Convert.ToString(err.Message),tdMessage);
        //}


    }
    //protected void SendEmailNotificationToUser(string StaffName, string LeaveFrom, string LeaveTo, string datetod, string Status)
    //{
    //    DataTable objDataTable = objclsLeave_Master.ReturnDataTable
    //      (
    //          "SELECT top 1 Email_Id FROM Staff_Master WHERE Staff_Name='" + StaffName + "'"
    //      );
    //    string LeaveSeeker = Convert.ToString(objDataTable.Rows[0]["Email_Id"]);
    //    string strBody = "<html>" +
    //                        "<head>" +
    //                        "</head>" +
    //                        "<body>" +
    //                        "<b>Hello " + StaffName + ",</b>,<br />" +
    //                        "<p>Your leave request for dates from <b>" + LeaveFrom + "</b> to " + LeaveTo + " applied on " + datetod + " has been <b><u>" + Status + "</b></u>." +
    //                        "<br /><br /> " +
    //                        "Regards,<br>" +
    //                        "TaskThru Team" +
    //                        "</body>" +
    //                        "</html>";

    //    MailMessage mailObj = new MailMessage(
    //        "noreply@taskthru.com", LeaveSeeker, "Leave Request Status - " + Status, strBody);
    //    mailObj.IsBodyHtml = true;
    //    SmtpClient SMTPServer = new SmtpClient();
    //    SMTPServer.UseDefaultCredentials = false;
    //    System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
    //    NetworkCred.UserName = "noreply@taskthru.com";
    //    NetworkCred.Password = "mathews.2768";
    //    SMTPServer.Credentials = NetworkCred;
    //    SMTPServer.Host = "smtp.1and1.com";
    //    try
    //    {
    //        SMTPServer.Send(mailObj);
    //    }
    //    catch (Exception ex)
    //    {
    //        // throw ex;
    //        objclsLeave_Master.WarningMessage("Error occurred in method of 'Email sending' error details:" + Convert.ToString(ex.Message), tdMessage);

    //    }
    //}
    protected void Company_Name_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Company_Unit_Master_Company_Unit_Name();
        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'Company_Name_OnSelectedIndexChanged' error details:" + Convert.ToString(err.Message), tdMessage);
        }
    }
    protected void Department_Name_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Team_Master_Team_Name();
        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'Department_Name_OnSelectedIndexChanged' error details:" + Convert.ToString(err.Message), tdMessage);
        }
    }
    protected void Designation_Name_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Staff_Master_Staff_Name();

        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'Designation_Name_OnSelectedIndexChanged' error details:" + Convert.ToString(err.Message), tdMessage);
        }
    }
    protected void Leave_Master_NewForm(object sender, EventArgs e)
    {
        try
        {
            Leave_Master_ClearForm();
        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'Leave_Master_NewForm' error details:" + Convert.ToString(err.Message), tdMessage);
        }
    }
    protected void Leave_Master_ClearForm()
    {
        try
        {
            Leave_Id.Text = "";
            Company_Name.SelectedValue = "";
            Company_Unit_Name.SelectedValue = "";
            Department_Name.SelectedValue = "";
            Team_Name.SelectedValue = "";
            Designation_Name.SelectedValue = "";
            Staff_NameTxt.SelectedValue = "";
            Leave_From.Text = "";
            Leave_To.Text = "";
            Total_Leave.Text = "";
            Reason_for_leave.Text = "";
            Remarks.Text = "";
            LeaveType.SelectedValue = "";
            Leave_Approve.SelectedValue = "";

        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'Leave_Master_ClearForm' error details:" + Convert.ToString(err.Message), tdMessage);
        }
    }

    protected bool Check_LastLeave(string Leave_Id)
    {
        return objclsLeave_Master.IsRecordExists("select * from Leave_Master Where Leave_Id='" + Leave_Id + "' AND DATEDIFF(dd,Entered_Date,getDate())");
    }

    protected void Leave_Master_DeleteFromSql(object sender, EventArgs e)
    {
        try
        {
            if (!Convert.ToBoolean(Session["Admin"]) && !IsOperationDepartment())
            {
                if (Check_LastLeave(Leave_Id.Text))
                {
                    objclsLeave_Master.Sql_ExecuteNoNQuery
                    (
                        "DELETE FROM Leave_Master WHERE [Leave_Id]='" + Leave_Id.Text + "'"
                    );
                    Leave_Master_ClearForm();
                    Bind_Grid_Leave_Master(Grid_Leave_Master);
                    objclsLeave_Master.SuccessMessage("You can't delete your leave contact operation department.", tdMessage);
                }
                else
                {
                    objclsLeave_Master.SuccessMessage("Record has been successfully deleted in the database.", tdMessage);
                }
            }
            else
            {
                objclsLeave_Master.Sql_ExecuteNoNQuery
                (
                    "DELETE FROM Leave_Master WHERE [Leave_Id]='" + Leave_Id.Text + "'"
                );

                Leave_Master_ClearForm();
                Bind_Grid_Leave_Master(Grid_Leave_Master);
                objclsLeave_Master.SuccessMessage("Record has been successfully deleted in the database.", tdMessage);
            }

        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'Leave_Master_DeleteFromSql' error details:" + Convert.ToString(err.Message), tdMessage);
        }
    }

    protected void Grid_Leave_Master_EditReload(object sender, CommandEventArgs e)
    {
        try
        {
            Leave_Edit(Convert.ToString(e.CommandArgument));

        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'Grid_Leave_Master_EditReload' error details:" + Convert.ToString(err.Message), tdMessage);
        }
    }
    protected void SetAllDropDownsOnStaffSelectionEdit(string StaffID)
    {
        string ThatStaff = StaffID;

        try
        {
            string strQuery = "Select * from Staff_Master_FullRootView where Staff_Id = '" + ThatStaff + "'";

            DataTable objDataTable = objclsLeave_Master.ReturnDataTable
             (
                 "Select * from Staff_Master_FullRootView where Staff_Id = '" + ThatStaff + "'"
             );
            string DepartmentID = Convert.ToString(objDataTable.Rows[0]["Department_Id"]);
            string DepartmentName = Convert.ToString(objDataTable.Rows[0]["Department_Name"]);
            string DesignationID = Convert.ToString(objDataTable.Rows[0]["Designation_Id"]);
            string DesignationName = Convert.ToString(objDataTable.Rows[0]["Designation_Name"]);
            string CoUnitID = Convert.ToString(objDataTable.Rows[0]["Unit_Id"]);
            string CoUnitName = Convert.ToString(objDataTable.Rows[0]["Company_Unit_Name"]);
            string CoId = Convert.ToString(objDataTable.Rows[0]["Company_Id"]);
            string CompanyName = Convert.ToString(objDataTable.Rows[0]["Company_Name"]);
            string TeamID = Convert.ToString(objDataTable.Rows[0]["Team_Id"]);
            string TeamName = Convert.ToString(objDataTable.Rows[0]["Team_Name"]);
            string ThisStaffID = Convert.ToString(objDataTable.Rows[0]["Staff_Id"]);


            objclsLeave_Master.BindDropDownList
                (
                strQuery,
                Company_Name
                );


            objclsLeave_Master.BindDropDownList
              (
              strQuery,
              Department_Name
              );
            objclsLeave_Master.BindDropDownList
            (
            strQuery,
            Team_Name
            );
            objclsLeave_Master.BindDropDownList
           (
           strQuery,
           Company_Unit_Name
           );
            objclsLeave_Master.BindDropDownList
                  (
                  strQuery,
                  Designation_Name
                  );
            objclsLeave_Master.BindDropDownList
               (
               strQuery,
               Staff_NameTxt
               );
            Designation_Name.SelectedValue = DesignationID;
            Department_Name.SelectedValue = DepartmentID;
            Team_Name.SelectedValue = TeamID;
            Company_Name.SelectedValue = CoId;
            Company_Unit_Name.SelectedValue = CoUnitID;
            Staff_NameTxt.SelectedValue = ThisStaffID;
            //SetDDDesignation();
        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'SetAllDropDownsOnStaffSelection' error details:" + Convert.ToString(err.Message), tdMessage);
        }



    }

    protected void Leave_Edit(string Leave_Identity)
    {

        try
        {
            DataTable objDataTable = objclsLeave_Master.ReturnDataTable
            (
                "SELECT * FROM Leave_Master WHERE [Leave_Id]='" + Convert.ToString(Leave_Identity) + "'"
            );
            for (int intRowLoop = 0; intRowLoop < objDataTable.Rows.Count; intRowLoop++)
            {
                SetAllDropDownsOnStaffSelectionEdit(objDataTable.Rows[intRowLoop]["Staff_Name"].ToString());
                Leave_Id.Text = Convert.ToString(objDataTable.Rows[intRowLoop]["Leave_Id"]);
                //Company_Name.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["Company_Name"]);
                //Company_Unit_Master_Company_Unit_Name();
                //Company_Unit_Name.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["Company_Unit_Name"]);
                //Department_Name.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["Department_Name"]);
                //Team_Master_Team_Name();
                //if (Convert.ToString(objDataTable.Rows[intRowLoop]["Team_Name"]) == null || Convert.ToString(objDataTable.Rows[intRowLoop]["Team_Name"]) == "")
                //{
                //    Response.Write("Jiby");
                //    Response.End();
                //    Team_Name.SelectedValue = "0";
                //}
                //else
                //{
                //    Response.Write("Priya");
                //    Response.End();
                //    Team_Name.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["Team_Name"]);


                //}
                //Designation_Name.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["Designation_Name"]);
                //Response.Write(Convert.ToString(objDataTable.Rows[intRowLoop]["Staff_Name"]));
                //Response.End();
                //LoadAllStaff();
                //Staff_NameTxt.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["Staff_Name"]);

                FnApprove_ControlCheck();
                Leave_From.Text = Convert.ToString(objDataTable.Rows[intRowLoop]["Leave_From"]);
                Leave_To.Text = Convert.ToString(objDataTable.Rows[intRowLoop]["Leave_To"]);
                Total_Leave.Text = Convert.ToString(objDataTable.Rows[intRowLoop]["Total_Leave"]);
                Reason_for_leave.Text = Convert.ToString(objDataTable.Rows[intRowLoop]["Reason_for_leave"]);
                Remarks.Text = Convert.ToString(objDataTable.Rows[intRowLoop]["Remarks"]);
                LeaveType.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["LeaveType"]);
                Leave_Approve.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["Approve_Status"]);
            }
        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'Leave_Edit' error details:" + Convert.ToString(err.Message), tdMessage);
        }

    }
    protected void Leave_Req(string ThisStaff_Id, string ThisDate)
    {

        try
        {
            DataTable objDataTable = objclsLeave_Master.ReturnDataTable
            (
                "SELECT * FROM Staff_Master WHERE [Staff_Id]='" + ThisStaff_Id + "'"
            );
            for (int intRowLoop = 0; intRowLoop < objDataTable.Rows.Count; intRowLoop++)
            {
                SetAllDropDownsOnStaffSelection();
                //Leave_Id.Text = Convert.ToString(objDataTable.Rows[intRowLoop]["Leave_Id"]);
                //Company_Name.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["Company_Name"]);
                //Company_Unit_Master_Company_Unit_Name();
                //Company_Unit_Name.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["Company_Unit_Name"]);
                //Department_Name.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["Department_Name"]);
                //Team_Master_Team_Name();
                //Team_Name.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["Team_Name"]);
                //Designation_Name.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["Designation_Name"]);
                ////Staff_Master_Staff_Name();
                //Staff_NameTxt.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["Staff_Id"]);
                //FnApprove_ControlCheck();
                Leave_From.Text = ThisDate;
                //Leave_To.Text = Convert.ToString(objDataTable.Rows[intRowLoop]["Leave_To"]);
                //Total_Leave.Text = Convert.ToString(objDataTable.Rows[intRowLoop]["Total_Leave"]);
                //Reason_for_leave.Text = Convert.ToString(objDataTable.Rows[intRowLoop]["Reason_for_leave"]);
                //Remarks.Text = Convert.ToString(objDataTable.Rows[intRowLoop]["Remarks"]);
                //LeaveType.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["LeaveType"]);
                //Leave_Approve.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["Approve_Status"]);

                trApprove.Visible = false;
                Leave_Approve.Visible = false;
            }
        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'Leave_Edit' error details:" + Convert.ToString(err.Message), tdMessage);
        }

    }
    protected void Grid_Leave_Master_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView objGrid = ((GridView)(sender));
        if (e.NewPageIndex > -1)
        {
            objGrid.PageIndex = e.NewPageIndex;
            Bind_Grid_Leave_Master(objGrid);
        }
    }
    protected void Bind_Grid_Leave_Master(GridView objGrid)
    {
        string strWhere = "";
        if (!Convert.ToBoolean(Session["Admin"]) && !IsOperationDepartment())
        {
            strWhere = " Where Unit_Id=" + Convert.ToString(Session["Unit_Id"]) + " " +
                        " AND Staff_Id IN ( SELECT [Staff_Id] FROM VW_Active_Staff_Master Where Staff_Id='" + Convert.ToString(Session["Login_Id"]) + "' UNION " +
                             " SELECT [Staff_Id] FROM VW_Active_Staff_Master Where Staff_Id IN(SELECT ISNULL(Reporting_Staff,0) FROM Reporting_Master WHERE Responsible_Staff IN('" + Convert.ToString(Session["Login_Id"]) + "') ))";

        }

        objclsLeave_Master.BindGridView("select * from VW_Leave_Master " + strWhere, objGrid);
        objclsLeave_Master.GridBottomPagerPosition(objGrid);
    }

    protected void Btn_SendMail_Click()
    {
        DataTable objDataTable = objclsLeave_Master.ReturnDataTable
           (
               "SELECT top 1 Email_Id FROM Staff_Master WHERE [Level]='100'"
           );
        string LeaveAdministrator = Convert.ToString(objDataTable.Rows[0]["Email_Id"]);
        string strBody = "<html>" +
                            "<head>" +
                            "</head>" +
                            "<body>" +
                            "<b>Hello Sir/Ma'am</b>,<br />" +
                            "<p>Leave request for <b>" + Staff_NameTxt.SelectedItem.Text + "</b> on " + Leave_From.Text + " to " + Leave_To.Text + "." +
                            "<br /><br /> " +
                            "Regards,<br>" +
                            "TaskThru Team" +
                            "</body>" +
                            "</html>";

        MailMessage mailObj = new MailMessage(
            "noreply@taskthru.com", LeaveAdministrator, "Leave Request for " + Staff_NameTxt.SelectedItem.Text, strBody);
        mailObj.IsBodyHtml = true;
        SmtpClient SMTPServer = new SmtpClient();
        SMTPServer.UseDefaultCredentials = false;
        System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
        NetworkCred.UserName = "noreply@taskthru.com";
        NetworkCred.Password = "mathews.2768";
        SMTPServer.Credentials = NetworkCred;
        SMTPServer.Host = "smtp.1and1.com";
        try
        {
            SMTPServer.Send(mailObj);
        }
        catch (Exception ex)
        {
            // throw ex;
            objclsLeave_Master.WarningMessage("Error occurred in method of 'Email sending' error details:" + Convert.ToString(ex.Message), tdMessage);

        }
    }
    protected void SaveDataToSql
    (
            object objLeave_Id,
            object objCompany_Name,
            object objCompany_Unit_Name,
            object objDepartment_Name,
            object objTeam_Name,
            object objDesignation_Name,
            object objStaff_Name,
            object objLeave_From,
            object objLeave_To,
            object objTotal_Leave,
            object objReason_for_leave,
            object objRemarks,
            object objEntered_Unit,
            object objEntered_By,
            object objEntered_Date,
            object objLeaveType,
            object objLeaveApprove
        )
    {
        try
        {
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("SP_Leave_Master", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Leave_Id", objLeave_Id);
                    cmd.Parameters.AddWithValue("@Company_Name", objCompany_Name);
                    cmd.Parameters.AddWithValue("@Company_Unit_Name", objCompany_Unit_Name);
                    cmd.Parameters.AddWithValue("@Department_Name", objDepartment_Name);
                    cmd.Parameters.AddWithValue("@Team_Name", objTeam_Name);
                    cmd.Parameters.AddWithValue("@Designation_Name", objDesignation_Name);
                    cmd.Parameters.AddWithValue("@Staff_Name", objStaff_Name);
                    cmd.Parameters.AddWithValue("@Leave_From", objLeave_From);
                    cmd.Parameters.AddWithValue("@Leave_To", objLeave_To);
                    cmd.Parameters.AddWithValue("@Total_Leave", objTotal_Leave);
                    cmd.Parameters.AddWithValue("@Reason_for_leave", objReason_for_leave);
                    cmd.Parameters.AddWithValue("@Remarks", objRemarks);
                    cmd.Parameters.AddWithValue("@Entered_Unit", objEntered_Unit);
                    cmd.Parameters.AddWithValue("@Entered_By", objEntered_By);
                    cmd.Parameters.AddWithValue("@Entered_Date", objEntered_Date);
                    cmd.Parameters.AddWithValue("@LeaveType", objLeaveType);
                    cmd.Parameters.AddWithValue("@Leave_Approve", objLeaveApprove);
                    SqlDataReader objReader = cmd.ExecuteReader();
                }
            }

            if (Convert.ToString(objLeaveApprove) == "")
                Btn_SendMail_Click();

            Leave_Master_ClearForm();
            Bind_Grid_Leave_Master(Grid_Leave_Master);
            objclsLeave_Master.SuccessMessage("Record has been successfully updated in the database.", tdMessage);

        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'SaveDataToSql' error details:" + Convert.ToString(err.Message), tdMessage);
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void RateOrganizationClick(object sender, EventArgs e)
    {
        Response.Redirect("~/Happy_Master/Happy_Rating.aspx");
    }
    protected void RateCoWorkersBtnClick(object sender, EventArgs e)
    {
        Response.Redirect("~/Happy_Master/Happy_Rating.aspx?Type=Admin");
    }
    protected void AdvancesRqst_Click(object sender, EventArgs e)
    {
        AdvanceApproval.Visible = true;
        AdvancesGridPanel.Visible = true;
        Bind_Grid_Advances(AdvancesGrid);
        FnAdvanceApprove_ControlCheck();
        AminAndOperationsDept();
        TargetsNIncentivesPanel.Visible = false;
        OnlyLeave.Visible = false;
    }
    protected void AdvanceAmount_TextChanged(object sender, EventArgs e)
    {
        InstalmentAmotText.Text = AdvanceAmount.Text;
    }

    protected void SubmitRequest_Click(object sender, EventArgs e)
    {
        if (Convert.ToString(Staff_NameTxt.SelectedValue) == "" || Convert.ToString(AdvanceAmount.Text) == "")
        {
            objclsLeave_Master.WarningMessage("Invalid Advance Requisition Entry, make sure you have selected your name and the advance amount.", tdMessage);
            return;
        }
        //string AdvanceId = (Convert.ToString(Advance_Id.Text) == "") ? "0" : Convert.ToString(Advance_Id.Text);

        //string strQuery = " SELECT * FROM AdvancesMaster a WHERE Staff_Name='" + Convert.ToString(Staff_Name.SelectedValue) + "' AND  EXISTS(" +
        //                      " SELECT * FROM DatesBetween('" + Convert.ToString(Leave_From.Text) + "','" + Convert.ToString(Leave_To.Text) + "')" +
        //                      " WHERE DateValue BETWEEN a.Leave_From and a.Leave_To) AND Leave_Id NOT IN(" + LeaveId + ")";

        //if (objclsLeave_Master.IsRecordExists(strQuery))
        //{
        //    objclsLeave_Master.WarningMessage("Leave already exists in the database.", tdMessage);
        //    return;
        //}

        string ThisStaffName = Convert.ToString(Staff_NameTxt.SelectedItem.Text);
        string AdvanceAmount1 = AdvanceAmount.Text;
        //string LeaveTo = Convert.ToString(Leave_To.Text);
        //string datetod = Convert.ToString(DateTime.UtcNow.AddHours(5).AddMinutes(30));

        //string Status = Convert.ToString(Leave_Approve.SelectedValue);
        //  objclsLeave_Master.ReturnValue(Convert.ToString(Leave_Id.Text), "int"),
        //    objclsLeave_Master.ReturnValue(Convert.ToString(Company_Name.SelectedValue), "int"),
        //    objclsLeave_Master.ReturnValue(Convert.ToString(Company_Unit_Name.SelectedValue), "int"),
        //    objclsLeave_Master.ReturnValue(Convert.ToString(Department_Name.SelectedValue), "int"),
        //    objclsLeave_Master.ReturnValue(Convert.ToString(Team_Name.SelectedValue), "int"),
        //    objclsLeave_Master.ReturnValue(Convert.ToString(Designation_Name.SelectedValue), "int"),
        //    objclsLeave_Master.ReturnValue(Convert.ToString(Staff_Name.SelectedValue), "int"),
        //    objclsLeave_Master.ReturnValue(Convert.ToString(Leave_From.Text), "datetime"),
        //    objclsLeave_Master.ReturnValue(Convert.ToString(Leave_To.Text), "datetime"),
        //    objclsLeave_Master.ReturnValue(Convert.ToString(Total_Leave.Text), "decimal"),
        //    objclsLeave_Master.ReturnValue(Convert.ToString(Reason_for_leave.Text), "varchar"),
        //    objclsLeave_Master.ReturnValue(Convert.ToString(Remarks.Text), "varchar"),
        //    objclsLeave_Master.ReturnValue(Convert.ToString(Session["Unit_Id"]), "int"),
        //    objclsLeave_Master.ReturnValue(Convert.ToString(Session["Login_Id"]), "int"),
        //    objclsLeave_Master.ReturnValue(Convert.ToString(DateTime.UtcNow.AddHours(5).AddMinutes(30)), "datetime"),
        //    objclsLeave_Master.ReturnValue(Convert.ToString(LeaveType.SelectedValue), "varchar"),
        //    objclsLeave_Master.ReturnValue(Convert.ToString(Leave_Approve.SelectedValue), "varchar")

        SaveAdvancesDataToSql
        (
            objclsLeave_Master.ReturnValue(Convert.ToString(Advance_Id.Text), "int"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Company_Name.SelectedValue), "int"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Company_Unit_Name.SelectedValue), "int"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Department_Name.SelectedValue), "int"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Team_Name.SelectedValue), "int"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Designation_Name.SelectedValue), "int"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Staff_NameTxt.SelectedValue), "int"),
            objclsLeave_Master.ReturnValue(Convert.ToString(AdvanceAmount.Text), "int"),
            objclsLeave_Master.ReturnValue(Convert.ToString(InstalmentsTxt.Text), "int"),
            objclsLeave_Master.ReturnValue(Convert.ToString(InstalmentAmotText.Text), "int"),
            objclsLeave_Master.ReturnValue(Convert.ToString(AdvanceRemarksTxt.Text), "varchar"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Session["Unit_Id"]), "int"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Session["Login_Id"]), "int"),
            objclsLeave_Master.ReturnValue(Convert.ToString(DateTime.UtcNow.AddHours(5).AddMinutes(30)), "datetime"),
            objclsLeave_Master.ReturnValue("Not Approved", "varchar"),
            objclsLeave_Master.ReturnValue(Convert.ToString(Session["Login_Id"]), "int"),
            objclsLeave_Master.ReturnValue(Convert.ToString(DateTime.UtcNow.AddHours(5).AddMinutes(30)), "datetime"),
            objclsLeave_Master.ReturnValue(Convert.ToString(AdvanceRemarksTxt.Text), "varchar")


        );
        Bind_Grid_Advances(AdvancesGrid);
        //if (trApprove.Visible == true)
        //{



        //DataTable objDataTable = objclsLeave_Master.ReturnDataTable
        //(
        //    "SELECT top 1 Email_Id FROM Staff_Master WHERE Staff_Name='" + ThisStaffName + "'"
        //);
        //string LeaveSeeker = Convert.ToString(objDataTable.Rows[0]["Email_Id"]);

        //string strBody = "<html>" +
        //                    "<head>" +
        //                    "</head>" +
        //                    "<body>" +
        //                    "<b>Hello " + ThisStaffName + "</b>,<br />" +
        //                    "<p>Your leave request for dates from " + LeaveFrom + " to " + LeaveTo + " applied on " + datetod + " has been <b><u>" + Status + "</b></u>." +
        //                    "<br /><br /> " +
        //                    "Regards,<br>" +
        //                    "TaskThru Team" +
        //                    "</body>" +
        //                    "</html>";

        //MailMessage mailObj = new MailMessage(
        //    "noreply@taskthru.com", LeaveSeeker, "Leave Request Status - " + Status, strBody);
        //mailObj.IsBodyHtml = true;
        //SmtpClient SMTPServer = new SmtpClient();
        //SMTPServer.UseDefaultCredentials = false;
        //System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
        //NetworkCred.UserName = "noreply@taskthru.com";
        //NetworkCred.Password = "mathews.2768";
        //SMTPServer.Credentials = NetworkCred;
        //SMTPServer.Host = "smtp.1and1.com";
        ////SMTPServer.Send(mailObj);
        //try
        //{
        //    SMTPServer.Send(mailObj);
        //}
        //catch (Exception ex)
        //{
        //    // throw ex;
        //    objclsLeave_Master.WarningMessage("Error occurred in method of 'Email sending' error details:" + Convert.ToString(ex.Message), tdMessage);

        //}
        //}
        //else
        //{
        //}
    }

    protected void SaveAdvancesDataToSql
(
        object objAdvance_Id,
        object objCompany_Name,
        object objCompany_Unit_Name,
        object objDepartment_Name,
        object objTeam_Name,
        object objDesignation_Name,
        object objStaff_Name,
        object objAmount,
        object objInstalmentNo,
        object objInstalmentAmount,
        object objRemarks,
        object objEntered_Unit,
        object objEntered_By,
        object objEntered_Date,
        object objAdvanceApprove,
        object objAdvanceApprovedBy,
        object objAdvanceApproveDate,
        object objAdvanceApproveRemarks
    )
    {
        try
        {
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("SP_Advances_Master", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Advance_Id", objAdvance_Id);
                    cmd.Parameters.AddWithValue("@Company_Name", objCompany_Name);
                    cmd.Parameters.AddWithValue("@Company_Unit_Name", objCompany_Unit_Name);
                    cmd.Parameters.AddWithValue("@Department_Name", objDepartment_Name);
                    cmd.Parameters.AddWithValue("@Team_Name", objTeam_Name);
                    cmd.Parameters.AddWithValue("@Designation_Name", objDesignation_Name);
                    cmd.Parameters.AddWithValue("@Staff_Name", objStaff_Name);
                    cmd.Parameters.AddWithValue("@Amount", objAmount);
                    cmd.Parameters.AddWithValue("@Instalments", objInstalmentNo);
                    cmd.Parameters.AddWithValue("@InstalmentAmount", objInstalmentAmount);
                    cmd.Parameters.AddWithValue("@Remarks", objRemarks);
                    cmd.Parameters.AddWithValue("@Entered_Unit", objEntered_Unit);
                    cmd.Parameters.AddWithValue("@Entered_By", objEntered_By);
                    cmd.Parameters.AddWithValue("@Entered_Date", objEntered_Date);
                    cmd.Parameters.AddWithValue("@Advance_Approve", objAdvanceApprove);
                    cmd.Parameters.AddWithValue("@Approved_By", objAdvanceApprovedBy);
                    cmd.Parameters.AddWithValue("@Approval_Date", objAdvanceApproveDate);
                    cmd.Parameters.AddWithValue("@Approval_remarks", objAdvanceApproveRemarks);
                    SqlDataReader objReader = cmd.ExecuteReader();
                }
            }


            Btn_Advances_SendMail_Click();

            Leave_Master_ClearForm();
            Bind_Grid_Advances(AdvancesGrid);
            objclsLeave_Master.SuccessMessage("Record has been successfully updated in the database.", tdMessage);

        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'SaveDataToSql' error details:" + Convert.ToString(err.Message), tdMessage);
        }
    }


    protected void FnAdvanceApprove_ControlCheck()
    {
        if (Staff_NameTxt.SelectedValue == Convert.ToString(Session["Login_Id"]) && !Convert.ToBoolean(Session["Admin"]) && !IsOperationDepartment())
        {
            AdvancesApprovalDD.SelectedValue = "";
            trAdvanceApprovals.Visible = false;
        }

    }
    protected void AminAndOperationsDept()
    {
        bool blnRights2 = (objclsLeave_Master.ReturnDataTable("SELECT ISNULL(Reporting_Staff,0) FROM Reporting_Master WHERE Responsible_Staff IN('" + Convert.ToString(Session["Login_Id"]) + "') ").Rows.Count > 0);

        if (!Convert.ToBoolean(Session["Admin"]) && !IsOperationDepartment() && !blnRights2)
        {

            AdvancesApprovalDD.SelectedValue = "";
            trAdvanceApprovals.Visible = false;
        }
        else
        {

            AdvancesApprovalDD.SelectedValue = "";
            trAdvanceApprovals.Visible = true;
        }

    }
    protected void Bind_Grid_Advances(GridView objGrid)
    {
        string strWhere = "";
        if (!Convert.ToBoolean(Session["Admin"]) && !IsOperationDepartment())
        {
            strWhere = " Where Unit_Id=" + Convert.ToString(Session["Unit_Id"]) + " " +
                        " AND Staff_Id IN ( SELECT [Staff_Id] FROM VW_Active_Staff_Master Where Staff_Id='" + Convert.ToString(Session["Login_Id"]) + "' UNION " +
                             " SELECT [Staff_Id] FROM VW_Active_Staff_Master Where Staff_Id IN(SELECT ISNULL(Reporting_Staff,0) FROM Reporting_Master WHERE Responsible_Staff IN('" + Convert.ToString(Session["Login_Id"]) + "') ))";

        }

        objclsLeave_Master.BindGridView("select * from VW_AdvancesMaster " + strWhere, objGrid);
        objclsLeave_Master.GridBottomPagerPosition(objGrid);
    }
    protected void AdvancesGrid_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView objGrid = ((GridView)(sender));
        if (e.NewPageIndex > -1)
        {
            objGrid.PageIndex = e.NewPageIndex;
            Bind_Grid_Advances(objGrid);
        }
    }
    protected void AdvancesGrid_Master_EditReload(object sender, CommandEventArgs e)
    {
        try
        {
            Advances_Edit(Convert.ToString(e.CommandArgument));

        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'AdvancesGrid_Master_EditReload' error details:" + Convert.ToString(err.Message), tdMessage);
        }
    }

    protected void Advances_Edit(string Advances_Identity)
    {
        Advance_Id.Text = Advances_Identity;
        //Response.Write(Advances_Identity);
        //Response.End();

        try
        {
            string strQuery = "SELECT * FROM VW_AdvancesMaster WHERE [ID]='" + Convert.ToString(Advances_Identity) + "'";
            DataTable objDataTable = objclsLeave_Master.ReturnDataTable
            (
                strQuery
            );
            for (int intRowLoop = 0; intRowLoop < objDataTable.Rows.Count; intRowLoop++)
            {
                objclsLeave_Master.BindDropDownList
                   (
                   strQuery,
                   Company_Name
                   );


                objclsLeave_Master.BindDropDownList
                  (
                  strQuery,
                  Department_Name
                  );
                objclsLeave_Master.BindDropDownList
                (
                strQuery,
                Team_Name
                );
                objclsLeave_Master.BindDropDownList
               (
               strQuery,
               Company_Unit_Name
               );
                objclsLeave_Master.BindDropDownList
                      (
                      strQuery,
                      Designation_Name
                      );

                objclsLeave_Master.BindDropDownList
                   (
                   strQuery,
                   Staff_NameTxt
                   );
                Advance_Id.Text = Convert.ToString(objDataTable.Rows[intRowLoop]["ID"]);

                Company_Name.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["Company_Id"]);
                //Company_Unit_Master_Company_Unit_Name();
                Company_Unit_Name.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["Unit_Id"]);
                Department_Name.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["Department_Id"]);
                //Team_Master_Team_Name();

                Designation_Name.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["Designation_Id"]);
                //Staff_Master_Staff_Name();
                Staff_NameTxt.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["Staff_Id"]);
                FnAdvanceApprove_ControlCheck();
                AdvanceAmount.Text = Convert.ToString(objDataTable.Rows[intRowLoop]["Advance_Amt"]);
                InstalmentsTxt.Text = Convert.ToString(objDataTable.Rows[intRowLoop]["Instalments"]);
                InstalmentAmotText.Text = Convert.ToString(objDataTable.Rows[intRowLoop]["Instalment_Amt"]);
                AdvanceRemarksTxt.Text = Convert.ToString(objDataTable.Rows[intRowLoop]["Remarks"]);
                AdvancesApprovalDD.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["Approval_Status"]);
                Team_Name.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["Team_Id"]);
                InstRad.SelectedValue = Convert.ToString(objDataTable.Rows[intRowLoop]["Instalments"]);

                if (objDataTable.Rows[intRowLoop]["Approval_Status"].ToString() == "Not Approved")
                {
                    SubmitRequest.Text = "Update";
                    SubmitRequest.Enabled = true;
                    DeleteAdvanceBtn.Visible = true;
                }
                else
                {
                    SubmitRequest.Enabled = false;
                    DeleteAdvanceBtn.Visible = false;
                }

            }
        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'Advances_Edit' error details:" + Convert.ToString(err.Message), tdMessage);
        }

    }
    protected void Advance_Master_ClearForm()
    {

        Advance_Id.Text = "";
        Company_Name.SelectedValue = "";
        Company_Unit_Name.SelectedValue = "";
        Department_Name.SelectedValue = "";
        Team_Name.SelectedValue = "";
        Designation_Name.SelectedValue = "";
        Staff_NameTxt.SelectedValue = "";
        AdvanceAmount.Text = "";
        InstalmentsTxt.Text = "";
        InstalmentAmotText.Text = "";
        Remarks.Text = "";
        AdvanceRemarksTxt.Text = "";
        AdvancesApprovalDD.SelectedValue = "";


    }
    protected void Btn_Advances_SendMail_Click()
    {
        DataTable objDataTable = objclsLeave_Master.ReturnDataTable
           (
               "SELECT top 1 Email_Id FROM Staff_Master WHERE [Level]='100'"
           );
        string LeaveAdministrator = Convert.ToString(objDataTable.Rows[0]["Email_Id"]);
        string strBody = "<html>" +
                            "<head>" +
                            "</head>" +
                            "<body>" +
                            "<b>Hello Sir/Ma'am</b>,<br />" +
                            "<p>There is a new advance request for <b>" + Staff_NameTxt.SelectedItem.Text + "</b> ." +
                            "<br/>Please do the needful to update the Advance requisition status accordingly." +
                            "<br /><br /> " +
                            "Regards,<br>" +
                            "TaskThru Team" +
                            "</body>" +
                            "</html>";

        MailMessage mailObj = new MailMessage(
            "noreply@taskthru.com", LeaveAdministrator, "Advance Request for " + Staff_NameTxt.SelectedItem.Text, strBody);
        mailObj.IsBodyHtml = true;
        SmtpClient SMTPServer = new SmtpClient();
        SMTPServer.UseDefaultCredentials = false;
        System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
        NetworkCred.UserName = "noreply@taskthru.com";
        NetworkCred.Password = "mathews.2768";
        SMTPServer.Credentials = NetworkCred;
        SMTPServer.Host = "smtp.1and1.com";
        try
        {
            SMTPServer.Send(mailObj);
        }
        catch (Exception ex)
        {
            // throw ex;
            objclsLeave_Master.WarningMessage("Error occurred in method of 'Email sending' error details:" + Convert.ToString(ex.Message), tdMessage);

        }
    }
    protected void ApproveButton_Click(object sender, EventArgs e)
    {
        string ApproveRemarks = ApprovalRemarks.Text;
        string ThisAdvanceAmount = AdvanceAmount.Text;
        try
        {
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("AdvancesApproval1", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Advance_Id", Advance_Id.Text);
                    cmd.Parameters.AddWithValue("@Advance_Approve", AdvancesApprovalDD.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@Approved_By", Convert.ToString(Session["Login_Id"]));
                    cmd.Parameters.AddWithValue("@Approval_remarks", ApproveRemarks);
                    cmd.Parameters.AddWithValue("@Advance_Amount", ThisAdvanceAmount);
                    cmd.Parameters.AddWithValue("@ApprovalUnitID", Convert.ToString(Session["Unit_Id"]));
                    SqlDataReader objReader = cmd.ExecuteReader();
                }

                string ThisStaffName = Staff_NameTxt.SelectedItem.Text;
                DataTable objDataTable = objclsLeave_Master.ReturnDataTable
           (
               "SELECT top 1 Email_Id FROM Staff_Master WHERE Staff_Name='" + ThisStaffName + "'"
           );
                string LeaveSeeker = Convert.ToString(objDataTable.Rows[0]["Email_Id"]);

                DataTable objDataTable2 = objclsLeave_Master.ReturnDataTable
         (
             "select * from VW_AdvancesMaster where ID='" + Advance_Id.Text + "'"
         );
                string AdvanceAmountText = Convert.ToString(objDataTable2.Rows[0]["Advance_Amt"]);
                string AppliedOn = Convert.ToString(objDataTable2.Rows[0]["Entered_Date"]);
                string ApprovedAmount = Convert.ToString(objDataTable2.Rows[0]["Advance_Amt"]);
                string ApprovedByStaff = Convert.ToString(objDataTable2.Rows[0]["Approved_By_Staff"]);
                string ApprovalRemarksText = Convert.ToString(objDataTable2.Rows[0]["Approval_Remarks"]);
                string status = AdvancesApprovalDD.SelectedItem.Text;
                string strBody = "";
                if (ApprovalRemarks.Text != "")
                {
                    strBody = "<html>" +
                                       "<head>" +
                                       "</head>" +
                                       "<body>" +
                                       "<b>Hello " + ThisStaffName + "</b>,<br />" +
                                       "<p>Your advance request applied on " + AppliedOn + " has been <b><u>" + AdvancesApprovalDD.SelectedItem.Text + "</u> by " + ApprovedByStaff + " for amount - " + ApprovedAmount + "</b>." +
                                       "<br/>" + ApprovedByStaff + ", has also left the remarks as below :<br/>" +
                                       ApprovalRemarksText + "." +
                                       "<br /><br /> " +
                                       "Regards,<br>" +
                                       "TaskThru Team" +
                                       "</body>" +
                                       "</html>";
                }
                else
                {
                    strBody = "<html>" +
                                 "<head>" +
                                 "</head>" +
                                 "<body>" +
                                 "<b>Hello " + ThisStaffName + "</b>,<br />" +
                                 "<p>Your advance request applied on " + AppliedOn + " has been <b><u>" + AdvancesApprovalDD.SelectedItem.Text + "</u> by " + ApprovedByStaff + " for amount - " + ApprovedAmount + "</b>." +
                                 "<br /><br /> " +
                                 "Regards,<br>" +
                                 "TaskThru Team" +
                                 "</body>" +
                                 "</html>";
                }

                MailMessage mailObj = new MailMessage(
                    "noreply@taskthru.com", LeaveSeeker, "Advance Request Status - " + status, strBody);
                mailObj.IsBodyHtml = true;
                SmtpClient SMTPServer = new SmtpClient();
                SMTPServer.UseDefaultCredentials = false;
                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                NetworkCred.UserName = "noreply@taskthru.com";
                NetworkCred.Password = "mathews.2768";
                SMTPServer.Credentials = NetworkCred;
                SMTPServer.Host = "smtp.1and1.com";
                //SMTPServer.Send(mailObj);
                try
                {
                    SMTPServer.Send(mailObj);
                }
                catch (Exception ex)
                {
                    // throw ex;
                    objclsLeave_Master.WarningMessage("Error occurred in method of 'Email sending' error details:" + Convert.ToString(ex.Message), tdMessage);

                }
            }

            //if (Convert.ToString(objAdvanceApprove) == "")


            //Leave_Master_ClearForm();
            Bind_Grid_Advances(AdvancesGrid);
            Advance_Master_ClearForm();
            objclsLeave_Master.SuccessMessage("Record has been successfully updated in the database.", tdMessage);

        }
        catch (Exception err)
        {
            objclsLeave_Master.WarningMessage("Error occurred in method of 'SaveAdvancesApproval' error details:" + Convert.ToString(err.Message), tdMessage);
        }
    }
    protected void Button2_Click1(object sender, EventArgs e)
    {
        if (Advance_Id.Text != "")
        {
            objclsLeave_Master.Sql_ExecuteNoNQuery
                    (
                        "DELETE FROM AdvancesMaster WHERE [ID]='" + Advance_Id.Text + "'"
                    );

            Advance_Master_ClearForm();
            Bind_Grid_Advances(AdvancesGrid);
            objclsLeave_Master.SuccessMessage("Record has been successfully deleted in the database.", tdMessage);
            DeleteAdvanceBtn.Visible = false;
        }

    }
    protected void Search_AdvancesGridValue(object sender, EventArgs e)
    {
        string strWhere = "";

        if (!Convert.ToBoolean(Session["Admin"]) && !IsOperationDepartment())
        {
            strWhere = " Where Unit_Id=" + Convert.ToString(Session["Unit_Id"]) + " " +
                        " AND Staff_Id IN ( SELECT [Staff_Id] FROM VW_Active_Staff_Master Where Staff_Id='" + Convert.ToString(Session["Login_Id"]) + "' UNION " +
                             " SELECT [Staff_Id] FROM VW_Active_Staff_Master Where Staff_Id IN(SELECT ISNULL(Reporting_Staff,0) FROM Reporting_Master WHERE Responsible_Staff IN('" + Convert.ToString(Session["Login_Id"]) + "') ))";

        }
        if (TextBox1.Text != "")
        {
            strWhere += (strWhere == "") ? " WHERE  " + DropDownList1.SelectedValue + " Like('" + TextBox1.Text + "%')" : " AND " + DropDownList1.SelectedValue + " Like('" + TextBox1.Text + "%')";
        }

        // Response.Write("select * from VW_Leave_Master " + strWhere);
        // Response.End();
        objclsLeave_Master.BindGridView("select * from VW_AdvancesMaster " + strWhere, AdvancesGrid);
        objclsLeave_Master.GridBottomPagerPosition(AdvancesGrid);
    }
    protected void InstRad_SelectedIndexChanged(object sender, EventArgs e)
    {
        int NoInst = Convert.ToInt16(InstRad.SelectedValue);
        Int64 AdvanceAmount1 = Convert.ToInt64(AdvanceAmount.Text);
        Int64 InstalmentVal = AdvanceAmount1 / NoInst;
        InstalmentsTxt.Text = NoInst.ToString();
        //Response.Write(InstalmentVal);
        //Response.End();
        InstalmentAmotText.Text = InstalmentVal.ToString();
    }
    protected void TargetBtn_Click(object sender, EventArgs e)
    {
        TargetsNIncentivesPanel.Visible = true;
        AdvanceApproval.Visible = false;
        AdvancesGridPanel.Visible = false;

        targetcalc();
    }
    protected void targetcalc()
    {
        string ThisStaff;
        if (Staff_NameTxt.SelectedValue != "0")
        {
            ThisStaff = Staff_NameTxt.SelectedValue.ToString();
        }
        else
        {
            ThisStaff = Session["Login_Id"].ToString();
        }

        DataTable objDataTable = objclsLeave_Master.ReturnDataTable
           (
               "SELECT * FROM Targets WHERE [Staff_Name]='" + ThisStaff + "' and Active=0"
           );
        if (objDataTable.Rows.Count > 0)
        {
            TargetsGrid.DataSource = objDataTable;
            TargetsGrid.DataBind();

            int ActiveTargets = objDataTable.Rows.Count;
            DateTime TargetPeriod = (Convert.ToDateTime(objDataTable.Rows[0]["Effective_From"].ToString()));
            double TargetValidity = Convert.ToDouble(objDataTable.Rows[0]["Days"].ToString());
            DateTime TargetPeriodEnd = TargetPeriod.AddDays(TargetValidity);

            string TargetPeriodStr = TargetPeriod.ToString("dd/MMM/yyyy");
            string EndTargetPeriodStr = TargetPeriodEnd.ToString("dd/MMM/yyyy");

            ActiveTargetLab.Text = ActiveTargets.ToString();
            TargetAmtLab.Text = objDataTable.Rows[0]["Amt"].ToString();

            TargetTerm.Text = EndTargetPeriodStr;

            DataTable objDataTable2 = objclsLeave_Master.ReturnDataTable
              (
                  "SELECT count (BasePrice) as 'TotalNo', ISNULL(Sum(BasePrice),0) as 'TotalValue' FROM CRMInvoices WHERE [Staff_Name]='" + ThisStaff + "' and Added=1 and Entered_Date > '" + TargetPeriod + "' and Entered_Date <= '" + TargetPeriodEnd + "' "
              );

           

            string str5 = "SELECT * FROM CRMInvoiceAndLead WHERE [Staff_Id]='" + ThisStaff + "' and Added=1 and Entered_Date > '" + TargetPeriod + "' and Entered_Date <= '" + TargetPeriodEnd + "' ";
            DataTable objDataTable3 = objclsLeave_Master.ReturnDataTable
              (
                  str5
              );

            //Response.Write(str5);
            //Response.End();
            IncentivesGrid.DataSource = objDataTable3;
            IncentivesGrid.DataBind();

            if  (objDataTable2.Rows.Count > 0)
            {
                string TotalNoOfSales = objDataTable2.Rows[0]["TotalNo"].ToString();
                TotalNoSaleLab.Text = TotalNoOfSales;

                string TotalValueOfSales = objDataTable2.Rows[0]["TotalValue"].ToString();
                TotalSaleAmtLab.Text = TotalValueOfSales;


                int TotalTargetAmt = Convert.ToInt32(objDataTable.Rows[0]["Amt"].ToString());
                int TotalValueSale = Convert.ToInt32(objDataTable2.Rows[0]["TotalValue"].ToString());


                if (TotalValueSale >= TotalTargetAmt)
                {
                    TargetStatusLab.Text = "Congratulations, you have achieved your targets for the term.";
                    TargetStatusLab.ForeColor = Color.Green;
                }
                else
                {
                    int DifferenceAmt = TotalTargetAmt - TotalValueSale;
                    TargetStatusLab.Text = "You are " + DifferenceAmt.ToString() + ", away to acheive your targets for the term.";
                    TargetStatusLab.ForeColor = Color.Red;
                }
            }
            else
            {
                TargetStatusLab.Text = "There are no Sales counted for incentives, yet.";
            }

        }
        else
        {
            TargetStatusLab.Text = "There are no targets configured.";
        }
    }
}