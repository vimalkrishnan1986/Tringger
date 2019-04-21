using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.ComponentModel;

public class clsTask_Master : BasePage
{

    protected string ReturnSubString(string strValue, int intLength)
    {
        if (strValue.Length > intLength)
        {
            return strValue.Substring(0, intLength);
        }
        return strValue;
    }


    public DataTable ExecuteProcedure(List<SqlParameter> sqlParams, string ProcedureName)
    {
        DataTable objTable = new DataTable();
        DataSet objDataSet = new DataSet();
        using (SqlConnection con = new SqlConnection(connectionstring))
        {
            con.Open();
            using (SqlCommand cmd = new SqlCommand(ProcedureName, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddRange(sqlParams.ToArray());
                using (SqlDataAdapter adaper = new SqlDataAdapter())
                {
                    adaper.SelectCommand = cmd;
                    adaper.Fill(objDataSet);
                    objTable = objDataSet.Tables[0];
                }
            }
        }
        return objTable;
    }

    public void ExecuteProcedureReader(List<SqlParameter> sqlParams, string ProcedureName)
    {
        DataTable objTable = new DataTable();
        DataSet objDataSet = new DataSet();
        using (SqlConnection con = new SqlConnection(connectionstring))
        {
            con.Open();
            using (SqlCommand cmd = new SqlCommand(ProcedureName, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddRange(sqlParams.ToArray());
                cmd.ExecuteReader();
            }
        }
    }


    public string FnFormatCondition(string strValue, string strField, string strExists, string Session_Name)
    {
        string strReturn = strExists;
        if (strValue != "")
        {
            strReturn += (strExists != "") ? " AND " + strField + "='" + strValue + "'" : " Where " + strField + "='" + strValue + "'";
        }
        try { Session[Session_Name] = strValue; } catch { }
        return strReturn;
    }

   

   

    protected virtual string FnDateDiffCondition(string StartDateField, string EndDateField, string StartDate, string EndDate, out DataTable objDuration)
    {
        DataTable objTable = FillTable
                            (
                              " Exec Sp_GetdateInfo '" + StartDate + "','" + EndDate + "'"
                            );

        string strOperator, strWhere;
        strOperator = strWhere = "";
        foreach (DataRow objRow in objTable.Rows)
        {
            strWhere += strOperator + " (cast('" + Convert.ToString(objRow["FullDate"]) + "' As date) " +
                        " BETWEEN  Cast(Convert(varchar(20)," + StartDateField + ",101) As date)" +
                        " AND Cast(Convert(varchar(20)," + EndDateField + ",101) As date) )";
            strOperator = " OR  ";
        }
        objDuration = objTable;
        return strWhere;
    }

    protected void DoSelectDropDown(DropDownList objDropDown, string strValue)
    {

        foreach (ListItem objList in objDropDown.Items)
        {
            if (objList.Value == strValue)
            {
                objDropDown.SelectedValue = strValue;
                break;
            }
        }
    }
    protected string ReturnStatusCss(string status)
    {
        string strValue = string.Empty;
        switch (status.ToUpper())
        {
            case "COMPLETED":
                strValue = "completed";
                break;
            case "REPLANNED":
                strValue = "replanned";
                break;
            case "CANCELED":
                strValue = "cancelled";
                break;
            case "WARNING":
                strValue = "warning";
                break;
            default:
                strValue = "inprogress";
                break;
        }

        return strValue;
    }

    protected string PopupProcess(string strTaskId)
    {
        DataTable objTable = FillTable("select * from Process_Task_Details where Task_Id=" + strTaskId);
        if (objTable.Rows.Count == 0) return "";
        return PopupMessage(objTable.Rows[0]);
    }

    //protected string PopupMessage(DataRow objRow)
    //{

    //    return "<div>" +
    //                        "<p><b>Project Name:</b>" +
    //                            objRow["Project_Name"].ToString().Replace(">", "&gt;") +
    //                         "</p>" +
    //                        "<p><b>Process Plan:</b>" + Convert.ToString(objRow["Process_Name"]) +
    //                        "<Ul><li><b>No Of Staff:</b>" + Convert.ToString(objRow["No_Of_Staffs"]) + "</li>" +
    //                        "<li><b>No of Days:</b>" + Convert.ToString(objRow["No_Of_Days"]) + "</li></ul></p>" +
    //                        "<p><b>Engineers Plan:" +
    //                        "<ul><li><b>No of Days:</b>" + Convert.ToString(objRow["Actual_Days"]) + "</li>" +
    //                        "<li><b>No of Staffs:</b>" + Convert.ToString(objRow["Resource_Count"]) + "</li>" +
    //                        "<li><b>PSDate:</b>" + Convert.ToDateTime(objRow["Planned_Start_Date"]).ToString("dd-MMM-yyyy") + "</li>" +
    //                        "<li><b>PEDate:</b>" + Convert.ToDateTime(objRow["Planned_End_Date"]).ToString("dd-MMM-yyyy") + "</li>" +
    //                        "<li><b>SDate:</b>" + Convert.ToDateTime(objRow["Actual_Plan_Start"]).ToString("dd-MMM-yyyy") + "</li>" +
    //                        "<li><b>EDate:</b>" + Convert.ToDateTime(objRow["Actual_Plan_End"]).ToString("dd-MMM-yyyy") + "</li>" +
    //                        "<li><b>CDate:</b>" + ((objRow["Completed_Date"] != DBNull.Value) ? Convert.ToDateTime(objRow["Completed_Date"]).ToString("dd-MMM-yyyy") : "") + "</li>" +
    //                        "<li><b>Status:</b>" + Convert.ToString(objRow["Process_Status"]) + "</li>" +
    //                        "<li><b>Status:</b><p class=" + Convert.ToString(objRow["Process_Status"]) + ">&nbsp;</p></li>" +
    //                        "</ul></p></div>";
    //}
    protected string PopupMessage(DataRow objRow)
    {

        return "<div>" +
                            "<p><b>Project Name:</b>" +
                                objRow["Project_Name"].ToString().Replace(">", "&gt;") +
                             "</p>" +
                            "<p><b>Process Plan:</b>" + Convert.ToString(objRow["Process_Name"]) +
                            "<Ul><li><b>No Of Staff:</b>" + Convert.ToString(objRow["No_Of_Staffs"]) + "</li>" +
                            "<li><b>No of Days:</b>" + Convert.ToString(objRow["No_Of_Days"]) + "</li></ul></p>" +
                            "<p><b>Engineers Plan:" +
                            "<ul><li><b>No of Days:</b>" + Convert.ToString(objRow["Actual_Days"]) + "</li>" +
                            "<li><b>No of Staffs:</b>" + Convert.ToString(objRow["Resource_Count"]) + "</li>" +
                            "<li><b>PSDate:</b>" + Convert.ToDateTime(objRow["Planned_Start_Date"]) + "</li>" +
                            "<li><b>PEDate:</b>" + Convert.ToDateTime(objRow["Planned_End_Date"]) + "</li>" +
                            "<li><b>SDate:</b>" + Convert.ToDateTime(objRow["Actual_Plan_Start"]) + "</li>" +
                            "<li><b>EDate:</b>" + Convert.ToDateTime(objRow["Actual_Plan_End"]) + "</li>" +
                            "<li><b>CDate:</b>" + ((objRow["Completed_Date"] != DBNull.Value) ? Convert.ToDateTime(objRow["Completed_Date"]).ToString() : "") + "</li>" +
                            "<li><b>Status:</b>" + Convert.ToString(objRow["Process_Status"]) + "</li>" +
                            "<li><b>Status:</b><p class=" + Convert.ToString(objRow["Process_Status"]) + ">&nbsp;</p></li>" +
                            "</ul></p></div>";
    }

    //protected DataTable FetchResult(string strProcedure)
    //{
    //
    //    List<SqlParameter> sqlParams = new List<SqlParameter>();
    //    CreateParameter(Project_Name.SelectedValue, "@Project_Id", "int", ref sqlParams);
    //    CreateParameter(Company_Unit_Name.SelectedValue, "@Company_Unit_Id", "int", ref sqlParams);
    //    CreateParameter(Process_Name.SelectedValue, "@Process_Id", "int", ref sqlParams);
    //}

    public void LoadCookieValue(string Key, string Value)
    {
        HttpCookie mycookie = new HttpCookie(Key);
        mycookie.Expires = DateTime.UtcNow.AddHours(5).AddMinutes(30).AddDays(1);
        mycookie.Value = Convert.ToString(Session[Value]);
        Response.Cookies.Add(mycookie);
    }

    public void TaskCompletedEmail(string strTaskId, string strType)
    {
        DataTable objTable = FillTable("EXEc SP_Task_EmailSending " + strTaskId + "," + strType);

        if (objTable.Rows.Count == 0)
        {
            return;
        }
        DataRow objRow = objTable.Rows[0];
        string EmailIds = string.Empty;
        string EmailFrom = Convert.ToString(objRow["Email_Configuration"]);
        string strBody = "<html>" +
                            "<head>" +
                            "<style>" +
                                "td{border:1px solid black;}" +
                                "table{border-colapse;colapse;}" +
                            "</style>" +
                            "</head>" +
                            "<body>" +
                            "<b>Hello Sir/Ma'am</b>,<br />" +
                            "<table width=\"80%\" border='1'>" +
                            "<tr>" +
                             "<td class=\"gridcaption\">" +
                             "<b>Project Name</b>" +
                            "</td>" +
                            "<td class=\"gridvalue\">" +
                            Convert.ToString(objRow["Project_Name"]) +
                            "<td>" +
                            "</tr>" +
                             "<tr>" +
                             "<td class=\"gridcaption\">" +
                             "<b>Task Name</b>" +
                            "</td>" +
                            "<td class=\"gridvalue\" align='center'>" +
                              Convert.ToString(objRow["Task_Name"]) +
                            "<td>" +
                            "</tr>" +
                            "<tr>" +
                             "<td class=\"gridcaption\" colspan=\"2\">" +
                                 PopupProcess(Convert.ToString(objRow["Task_Id"])) +
                            "</td>" +
                           "</tr>" +
                             "<tr>" +
                             "<td class=\"gridcaption\">" +
                             "Status" +
                            "</td>" +
                            "<td class=\"gridvalue\">" +
                             Convert.ToString(objRow["Status_Value"]) +
                            "<td>" +
                            "</tr>" +
                            "<tr>" +
                            "<td colspan=\"2\">" +
                             ResourceList(Convert.ToString(objRow["Task_Id"]), ref EmailIds) +
                            "<td>" +
                            "<tr>" +
                             "<td class=\"gridcaption\">" +
                             "Task Description" +
                            "</td>" +
                            "<td class=\"gridvalue\">" +
                             Convert.ToString(objRow["Task_Description"]) +
                            "<td>" +
                            "</tr>" +
                            "</table>" +
                            "<br /><br /> " +
                            "Regards,<br>" +
                            "TaskThru Team" +
                            "</body>" +
                            "</html>";

        if (strType == "1")
        {

            DataTable TryThis = FillTable("EXEC CheckTaskExists " + strTaskId);

            if (TryThis.Rows.Count != 0)
            {
                SendTaskCompletedEmail(string.Empty, EmailFrom + (string.IsNullOrEmpty(EmailIds) ? "" : "," + EmailIds), "Reg=>Task Planned - Status of " + Convert.ToString(objRow["Project_Name"]) + " is " + Convert.ToString(objRow["Task_Subject"]), strBody);
                if (objRow["Completed_Date"] != DBNull.Value)
                {
                    TaskCompletedEmail(strTaskId, "2");
                }
                ChangeMailStatsProcess(strTaskId);
            }
            else
            {
                SendTaskCompletedEmail(string.Empty, EmailFrom + (string.IsNullOrEmpty(EmailIds) ? "" : "," + EmailIds), "Reg=>Task Re-Planned - Status of " + Convert.ToString(objRow["Project_Name"]) + " is " + Convert.ToString(objRow["Task_Subject"]), strBody);
                if (objRow["Completed_Date"] != DBNull.Value)
                {
                    TaskCompletedEmail(strTaskId, "2");
                }

            }




        }
        else if (strType == "3")
        {
            SendTaskCompletedEmail(EmailFrom, EmailIds, "Reg=>Task Reminder for " + Convert.ToString(objRow["Project_Name"]), strBody);
        }

    }

    protected string ResourceList(string TaskId, ref string EmailIds)
    {

        DataTable objTable = FillTable("SP_Task_EmailSending " + TaskId + ",3");
        string strResource = "<ul>";
        string strComma = string.Empty;
        foreach (DataRow objRow in objTable.Rows)
        {
            strResource += "<li>" + objRow["Staff_Name"] + "</li>";
            if (objRow["Email_Id"] != DBNull.Value)
            {
                EmailIds += strComma + Convert.ToString(objRow["Email_Id"]);
                strComma = ",";
            }
        }
        return strResource + "</ul>";
    }
    protected void ChangeMailStatsProcess(string strTaskId)
    {

        DataTable TryThis2 = FillTable("ChangeMailStats " + strTaskId);

    }

    protected Project_MasterInfo Project_Duration(string ProjectId)
    {
        if (string.IsNullOrEmpty(ProjectId)) return null;
        return GetProjectInfo(ProjectId);

    }
    public Project_MasterInfo GetProjectInfo(string Project_Id)
    {
        string strQuery = " select ISNULL(Min(b.Start_Date),a.Start_Date) As Start_Date,  ISNULL(Max(b.End_Date),a.End_Date) As End_Date " +
                         " from Project_Master a,Project_Task_Master b Where " +
                         " a.ProjectId=b.Project_Name " +
                         " AND  a.ProjectId=" + Project_Id + " GROUP BY a.Start_Date,a.End_Date";

        DataTable objTable = FillTable(strQuery);
        Project_MasterInfo objProject = null;
        if (objTable.Rows.Count > 0)
        {
            objProject = new Project_MasterInfo();
            objProject.Start_Date = Convert.ToDateTime(objTable.Rows[0]["Start_Date"]);
            objProject.End_Date = Convert.ToDateTime(objTable.Rows[0]["End_Date"]);

        }
        return objProject;

    }
    protected void AutomaticEmailForProcess()
    {
        string strWhere = " select Project_Name,Task_Id FROM Project_Task_Master Where DATEADD(dd,-1,Start_Date)=CAST(CONVERT(VARCHAR(20),GetDate(),101) AS DATETIME) AND Completed_Date is null" +
                          " union " +
                          " select Project_Name,Task_Id FROM Project_Task_Master Where Start_Date<CAST(CONVERT(VARCHAR(20),GetDate(),101) AS DATETIME) AND End_Date<CAST(CONVERT(VARCHAR(20),GetDate(),101) AS DATETIME) AND Completed_Date is null" +
                          " union " +
                          " select Project_Name,Task_Id FROM Project_Task_Master Where Start_Date<CAST(CONVERT(VARCHAR(20),GetDate(),101) AS DATETIME) AND Completed_Date is null AND Task_Status=2";

        DataTable objTable = FillTable
                             (
                              strWhere
                             );
        foreach (DataRow objRow in objTable.Rows)
        {
            TaskCompletedEmail(Convert.ToString(objRow["Task_Id"]), "3");
        }
    }
    protected void SendTaskCompletedEmail(string EmailFrom, string EmailTo, string strSubject, string MailContent)
    {
        string Emailcheck = string.Empty;
        try
        {
            if (string.IsNullOrEmpty(EmailTo))
            {
                return;
            }

            if (string.IsNullOrEmpty(EmailFrom))
            {
                EmailFrom = "noreply@taskthru.com";
            }
            EmailFrom = "noreply@taskthru.com";
            string[] aryEmailTo = EmailTo.Split(',');
            MailMessage mailObj = new MailMessage();
            foreach (string Email in aryEmailTo)
            {
                Emailcheck = Email;
                mailObj.To.Add(new MailAddress(Email));
            }
            mailObj.From = new MailAddress(EmailFrom);
            mailObj.Subject = strSubject;
            mailObj.Body = MailContent;
            mailObj.IsBodyHtml = true;
            SmtpClient SMTPServer = new SmtpClient();
            SMTPServer.UseDefaultCredentials = false;
            System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
            NetworkCred.UserName = "noreply@taskthru.com";
            NetworkCred.Password = "jiby.2768";
            SMTPServer.Credentials = NetworkCred;
            SMTPServer.Host = "smtp.1and1.com";
            SMTPServer.Send(mailObj);

        }
        catch (Exception ex)
        {
            ex.Source = EmailTo + "This EmailId format is invalid";
            throw ex;
        }
    }
}

public class Project_MasterInfo
{
    private DateTime _Start_Date;
    private DateTime _End_Date;

    public DateTime Start_Date
    {
        get
        {
            return _Start_Date;
        }
        set
        {
            _Start_Date = value;
        }
    }
    public DateTime End_Date
    {
        get
        {
            return _End_Date;
        }
        set
        {
            _End_Date = value;
        }
    }
}
