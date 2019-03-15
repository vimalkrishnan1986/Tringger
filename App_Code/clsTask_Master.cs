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


public  class clsTask_Master : System.Web.UI.Page
{
	string connectionstring;
	public clsTask_Master()
	{
		try
		{
			 connectionstring=Convert.ToString(ConfigurationManager.AppSettings["connectionstring"]);
		}
		catch(Exception err)
		{
            //tdMessage.innerHtml;
		}
	}
	public void BindGridView(string strQuery, GridView GridObject)
	{
		GridObject.DataSource = ReturnDataTable(strQuery);
		GridObject.DataBind();

	}
    public void BindListBox(string strQuery, ListBox ListBoxObject)
    {
        ListBoxObject.DataSource = ReturnDataTable(strQuery);
        ListBoxObject.DataBind();

    }
	public void WarningMessage(string strMessage,HtmlTableCell objCell)
	{
        try
        {
            objCell.InnerHtml = "<span class='warningstyle'>" + strMessage + "</span>";
        }
        catch
        {
        }
	}

    public bool IsValid_Duration(string DateFrom, string DateTo)
    {
        if (!string.IsNullOrEmpty(DateFrom) && !string.IsNullOrEmpty(DateTo))
            return (Convert.ToDateTime(DateFrom) <= Convert.ToDateTime(DateTo));
        else
            return false;

    }

    public bool Validate_Duration(DataRow objRow, string Start_Field, string End_Field, DateTime dateValue, bool IsDayCheck)
    {
        if (objRow[Start_Field] != DBNull.Value && objRow[End_Field] != DBNull.Value)
        {
            if (IsDayCheck)
            {
                return ((dateValue >= Convert.ToDateTime(objRow[Start_Field]) && dateValue <= Convert.ToDateTime(objRow[End_Field])));
            }
            else
            {
                if ((dateValue >= Convert.ToDateTime(objRow[Start_Field]) && dateValue <= Convert.ToDateTime(objRow[End_Field])))
                {
                    return true;
                }
                else
                {
                    DateTime dateEnd = dateValue.AddMonths(1).AddDays(-1);
                    return ((dateValue.Month >= Convert.ToDateTime(objRow[Start_Field]).Month && dateValue.Month <= Convert.ToDateTime(objRow[End_Field]).Month)
                            &&
                           (dateValue.Year >= Convert.ToDateTime(objRow[Start_Field]).Year && dateValue.Year <= Convert.ToDateTime(objRow[End_Field]).Year));
                }

            }
        }
        else
        {
            return false;
        }
    }

	public void SuccessMessage(string strMessage,HtmlTableCell objCell)
	{
		objCell.InnerHtml ="<span class='msgstyle'>"+ strMessage + "</span>";
	}
	public void BindDropDownList(string strQuery, DropDownList DropDownObject)
	{
		DropDownObject.DataSource = ReturnDataTable(strQuery);
		DropDownObject.DataBind();
	}
	public void Sql_ExecuteNoNQuery(string strQuery)
	{
		using (SqlConnection con = new SqlConnection(connectionstring))
		{
			con.Open();
			using (SqlCommand cmd = new SqlCommand(strQuery, con))
			{
				cmd.ExecuteNonQuery();
			}
		}
	}

    public bool IsRecordExists(string strQuery)
    {
        using (SqlConnection con = new SqlConnection(connectionstring))
        {
            con.Open();
            using (SqlCommand cmd = new SqlCommand(strQuery, con))
            {
                return cmd.ExecuteReader().HasRows; 
            }
        }
    }

	public DataTable ReturnDataTable(string strQuery)
	{
        
		DataTable objTable = new DataTable();
		DataSet objDataSet = new DataSet();
		using (SqlConnection con = new SqlConnection(connectionstring))
		{
			con.Open();
			using (SqlCommand cmd = new SqlCommand(strQuery, con))
			{
               
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

    protected string ReturnSubString(string strValue, int intLength)
    {
        if (strValue.Length > intLength)
        {
            return strValue.Substring(0, intLength);
        }
        return strValue;
    }

	 public object ReturnValue(string strValue,string strDataType)
	 {
		 object objReturn = strValue;
		 if (Convert.ToString(strValue)=="")
		 {
			 objReturn=DBNull.Value;
		 }
		switch (strDataType) 
		{
			    case "INT":
				        objReturn = Convert.ToInt32(strValue);
				 break;
			  case "TINYINT":
				objReturn = Convert.ToInt16(strValue);
				break;
			case "SMALLINT":
				objReturn = Convert.ToInt32(strValue);
				break;
			case "BIGINT":
				     objReturn = Convert.ToInt64(strValue);
				     break;
			case "VARCHAR":
			case "CHAR":
				     objReturn = Convert.ToString(strValue);
				         break;
			case "NVARCHAR":
			case "NCHAR":
				         objReturn = Convert.ToString(strValue);
				         break;
			case "DECIMAL":
			case "NUMERIC":
				         objReturn = Convert.ToDecimal(strValue);
				         break;
			case "FLOAT":
			case "REAL":
			case "MONEY":
			case "SMALLMONEY":
				         objReturn = Convert.ToDouble(strValue);
				         break;
			case "SMALLDATETIME":
			case "DATETIME":
			case "DATE":
			case "TIME":
				         Convert.ToDateTime(strValue);
				    break;
			case "BIT":
				         Convert.ToBoolean(strValue);
				    break;
			}
		 return objReturn;
	}
	public void GridTopPagerPosition(GridView Grid)
	{
		if (Grid.PageCount> 1)
		{
			TextBox objText = ((TextBox)(Grid.TopPagerRow.FindControl("CurrentPageIndex")));
			if (objText is TextBox)
			{
				objText.Text = Convert.ToString(Grid.PageIndex + 1) + "/" + Convert.ToString(Grid.PageCount);
			}
		}
	}
	public void GridBottomPagerPosition(GridView Grid)
	{
		if (Grid.PageCount> 1)
		{
			TextBox objText = ((TextBox)(Grid.BottomPagerRow.FindControl("CurrentPageIndex")));
			if (objText is TextBox)
			{
				objText.Text = Convert.ToString(Grid.PageIndex + 1) + "/" + Convert.ToString(Grid.PageCount);
			}
		}
	}

    public void BindYearDropDownList(DropDownList objDropDownList,int StartYear, int EndYear)
    {
        for (int intYearLoop = StartYear; intYearLoop<=EndYear+5; intYearLoop++)
        {
            ListItem objList = new ListItem();
            objList.Value = Convert.ToString(intYearLoop);
            objList.Text = objList.Value;
            if (EndYear == intYearLoop) objList.Selected = true;
            objDropDownList.Items.Add(objList);
            
            
        }
    }
    public void BindMonthDropDownList(DropDownList objDropDownList)
    {
        string[] aryMonthList = new string[] { "ALL", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
                                
        for (int intYearLoop = 0; intYearLoop<aryMonthList.Length; intYearLoop++)
        {
            ListItem objList = new ListItem();
            objList.Value = Convert.ToString( intYearLoop);
            objList.Text = aryMonthList[intYearLoop];
            objDropDownList.Items.Add(objList);
        }
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

    public void CreateParameter(string strValue, string strField,string strType, ref List<SqlParameter> sqlParams)
    {
        sqlParams.Add(new SqlParameter(strField, ReturnValue(strValue,strType)));            
    }

    public string FnFormatCondition(string strValue, string strField, string strExists, string Session_Name)
    {
        string strReturn = strExists;
        if (strValue != "")
        {
            strReturn += (strExists != "") ? " AND " + strField + "='" + strValue + "'" : " Where " + strField + "='" + strValue + "'";
        }
        try { Session[Session_Name] = strValue; }catch{}
        return strReturn;
    }

    public void Company_Unit_Master_Company_Unit_Name(DropDownList Company_Unit_Name, HtmlTableCell tdMessage, string strValue)
    {
        try
        {
            Company_Unit_Name.Items.Clear();
            ListItem objList = new ListItem();
            objList.Text = "---Select---";
            objList.Value = "";
            Company_Unit_Name.Items.Add(objList);
            string strWhere = string.Empty;

            if (!Convert.ToBoolean(HttpContext.Current.Session["Admin"]))
            {
                strWhere = " Where Unit_Id=" + Convert.ToString(Session["Unit_Id"]);
            }

            BindDropDownList
            (
                "select [Unit_Id], [Company_Unit_Name]  from Company_Unit_Master  " + strWhere,
                Company_Unit_Name
            );

            Company_Unit_Name.SelectedValue = strValue;
        }
        catch (ArgumentOutOfRangeException)
        {
            //
        }
        catch (Exception err)
        {
            WarningMessage("Error occurred in method of 'Company_Unit_Master_Company_Unit_Name' error details:" + Convert.ToString(err.Message), tdMessage);
        }
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

    public void Designation_Master_Designation_Name(DropDownList Designation_Name, HtmlTableCell tdMessage,string strValue)
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

    public string FnGetDate(DateTime dateValue)
    {
        string[] aryMonth = new string[] { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
        return dateValue.Day + "-" + aryMonth[dateValue.Month - 1] + "-" + dateValue.Year;
    }

    protected virtual string FnDateDiffCondition(string StartDateField, string EndDateField, string StartDate, string EndDate, out DataTable objDuration)
    {
        DataTable objTable = ReturnDataTable
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
        DataTable objTable = ReturnDataTable("select * from Process_Task_Details where Task_Id=" + strTaskId);
        if (objTable.Rows.Count == 0) return "";
        return PopupMessage(objTable.Rows[0] );   
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
   
    public void LoadCookieValue(string Key,string Value)
    {
        HttpCookie mycookie = new HttpCookie(Key);
        mycookie.Expires = DateTime.UtcNow.AddHours(5).AddMinutes(30).AddDays(1);
        mycookie.Value = Convert.ToString(Session[Value]);
        Response.Cookies.Add(mycookie);
	}
   
    public void TaskCompletedEmail(string strTaskId,string strType)
    {
       DataTable objTable = ReturnDataTable("EXEc SP_Task_EmailSending "+ strTaskId +","+strType);
       
        if( objTable.Rows.Count==0)
        {
            return; 
        }
        DataRow objRow = objTable.Rows[0];
        string EmailIds = string.Empty;
        string EmailFrom = Convert.ToString(objRow["Email_Configuration"]);
        string strBody ="<html>" +
                            "<head>" +
                            "<style>"+
                                "td{border:1px solid black;}"+
                                "table{border-colapse;colapse;}" +
                            "</style>"+
                            "</head>" +
                            "<body>" +
                            "<b>Hello Sir/Ma'am</b>,<br />" +
                            "<table width=\"80%\" border='1'>"+
                            "<tr>"+
                             "<td class=\"gridcaption\">"+
                             "<b>Project Name</b>"+
                            "</td>"+
                            "<td class=\"gridvalue\">"+
                            Convert.ToString(objRow["Project_Name"])+
                            "<td>"+
                            "</tr>"+
                             "<tr>" +
                             "<td class=\"gridcaption\">" +
                             "<b>Task Name</b>" +
                            "</td>" +
                            "<td class=\"gridvalue\" align='center'>" +
                              Convert.ToString(objRow["Task_Name"]) +
                            "<td>" +
                            "</tr>" +
                            "<tr>"+
                             "<td class=\"gridcaption\" colspan=\"2\">"+
                                 PopupProcess(Convert.ToString(objRow["Task_Id"])) +
                            "</td>"+
                           "</tr>"+                          
                             "<tr>"+
                             "<td class=\"gridcaption\">"+
                             "Status"+
                            "</td>"+
                            "<td class=\"gridvalue\">"+
                             Convert.ToString(objRow["Status_Value"]) +
                            "<td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td colspan=\"2\">"+
                             ResourceList(Convert.ToString(objRow["Task_Id"]), ref EmailIds) +
                            "<td>"+
                            "<tr>"+
                             "<td class=\"gridcaption\">"+
                             "Task Description" +
                            "</td>"+
                            "<td class=\"gridvalue\">"+
                             Convert.ToString(objRow["Task_Description"]) +
                            "<td>"+
                            "</tr>"+
                            "</table>"+                            
                            "<br /><br /> " +
                            "Regards,<br>" +
                            "TaskThru Team" +
                            "</body>" +
                            "</html>";

            if (strType == "1")
            {
                
                 DataTable TryThis = ReturnDataTable("EXEC CheckTaskExists " + strTaskId );

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
                 SendTaskCompletedEmail(EmailFrom,EmailIds,"Reg=>Task Reminder for "+Convert.ToString(objRow["Project_Name"]),strBody);
            }
        
    }
   
   protected string ResourceList(string TaskId,ref string EmailIds)
   {
       
       DataTable objTable = ReturnDataTable("SP_Task_EmailSending "+ TaskId +",3");
       string strResource="<ul>";
       string strComma=string.Empty;
        foreach (DataRow objRow in objTable.Rows)
        {
            strResource+="<li>"+ objRow["Staff_Name"] +"</li>";
            if ( objRow["Email_Id"]!=DBNull.Value)
            {
                EmailIds +=  strComma + Convert.ToString(objRow["Email_Id"]);
                strComma = ",";
            }
        }
       return strResource+"</ul>";
   }
   protected void ChangeMailStatsProcess(string strTaskId)
   {

       DataTable TryThis2 = ReturnDataTable("ChangeMailStats " + strTaskId);
     
   }

   protected Project_MasterInfo Project_Duration(string ProjectId)
   {
       if (string.IsNullOrEmpty(ProjectId)) return null;
       return GetProjectInfo(ProjectId);

   }
   public Project_MasterInfo GetProjectInfo(string Project_Id)
   {
       string strQuery = " select ISNULL(Min(b.Start_Date),a.Start_Date) As Start_Date,  ISNULL(Max(b.End_Date),a.End_Date) As End_Date "+
                        " from Project_Master a,Project_Task_Master b Where " +
                        " a.ProjectId=b.Project_Name " +
                        " AND  a.ProjectId=" + Project_Id +" GROUP BY a.Start_Date,a.End_Date";

       DataTable objTable = ReturnDataTable(strQuery);
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

       DataTable objTable = ReturnDataTable
                            (
                             strWhere
                            );
       foreach (DataRow objRow in objTable.Rows)
       {
           TaskCompletedEmail(Convert.ToString(objRow["Task_Id"]), "3");
       }
   }
    protected void SendTaskCompletedEmail(string EmailFrom,string EmailTo,string strSubject,string MailContent)
    {
        string Emailcheck = string.Empty;
        try
        {
            if (string.IsNullOrEmpty(EmailTo))
            {
                return;
            }

            if (string.IsNullOrEmpty(EmailFrom) )
            {
                EmailFrom = "noreply@taskthru.com";
            }
            EmailFrom = "noreply@taskthru.com";
            string[] aryEmailTo = EmailTo.Split(',');
            MailMessage mailObj = new MailMessage();
            foreach( string Email in aryEmailTo)
            {
                Emailcheck = Email;
                mailObj.To.Add(new MailAddress(Email));
            }
            mailObj.From=new MailAddress(EmailFrom);
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
