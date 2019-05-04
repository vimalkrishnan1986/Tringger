using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Globalization;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.XPath;
using System.Xml.Linq;
using System.ComponentModel;
using System.Data.SqlClient;
public partial class Time_Sheet_Master_Time_Sheet_View : TimeSheetBase
{
    const string _loginIdKey = "Login_Id";
    const string _isinitialDepartmentKey = "IsInitialDepartment";
    const string _isFinalDepartmentKey = "IsFinalDepartment";
    const string _unitIdKey = "Unit_Id";
    protected string InputValue { get; set; }

    protected override void Page_Init(object sender, EventArgs e)
    {

        try
        {
            _loginId = SessionHelper.GetSessionValue<string>(_loginIdKey);
        }
        catch (KeyNotFoundException)
        {
            foreach (string Key in Request.Cookies.Keys)
            {
                Session[Key] = Convert.ToString(Request.Cookies[Key].Value);
            }
        }
        base.Page_Init(sender, e);
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        tdMessage.InnerHtml = "";
        if (!IsPostBack)
        {
            ///
            SessionHelper.AddtoSession<bool>("Admin", true);
            SessionHelper.AddtoSession<string>("Company_Unit_Name", "");

            ///
            DateFrom.Text = FormattedDate(CurrentTime);// (Convert.ToString(Session["DateFrom"]) == "") ? FnGetDate(DateTime.UtcNow.AddHours(5).AddMinutes(30)) : Convert.ToString(Session["DateFrom"]);
            DateTo.Text = FormattedDate(CurrentTime);// (Convert.ToString(Session["DateTo"]) == "") ? FnGetDate(DateTime.UtcNow.AddHours(5).AddMinutes(30)) : Convert.ToString(Session["DateTo"]);
            Staff_Master_Staff_Name();
            int responseType = GetQueryStringValue<int>("ResponseType");
            List<int> applicableResponseTypes = new List<int> { 3, 2, -1, 5 };

            if (!applicableResponseTypes.Contains(responseType))
            {
                PageReload(responseType.ToString());
                return;
            }
            Load_Data1("");
            this.InputValue = "0";

        }
    }


    protected void PageReload(string strType)
    {

        switch (strType)
        {
            case "1":
                Load_Data1("");
                SuccessMessage("Record has been successfully updated in the database.", tdMessage);
                this.InputValue = "0";
                break;
            case "0":
                SuccessMessage("Record has been successfully deleted in the database.", tdMessage);
                this.InputValue = "0";
                Load_Data1("");
                break;
            case "-1":
            case "5":
                string Query = " Display=2";
                Load_Data1(Query);
                this.InputValue = "0";
                break;
            case "4":
                Load_Data1("");
                this.InputValue = "Time_Sheet_Master_Popup.aspx?RequestType=1&Date=" + Request.QueryString["Date"] +
                             "&Staff_Id=" + Request.QueryString["Staff_Id"] + "&Time_Sheet_Id=" + Request.QueryString["Time_Sheet_Id"] +
                             "&task_Id=" + Request.QueryString["task_Id"] +
                             "&StatusID=" + Request.QueryString["StatusID"] +
                             "&id=&Action=PR";
                break;
        }
    }

    protected void ModalCloseClick(object sender, EventArgs e)
    {

        if (ModalCloseBtn.Attributes["Mvalue"] == "0")
        {
            Load_Data1("");
        }
        else
        {
            Load_Data1("");
        }

    }
    protected void ModalCloseClick2(object sender, EventArgs e)
    {

        if (ModalCloseBtn.Attributes["Mvalue"] == "0")
        {
            Load_Data1("");
        }
        else
        {
            Load_Data1("");
        }

    }
    protected void Load_Data(object sender, EventArgs e)
    {
        Load_Data1("");
        ModalCloseBtn.Attributes.Add("Mvalue", "0");
        //TdReport.InnerHtml=GenerateChart();
    }

    protected string[] Leave_Approve(string strDate, string strStaffName, bool blnRights, string ThisDate, string IsField)
    {
        string strQuery = " SELECT  Leave_From, Leave_To, Total_Leave, ISNULL(Approve_Status,'Leave Applied') AS Approve_Status, Leave_Id, 1 As Type FROM Leave_Master WHERE Staff_Name='" + strStaffName + "' " +
                          " AND '" + strDate + "' BETWEEN Leave_From AND Leave_To " +
                          " UNION " +
                          " SELECT  Holiday_From, Holiday_To, DATEDIFF(dd,Holiday_From,Holiday_To)+1, Holiday_Details,Holiday_Id,0 As Type  FROM Holiday_Master " +
                          " WHERE '" + strDate + "' BETWEEN Holiday_From AND Holiday_To AND Company_Unit_Name IN" +
                          "(SELECT Company_Unit_Name FROM Staff_Master Where Staff_Id='" + strStaffName + "')";

        DataTable objTable = FillTable(strQuery);
        string[] aryReturn = new string[] { "", "" };
        if (objTable.Rows.Count > 0)
        {
            aryReturn[0] = "0";
            if (Convert.ToString(objTable.Rows[0]["Approve_Status"]).ToLower() == "not approved" || Convert.ToString(objTable.Rows[0]["Approve_Status"]).ToLower() == "cancelled")
            {
                aryReturn[0] = "1";
                aryReturn[1] = "<div style=\"float:center; text-align:center; \" class=\"label\"></div><div style=\"float:right;\" class=\"label\"><nobr>Leave " + Convert.ToString(objTable.Rows[0]["Approve_Status"]) + "</nobr></div>";
                aryReturn[1] = "<div class=\"label\" style=\"float:inherit;color:#773636;text-align:-webkit-center; border-width:2px;border-color:gray;border-style:outset; width:100%;background-color:#e4f7e7;border-radius:5x;\"><a href=\"/Leave_Master/Leave_Master.aspx?ThisStaff_Id=" + strStaffName + "&LeaveDate='" + strDate + "'\">Leaves not Approved / Cancelled</a></div><br /><br />";
                if (blnRights == true)
                {
                    if (IsField == "1")
                    {
                        aryReturn[1] += "<div class=\"label\" style=\"float:inherit;color:#773636;text-align:-webkit-center; border-width:2px;border-color:gray;border-style:outset; width:100%;background-color:#fdeedd;border-radius:5px;\"><a href=\"TimeSheetMap.aspx?StaffID=" + strStaffName + "&Type=2&Date=" + ThisDate + " \" target=\"_blank\" >Routes..</a><a class=\"label\" target='_blank' class=\"quotepopup BlueBar2 label\"" + " style=\"width:50px;height:30px;\" href=\"ExpensesList.aspx?TimeSheetId=&TaskId=&StaffId=" + strStaffName + "&Date=" + ThisDate + "&Action=\">Tracks</a><a class=\"label\" href=\"Trip_Plan.aspx?StaffID=" + strStaffName + "&Type=2&Date=" + ThisDate + " \" target=\"_blank\" >Plan New Trip</a><a class=\"label\" href=\"/Leave_Master/Leave_Master.aspx?ThisStaff_Id=" + strStaffName + "&LeaveDate='" + strDate + "'\">Leaves..</a><br/><iframe style=\"width:250px; height:210px; border-radius:10px; border-style:outset; border-width:0px;\" scrolling=\"no\" frameborder=\"0\" src=\"../UsersMap.aspx?Staff_Id=" + strStaffName + "&ThDa=" + strDate + "\" ></iframe></div>";
                    }
                }
                //else
                //{
                //    if (IsField == "1")
                //    {
                //        aryReturn[1] += "<div class=\"label\" style=\"float:inherit;color:#773636;text-align:-webkit-center; border-width:2px;border-color:gray;border-style:outset; width:100%;background-color:#fdeedd;border-radius:5px;\"><a href=\"TimeSheetMap.aspx?StaffID=" + strStaffName + "&Type=2&Date=" + ThisDate + " \" target=\"_blank\" >Routes..</a><a class=\"label\" target='_blank' class=\"quotepopup BlueBar2 label\"" + " style=\"width:50px;height:30px;\" href=\"ExpensesList.aspx?TimeSheetId=&TaskId=&StaffId=" + strStaffName + "&Date=" + ThisDate + "&Action=\">Tracks</a><a class=\"label\" href=\"Trip_Plan.aspx?StaffID=" + strStaffName + "&Type=2&Date=" + ThisDate + " \" target=\"_blank\" >Plan New Trip</a><a class=\"label\" href=\"/Leave_Master/Leave_Master.aspx?ThisStaff_Id=" + strStaffName + "&LeaveDate='" + strDate + "'\">Leaves..</a><br/><iframe style=\"width:250px; height:210px; border-radius:10px; border-style:outset; border-width:0px;\" scrolling=\"no\" frameborder=\"0\" src=\"../UsersMap.aspx?Staff_Id=" + strStaffName + " & ThDa = " + strDate + "\" ></iframe></div>";
                //    }

                //}
            }
            else if (Convert.ToString(objTable.Rows[0]["Approve_Status"]) == "Approved")
            {
                aryReturn[0] = "0";
                aryReturn[1] = "><div style=\"float:center; text-align:center;\" class=\"label\"></div><div style=\"float:right;\" class=\"label\"><nobr>Leave " + Convert.ToString(objTable.Rows[0]["Approve_Status"]) + "</nobr></div>";
            }
            else if (blnRights && Convert.ToBoolean(objTable.Rows[0]["Type"]))
            {
                aryReturn[1] = "<div style=\"float:center; text-align:center;\" class=\"label\">Leave Pending:</div><div style=\"float:right;\" class=\"label\"><nobr><input type='button' class=\"smallbutton\" onclick=\"AjaxCallBack(this.parentNode.parentNode,'" + strDate + "','" + strStaffName + "','Approved','Leave')\"  value='AP'>&nbsp;<input type='button' class=\"smallbutton\" onclick=\"AjaxCallBack(this.parentNode.parentNode,'" + strDate + "','" + strStaffName + "','Not Approved','Leave')\"  value='NA'></nobr></div>";
                aryReturn[1] = "<br /><div style=\"float:center; text-align:center;\" class=\"label\" style=\"text-decoration:underline\" onclick=\"OpenLeavePage('" + Convert.ToString(objTable.Rows[0]["Leave_Id"]) + "')\">Leave Pending:</div>";
                aryReturn[1] = "<br /><div style=\"float:center; text-align:center;\" class=\"label\"><a href=\"/Leave_Master/Leave_Master.aspx?Staff_Id=" + strStaffName + "&Leave_Id=" + Convert.ToString(objTable.Rows[0]["Leave_Id"]) + "\">Leave Applied</a></div>";
                aryReturn[0] = "1";
            }
            else
            {
                aryReturn[0] = Convert.ToString(objTable.Rows[0]["Type"]);
                aryReturn[1] = "<br /><div style=\"float:center; text-align:center;\" class=\"label\"><nobr>Leave " + Convert.ToString(objTable.Rows[0]["Approve_Status"]) + "</nobr></div>";
            }

            if (Convert.ToInt32(objTable.Rows[0]["Total_Leave"]) < 1)
            {
                aryReturn[0] = "1";
                return aryReturn;
            }
            return aryReturn;
        }
        else
        {
            aryReturn[0] = "1";
            DateTime thisday = DateTime.Today;
            //if (Convert.ToDateTime(ThisDate).ToShortDateString() == thisday.ToShortDateString())
            if (Convert.ToDateTime(ThisDate) <= thisday)
            {
                if (blnRights == true)
                {
                    //Response.Write(strStaffName + ".." + IsField);
                    if (IsField == "1")
                    {
                        aryReturn[1] = "<div style=\"text-align:center;\"><br /><a class=\"label\" href=\"TimeSheetMap.aspx?StaffID=" + strStaffName + "&Type=2&Date=" + ThisDate + " \" target=\"_blank\" >Routes</a><a class=\"label\" target='_blank' class=\"quotepopup BlueBar2 label\"" + " style=\"width:50px;height:30px;\" href=\"ExpensesList.aspx?TimeSheetId=&TaskId=&StaffId=" + strStaffName + "&Date=" + ThisDate + "&Action=\">Tracks</a><a class=\"label\" href=\"Trip_Plan.aspx?StaffID=" + strStaffName + "&Type=2&Date=" + ThisDate + " \" target=\"_blank\" >Plan New Trip</a><a class=\"label\" href=\"/Leave_Master/Leave_Master.aspx?ThisStaff_Id=" + strStaffName + "&LeaveDate='" + strDate + "'\">Leaves..</a><br/><iframe style=\"width:250px; height:210px; border-radius:10px; border-style:outset; border-width:0px;\" scrolling=\"no\" frameborder=\"0\" src=\"../UsersMap.aspx?Staff_Id=" + strStaffName + "&ThDa=" + strDate + "\" ></iframe></div></div>";
                    }
                    else
                    {
                        //aryReturn[1] = "<div style=\"text-align:center;\"><br /><a class=\"label\" href=\"/Leave_Master/Leave_Master.aspx?ThisStaff_Id=" + strStaffName + "&LeaveDate='" + strDate + "'\">Leaves..</a></div>";
                    }
                }
                else
                {
                    //if (IsField == "1")
                    //{
                    //    aryReturn[1] = "<div style=\"text-align:center;\"><br /><a class=\"label\" href=\"TimeSheetMap.aspx?StaffID=" + strStaffName + "&Type=2&Date=" + ThisDate + " \" target=\"_blank\" >Routes</a><a class=\"label\" target='_blank' class=\"quotepopup BlueBar2 label\"" + " style=\"width:50px;height:30px;\" href=\"ExpensesList.aspx?TimeSheetId=&TaskId=&StaffId=" + strStaffName + "&Date=" + ThisDate + "&Action=\">Tracks</a><a class=\"label\" href=\"Trip_Plan.aspx?StaffID=" + strStaffName + "&Type=2&Date=" + ThisDate + " \" target=\"_blank\" >Plan New Trip</a><a class=\"label\" href=\"/Leave_Master/Leave_Master.aspx?ThisStaff_Id=" + strStaffName + "&LeaveDate='" + strDate + "'\">Leaves..</a><br/><iframe style=\"width:250px; height:210px; border-radius:10px; border-style:outset; border-width:0px;\" scrolling=\"no\" frameborder=\"0\" src=\"../UsersMap.aspx?Staff_Id=" + strStaffName + "&ThDa=" + strDate + "\" ></iframe></div></div>";
                    //}
                    //else
                    //{
                    //    //aryReturn[1] = "<div style=\"text-align:center;\"><br /><a class=\"label\" href=\"/Leave_Master/Leave_Master.aspx?ThisStaff_Id=" + strStaffName + "&LeaveDate='" + strDate + "'\">Leaves..</a></div>";
                    //}
                }
            }
            else
            {
                if (blnRights == true)
                {
                    if (IsField == "1")
                    {
                        aryReturn[1] = "<div style=\"text-align:center;\"><br /><a class=\"label\" href=\"TimeSheetMap.aspx?StaffID=" + strStaffName + "&Type=2&Date=" + ThisDate + " \" target=\"_blank\" >Routes</a><a class=\"label\" target='_blank' class=\"quotepopup BlueBar2 label\"" + " style=\"width:50px;height:30px;\" href=\"ExpensesList.aspx?TimeSheetId=&TaskId=&StaffId=" + strStaffName + "&Date=" + ThisDate + "&Action=\">Tracks</a><a class=\"label\" href=\"Trip_Plan.aspx?StaffID=" + strStaffName + "&Type=2&Date=" + ThisDate + " \" target=\"_blank\" >Plan New Trip</a><a class=\"label\" href=\"/Leave_Master/Leave_Master.aspx?ThisStaff_Id=" + strStaffName + "&LeaveDate='" + strDate + "'\">Leaves..</a></div></div>";

                    }
                    else
                    {
                        aryReturn[1] = "<div style=\"text-align:center;\"><br /><a class=\"label\" href=\"/Leave_Master/Leave_Master.aspx?ThisStaff_Id=" + strStaffName + "&LeaveDate='" + strDate + "'\">Leaves..</a></div>";
                    }
                }
                else
                {
                    //if (IsField == "1")
                    //{
                    //    aryReturn[1] = "<div style=\"text-align:center;\"><br /><a class=\"label\" href=\"TimeSheetMap.aspx?StaffID=" + strStaffName + "&Type=2&Date=" + ThisDate + " \" target=\"_blank\" >Routes</a><a class=\"label\" target='_blank' class=\"quotepopup BlueBar2 label\"" + " style=\"width:50px;height:30px;\" href=\"ExpensesList.aspx?TimeSheetId=&TaskId=&StaffId=" + strStaffName + "&Date=" + ThisDate + "&Action=\">Tracks</a><a class=\"label\" href=\"Trip_Plan.aspx?StaffID=" + strStaffName + "&Type=2&Date=" + ThisDate + " \" target=\"_blank\" >Plan New Trip</a><a class=\"label\" href=\"/Leave_Master/Leave_Master.aspx?ThisStaff_Id=" + strStaffName + "&LeaveDate='" + strDate + "'\">Leaves..</a></div></div>";

                    //}
                    //else
                    //{
                    //    aryReturn[1] = "<div style=\"text-align:center;\"><br /><a class=\"label\" href=\"/Leave_Master/Leave_Master.aspx?ThisStaff_Id=" + strStaffName + "&LeaveDate='" + strDate + "'\">Leaves..</a></div>";
                    //}
                }
            }

            //< a class=\"label\" href=\"../AllUsersOnAMapToday.aspx?ThisDate=" + ThisDate + " \" target=\"_blank\" >Last Spotted..</a>
            return aryReturn;

        }
    }

    protected void ShiftPendingTasks()
    {
        const string query = "Shiftpendingtasks";
        DataAccess.ExecuteNonQuery(query, CommandType.StoredProcedure, new SqlParameter[] {
            new SqlParameter("@loginId", _loginId),
            new SqlParameter("@date", GetIstDate())
        });
    }


    protected void CheckForUnAssignedOrders()
    {

        if (!SessionHelper.GetSessionValue<bool>(_isFinalDepartmentKey))
        {
            CheckForAllUnAssignedProcessOrders();
            return;
        }

        int count = GetEnquiries(GetDateAsDatetime(), 1, 5).Rows.Count;
        UnAssignedDiv.Visible = count > 0;
        if (UnAssignedDiv.Visible)
        {
            UnAssigneCount.Text = count.ToString();
        }
    }

    protected void CheckForAllUnAssignedProcessOrders()
    {

        int count = GetEnquiries(GetDateAsDatetime(), 3, 5).Rows.Count;
        UnAssignedProcessDiv.Visible = count > 0;

        if (UnAssignedProcessDiv.Visible)
        {
            UnAssignedProcessCount.Text = count.ToString();
        }
    }


    protected void CheckForUnAssignedDeliveries()
    {
        if (!SessionHelper.GetSessionValue<bool>(_isinitialDepartmentKey))
        {
            CheckForAllUnAssignedProcessOrders();
            return;
        }
        //Response.Write(Session["IsFinalDepartment"].ToString());

        //Response.Write(Session["IsFinalDepartment"].ToString() + " Is available<br />");

        string ThisStaff = "";
        string This = "select * from Enquiries where Cast (Time as date) <= Cast ('" + GetDateAsDatetime() + "' as date) and BMode=2 and Status !=5 ";


        DataTable objTable1 = FillTable(This);

        if (objTable1.Rows.Count > 0)
        {
            string This2 = "select t1.*, t2.PostCode, t3.Band, t2.Latitude, t2.Longitude from Enquiries t1 join tblLeadMaster t2 on t1.LeadId = t2.Lead_Id join PincodeBandAllocate t3 on t2.Pincode = (Select pincode from pincodes where pinid = t3.PinId and Entered_Unit ='" + Session["Unit_Id"].ToString() + "') where Cast (t1.Time as date) <= Cast ('" + GetDateAsDatetime() + "' as date) and t1.BMode=2 and t1.Status !=5 ";

            //Response.Write(This2); Response.End();
            DataTable objTable = FillTable(This2);
            if (objTable.Rows.Count > 0)
            {
                //Response.Write("<br />" + This2 + "Available");
                for (int i = 0; i < objTable.Rows.Count; i++)
                {
                    string PostCode = objTable.Rows[i]["PostCode"].ToString().TrimEnd();
                    string Band = objTable.Rows[i]["Band"].ToString().TrimEnd();
                    string Lat = objTable.Rows[i]["Latitude"].ToString().TrimEnd();
                    string Long = objTable.Rows[i]["Longitude"].ToString().TrimEnd();
                    string DMode = objTable.Rows[i]["DMode"].ToString().TrimEnd();
                    string ThisTaskId = objTable.Rows[i]["Task_Id"].ToString().TrimEnd();
                    string SubStatus = objTable.Rows[i]["Sub_Status"].ToString();
                    string RejectedStaff = "0";
                    string flag = objTable.Rows[i]["flag"].ToString().TrimEnd();
                    string QueryWithAttendance = "";
                    string QueryWithAttendance55 = "";
                    string QueryWithAttendance66 = "";
                    if (flag == "r")
                    {
                        string GetRejectedStaff = "select Staff_Name from time_Sheet_Master where Status=7 and Task_Id ='" + ThisTaskId + "'";
                        DataTable objDataTableStatus883 = FillTable(GetRejectedStaff);
                        if (objDataTableStatus883.Rows.Count > 0)
                        {
                            RejectedStaff = objDataTableStatus883.Rows[0]["Staff_Name"].ToString();
                        }
                        else
                        {
                            RejectedStaff = "0";
                        }
                    }


                    if (RejectedStaff != "0")
                    {
                        QueryWithAttendance55 = "select top 1 t1.FirstStaff_Id from PostCodeToDriver t1 join Attendance_Master t4 on t1.FirstStaff_Id=t4.Staff_Name where Cast(t4.Attendance_Date as date) = cast('" + GetDateAsDatetime() + "' as date) and t4.In_Time is not null and t4.Out_Time is null and t1.PostCode='" + PostCode + "' and t1.FirstStaff_Id != '" + RejectedStaff + "'";


                    }
                    else
                    {
                        QueryWithAttendance55 = "select top 1 t1.FirstStaff_Id from PostCodeToDriver t1 join Attendance_Master t4 on t1.FirstStaff_Id=t4.Staff_Name where Cast(t4.Attendance_Date as date) = cast('" + GetDateAsDatetime() + "' as date) and t4.In_Time is not null and t4.Out_Time is null and t1.PostCode='" + PostCode + "'";


                    }

                    DataTable objDataTableStatus553 = FillTable(QueryWithAttendance55);
                    if (objDataTableStatus553.Rows.Count > 0)
                    {

                        ThisStaff = objDataTableStatus553.Rows[0]["FirstStaff_Id"].ToString();
                    }
                    else
                    {
                        if (Band != "0")
                        {

                            if (RejectedStaff != "0")
                            {
                                QueryWithAttendance = "SELECT top 1 Min(Least) as 'Low', t1.Staff_Name, t1.Department_Name FROM TodayLeastJobsWithDepartment t1 join VW_Active_Staff_Master t2 on t1.Staff_Name= t2.Staff_Id where t1.Department_Name= '" + Session["IsFinalDepartment"].ToString() + "' and t2.Band ='" + Band + "'  and t1.Staff_Name != '" + RejectedStaff + "' group by t1.Staff_Name, t1.Department_Name Order by Low Asc";
                            }
                            else
                            {
                                QueryWithAttendance = "SELECT top 1 Min(Least) as 'Low', t1.Staff_Name, t1.Department_Name FROM TodayLeastJobsWithDepartment t1 join VW_Active_Staff_Master t2 on t1.Staff_Name= t2.Staff_Id where t1.Department_Name= '" + Session["IsFinalDepartment"].ToString() + "' and t2.Band ='" + Band + "' group by t1.Staff_Name, t1.Department_Name Order by Low Asc";
                            }


                            DataTable objDataTableStatus33 = FillTable(QueryWithAttendance);
                            if (objDataTableStatus33.Rows.Count > 0)
                            {

                                ThisStaff = objDataTableStatus33.Rows[0]["Staff_Name"].ToString();
                            }
                            else
                            {
                                if (RejectedStaff != "0")
                                {
                                    QueryWithAttendance66 = "select top 1 t1.SecStaff_Id from PostCodeToDriver t1 join Attendance_Master t4 on t1.SecStaff_Id=t4.Staff_Name where Cast(t4.Attendance_Date as date) = cast('" + GetDateAsDatetime() + "' as date) and t4.In_Time is not null and t4.Out_Time is null and t1.PostCode='" + PostCode + "'  and t1.SecStaff_Id != '" + RejectedStaff + "'";
                                }
                                else
                                {
                                    QueryWithAttendance66 = "select top 1 t1.SecStaff_Id from PostCodeToDriver t1 join Attendance_Master t4 on t1.SecStaff_Id=t4.Staff_Name where Cast(t4.Attendance_Date as date) = cast('" + GetDateAsDatetime() + "' as date) and t4.In_Time is not null and t4.Out_Time is null and t1.PostCode='" + PostCode + "'";
                                }

                                DataTable objDataTableStatus663 = FillTable(QueryWithAttendance66);
                                if (objDataTableStatus663.Rows.Count > 0)
                                {

                                    ThisStaff = objDataTableStatus663.Rows[0]["SecStaff_Id"].ToString();
                                }
                                else
                                {
                                    GetClosestDistanceDriver(Session["IsFinalDepartment"].ToString(), Lat, Long, RejectedStaff);
                                    ThisStaff = ExceptionDriverHdn.Value;


                                }
                            }
                        }
                        else
                        {
                            return;
                        }
                    }
                    if (!string.IsNullOrWhiteSpace(ThisStaff))
                    {
                        string strQrySubTask11 = "select t1.NextStatus as 'FieldMore_Status_Id', t2.Status_Details, t2.LeadStatusId from tblFieldMoreStatusMaster t1 left outer join tblFieldMoreStatusMaster t2 on t1.NextStatus = t2.FieldMore_Status_Id where t1.FieldMore_Status_Id='" + SubStatus + "'";


                        DataTable objDTTaskId211 = FillTable(strQrySubTask11);
                        if (objDTTaskId211.Rows.Count > 0)
                        {
                            string updtQry4 = "update Enquiries set staff_Id='" + ThisStaff + "', BMode=0, Status='" + objDTTaskId211.Rows[0]["LeadStatusId"].ToString() + "', Sub_Status='" + objDTTaskId211.Rows[0]["FieldMore_Status_Id"].ToString() + "' where Task_Id='" + objTable.Rows[i]["task_Id"].ToString() + "'";
                            Sql_ExecuteNoNQuery(updtQry4);
                        }

                        string updtQry5 = "update Resource_Allocation_Master set Staff_Name='" + ThisStaff + "' where Task_Name='" + objTable.Rows[i]["task_Id"].ToString() + "'";

                        Sql_ExecuteNoNQuery(updtQry5);

                        string updtQry6 = "update Time_Sheet_Master set Staff_Name='" + ThisStaff + "' where task_Id='" + objTable.Rows[i]["task_Id"].ToString() + "' and Status !=3";

                        Sql_ExecuteNoNQuery(updtQry6);
                    }
                    else
                    {

                    }
                }
            }

            UnassignedDeliveriesDiv.Visible = true;
            UnAssignedDeliveryCount.Text = objTable1.Rows.Count.ToString();
        }
        else
        {
            UnAssignedDeliveryCount.Text = objTable1.Rows.Count.ToString();
            UnassignedDeliveriesDiv.Visible = false;
        }
    }


    protected void GetClosestDistanceDriver(string Dept, string Lat, string Long, string RejectedStaff)
    {
        string Qry1 = "";
        if (RejectedStaff != "0")
        {
            Qry1 = "SELECT Staff_Id, PostCode, latitude, longitude, (6971 * acos(cos(radians('" + Lat + "')) * cos(radians(Latitude)) * cos(radians(Longitude)- radians('" + Long + "')) + sin(radians('" + Lat + "')) * sin(radians(Latitude)))) AS distance FROM CampaignToLeadFullView2 where Cast(NextTime as date) = Cast(Getdate() as date) and Display=2 and Department_Name='" + Dept + "' and Staff_Id != '" + RejectedStaff + "' group by PostCode, Latitude, Longitude, Staff_Id order by distance asc";
        }
        else
        {
            Qry1 = "SELECT Staff_Id, PostCode, latitude, longitude, (6971 * acos(cos(radians('" + Lat + "')) * cos(radians(Latitude)) * cos(radians(Longitude)- radians('" + Long + "')) + sin(radians('" + Lat + "')) * sin(radians(Latitude)))) AS distance FROM CampaignToLeadFullView2 where Cast(NextTime as date) = Cast(Getdate() as date) and Display=2 and Department_Name='" + Dept + "' group by PostCode, Latitude, Longitude, Staff_Id order by distance asc";
        }


        DataTable objDataTableStatus4 = FillTable(Qry1);
        if (objDataTableStatus4.Rows.Count > 0)
        {
            decimal dist = Convert.ToDecimal(objDataTableStatus4.Rows[0]["distance"].ToString());
            if (dist <= 5.00M)
            {
                string NewDriver = objDataTableStatus4.Rows[0]["Staff_Id"].ToString();
                ExceptionDriverHdn.Value = NewDriver;

            }
            else
            {
                if (dist <= 7.50M)
                {
                    string NewDriver = objDataTableStatus4.Rows[0]["Staff_Id"].ToString();
                    ExceptionDriverHdn.Value = NewDriver;

                }
                else
                {
                    ExceptionDriverHdn.Value = "";

                }
            }
        }
        else
        {
            ExceptionDriverHdn.Value = "";
        }

    }
    protected void UnAssignedDeliveries_Click(object sender, EventArgs e)
    {
        string Query = " BMode =2";
        UnAssignedDvryHdn.Value = "30";
        Load_Data1(Query);
        UnAssignedDvryHdn.Value = "0";
    }
    protected void DistributeOrders_Click(object sender, EventArgs e)
    {
        //string This = "select * from Enquiries where  (Cast (Time as date) = Cast ('" + GetDate2() + "' as date) or  Cast (Time as date) < Cast ('" + GetDate2() + "' as date) )and BMode= 1 ";
        string This = "select * from Enquiries where  Cast (Time as date) <= Cast ('" + GetDateAsDatetime() + "' as date) and BMode= 1 ";
        DataTable objTable = FillTable(This);
        if (objTable.Rows.Count > 0)
        {
            for (int i = 0; i < objTable.Rows.Count; i++)
            {
                string QueryWithAttendance = "SELECT top 1  Min(Least) as 'Low', Staff_Name, Department_Name  FROM TodayLeastJobsWithDepartment where Department_Name= '" + Session["IsInitialDepartment"].ToString() + "' group by Staff_Name, Department_Name Order by Low Asc";
                //Response.Write(QueryWithAttendance);
                //Response.End();
                DataTable objDataTableStatus3 = FillTable(QueryWithAttendance);
                string ThisStaff = "";
                if (objDataTableStatus3.Rows.Count > 0)
                {
                    ThisStaff = objDataTableStatus3.Rows[0]["Staff_Name"].ToString();


                    string updtQry4 = "update Enquiries set staff_Id='" + ThisStaff + "', BMode=0 where EnqNo='" + objTable.Rows[i]["EnqNo"].ToString() + "'";

                    Sql_ExecuteNoNQuery(updtQry4);
                    string updtQry5 = "update Resource_Allocation_Master set Staff_Name='" + ThisStaff + "' where Task_Name='" + objTable.Rows[i]["task_Id"].ToString() + "'";

                    Sql_ExecuteNoNQuery(updtQry5);

                    string updtQry6 = "update Time_Sheet_Master set Staff_Name='" + ThisStaff + "' where task_Id='" + objTable.Rows[i]["task_Id"].ToString() + "' and Status !=3";

                    Sql_ExecuteNoNQuery(updtQry6);
                }
            }
            Response.Redirect(Request.RawUrl);
        }
        else
        {
            Response.Redirect(Request.RawUrl);
        }
    }
    protected void DistributeAllProcessOrders_Click(object sender, EventArgs e)
    {
        string This = "select t1.*, t2.Department from Enquiries t1 left outer join tblFieldMoreStatusMaster t2 on t1.Sub_Status = t2.FieldMore_Status_Id where  Cast (Time as date) <= Cast ('" + GetDateAsDatetime() + "' as date) and BMode= 3 and t1.Status !=5  ";

        DataTable objTable = FillTable(This);
        if (objTable.Rows.Count > 0)
        {
            string Dep = "0";
            for (int i = 0; i < objTable.Rows.Count; i++)
            {
                Dep = objTable.Rows[i]["Department"].ToString();
                string QueryWithAttendance = "SELECT top 1  Min(Least) as 'Low', Staff_Name, Department_Name  FROM TodayLeastJobsWithDepartment where Department_Name= '" + Dep + "' group by Staff_Name, Department_Name Order by Low Asc";

                DataTable objDataTableStatus3 = FillTable(QueryWithAttendance);
                string ThisStaff = "";
                if (objDataTableStatus3.Rows.Count > 0)
                {
                    ThisStaff = objDataTableStatus3.Rows[0]["Staff_Name"].ToString();
                    string updtQry4 = "update Enquiries set staff_Id='" + ThisStaff + "', BMode=0 where EnqNo='" + objTable.Rows[i]["EnqNo"].ToString() + "'";
                    Sql_ExecuteNoNQuery(updtQry4);

                    string updtQry5 = "update Resource_Allocation_Master set Staff_Name='" + ThisStaff + "' where Task_Name='" + objTable.Rows[i]["Task_Id"].ToString() + "' and Allocation_Id = (Select Max (Allocation_Id) from Resource_Allocation_Master where Task_Name='" + objTable.Rows[i]["Task_Id"].ToString() + "') ";
                    Sql_ExecuteNoNQuery(updtQry5);

                    string updtQry6 = "update Time_Sheet_Master set Staff_Name='" + ThisStaff + "', Display=2, Status=1 where task_Id='" + objTable.Rows[i]["Task_Id"].ToString() + "' and Time_sheet_Id = (Select top 1 Time_Sheet_Id from Time_Sheet_Master order by time_Sheet_Id desc)";

                    Sql_ExecuteNoNQuery(updtQry6);

                }
            }
            Response.Redirect(Request.RawUrl);
        }
        else
        {
            Response.Redirect(Request.RawUrl);
        }
    }
    public void calcularRota(string latitude, string longitude)
    {
        string LastLoc = "";
        //URL do distancematrix - adicionando endereco de origem e destino
        string url = string.Format("https://maps.googleapis.com/maps/api/geocode/xml?latlng={0},{1}&sensor=false&key=AIzaSyDgmcpXMTgAFXVp6DP0kFzLn9hpY3FFbOE", latitude, longitude);
        XElement xml = XElement.Load(url);

        if (xml.Element("status").Value == "OK")
        {
            //Formatar a resposta
            LastLoc = string.Format("{0}",
                //Pegar endereço de origem 
                xml.Element("result").Element("formatted_address").Value);
        }
        else
        {
            LastLoc = "";
        }
        // string strText = LastLoc.Trim();
        // string strText2 = "";
        //string[] strArr = strText.Split(',');
        // int count = 0;
        // for (int i = 0; i < strArr.Length; i++)
        // {
        //     count++;
        // }
        // string label1= Convert.ToString(count);

        // for (int i = 0; i < count ; i++)
        // {

        //     if (i == count -1)
        //     {
        //         strText2 += strArr[i].Trim() + ".";
        //     }
        //     else if (i == count - 2)
        //     {
        //         strText2 += strArr[i].Trim() + ", ";
        //     }
        //     else
        //     {
        //         if (!string.IsNullOrWhiteSpace(LastLoc))
        //         {
        //             strText2 += strArr[i].Trim() + ",\n";
        //         }
        //     }
        // }
        // string modifiedString = strText2.Replace("@", "").Replace(";", "").Replace("'", "").Replace("/", "");

        //LastLocation.Value = modifiedString;
        LastLocation.Value = LastLoc;
    }
    protected void Load_Data1(string Query)
    {
        bool isInitialDepartment = false;
        bool isFinalDepartment = false;

        isInitialDepartment = SessionHelper.GetSessionValue<bool>(_isinitialDepartmentKey, isInitialDepartment);
        isFinalDepartment = SessionHelper.GetSessionValue<bool>(_isFinalDepartmentKey, isFinalDepartment);

        if (isInitialDepartment)
        {
            CheckForUnAssignedOrders();
        }

        if (isFinalDepartment)
        {
            CheckForUnAssignedDeliveries();
        }
        string strStaff_Id, strSD, strED = "";
        try
        {
            if (Convert.ToDateTime(DateFrom.Text) > Convert.ToDateTime(DateTo.Text))
            {
                strSD = DateFrom.Text;
                strED = DateFrom.Text;
            }
            else
            {
                strSD = DateFrom.Text;
                strED = DateTo.Text;
            }
        }
        catch (Exception ex)
        {
            strSD = DateFrom.Text;
            strED = DateFrom.Text;
        }
        string IsField = "0";
        string strEmpId = Convert.ToString(Session["Login_Id"]);
        string strWhere = " SELECT * from TimeSheetViewAllDates";
        Session["Company_Unit_Name"] = Company_Unit_Name.SelectedValue;
        Session["Staff_Id"] = Staff_Name.SelectedValue;
        strStaff_Id = Staff_Name.SelectedValue;
        Session["DateFrom"] = strSD;
        Session["DateTo"] = strED;
        int intCheck = 0;
        if (UnPickedHdn.Value == "1")
        {
            strWhere += " WHERE Display =2";
            intCheck = 1;
        }
        if (UnAssignedDvryHdn.Value != "30")
        {
            if (Convert.ToString(Staff_Name.SelectedValue) != "")
            {
                ShiftPendingTasks();
                strWhere += " WHERE Staff_Id IN (" + Convert.ToString(Staff_Name.SelectedValue) + ")";
                intCheck = 1;
            }
            else if (!Convert.ToBoolean(Session["Admin"]))
            {
                strWhere += " WHERE Staff_Id IN(SELECT [Staff_Id] FROM VW_Active_Staff_Master WHERE Company_Unit_Name=" + Convert.ToString(Session["Unit_Id"]) + " AND Staff_Id IN('" + Convert.ToString(strEmpId) + "')" +
                             " UNION " +
                             " SELECT [Staff_Id]  FROM VW_Active_Staff_Master WHERE Company_Unit_Name=" + Convert.ToString(Session["Unit_Id"]) + " AND Staff_Id IN(SELECT ISNULL(Reporting_Staff,0) FROM Reporting_Master WHERE Responsible_Staff IN('" + Convert.ToString(strEmpId) + "') ) )";
                intCheck = 1;
            }
        }

        if (Convert.ToString(Company_Unit_Name.SelectedValue) != "")
        {
            strWhere += ((intCheck == 1) ? " AND " : " Where ") + " Company_Unit_Name='" + Convert.ToString(Company_Unit_Name.SelectedItem.Text) + "'";
            strWhere += ((intCheck == 1) ? " AND " : " Where ") + " Task_Date BETWEEN '" + strSD + "'  AND '" + strED + "' ";
        }
        if (Query != "")
        {
            strWhere += ((intCheck == 1) ? " AND " : " Where ") + Query;
        }
        //Response.Write(strWhere + " ORDER BY Staff_Name Asc, Task_Date DESC, Start_Time Asc");
        //Response.End();
        DataTable objTable = FillTable(strWhere + " ORDER BY Staff_Name Asc, Task_Date DESC, Start_Time Asc");

        if (objTable.Rows.Count <= 0)
        {
            WarningMessage("No Record found.", tdMessage);
            return;
        }
        else
        {
            displayHeadingLab.Text = "Displayed are the Orders / Activities.";
        }
        bool ApproveRights = true;
        if (!Convert.ToBoolean(Session["Admin"]))
        {
            ApproveRights = (FillTable("SELECT ISNULL(Reporting_Staff,0) FROM Reporting_Master WHERE Responsible_Staff IN('" + Convert.ToString(Session["Login_Id"]) + "') ").Rows.Count > 0);
        }
        string strHTML1 = "<div>" +
        #region heading
            "<table class=\"table\" style=\"text-align:center;\" >";
        #endregion
        string strHTML = strHTML1;
        string strDateTime, strEmptyCell, strStaffName = "";

        string strToolTip = "";
        int intSerialNo = 1;
        DataTable GetTableDuration = FillTable("Exec Sp_GetdateInfo '" + strSD + "','" + strED + "'");
        string[] aryDate = new string[Convert.ToInt32(GetTableDuration.Rows.Count)];
        string[] aryLodData = new string[Convert.ToInt32(GetTableDuration.Rows.Count)];
        bool[] aryCheck = new bool[Convert.ToInt32(GetTableDuration.Rows.Count)];
        string[] aryFullDate = new string[Convert.ToInt32(GetTableDuration.Rows.Count)];
        string[] aryApprove = new string[Convert.ToInt32(GetTableDuration.Rows.Count)];
        string[] aryApprovecheck = new string[Convert.ToInt32(GetTableDuration.Rows.Count)];
        string[] aryLeaveApprove;
        int intFillLoop = GetTableDuration.Rows.Count;
        foreach (DataRow objDateRow in GetTableDuration.Rows)
        {
            aryDate[--intFillLoop] = Convert.ToString(objDateRow["MonthDay"]);
            aryFullDate[intFillLoop] = Convert.ToString(objDateRow["FullDate"]);
            aryCheck[intFillLoop] = true;
            aryApprove[intFillLoop] = "";
            aryLodData[intFillLoop] = "";
            aryApprovecheck[intFillLoop] = "0";
        }
        DateTime ThisDay = CurrentTime.Date;
        string strRowProperty = "";
        string strBorder = "";

        int Count1 = 0, Count2 = 0, Count3 = 0, Count4 = 0, Count5 = 0, Count6 = 0, Count7 = 0, Count8 = 0, Count9 = 0, Count11 = 0, Count12 = 0, Count13 = 0, Count14 = 0, Count15 = 0, Count16 = 0, Count17 = 0;
        Double DistanceCounter = 0.00;
        Double DurationCounter = 0.00;
        string DMode = "", Rush = "", BeforeTime = "";
        Rush = "<span style=\" width:100%;\">Rush</span>";
        int TotalRowCount = objTable.Rows.Count;
        foreach (DataRow objRow in objTable.Rows)
        {
            string task_Id = objRow["Task_Name"].ToString();
            string LeadId = objRow["LeadId"].ToString();
            string CampaignID = objRow["CampaignID"].ToString();
            string DynId = "#" + objRow["OrderNo"].ToString();
            string DynId2 = "" + objRow["OrderNo"].ToString();
            string But1 = "#" + objRow["Time_Sheet_Id"].ToString();
            string But2 = "" + objRow["Time_Sheet_Id"].ToString();
            string But11 = "#" + objRow["Time_Sheet_Id"].ToString() + "11";
            string But22 = "" + objRow["Time_Sheet_Id"].ToString() + "11";
            string But33 = "" + objRow["Time_Sheet_Id"].ToString() + "33";
            DateTime EndDate = DateTime.UtcNow.AddHours(5).AddMinutes(30).Date;
            string EnteredDate = "";
            EnteredDate = objRow["Entered_Date"].ToString();
            strHTML += "";
            IsField = objRow["Is_Field"].ToString();

            if (IsField == "1")
            {

                if (!string.IsNullOrWhiteSpace(objRow["LatLong"].ToString()))
                {
                    //Response.Write(objRow["LatLong"].ToString()); Response.End();
                    string Lat = objRow["LatLong"].ToString().Split(',')[0];
                    string Long = objRow["LatLong"].ToString().Split(',')[1];
                    calcularRota(Lat, Long);

                    //strHTML += "<tr><td style=\"background-color:#ffffff; \" colspan=\"4\" width=\"100%\">Last Seen at : " + LastLocation.Value + "</td></tr>";
                    if (strStaff_Id == Session["Login_Id"].ToString())
                    {
                        if (LastLocation.Value != "0")
                        {
                            Session["Location"] = LastLocation.Value;
                        }
                    }
                }
                else
                {
                    LastLocation.Value = "0";
                }
            }
            else
            {
                LastLocation.Value = "0";
            }
            if (objRow["End_Date"].ToString() != "" && objRow["End_Date"].ToString() != null)
            {
                EndDate = Convert.ToDateTime(objRow["End_Date"].ToString());
            }
            if (strStaffName != Convert.ToString(objRow["Staff_Name"]))
            {
                if (strStaffName != "")
                {
                    for (int intPrintLoop = 0; intPrintLoop < aryLodData.Length; intPrintLoop++)
                    {
                        string ThisDate2 = CurrentTime.Date.ToString("MM/dd/yyyy");
                        string[] arySignInSignOut;
                        string strFullDate = Convert.ToString(FormattedDate(Convert.ToDateTime(aryFullDate[intPrintLoop])));

                        if (Convert.ToInt32(Session["Login_Id"]) == Convert.ToInt32(strStaff_Id) && strFullDate == Convert.ToString(FormattedDate(DateTime.UtcNow.AddHours(5).AddMinutes(30))))
                        {
                            strEmptyCell = "";
                            arySignInSignOut = FnSignInSignOut(strStaff_Id, strFullDate, true, ApproveRights);
                        }
                        else
                        {
                            arySignInSignOut = FnSignInSignOut(strStaff_Id, strFullDate, false, ApproveRights);
                        }
                        if (strFullDate == Convert.ToString(FormattedDate(DateTime.UtcNow.AddHours(5).AddMinutes(30))))
                        {
                            strRowProperty = "style=\"background-color:#c0c0c0; border-radius:10px;\"";
                            BeforeTime = "<span style=\"  width:100%;\"> :" + objRow["Start_Time"].ToString() + "</span>";
                        }
                        else
                        {
                            BeforeTime = "<span style=\" width:100%;\"> :" + objRow["Time_Sheet_Date"].ToString() + " " + objRow["Start_Time"].ToString() + "</span>";
                        }

                        string But444 = "#" + strStaff_Id;
                        string But555 = "" + strStaff_Id;
                        string But666 = "" + strStaff_Id + "##";
                        string strToolTipText22 = "Click this button to plan and schedule various tasks or reminders.";
                        string tooltip22 = " onMouseover=\"ddrivetip('" + strToolTipText22 + "')\" onmouseout=\"hideddrivetip()\"";
                        strEmptyCell = "<div style=\"text-align:center;\">" +
                                                 "<br /><br /><button type =\"button\" class=\"btn btn-danger btn-sm\" style=\"font-size:medium;float:center;   background-color:#acb39d;\" data-whatever=\"Time_Sheet_Master_Plan.aspx?RequestType=1 &Date=" + Convert.ToString(FormattedDate(Convert.ToDateTime(aryFullDate[intPrintLoop]))) + "&Staff_Id=" + strStaff_Id + "&Time_Sheet_Id=0&id=&Action=A\" style=\"zoom:0.60\" frameborder=\"0\" height=\"900\" width=\"99.6%\"  data-toggle=\"modal\" data-target=\"#orderModal\" " + tooltip22 + " >Create an <span style=\"font-weight:bold;\">Activity / Reminder / Memo</span></button><br /><br />";
                        if (aryLodData[intPrintLoop] != "")
                        {
                            if (aryApprove[intPrintLoop] == "" && Convert.ToInt32(aryApprovecheck[intPrintLoop]) > 0 && ApproveRights)
                            {
                                aryApprove[intPrintLoop] = "<div style=\"float:left;\" class=\"label\">Time Line:</div><div style=\"float:right;\" class=\"label\"><nobr><input type='button' class=\"smallbutton\" onclick=\"AjaxCallBack(this.parentNode.parentNode,'" + strFullDate + "','" + strStaff_Id + "','Approved','Time')\"  value='AP'>&nbsp;<input type='button' class=\"smallbutton\" onclick=\"AjaxCallBack(this.parentNode.parentNode,'" + strFullDate + "','" + strStaff_Id + "','Not Approved','Time')\"  value='NA'></nobr></div>";
                            }
                            else if (aryApprove[intPrintLoop] != "")
                            {
                                aryApprove[intPrintLoop] = "<div style=\"float:left;\" class=\"label\">Time Line:</div><div style=\"float:right;\">" + aryApprove[intPrintLoop] + "</div>";
                            }
                        }
                        if (intPrintLoop == 0)
                        {
                            strHTML += "<tr><td  width=\"20%\" style=\"border-radius:10px;\" rowspan=\"" + aryLodData.Length + "\">" + (intSerialNo++) + "  -  </td>";
                            strHTML += "<td colspan=\"3\" rowspan=\"" + aryLodData.Length + "\" width=\"80%\">" + strStaffName + " : " + aryApprove[intPrintLoop] + "</td>" +
                                 //strHTML += "<td class=\"gridvalue\" style=\"border-radius:10px;width:20%;\">" + aryApprove[intPrintLoop]  + "</td>" +
                                 "</tr>";
                        }
                        //string ThisDate = Convert.ToDateTime(aryFullDate[intPrintLoop]).ToString("dd/MM/yyyy HH:mm:ss tt");
                        string ThisDate = Convert.ToDateTime(aryFullDate[intPrintLoop]).ToString();
                        aryLeaveApprove = Leave_Approve(strFullDate, strStaff_Id, ApproveRights, ThisDate, IsField);

                        if (Convert.ToString(aryLeaveApprove[0]).Trim() == "0")
                        {
                            arySignInSignOut[0] = "";
                            arySignInSignOut[1] = "";
                        }

                        strHTML += "<tr><td " + strRowProperty + "  colspan=\"4\" width=\"100%\">" + strStaffName + " : " + aryDate[intPrintLoop] + " </td></tr>";
                        strHTML += "<tr><td  width=\"100%\" colspan=\"4\" align=\"center\">" + arySignInSignOut[0] + " " + arySignInSignOut[1] + "</td></tr>";

                        if (string.IsNullOrWhiteSpace(arySignInSignOut[4]) || arySignInSignOut[4] == "No location found" || arySignInSignOut[4] == "Office" || arySignInSignOut[4] == "test_location" || arySignInSignOut[4] == "Location not available." || arySignInSignOut[4] == "." || arySignInSignOut[4] == "")
                        {
                            strHTML += "";
                        }
                        else
                        {
                            strHTML += "<tr><td colspan=\"4\" width=\"100%\"  align=\"center\" style=\"text-align:center;\" >" + arySignInSignOut[4] + "</td></tr>";
                        }
                        if (string.IsNullOrWhiteSpace(arySignInSignOut[5]) || arySignInSignOut[5] == "No location found" || arySignInSignOut[5] == "Office" || arySignInSignOut[5] == "test_location" || arySignInSignOut[5] == "Location not available." || arySignInSignOut[5] == "." || arySignInSignOut[5] == "")
                        {
                            strHTML += "";
                        }
                        else
                        {
                            strHTML += "<tr><td colspan=\"4\" width=\"100%\"  align=\"center\" style=\"text-align:center;\">" + arySignInSignOut[5] + "</td></tr>";
                        }
                        strHTML += "<tr><td width=\"100%\" colspan=\"4\" align=\"center\">" + aryLeaveApprove[1] + "&nbsp&nbsp" + aryApprove[intPrintLoop] + "</td></tr>";
                        strHTML += "<tr><td  colspan=\"4\" width=\"100%\" ><center>" + aryLodData[intPrintLoop] + "</center></td></tr>";
                        strHTML += "<tr><td  colspan=\"4\" width=\"100%\" ><center>" + strEmptyCell + "</center></td></tr>";
                        strRowProperty = "";
                        aryLodData[intPrintLoop] = "";
                        aryCheck[intPrintLoop] = true;
                        aryApprove[intPrintLoop] = "";
                        aryApprovecheck[intPrintLoop] = "0";
                    }
                }
            }
            if (Convert.ToString(objRow["Time_Sheet_Date"]) != "")

                for (int intLoop = 0; intLoop < aryLodData.Length; intLoop++)
                {
                    strStaff_Id = Convert.ToString(objRow["Staff_Id"]); // VIB Note
                    strBorder = "";
                    LastLocation.Value = Convert.ToString(objRow["LatLong"]);
                    if (Convert.ToDateTime(aryFullDate[intLoop]) == Convert.ToDateTime(objRow["Time_Sheet_Date"]))
                    {
                        DateTime ThisDt = Convert.ToDateTime(objRow["Time_Sheet_Date"].ToString() + " " + objRow["Start_Time"].ToString());
                        string ThisDTSt = ThisDt.ToString("M/d/yyyy h:mm tt");
                        string ThisDTSt2 = ThisDt.ToString("h:mm tt");
                        if (Convert.ToDateTime(objRow["Time_Sheet_Date"]).ToShortDateString() == Convert.ToDateTime(GetDateAsDatetime()).ToShortDateString())
                        {
                            BeforeTime = "<span style=\" background-color:#f5d2b9; width:100%;\">by :" + ThisDTSt2 + "</span>";
                        }
                        else
                        {
                            BeforeTime = "<span style=\" background-color:#f5d2b9; width:100%;\">by " + ThisDTSt + "</span>";
                        }
                        string strToolTipText = "";

                        String ThisStartTime = "";
                        DateTime ThatStart;
                        if (objRow["Start_Time"].ToString() != "" && objRow["Start_Time"].ToString() != null)
                        {
                            ThisStartTime = objRow["Task_Date"].ToString().Substring(0, objRow["Task_Date"].ToString().IndexOf(" ")) + " " + objRow["Start_Time"].ToString();
                            ThatStart = Convert.ToDateTime(ThisStartTime);
                        }
                        else
                        {
                            ThatStart = GetDateAsDatetime();
                        }
                        DateTime ThisNow = GetDateAsDatetime();
                        DateTime Then = ThisNow.AddMinutes(-30.00);
                        if (Convert.ToString(objRow["End_Time"]) != "" && Convert.ToString(objRow["Start_Time"]) != "")
                        {

                            if (Convert.ToString(objRow["LeadName"]) != "")
                            {
                                string Disp = "0";
                                PickUpHdn.Value = "0";
                                //UnpickedDiv.Visible = false;

                                if (objRow["Display"].ToString() == "2" && objRow["DModeField"].ToString() == "1")
                                {
                                    Count8 = Count8 + 1;
                                    UnpickedDiv.Visible = true;
                                    Disp = "1";
                                    PickUpHdn.Value = "1";
                                    Response.Write("<embed height='0' width='0' src='TrringerRingWav.wav' />");

                                    if (Convert.ToString(objRow["DMode"]) == "0")
                                    {
                                        if (Convert.ToString(objRow["CMode"]) == "1")
                                        {
                                            DMode = "<td style=\"background-color:#ffffff;\">Normal - Non Rx</td>";
                                        }
                                        else
                                        {
                                            DMode = "<td style=\"background-color:#ffffff;\">Normal</td>";
                                        }
                                        Count14 += 1;
                                    }
                                    if (EndDate < ThisDay && objRow["Status_Id"].ToString() != "3")
                                    {
                                        Count7 = Count7 + 1;
                                        strBorder = "border:4px Dashed #000000;";
                                    }
                                    if (Convert.ToString(objRow["DMode"]) == "1")
                                    {
                                        Count9 = Count9 + 1;
                                        if (Convert.ToString(objRow["CMode"]) == "1")
                                        {
                                            DMode = "<td style=\"background-color:#f77474;\">" + Rush + " - Non Rx</td>";
                                        }
                                        else
                                        {
                                            DMode = "<td style=\"background-color:#f77474;\">" + Rush + "</td>";
                                        }
                                    }
                                    if (Convert.ToString(objRow["DMode"]) == "2")
                                    {
                                        Count11 = Count11 + 1;
                                        if (Convert.ToString(objRow["CMode"]) == "1")
                                        {
                                            DMode = "<td style=\"background-color:#f5d2b9;\"> Deadline " + BeforeTime + " - Non Rx</td>";
                                        }
                                        else
                                        {
                                            DMode = "<td style=\"background-color:#f5d2b9;\"> Deadline " + BeforeTime + "</td>";
                                        }
                                    }

                                    aryLodData[intLoop] += "<span style=\"font-weight:bold;\">CRM Task</span><button style=\"background-color:#dbd9d0; margin-bottom:10px; text-align:right; padding:3px; color:#000000; border-radius: 7px;\" class=\"btn btn-md btn-default dropdown-toggle\" type=\"button\" data-toggle=\"collapse\" data-target=\"" + DynId + "\" aria-expanded=\"false\" aria-controls=\"" + DynId2 + "\"><table class=\"table table-striped\"><thead style=\" background-color:#dbd9d0;\"><tr><td style=\"width:60%; text-align:left;\">Name</td><td style=\"width:40%; text-align:left;\">Type</td></tr></thead><tbody style=\"text-align:left;\"><tr><th scope=\"col\">" + objRow["LeadName"] + "</th>" + DMode + "</tr><tr style=\"background-color:#e0dfde; text-align:center;\" align=\"center\" ><td colspan=\"2\" style=\"align:center;\"></td></tbody></table><span class=\"caret\" style=\"float:left; font-size:small;  margin-top:-43px\">Expand  -  Activity starting at : " + objRow["Start_Time"] + "</span><div style=\"margin-top:-20px; font-size:10px; text-align:center; background-color:" + Convert.ToString(objRow["Color_Code"]) + ";\">Order No. " + objRow["OrderNo"] + " - Current Process : <b>" + objRow["Status_Details"] + "</b></div></button>";
                                    //big button with name/type table on it - end

                                    //open/done buttons - start                                       

                                    aryLodData[intLoop] += "<center><div><button type =\"button\" data-whatever= \"../CRM/ProductsList.aspx?Enquiry=" + objRow["OrderNo"].ToString() + "&LeadId=" + LeadId + "&Campaign=" + CampaignID + "&TaskID=" + task_Id + " \" class=\"btn btn-default btn-sm\"  style=\"border-radius:7px; margin-top:-10px; margin-left:5px; margin-right:5px; width:100px; display:inline; background-color:#ebe8ed;\" data-toggle=\"modal\" data-target=\"#orderModal\" >Open</button><a style=\"color:transparent\" class=\"arefPlain\" href=\"Time_Sheet_Master_Popup.aspx?RequestType=1&Action=UPV&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "\" ><input type='button' class=\"btn btn-default btn-sm\" value='Accept' style=\" border-radius:7px; width:100px; display:inline; margin-top:-10px; background-color:#ebe8ed\"/></a></div>";


                                    aryLodData[intLoop] += "<div class=\"btn-group dropup\"><button style=\"border-radius:7px; width:100px; display:inline; margin-top:-10px; background-color:#ebe8ed\" class=\"btn btn-default btn-sm dropdown-toggle\" type=\"button\" data-toggle=\"dropdown\">Options<span class=\"caret\"></span></button><ul class=\"dropdown-menu dropdown-menu-right\" style=\"background-color:rgb(224, 222, 205); border-radius:15px; border-width:0px;; font-size:small;\"><li><a style=\"margin-top:-10px; background-color:transparent\" class=\"arefPlain\" href=\"Time_Sheet_Master_Popup.aspx?RequestType=1&Action=UOVD&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "\" ><input type='button' class=\"btn btn-default btn-sm\" value='Reject' style=\" border-radius:7px; background-color:#ebe8ed\"/></a></li></a></div></center>";
                                    //open/done buttons - end                                       
                                    //dropdown content(more) when clicking big button - start
                                    aryLodData[intLoop] += "<div class=\"collapse\" id=\"" + DynId2 + "\"><div style=\"margin-bottom:-30px; margin-top:-20px;\" class=\"card card-body\"><div id=\"jumbo-center\" class=\"jumbotron\" style=\"padding:10px; margin-top:0px;> <div style=\"float:center; padding:5px;width:10%;background-color:" + Convert.ToString(objRow["Color_Code"]) + "; border-radius: 10px;" + strBorder + "\"><table class=\"table  table-striped table-bordered\"> <thead> <tr> <th scope=\"col\">Ord#</th><th scope=\"col\">Ph#</th><th scope=\"col\">Time</th></tr> </thead> <tbody> <tr><th scope=\"row\">" + objRow["OrderNo"] + "</th><td>" + objRow["LeadType"] + "</td><td>" + EnteredDate + "</td></tr> </tbody></table><table class=\"table table-striped table-bordered\"> <thead> <tr> <th scope=\"col\">Address</th></tr> </thead> <tbody> <tr><td>" + objRow["Address"] + " - Apt # - " + objRow["ApartmentNo"] + "</td></tr> </tbody></table><table class=\"table table-striped table-bordered\"> <thead> <tr> <th scope=\"col\">Destination</th></tr> </thead> <tbody> <tr><td>" + objRow["DestAddress"] + "</td></tr><tr><td><a class=\"label\" style=\"font-size:16px;border-width:3px;border-color:#e6e5e5;border-style:ridge;background-color:beige;\" href=\"Trip_PlanAuto.aspx?StaffID=" + strStaff_Id + "&Type=2&Mode=Dest&Date=" + GetDateAsDatetime() + "\" target=\"_blank\" >Proceed to Destination</a></td></tr> </tbody></table><table class=\"table table-striped table-bordered\"><thead><tr><th scope=\"col\">Permanent Instructions</th></tr></thead><tbody><tr><td>" + objRow["PInstructions"] + "</td></tr><tr><th scope=\"col\">Order Instructions</th></tr></thead><tbody><tr><td>" + objRow["DInstructions"] + "</td></tr></tbody><tr><th scope=\"col\">Order Activity Log</th></tr></thead><tbody><tr><td>" + objRow["Remarks"].ToString() + "</td></tr></tbody></table></div></div><p><a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupReplan.aspx?RequestType=1&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) +
                    "&Staff_Id=" + strStaff_Id + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) +
                    "&task_id=" + Convert.ToString(objRow["task_name"]) +
                    "&status_id=" + Convert.ToString(objRow["Status_Id"]) +
                    //"&id=\" onclick=\"OpenPopUp(this.href,'mywin','200','150','yes');return false\" onfocus=\"this.blur()\" >" +
                    "&id=&Action=NN\" onclick=\"return hs.htmlExpand(this, { objectType: 'iframe' } )\" >" +
                   "<input type ='button' class=\"btn btn-default btn-sm\" value='Edit / Add Details' style=\" border-radius:7px; width:125px; display:inline;  background-color:#ebe8ed\"/></a></div></center>";

                                }
                                else if (objRow["Display"].ToString() == "0")
                                {
                                    Count6 = Count6 + 1;
                                    strBorder = "border:3px inset #CCFF00;";
                                    if (Convert.ToString(objRow["Replan"]) == "r" && EndDate > ThisDay)
                                    {
                                        Count4 = Count4 + 1;
                                        strBorder = "border:3px groove #FF4500;";
                                    }
                                    if (ThatStart < Then && objRow["Status_Id"].ToString() == "1")
                                    {
                                        Count5 = Count5 + 1;
                                        strBorder = "border:3px outset #000000;";
                                    }
                                    if (EndDate < ThisDay && objRow["Status_Id"].ToString() != "3")
                                    {
                                        Count7 = Count7 + 1;
                                        strBorder = "border:4px Dashed #000000;";
                                    }
                                    if (Convert.ToString(objRow["DMode"]) == "0")
                                    {

                                        if (Convert.ToString(objRow["CMode"]) == "1")
                                        {
                                            DMode = "<td style=\"background-color:#ffffff;\">Normal - Non Rx</td>";
                                        }
                                        else
                                        {
                                            DMode = "<td style=\"background-color:#ffffff;\">Normal</td>";
                                        }
                                        Count14 += 1;
                                    }

                                    else if (Convert.ToString(objRow["DMode"]) == "1")
                                    {
                                        Count9 = Count9 + 1;
                                        if (Convert.ToString(objRow["CMode"]) == "1")
                                        {
                                            DMode = "<td style=\"background-color:#f77474;\">" + Rush + " - Non Rx</td>";
                                        }
                                        else
                                        {
                                            DMode = "<td style=\"background-color:#f77474;\">" + Rush + "</td>";
                                        }
                                    }
                                    else if (Convert.ToString(objRow["DMode"]) == "2")
                                    {
                                        Count11 = Count11 + 1;
                                        if (Convert.ToString(objRow["CMode"]) == "1")
                                        {
                                            DMode = "<td style=\"background-color:#f5d2b9;\"> Deadline " + BeforeTime + " - Non Rx</td>";
                                        }
                                        else
                                        {
                                            DMode = "<td style=\"background-color:#f5d2b9;\"> Deadline " + BeforeTime + "</td>";
                                        }

                                    }
                                    else if (Convert.ToString(objRow["DMode"]) == "3")
                                    {
                                        Count16 = Count16 + 1;
                                        if (Convert.ToString(objRow["CMode"]) == "1")
                                        {
                                            DMode = "<td style=\"background-color:#f8ccef;\">Returns - Non Rx</td>";
                                        }
                                        else
                                        {
                                            DMode = "<td style=\"background-color:#f8ccef;\">Returns</td>";
                                        }
                                    }
                                    else if (Convert.ToString(objRow["DMode"]) == "4")
                                    {
                                        if (Convert.ToString(objRow["CMode"]) == "1")
                                        {
                                            DMode = "<td style=\"background-color:#ccf7db;\">Customer Waiting - Non Rx</td>";
                                        }
                                        else
                                        {
                                            DMode = "<td style=\"background-color:#ccf7db;\">Customer Waiting</td>";
                                        }
                                        Count12 += 1;
                                    }
                                    else if (Convert.ToString(objRow["DMode"]) == "5")
                                    {
                                        if (Convert.ToString(objRow["CMode"]) == "1")
                                        {
                                            DMode = "<td style=\"background-color:#e5f9fc;\">Customer Pickup - Non Rx</td>";
                                        }
                                        else
                                        {
                                            DMode = "<td style=\"background-color:#e5f9fc;\">Customer Pickup</td>";
                                        }
                                        Count13 += 1;
                                    }
                                    else if (Convert.ToString(objRow["DMode"]) == "7")
                                    {
                                        if (Convert.ToString(objRow["CMode"]) == "1")
                                        {
                                            DMode = "<td style=\"background-color:#e5f9fc;\">Deadline Pickup " + BeforeTime + " - Non Rx</td>";

                                        }
                                        else
                                        {
                                            DMode = "<td style=\"background-color:#e5f9fc;\">Deadline Pickup " + BeforeTime + "</td>";
                                        }
                                        Count17 += 1;
                                    }
                                    else if (Convert.ToString(objRow["DMode"]) == "6")
                                    {
                                        if (Convert.ToString(objRow["CMode"]) == "1")
                                        {
                                            DMode = "<td style=\"background-color:#f3edd1;\">Cancelled - Non Rx</td>";
                                        }
                                        else
                                        {
                                            DMode = "<td style=\"background-color:#f3edd1;\">Cancelled</td>";
                                        }
                                        Count15 += 1;
                                    }
                                    if (objRow["BMode"].ToString() == "2")
                                    {
                                        //big button with name/type table on it - start 
                                        aryLodData[intLoop] += "<span style=\"font-weight:bold;\">CRM Task</span><button style=\"background-color:#dbd9d0; margin-bottom:10px; text-align:right; padding:3px; color:#000000; border-radius: 7px;\" class=\"btn btn-md btn-default dropdown-toggle\" type=\"button\" data-toggle=\"collapse\" data-target=\"" + DynId + "\" aria-expanded=\"false\" aria-controls=\"" + DynId2 + "\"><table class=\"table table-striped\"><thead style=\" background-color:#dbd9d0;\"><tr><td style=\"width:60%; text-align:left;\">Name</td><td style=\"width:40%; text-align:left;\">Type</td></tr></thead><tbody style=\"text-align:left;\"><tr><th scope=\"col\">" + objRow["LeadName"] + "</th>" + DMode + "</tr><tr style=\"background-color:#e0dfde; text-align:center;\" align=\"center\" ><td colspan=\"2\" style=\"align:center;\"></td></tbody></table><span class=\"caret\" style=\"float:left; font-size:small;  margin-top:-43px\">Expand  -  Activity starting at : " + objRow["Start_Time"] + "</span><div style=\"margin-top:-20px; font-size:10px; text-align:center; background-color:" + Convert.ToString(objRow["Color_Code"]) + ";\">Order No. " + objRow["OrderNo"] + " - Current Process : <b>" + objRow["Status_Details"] + "</b></div></button>";
                                        //big button with name/type table on it - end

                                        //open/done buttons - start
                                        aryLodData[intLoop] += "<center><div><button type =\"button\" data-whatever= \"../CRM/ProductsList.aspx?Enquiry=" + objRow["OrderNo"].ToString() + "&LeadId=" + LeadId + "&Campaign=" + CampaignID + "&TaskID=" + task_Id + " \" class=\"btn btn-default btn-sm\"  style=\"border-radius:7px; margin-top:-10px; margin-left:5px; margin-right:5px; width:100px; display:inline; background-color:#ebe8ed;\" data-toggle=\"modal\" data-target=\"#orderModal\" " + strToolTip + ">Open</button>";

                                        aryLodData[intLoop] += "<a style=\"color:transparent\" class=\"arefPlain\" href=\"Time_Sheet_Master_Popup.aspx?RequestType=1&Action=UOV&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "\" ><input type='button' class=\"btn btn-default btn-sm\" value='Accept' style=\" border-radius:7px; width:100px; display:inline; margin-top:-10px; background-color:#ebe8ed\"/></a>";

                                        aryLodData[intLoop] += "<div class=\"btn-group dropup\"><button style=\"border-radius:7px; width:100px; display:inline; margin-top:-10px; background-color:#ebe8ed\" class=\"btn btn-default btn-sm dropdown-toggle\" type=\"button\" data-toggle=\"dropdown\">Options<span class=\"caret\"></span></button><ul style=\"background-color:rgb(224, 222, 205); border-radius:15px; border-width:0px;; font-size:small;\" class=\"dropdown-menu dropdown-menu-right\"><li><a style=\"margin-top:-10px; background-color:transparent\" class=\"arefPlain\" href=\"Time_Sheet_Master_Popup.aspx?RequestType=2&Action=UOV&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "&PostCode=" + Convert.ToString(objRow["PostCode"]) + "\" ><input type='button' class=\"btn btn-default btn-sm\" value='Accept As Primary Driver' style=\" border-radius:7px; background-color:#ebe8ed\"/></a></li><li><a style=\"background-color:transparent\" class=\"arefPlain\" href=\"Time_Sheet_Master_Popup.aspx?RequestType=3&Action=UOV&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "\" ><input type='button' class=\"btn btn-default btn-sm\" value='Accept As Secondary Driver' style=\" border-radius:7px; background-color:#ebe8ed\"/></a></li></a></div></center>";
                                        //open/done buttons - end                                       
                                        //dropdown content(more) when clicking big button - start
                                        aryLodData[intLoop] += "<div class=\"collapse\" id=\"" + DynId2 + "\"><div style=\"margin-bottom:-30px; margin-top:-20px;\" class=\"card card-body\"><div id=\"jumbo-center\" class=\"jumbotron\" style=\"padding:10px; margin-top:0px;> <div style=\"float:center; padding:5px;width:10%;background-color:" + Convert.ToString(objRow["Color_Code"]) + "; border-radius: 10px;" + strBorder + "\"><table class=\"table  table-striped table-bordered\"> <thead> <tr> <th scope=\"col\">Ord#</th><th scope=\"col\">Ph#</th><th scope=\"col\">Time</th></tr> </thead> <tbody> <tr><th scope=\"row\">" + objRow["OrderNo"] + "</th><td>" + objRow["LeadType"] + "</td><td>" + EnteredDate + "</td></tr> </tbody></table><table class=\"table table-striped table-bordered\"> <thead> <tr> <th scope=\"col\">Address</th></tr> </thead> <tbody> <tr><td>" + objRow["Address"] + " - Apt # - " + objRow["ApartmentNo"] + "</td></tr> </tbody></table><table class=\"table table-striped table-bordered\"> <thead> <tr> <th scope=\"col\">Destination</th></tr> </thead> <tbody> <tr><td>" + objRow["DestAddress"] + "</td></tr><tr><td><a class=\"label\" style=\"font-size:16px;border-width:3px;border-color:#e6e5e5;border-style:ridge;background-color:beige;\" href=\"Trip_PlanAuto.aspx?StaffID=" + strStaff_Id + "&Type=2&Mode=Dest&Date=" + GetDateAsDatetime() + "\" target=\"_blank\" >Proceed to Destination</a></td></tr> </tbody></table><table class=\"table table-striped table-bordered\"><thead><tr><th scope=\"col\">Permanent Instructions</th></tr></thead><tbody><tr><td>" + objRow["PInstructions"] + "</td></tr><tr><th scope=\"col\">Order Instructions</th></tr></thead><tbody><tr><td>" + objRow["DInstructions"] + "</td></tr></tbody><tr><th scope=\"col\">Order Activity Log</th></tr></thead><tbody><tr><td>" + objRow["Remarks"].ToString() + "</td></tr></tbody></table></div></div><p>";
                                        aryLodData[intLoop] += "<a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupReplan.aspx?RequestType=1&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) +
                        "&Staff_Id=" + strStaff_Id + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) +
                        "&task_id=" + Convert.ToString(objRow["task_name"]) +
                        "&status_id=" + Convert.ToString(objRow["Status_Id"]) +
                        //"&id=\" onclick=\"OpenPopUp(this.href,'mywin','200','150','yes');return false\" onfocus=\"this.blur()\" >" +
                        "&id=&Action=NN\" onclick=\"return hs.htmlExpand(this, { objectType: 'iframe' } )\" >" +
                       "<input type ='button' class=\"btn btn-default btn-sm\" value='Edit / Add Details' style=\" border-radius:7px; width:125px; display:inline;  background-color:#ebe8ed\"/></a></div></center>";
                                    }
                                    else
                                    {
                                        if (objRow["MasterStatus"].ToString() == "3")
                                        {
                                            if (!string.IsNullOrWhiteSpace(objRow["Duration"].ToString()) && (!string.IsNullOrWhiteSpace(objRow["Distance"].ToString())) && (!string.IsNullOrWhiteSpace(objRow["ETA"].ToString())))
                                            {
                                                DistanceCounter += Convert.ToDouble(objRow["Distance"].ToString());
                                                DurationCounter += Convert.ToDouble(objRow["Duration"].ToString());
                                                if (objRow["DMode"].ToString() != "6")
                                                {
                                                    aryLodData[intLoop] += "<h6 style=\"display:inline;\">From Origin :<span style=\"background-color:#e8e8e8; color:black;\" class=\"badge\">" + DistanceCounter.ToString() + " Km./" + DurationCounter.ToString() + " Mins. </h6><br/><h5 style=\"display:inline; margin-right:8px;\"> ETA : <span style=\"color:black; background-color:#adcec9;\" class=\"badge\">" + objRow["ETA"].ToString().Substring(0, 5) + "</span></h5>" +
                                                         //"<h6 style=\"display:inline;\">From Last Stop : <span style=\"background-color:#e8e8e8; color:black;\" class=\"badge\">" + objRow["Distance"].ToString() + " Km. /" + objRow["Duration"].ToString() + " mins.</span></h6>"+
                                                         "<br /><br />Origin : " + objRow["Address"].ToString() + "<br /><a href=\"https://www.google.com/maps/dir/?api=1&destination=" + objRow["Latitude"].ToString() + "," + objRow["Longitude"].ToString() + "\" target=\"_blank\" ><input type='button'  class=\"btn-default\"  value='Navigate to trip origin' style=\"border-radius:5px; text-align:center;background-color:#adcec9; height:35px;\"  /></a><br /><br />Destination : " + objRow["DestAddress"].ToString() + "<br /><a href=\"https://www.google.com/maps/dir/?api=1&destination=" + objRow["DestLatitude"].ToString() + "," + objRow["DestLongitude"].ToString() + "\" target=\"_blank\" ><input type='button'  class=\"btn-default\"  value='Navigate to trip destination' style=\"border-radius:5px; text-align:center;background-color:#adcec9; height:35px;\"  /></a><br /><br />";
                                                }
                                            }
                                            if (Convert.ToString(objRow["DMode"]) != "3")
                                            {
                                                aryLodData[intLoop] += "<span style=\"font-weight:bold;\">CRM Task</span><button style=\"background-color:#dbd9d0; margin-bottom:10px; text-align:right; padding:3px; color:#000000; border-radius: 7px;\" class=\"btn btn-md btn-default dropdown-toggle\" type=\"button\" data-toggle=\"collapse\" data-target=\"" + DynId + "\" aria-expanded=\"false\" aria-controls=\"" + DynId2 + "\"><table class=\"table table-striped\"><thead style=\" background-color:#dbd9d0;\"><tr><td style=\"width:60%; text-align:left;\">Name</td><td style=\"width:40%; text-align:left;\">Type</td></tr></thead><tbody style=\"text-align:left;\"><tr><th scope=\"col\">" + objRow["LeadName"] + "</th>" + DMode + "</tr><tr style=\"background-color:#e0dfde; text-align:center;\" align=\"center\" ><td colspan=\"2\" style=\"align:center;\"></td></tbody></table><span class=\"caret\" style=\"float:left; font-size:small;  margin-top:-43px\">Expand  -  Activity starting at : " + objRow["Start_Time"] + "</span><div style=\"margin-top:-20px; font-size:10px; text-align:center; background-color:" + Convert.ToString(objRow["Color_Code"]) + ";\">Order No. " + objRow["OrderNo"] + " - Current Process : <b>" + objRow["Status_Details"] + "</b></div></button>";
                                                aryLodData[intLoop] += "<center><div><button type =\"button\" data-whatever= \"../CRM/ProductsList.aspx?Enquiry=" + objRow["OrderNo"].ToString() + "&LeadId=" + LeadId + "&Campaign=" + CampaignID + "&TaskID=" + task_Id + " \" class=\"btn btn-default btn-sm\"  style=\"border-radius:7px; margin-top:-10px; margin-left:5px; margin-right:5px; width:100px; display:inline; background-color:#ebe8ed;\"  " + strToolTip + " data-toggle=\"modal\" data-target=\"#orderModal\" " + strToolTip + ">Open</button>";
                                                aryLodData[intLoop] += "<a style=\"color:transparent\" class=\"arefPlain\" href=\"Time_Sheet_Master_PopupAxnV.aspx?RequestType=1&Action=V&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "&Location=" + Convert.ToString(objRow["Location"]) + "\" ><input type='button' class=\"btn btn-default btn-sm\" value='Done..' style=\" border-radius:7px; width:100px; display:inline; margin-top:-10px; background-color:#ebe8ed\"/></a>";
                                                aryLodData[intLoop] += "<br/><a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupAxnV.aspx?RequestType=1&Action=VVS&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&Task_Id=" + Convert.ToString(objRow["task_name"]) + "\" >" +
                                 "<input type='button' class=\"btn btn-default btn-sm\" value='Start Job' style=\" border-radius:7px; width:125px; display:inline;  background-color:#ebe8ed\"/>" +
                                 "</a><a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupReplan.aspx?RequestType=1&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) +
                                 "&Staff_Id=" + strStaff_Id + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) +
                                 "&task_id=" + Convert.ToString(objRow["task_name"]) +
                                 "&status_id=" + Convert.ToString(objRow["Status_Id"]) +
                                 //"&id=\" onclick=\"OpenPopUp(this.href,'mywin','200','150','yes');return false\" onfocus=\"this.blur()\" >" +
                                 "&id=&Action=NN\" onclick=\"return hs.htmlExpand(this, { objectType: 'iframe' } )\" >" +
                                "<input type ='button' class=\"btn btn-default btn-sm\" value='Edit / Add Details' style=\" border-radius:7px; width:125px; display:inline;  background-color:#ebe8ed\"/></a></div></center>";

                                                if (Convert.ToString(objRow["CampaignID"]) != "0" && !string.IsNullOrWhiteSpace(Convert.ToString(objRow["ClientName"])))
                                                {
                                                    if (Convert.ToString(objRow["TaskReplan"]) != "y")
                                                    {
                                                        aryLodData[intLoop] += "<a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupAxnV.aspx?RequestType=1&Action=VC&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Batch=" + Disp + "&Staff_Id=" + strStaff_Id + "&CampaignID=" + Convert.ToString(objRow["CampaignID"]) + "\" ><input type='button' class=\"btn btn-default btn-sm\" value='Batch' style=\" border-radius:7px; width:100px; display:inline; margin-top:-10px; background-color:#ebe8ed\"/></a>";
                                                    }
                                                    else
                                                    {
                                                    }
                                                }
                                                else
                                                {
                                                }
                                                //open/done buttons - end
                                                aryLodData[intLoop] += "</div></center>";
                                                //dropdown content(more) when clicking big button - start
                                                aryLodData[intLoop] += "<div class=\"collapse\" id=\"" + DynId2 + "\"><div style=\"margin-bottom:-30px; margin-top:-20px;\" class=\"card card-body\"><div id=\"jumbo-center\" class=\"jumbotron\" style=\"padding:10px; margin-top:0px;> <div style=\"float:center; padding:5px;width:10%;background-color:" + Convert.ToString(objRow["Color_Code"]) + "; border-radius: 10px;" + strBorder + "\"><table class=\"table  table-striped table-bordered\"> <thead> <tr> <th scope=\"col\">Ord#</th><th scope=\"col\">Ph#</th><th scope=\"col\">Time</th></tr> </thead> <tbody> <tr><th scope=\"row\">" + objRow["OrderNo"] + "</th><td>" + objRow["LeadType"] + "</td><td>" + EnteredDate + "</td></tr> </tbody></table><table class=\"table table-striped table-bordered\"> <thead> <tr> <th scope=\"col\">Address</th></tr> </thead> <tbody> <tr><td>" + objRow["Address"] + " - Apt # - " + objRow["ApartmentNo"] + "</td></tr> </tbody></table><table class=\"table table-striped table-bordered\"> <thead> <tr> <th scope=\"col\">Destination</th></tr> </thead> <tbody> <tr><td>" + objRow["DestAddress"] + "</td></tr><tr><td><a class=\"label\" style=\"font-size:16px;border-width:3px;border-color:#e6e5e5;border-style:ridge;background-color:beige;\" href=\"Trip_PlanAuto.aspx?StaffID=" + strStaff_Id + "&Type=2&Mode=Dest&Date=" + GetDateAsDatetime() + "\" target=\"_blank\" >Proceed to Destination</a></td></tr> </tbody></table><table class=\"table table-striped table-bordered\"><thead><tr><th scope=\"col\">Permanent Instructions</th></tr></thead><tbody><tr><td>" + objRow["PInstructions"] + "</td></tr><tr><th scope=\"col\">Order Instructions</th></tr></thead><tbody><tr><td>" + objRow["DInstructions"] + "</td></tr></tbody><tr><th scope=\"col\">Order Activity Log</th></tr></thead><tbody><tr><td>" + objRow["Remarks"].ToString() + "</td></tr></tbody></table></div></div><p><a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupReplan.aspx?RequestType=1&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) +
                                "&Staff_Id=" + strStaff_Id + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&task_id=" + Convert.ToString(objRow["task_name"]) + "&status_id=" + Convert.ToString(objRow["Status_Id"]) + "&id=&Action=NN\" onclick=\"return hs.htmlExpand(this, { objectType: 'iframe' } )\" >" + "<input type ='button' class=\"btn btn-default btn-sm\" value='Edit / Add Details' style=\" border-radius:7px; width:125px; display:inline;  background-color:#ebe8ed\"/></a></div></center>";
                                            }
                                            else
                                            {
                                                aryLodData[intLoop] += "<span style=\"font-weight:bold;\">CRM Task</span><button style=\"background-color:#dbd9d0; margin-bottom:10px; text-align:right; padding:3px; color:#000000; border-radius: 7px;\" class=\"btn btn-md btn-default dropdown-toggle\" type=\"button\" data-toggle=\"collapse\" data-target=\"" + DynId + "\" aria-expanded=\"false\" aria-controls=\"" + DynId2 + "\"><table class=\"table table-striped\"><thead style=\" background-color:#dbd9d0;\"><tr><td style=\"width:60%; text-align:left;\">Name</td><td style=\"width:40%; text-align:left;\">Type</td></tr></thead><tbody style=\"text-align:left;\"><tr><th scope=\"col\">" + objRow["LeadName"] + "</th>" + DMode + "</tr><tr style=\"background-color:#e0dfde; text-align:center;\" align=\"center\" ><td colspan=\"2\" style=\"align:center;\"></td></tbody></table><span class=\"caret\" style=\"float:left; font-size:small;  margin-top:-43px\">Expand  -  Activity starting at : " + objRow["Start_Time"] + "</span><div style=\"margin-top:-20px; font-size:10px; text-align:center; background-color:" + Convert.ToString(objRow["Color_Code"]) + ";\">Order No. " + objRow["OrderNo"] + " - Current Process : <b>" + objRow["Status_Details"] + "</b></div></button>";

                                                aryLodData[intLoop] += "<center><div><button type =\"button\" data-whatever= \"../CRM/ProductsList.aspx?Enquiry=" + objRow["OrderNo"].ToString() + "&LeadId=" + LeadId + "&Campaign=" + CampaignID + "&TaskID=" + task_Id + " \" class=\"btn btn-default btn-sm\"  style=\"border-radius:7px; margin-top:-10px; margin-left:5px; margin-right:5px; width:100px; display:inline; background-color:#ebe8ed;\" " + strToolTip + " data-toggle=\"modal\" data-target=\"#orderModal\" >Open</button>";

                                                aryLodData[intLoop] += "<a style=\"color:transparent\" class=\"arefPlain\" href=\"Time_Sheet_Master_PopupAxnV.aspx?RequestType=1&Action=V&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "&DMode=3&Location=" + Convert.ToString(objRow["Location"]) + "\" ><input type='button' class=\"btn btn-default btn-sm\" value='Done..' style=\" border-radius:7px; width:100px; display:inline; margin-top:-10px; background-color:#ebe8ed\"/></a>";
                                                aryLodData[intLoop] += "<br/><a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupAxnV.aspx?RequestType=1&Action=VVS&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&Task_Id=" + Convert.ToString(objRow["task_name"]) + "\" >" +
                                "<input type='button' class=\"btn btn-default btn-sm\" value='Start Job' style=\" border-radius:7px; width:125px; display:inline;  background-color:#ebe8ed\"/>" +
                                "</a><a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupReplan.aspx?RequestType=1&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) +
                                "&Staff_Id=" + strStaff_Id + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) +
                                "&task_id=" + Convert.ToString(objRow["task_name"]) +
                                "&status_id=" + Convert.ToString(objRow["Status_Id"]) +
                                //"&id=\" onclick=\"OpenPopUp(this.href,'mywin','200','150','yes');return false\" onfocus=\"this.blur()\" >" +
                                "&id=&Action=NN\" onclick=\"return hs.htmlExpand(this, { objectType: 'iframe' } )\" >" +
                               "<input type ='button' class=\"btn btn-default btn-sm\" value='Edit / Add Details' style=\" border-radius:7px; width:125px; display:inline;  background-color:#ebe8ed\"/></a></div></center>";

                                                if (Convert.ToString(objRow["CampaignID"]) != "0" && !string.IsNullOrWhiteSpace(Convert.ToString(objRow["ClientName"])))
                                                {
                                                    if (Convert.ToString(objRow["TaskReplan"]) != "y")
                                                    {
                                                        aryLodData[intLoop] += "<a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupAxnV.aspx?RequestType=1&Action=VD&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Batch=" + Disp + "&Staff_Id=" + strStaff_Id + "&DMode=3&CampaignID = " + Convert.ToString(objRow["CampaignID"]) + "\"\" ><input type='button' class=\"btn btn-default btn-sm\" value='Batch' style=\" border-radius:7px; width:100px; display:inline; margin-top:-10px; background-color:#ebe8ed\"/></a></div></center>";
                                                    }
                                                    else
                                                    {
                                                    }
                                                }
                                                else
                                                {
                                                }

                                                aryLodData[intLoop] += "<div class=\"collapse\" id=\"" + DynId2 + "\"><div style=\"margin-bottom:-30px; margin-top:-20px;\" class=\"card card-body\"><div id=\"jumbo-center\" class=\"jumbotron\" style=\"padding:10px; margin-top:0px;> <div style=\"float:center; padding:5px;width:10%;background-color:" + Convert.ToString(objRow["Color_Code"]) + "; border-radius: 10px;" + strBorder + "\"><table class=\"table  table-striped table-bordered\"> <thead> <tr> <th scope=\"col\">Ord#</th><th scope=\"col\">Ph#</th><th scope=\"col\">Time</th></tr> </thead> <tbody> <tr><th scope=\"row\">" + objRow["OrderNo"] + "</th><td>" + objRow["LeadType"] + "</td><td>" + EnteredDate + "</td></tr> </tbody></table><table class=\"table table-striped table-bordered\"> <thead> <tr> <th scope=\"col\">Address</th></tr> </thead> <tbody> <tr><td>" + objRow["Address"] + " - Apt # - " + objRow["ApartmentNo"] + "</td></tr> </tbody></table><table class=\"table table-striped table-bordered\"> <thead> <tr> <th scope=\"col\">Destination</th></tr> </thead> <tbody> <tr><td>" + objRow["DestAddress"] + "</td></tr> </tbody></table><table class=\"table table-striped table-bordered\"><thead><tr><th scope=\"col\">Permanent Instructions</th></tr></thead><tbody><tr><td>" + objRow["PInstructions"] + "</td></tr><tr><th scope=\"col\">Order Instructions</th></tr></thead><tbody><tr><td>" + objRow["DInstructions"] + "</td></tr></tbody><tr><th scope=\"col\">Order Activity Log</th></tr></thead><tbody><tr><td>" + objRow["Remarks"].ToString() + "</td></tr></tbody></table></div></div>";

                                                aryLodData[intLoop] += "<p><a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupAxnV.aspx?RequestType=1&Action=V&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "&DMode=3&Location=" + Convert.ToString(objRow["Location"]) + "\" >" +
                                        "<input type='button' class=\"btn btn-default btn-sm\"  value='Done..' style=\" border-radius: 10px;\"/>" +
                                       "</p></a>";
                                                aryLodData[intLoop] += "<br/><a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupAxnV.aspx?RequestType=1&Action=VVS&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&Task_Id=" + Convert.ToString(objRow["task_name"]) + "\" >" +
                                "<input type='button' class=\"btn btn-default btn-sm\" value='Start Job' style=\" border-radius:7px; width:125px; display:inline;  background-color:#ebe8ed\"/>" +
                                "</a><a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupReplan.aspx?RequestType=1&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) +
                                "&Staff_Id=" + strStaff_Id + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) +
                                "&task_id=" + Convert.ToString(objRow["task_name"]) +
                                "&status_id=" + Convert.ToString(objRow["Status_Id"]) +
                                //"&id=\" onclick=\"OpenPopUp(this.href,'mywin','200','150','yes');return false\" onfocus=\"this.blur()\" >" +
                                "&id=&Action=NN\" onclick=\"return hs.htmlExpand(this, { objectType: 'iframe' } )\" >" +
                               "<input type ='button' class=\"btn btn-default btn-sm\" value='Edit / Add Details' style=\" border-radius:7px; width:125px; display:inline;  background-color:#ebe8ed\"/></a></div></center>";
                                                aryLodData[intLoop] += "</div></div>";
                                            }
                                        }
                                        else
                                        {
                                            if (Convert.ToString(objRow["DMode"]) != "3")
                                            {
                                                aryLodData[intLoop] += "<span style=\"font-weight:bold;\">CRM Task</span>" +
                                                    "<button style=\"background-color:#dbd9d0; margin-bottom:10px; text-align:right; padding:3px; color:#000000; border-radius: 7px;\" class=\"btn btn-md btn-default dropdown-toggle\" type=\"button\" data-toggle=\"collapse\" data-target=\"" + DynId + "\" aria-expanded=\"false\" aria-controls=\"" + DynId2 + "\"><table class=\"table table-striped\"><thead style=\" background-color:#dbd9d0;\"><tr><td style=\"width:60%; text-align:left;\">Name</td><td style=\"width:40%; text-align:left;\">Type</td></tr></thead><tbody style=\"text-align:left;\"><tr><th scope=\"col\">" + objRow["LeadName"] + "</th>" + DMode + "</tr><tr style=\"background-color:#e0dfde; text-align:center;\" align=\"center\" ><td colspan=\"2\" style=\"align:center;\"></td></tbody></table><span class=\"caret\" style=\"float:left; font-size:small;  margin-top:-43px\">Expand  -  Activity starting at : " + objRow["Start_Time"] + "</span><div style=\"margin-top:-20px; font-size:10px; text-align:center; background-color:" + Convert.ToString(objRow["Color_Code"]) + ";\">Order No. " + objRow["OrderNo"] + " - Current Process : <b>" + objRow["Status_Details"] + "</b></div></button>";
                                                aryLodData[intLoop] += "<center><div><button type =\"button\" data-whatever= \"../CRM/ProductsList.aspx?Enquiry=" + objRow["OrderNo"].ToString() + "&LeadId=" + LeadId + "&Campaign=" + CampaignID + "&TaskID=" + task_Id + " \" class=\"btn btn-default btn-sm\"  style=\"border-radius:7px; margin-top:-10px; margin-left:5px; margin-right:5px; width:100px; display:inline; background-color:#ebe8ed;\" " + strToolTip + " data-toggle=\"modal\" data-target=\"#orderModal\" >Open</button>";
                                                aryLodData[intLoop] += "<a style=\"color:transparent\" class=\"arefPlain\" href=\"Time_Sheet_Master_PopupAxnV.aspx?RequestType=1&Action=V&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "&DMode=3&Location=" + Convert.ToString(objRow["Location"]) + "\" ><input type='button' class=\"btn btn-default btn-sm\" value='Done..' style=\" border-radius:7px; width:100px; display:inline; margin-top:-10px; background-color:#ebe8ed\"/></a>";
                                                aryLodData[intLoop] += "<br/><a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupAxnV.aspx?RequestType=1&Action=VVS&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&Task_Id=" + Convert.ToString(objRow["task_name"]) + "\" >" +
                                "<input type='button' class=\"btn btn-default btn-sm\" value='Start Job' style=\" border-radius:7px; width:125px; display:inline;  background-color:#ebe8ed\"/>" +
                                "</a><a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupReplan.aspx?RequestType=1&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) +
                                "&Staff_Id=" + strStaff_Id + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) +
                                "&task_id=" + Convert.ToString(objRow["task_name"]) +
                                "&status_id=" + Convert.ToString(objRow["Status_Id"]) +
                                //"&id=\" onclick=\"OpenPopUp(this.href,'mywin','200','150','yes');return false\" onfocus=\"this.blur()\" >" +
                                "&id=&Action=NN\" onclick=\"return hs.htmlExpand(this, { objectType: 'iframe' } )\" >" +
                               "<input type ='button' class=\"btn btn-default btn-sm\" value='Edit / Add Details' style=\" border-radius:7px; width:125px; display:inline;  background-color:#ebe8ed\"/></a></div></center>";

                                                if (Convert.ToString(objRow["CampaignID"]) != "0" && !string.IsNullOrWhiteSpace(Convert.ToString(objRow["ClientName"])))
                                                {
                                                    if (Convert.ToString(objRow["TaskReplan"]) != "y")
                                                    {
                                                        aryLodData[intLoop] += "<a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupAxnV.aspx?RequestType=1&Action=VD&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Batch=" + Disp + "&Staff_Id=" + strStaff_Id + "&DMode=3&CampaignID = " + Convert.ToString(objRow["CampaignID"]) + "\"\" ><input type='button' class=\"btn btn-default btn-sm\" value='Batch' style=\" border-radius:7px; width:100px; display:inline; margin-top:-10px; background-color:#ebe8ed\"/></a></div></center>";
                                                    }
                                                    else
                                                    {
                                                    }
                                                }
                                                else
                                                {
                                                }

                                                aryLodData[intLoop] += "<div class=\"collapse\" id=\"" + DynId2 + "\"><div style=\"margin-bottom:-30px; margin-top:-20px;\" class=\"card card-body\"><div id=\"jumbo-center\" class=\"jumbotron\" style=\"padding:10px; margin-top:0px;> <div style=\"float:center; padding:5px;width:10%;background-color:" + Convert.ToString(objRow["Color_Code"]) + "; border-radius: 10px;" + strBorder + "\"><table class=\"table  table-striped table-bordered\"> <thead> <tr> <th scope=\"col\">Ord#</th><th scope=\"col\">Ph#</th><th scope=\"col\">Time</th></tr> </thead> <tbody> <tr><th scope=\"row\">" + objRow["OrderNo"] + "</th><td>" + objRow["LeadType"] + "</td><td>" + EnteredDate + "</td></tr> </tbody></table><table class=\"table table-striped table-bordered\"> <thead> <tr> <th scope=\"col\">Address</th></tr> </thead> <tbody> <tr><td>" + objRow["Address"] + " - Apt # - " + objRow["ApartmentNo"] + "</td></tr> </tbody></table><table class=\"table table-striped table-bordered\"> <thead> <tr> <th scope=\"col\">Destination</th></tr> </thead> <tbody> <tr><td>" + objRow["DestAddress"] + "</td></tr> </tbody></table><table class=\"table table-striped table-bordered\"><thead><tr><th scope=\"col\">Permanent Instructions</th></tr></thead><tbody><tr><td>" + objRow["PInstructions"] + "</td></tr><tr><th scope=\"col\">Order Instructions</th></tr></thead><tbody><tr><td>" + objRow["DInstructions"] + "</td></tr></tbody><tr><th scope=\"col\">Order Activity Log</th></tr></thead><tbody><tr><td>" + objRow["Remarks"].ToString() + "</td></tr></tbody></table></div></div>";

                                                aryLodData[intLoop] += "<p><a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupAxnV.aspx?RequestType=1&Action=V&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "&DMode=3&Location=" + Convert.ToString(objRow["Location"]) + "\" >" +
                                        "<input type='button' class=\"btn btn-default btn-sm\"  value='Done..' style=\" border-radius: 10px;\"/>" +
                                       "</p></a>";
                                                aryLodData[intLoop] += "<br/><a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupAxnV.aspx?RequestType=1&Action=VVS&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&Task_Id=" + Convert.ToString(objRow["task_name"]) + "\" >" +
                                "<input type='button' class=\"btn btn-default btn-sm\" value='Start Job' style=\" border-radius:7px; width:125px; display:inline;  background-color:#ebe8ed\"/>" +
                                "</a><a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupReplan.aspx?RequestType=1&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) +
                                "&Staff_Id=" + strStaff_Id + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) +
                                "&task_id=" + Convert.ToString(objRow["task_name"]) +
                                "&status_id=" + Convert.ToString(objRow["Status_Id"]) +
                                //"&id=\" onclick=\"OpenPopUp(this.href,'mywin','200','150','yes');return false\" onfocus=\"this.blur()\" >" +
                                "&id=&Action=NN\" onclick=\"return hs.htmlExpand(this, { objectType: 'iframe' } )\" >" +
                               "<input type ='button' class=\"btn btn-default btn-sm\" value='Edit / Add Details' style=\" border-radius:7px; width:125px; display:inline;  background-color:#ebe8ed\"/></a></div></center>";
                                                aryLodData[intLoop] += "</div></div>";
                                            }
                                            else
                                            {
                                                aryLodData[intLoop] += "<span style=\"font-weight:bold;\">CRM Task</span><button style=\"background-color:#dbd9d0; margin-bottom:10px; text-align:right; padding:3px; color:#000000; border-radius: 7px;\" class=\"btn btn-md btn-default dropdown-toggle\" type=\"button\" data-toggle=\"collapse\" data-target=\"" + DynId + "\" aria-expanded=\"false\" aria-controls=\"" + DynId2 + "\"><table class=\"table table-striped\"><thead style=\" background-color:#dbd9d0;\"><tr><td style=\"width:60%; text-align:left;\">Name</td><td style=\"width:40%; text-align:left;\">Type</td></tr></thead><tbody style=\"text-align:left;\"><tr><th scope=\"col\">" + objRow["LeadName"] + "</th>" + DMode + "</tr><tr style=\"background-color:#e0dfde; text-align:center;\" align=\"center\" ><td colspan=\"2\" style=\"align:center;\"></td></tbody></table><span class=\"caret\" style=\"float:left; font-size:small;  margin-top:-43px\">Expand  -  Activity starting at : " + objRow["Start_Time"] + "</span><div style=\"margin-top:-20px; font-size:10px; text-align:center; background-color:" + Convert.ToString(objRow["Color_Code"]) + ";\">Order No. " + objRow["OrderNo"] + " - Current Process : <b>" + objRow["Status_Details"] + "</b></div></button>";
                                                //big button with name/type table on it - end
                                                //open/done buttons - start
                                                aryLodData[intLoop] += "<center><div><button type =\"button\" data-whatever= \"../CRM/ProductsList.aspx?Enquiry=" + objRow["OrderNo"].ToString() + "&LeadId=" + LeadId + "&Campaign=" + CampaignID + "&TaskID=" + task_Id + " \" class=\"btn btn-default btn-sm\"  style=\"border-radius:7px; margin-top:-10px; margin-left:5px; margin-right:5px; width:100px; display:inline; background-color:#ebe8ed;\" " + strToolTip + " data-toggle=\"modal\" data-target=\"#orderModal\" >Open</button><a class=\"arefPlain\"  style=\"color:transparent;\" href=\"Time_Sheet_Master_PopupAxnV.aspx?RequestType=1&Action=V&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "&DMode=3&Location=" + Convert.ToString(objRow["Location"]) + "\" ><input type='button' class=\"btn btn-default btn-sm\" value='Done..' style=\" border-radius:7px; width:100px; display:inline; margin-top:-10px; background-color:#ebe8ed\"/></a>";
                                                aryLodData[intLoop] += "<br/><a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupAxnV.aspx?RequestType=1&Action=VVS&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&Task_Id=" + Convert.ToString(objRow["task_name"]) + "\" >" + "<input type='button' class=\"btn btn-default btn-sm\" value='Start Job' style=\" border-radius:7px; width:125px; display:inline;  background-color:#ebe8ed\"/>" + "</a><a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupReplan.aspx?RequestType=1&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) +
                                 "&Staff_Id=" + strStaff_Id + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) +
                                 "&task_id=" + Convert.ToString(objRow["task_name"]) + "&status_id=" + Convert.ToString(objRow["Status_Id"]) + "&id=&Action=NN\" onclick=\"return hs.htmlExpand(this, { objectType: 'iframe' } )\" >" +
                                "<input type ='button' class=\"btn btn-default btn-sm\" value='Edit / Add Details' style=\" border-radius:7px; width:125px; display:inline;  background-color:#ebe8ed\"/></a></div></center>";
                                                //open/done buttons - end
                                                //dropdown content(more) when clicking big button - start
                                                aryLodData[intLoop] += "<div class=\"collapse\" id=\"" + DynId2 + "\"><div style=\"margin-bottom:-30px; margin-top:-20px;\" class=\"card card-body\"><div id=\"jumbo-center\" class=\"jumbotron\" style=\"padding:10px; margin-top:0px;> <div style=\"float:center; padding:5px;width:10%;background-color:" + Convert.ToString(objRow["Color_Code"]) + "; border-radius: 10px;" + strBorder + "\"><table class=\"table table-striped table-bordered\" > <thead> <tr> <th scope=\"col\">Status</th></thead> <tbody> <tr><th scope=\"row\" style=\"background-color:" + Convert.ToString(objRow["Color_Code"]) + " \">" + objRow["Status_Name"] + "</th></tr> </tbody></table><table class=\"table  table-striped table-bordered\"> <thead> <tr> <th scope=\"col\">Ord#</th><th scope=\"col\">Ph#</th><th scope=\"col\">Time</th></tr> </thead> <tbody> <tr><th scope=\"row\">" + objRow["OrderNo"] + "</th><td>" + objRow["LeadType"] + "</td><td>" + EnteredDate + "</td></tr> </tbody></table><table class=\"table table-striped table-bordered\"> <thead> <tr> <th scope=\"col\">Address</th></tr> </thead> <tbody> <tr><td>" + objRow["Address"] + " - Apt # - " + objRow["ApartmentNo"] + "</td></tr> </tbody></table><table class=\"table table-striped table-bordered\"> <thead> <tr> <th scope=\"col\">Destination</th></tr> </thead> <tbody> <tr><td>" + objRow["DestAddress"] + "</td></tr> </tbody></table><table class=\"table table-striped table-bordered\"><thead><tr><th scope=\"col\">Permanent Instructions</th></tr></thead><tbody><tr><td>" + objRow["PInstructions"] + "</td></tr><tr><th scope=\"col\">Order Instructions</th></tr></thead><tbody><tr><td>" + objRow["DInstructions"] + "</td></tr></tbody><tr><th scope=\"col\">Order Activity Log</th></tr></thead><tbody><tr><td>" + objRow["Remarks"].ToString() + "</td></tr></tbody></table></div></div>";

                                                aryLodData[intLoop] += "<p><a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupAxnV.aspx?RequestType=1&Action=V&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "&DMode=3&Location=" + Convert.ToString(objRow["Location"]) + "\" >" +
                                           "<input type='button' class=\"btn btn-default btn-sm\"  value='Done..' style=\" border-radius: 10px;\"/>" +
                                          "</p></a></div></div>";

                                            }
                                        }
                                    }
                                }

                            }
                            else
                            {
                                DateTime ThisD2 = Convert.ToDateTime(objRow["Time_Sheet_Date"].ToString());

                                //DateTime ThisD= DateTime.Parse(objRow["Time_Sheet_Date"].ToString().Trim()).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                                DateTime ThisD = Convert.ToDateTime(ThisD2.ToShortDateString() + " " + objRow["Start_Time"].ToString());
                                string ThisDates = ThisD.ToString("yyyy-MM-dd hh:mm tt");

                                DateTime date1 = DateTime.ParseExact(ThisDates, "yyyy-MM-dd hh:mm tt", CultureInfo.InvariantCulture);

                                EnteredDate = date1.ToString("yyyy-MM-dd hh:mm tt");

                                DynId = "#" + objRow["Time_Sheet_Id"].ToString();
                                DynId2 = "" + objRow["Time_Sheet_Id"].ToString();

                                if (!string.IsNullOrWhiteSpace(Convert.ToString(objRow["UniqueTrack2"])))
                                {

                                    string Qrt = "Select Id as 'DocId', Purpose_Id, Task_Id, Used_In, Doc_Name, Uploaded_By,Staff_Master.Emp_Name, Uploaded_Date, Uploaded_Type, Uploaded_Type, Status, Project_Id, UniqueTrack, Lead_Id, Location, PlainText from tblUploadDocument join staff_Master on tblUploadDocument.Uploaded_By = Staff_Master.Staff_Id where UniqueTrack = '" + Convert.ToString(objRow["UniqueTrack2"]) + "'";

                                    DataTable objDataTableDoc = FillTable(Qrt);
                                    if (objDataTableDoc.Rows.Count > 0)
                                    {

                                        int l = 0;

                                        for (int i = 0; i < objDataTableDoc.Rows.Count; i++)
                                        {
                                            string strSiteURL = "";
                                            string ThisExt = "";
                                            string rxHTML = "";
                                            string ThisUrl = "";
                                            string DriveUrl = "";
                                            string HastID = "#" + objDataTableDoc.Rows[i]["DocId"].ToString();
                                            string PlainID = "" + objDataTableDoc.Rows[i]["DocId"].ToString();
                                            string PlainID2 = "" + objDataTableDoc.Rows[i]["DocId"].ToString() + "Pic2";
                                            if (i == 0)
                                            {
                                                //"<div style =\"background-color:#e9ece7; border-width:3px; border-style:groove; border-radius:10px;\">
                                                rxHTML += "<table class=\"table\" style=\"text-align:center; background-color:#e9ece7; border-radius:10px;\">";
                                                //rxHTML += "<div style=\"display: inline; text-align:center;\">";
                                            }
                                            if (HttpContext.Current.Request.ServerVariables["HTTPS"] == "on")
                                            {
                                                strSiteURL = "https://" + HttpContext.Current.Request.ServerVariables["HTTP_HOST"];
                                            }
                                            else
                                            {
                                                strSiteURL = "http://" + HttpContext.Current.Request.ServerVariables["HTTP_HOST"];
                                            }


                                            ThisUrl = strSiteURL + "/UploadDocs/" + Convert.ToString(objRow["UniqueTrack2"]) + "/" + objDataTableDoc.Rows[i]["Doc_Name"].ToString().TrimEnd();
                                            DriveUrl = strSiteURL + "/images/GoogleDoc.png";
                                            string FName = objDataTableDoc.Rows[i]["Doc_Name"].ToString();
                                            int pos = FName.LastIndexOf(".") + 1;
                                            string swfExt = FName.Substring(pos, FName.Length - pos);


                                            if (string.IsNullOrWhiteSpace(objDataTableDoc.Rows[i]["Location"].ToString()) || objDataTableDoc.Rows[i]["Location"].ToString() == "No location found" || objDataTableDoc.Rows[i]["Location"].ToString().TrimEnd() == "Office" || objDataTableDoc.Rows[i]["Location"].ToString().TrimEnd() == "test_location" || objDataTableDoc.Rows[i]["Location"].ToString().TrimEnd() == "Location not available." || objDataTableDoc.Rows[i]["Location"].ToString().TrimEnd() == "." || objDataTableDoc.Rows[i]["Location"].ToString().TrimEnd() == "")
                                            {
                                                ThisExt = "<spanwrap class=\"spanwrap\">By :" + objDataTableDoc.Rows[i]["Emp_Name"].ToString() + " @ " + (Convert.ToDateTime(objDataTableDoc.Rows[i]["Uploaded_Date"].ToString())).ToString("dd-MM-yyyy hh:mm tt") + "</spanwrap>";
                                            }
                                            else
                                            {
                                                ThisExt = "<spanwrap class=\"spanwrap\">By :" + objDataTableDoc.Rows[i]["Emp_Name"].ToString() + " @ : " + objDataTableDoc.Rows[i]["Location"].ToString().TrimEnd() + "<br/>@  " + (Convert.ToDateTime(objDataTableDoc.Rows[i]["Uploaded_Date"].ToString())).ToString("dd-MM-yyyy hh:mm tt") + "</spanwrap>";
                                            }
                                            if (l == 0)
                                            {
                                                rxHTML += "<tbody><tr>";
                                                //rxHTML += "<div style=\"display: inline; text-align:center;\">";
                                            }
                                            if (swfExt == "mp4")
                                            {
                                                rxHTML += "<td><a href=\"#\" role=\"button\" data-toggle=\"modal\" data-target=\"" + HastID + "\"><video width=\"250\" height=\"200\" controls=\"\"><source src=\"" + ThisUrl + " type=\"video/mp4\" ><source src=\"" + ThisUrl + " type=\"video/ogg\" >Your browser does not support the video tag.</source></source></video></a></br>";
                                                rxHTML += "<br/><span class=\"label\" style=\"color:green; font-size:8px;\">" + ThisExt + "</span>";
                                            }
                                            else
                                            {
                                                if (objDataTableDoc.Rows[i]["Uploaded_Type"].ToString() == "Google")
                                                {
                                                    rxHTML += "<td><a href=\"" + objDataTableDoc.Rows[i]["Doc_Name"].ToString() + "\" target=\"_blank\" ><img src=\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI0KOTsd-RoUxa5fmjidtlZJGmOOUYkx8yDKz-pMSMlYpRggDM7Q\" class=\"img-thumbnail\" style=\"max-width:200px; height:auto; text-align:left;\"></a></br>";
                                                    rxHTML += "<br/>" + ThisExt + "";
                                                }
                                                else if (objDataTableDoc.Rows[i]["Uploaded_Type"].ToString() == "PlainText")
                                                {
                                                    if (Request.Browser.IsMobileDevice)
                                                    {
                                                        rxHTML += "</td><tr><td colspan=\"2\"><span lass=\"label\" style=\"text-align:center;\">" + objDataTableDoc.Rows[i]["PlainText"].ToString() + "</span><br/>";
                                                        rxHTML += "<br/>" + ThisExt + "<td><tr>";
                                                    }
                                                    else
                                                    {
                                                        rxHTML += "</td><tr><td colspan=\"4\"><span lass=\"label\" style=\"text-align:center;\">" + objDataTableDoc.Rows[i]["PlainText"].ToString() + "</span><br />";
                                                        rxHTML += "<br/>" + ThisExt + "<td><tr>";
                                                    }
                                                }
                                                else
                                                {
                                                    rxHTML += "<td><a href=\"#\" role=\"button\" data-toggle=\"modal\" data-target=\"" + HastID + "\"><img src=\"" + ThisUrl + "\" class=\"img-thumbnail\" style=\"max-width:200px; height:auto; text-align:center;\"></a></br>";
                                                    rxHTML += "<br/>" + ThisExt + "";
                                                }
                                            }
                                            rxHTML += "<div class=\"modal fade\" id=\"" + PlainID + "\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"" + PlainID2 + "\" aria-hidden=\"true\"><div class=\"modal-dialog\" role=\"document\"><div class=\"modal-content\"><div class=\"modal-header\"><h5 class=\"modal-title\" id=\"" + PlainID2 + "\">Rx / Document</h5><button type=\"button\" class=\"close\" data-dismiss=\"modal\"   aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button></div><div class=\"modal-body\"><img src=\"" + ThisUrl + "\"class=\"img-fluid\" style=\"max-width:100%; height:auto;\"></div><button type = \"button\"   class=\"btn btn-secondary\" data-dismiss=\"modal\">Close</button></div></div></div></div><br/></td>";
                                            l += 1;

                                            aryLodData[intLoop] += rxHTML;

                                            if (Request.Browser.IsMobileDevice)
                                            {
                                                if (l == 1)
                                                {
                                                    rxHTML += "</tr></tbody>";
                                                    //rxHTML += "</div>";
                                                    l = 0;
                                                }

                                            }
                                            else
                                            {
                                                if (l == 2)
                                                {
                                                    rxHTML += "</tr></tbody>";
                                                    //rxHTML += "</div>";
                                                    l = 0;
                                                }

                                            }

                                        }
                                    }
                                }
                                if (!string.IsNullOrWhiteSpace(Convert.ToString(objRow["task_name"])) && Convert.ToString(objRow["LeadName"]) == "")
                                {
                                    aryLodData[intLoop] += "<tbody><tr><td colspan=\"5\" style=\"text-align:center; width:100%;\"><span style=\"font-weight:bold;\">Project Task</span><div style=\"display:inline; text-align:center; width:100%;\">";
                                    aryLodData[intLoop] += "<center><button type =\"button\" class=\"btn btn-danger btn-sm\" style=\"font-size:medium;float:center; background-color:#cbd0c9;\" data-whatever=\"Time_Sheet_Master_PopupForPlan.aspx?RequestType=1&Action=M&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&UniqueTrack=" + Convert.ToString(objRow["UniqueTrack"]) + "&Staff_Id=" + strStaff_Id + "\" style=\"zoom:0.60\" frameborder=\"0\" height=\"900\" width=\"99.6%\"  data-toggle=\"modal\" data-target=\"#orderModal\" >Add More to this Activity</button></center></div>";
                                    aryLodData[intLoop] += "<button style=\"background-color:#f3f8ea; margin-bottom:10px; text-align:right; padding:3px; color:#000000; border-radius: 7px;\" class=\"btn btn-md btn-default dropdown-toggle\" type=\"button\" data-toggle=\"collapse\" data-target=\"" + DynId + "\" aria-expanded=\"false\" aria-controls=\"" + DynId2 + "\"><table class=\"table table-striped\"><thead style=\" background-color:#dbd9d0;\"><tr><td style=\"text-align:left;\">Scheduled for : " + EnteredDate + "</td></tr></thead><tbody style=\"text-align:left;\"><tr><th scope=\"col\"><spanwrap class=\"spanwrap\">" + objRow["Purpose_Code"] + "  " + objRow["Purpose_Name"] + "</spanwrap></th></tr></tbody><thead style=\" background-color:#dbd9d0;\"><tr><td style=\"text-align:left; background-color:" + Convert.ToString(objRow["Color_Code"]) + "; \">" + objRow["Status_Name"] + "</td></tr></thead>";
                                    //Dynamic action button starting from here.

                                    aryLodData[intLoop] += "<center><div><tr style=\"background-color:#e0dfde; text-align:center;\" align=\"center\" ><td colspan=\"2\" style=\"align:center;\"></td></tbody></table>More " + objRow["OrderNo"] + "<span class=\"caret\"></span></button>";

                                    aryLodData[intLoop] += "<a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupReplan.aspx?RequestType=1&Action=Q&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&task_id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "\" ><input type='button' class=\"btn btn-default btn-sm\" value='Progress' style=\" border-radius:7px; width:100px; display:inline; margin-top:-10px; background-color:#ebe8ed\"/></a><a class=\"arefPlain\" href=\"Time_Sheet_Master_PopupReplan.aspx?RequestType=1&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Staff_Id=" + strStaff_Id + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&task_id=" + Convert.ToString(objRow["task_name"]) + "&status_id=" + Convert.ToString(objRow["Status_Id"]) + "&id=&Action=NN\" onclick=\"return hs.htmlExpand(this, { objectType: 'iframe' } )\" >" +
                    "<input type ='button' class=\"btn btn-default btn-sm\" value='Edit / Add Details' style=\" border-radius:7px; width:125px; display:inline; margin-top:-10px; background-color:#ebe8ed\"/></a></div></center>";
                                    //big button with name/type table on it - end

                                    //open buttons - start
                                    //Open-Modal
                                    aryLodData[intLoop] += "<center><div>";

                                    if (Convert.ToString(objRow["Status_Id"]) == "1")
                                    {
                                        aryLodData[intLoop] += "<a class=\"arefPlain\"  style=\"color:transparent;\" href=\"Time_Sheet_Master_Popup.aspx?RequestType=1&Action=P&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "\" ><input type='button' class=\"btn btn-danger btn-sm\" value='Start' style=\" border-radius:7px; width:75px; display:inline; margin-top:5px; background-color:#ebe8ed\"/></a>";
                                    }
                                    else if (Convert.ToString(objRow["Status_Id"]) == "2")
                                    {
                                        aryLodData[intLoop] += "<a class=\"arefPlain\"  style=\"color:transparent;\" href=\"Time_Sheet_Master_Popup.aspx?RequestType=1&Action=P&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "\" ><input type='button' class=\"btn btn-danger btn-sm\" value='Done' style=\" border-radius:7px; width:75px; display:inline; margin-top:5px; background-color:#ebe8ed\"/></a>";
                                    }
                                    else if (Convert.ToString(objRow["Status_Id"]) == "3")
                                    {
                                        aryLodData[intLoop] += "<a class=\"arefPlain\"  style=\"color:transparent;\" href=\"Time_Sheet_Master_Popup.aspx?RequestType=1&Action=P&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "\" ><input type='button' class=\"btn btn-danger btn-sm\" value='PostPone' style=\" border-radius:7px; width:75px; display:inline; margin-top:5px; background-color:#ebe8ed\"/></a>";
                                    }
                                    else if (Convert.ToString(objRow["Status_Id"]) == "4")
                                    {
                                        aryLodData[intLoop] += "<a class=\"arefPlain\"  style=\"color:transparent;\" href=\"Time_Sheet_Master_Popup.aspx?RequestType=1&Action=P&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "\" ><input type='button' class=\"btn btn-danger btn-sm\" value='Done' style=\" border-radius:7px; width:75px; display:inline; margin-top:5px; background-color:#ebe8ed\"/></a>";
                                    }
                                    aryLodData[intLoop] += "</div></center>";
                                    aryLodData[intLoop] += "<div class=\"collapse\" id=\"" + DynId2 + "\"><div style=\"margin-bottom:-30px; margin-top:-20px;\" class=\"card card-body\"><div id=\"jumbo-center\" class=\"jumbotron\" style=\"padding:10px; margin-top:0px;><div style=\"float:center; padding:5px;width:10%;background-color:" + Convert.ToString(objRow["Color_Code"]) + "; border-radius: 10px;" + strBorder + "\"><table class=\"table  table-striped table-bordered\"> <thead><tr> <th scope=\"col\">Entered By</th><th scope=\"row\">" + objRow["Entered_By"].ToString() + "</th></tr> <tr><th scope=\"col\">Entered On</th><th scope=\"col\">Scheduled for</th></tr> </thead> <tbody> <tr><td>" + Convert.ToDateTime(objRow["Entered_Date"]).ToShortDateString() + "</td><td>" + EnteredDate + "</td></tr> </tbody></table><table class=\"table table-striped table-bordered\"> <thead> <tr> <th scope=\"col\">Activity Log</th></tr> </thead> <tbody> <tr><td>" + objRow["Remarks"] + "</td></tr> </tbody></table><table class=\"table table-striped table-bordered\"><thead><tr><th scope=\"col\">Start Location</th><th scope=\"col\">End Location</th></tr></thead><tbody><tr><td>" + objRow["Location"] + "</td><td>" + objRow["End_Location"] + "</td></tr></tbody></table></div></div><p><a class=\"arefPlain\" href=\"Time_Sheet_Master_Popup.aspx?RequestType=1&Action=P&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "\"  >" +
                                   "<input type='button' class=\"btn btn-default btn-sm\"  value='Done..' style=\" border-radius: 10px;\"/>" +
                                  "</p></a><p><a href=\"TimeSheetMap.aspx?StaffID=" + Convert.ToString(objRow["Staff_Id"]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "\" target=\"_blank\" >" + "<input type='button' class=\"btn btn-default btn-sm\"  value='Map' style=\" border-radius: 10px;\"/></a></p></div>";
                                }
                                else
                                {

                                    aryLodData[intLoop] += "<tbody><tr><td colspan=\"5\" style=\"text-align:center; width:100%;\"><div style=\"display:inline; text-align:center; width:100%;\">";
                                    aryLodData[intLoop] += "<center><button type =\"button\" class=\"btn btn-danger btn-sm\" style=\"font-size:medium;float:center; background-color:#cbd0c9;\" data-whatever=\"Time_Sheet_Master_PopupForPlan.aspx?RequestType=1&Action=M&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&UniqueTrack=" + Convert.ToString(objRow["UniqueTrack"]) + "&Staff_Id=" + strStaff_Id + "\" style=\"zoom:0.60\" frameborder=\"0\" height=\"900\" width=\"99.6%\"  data-toggle=\"modal\" data-target=\"#orderModal\" >Add / Edit </button></center></div>";

                                    aryLodData[intLoop] += "<br /><span style=\"font-weight:bold;\">Activity / Reminder / Memo</span><button style=\"background-color:#acb39d; margin-bottom:10px; text-align:right; padding:3px; color:#000000; border-radius: 7px;\" class=\"btn btn-md btn-default dropdown-toggle\" type=\"button\" data-toggle=\"collapse\" data-target=\"" + DynId + "\" aria-expanded=\"false\" aria-controls=\"" + DynId2 + "\"><table class=\"table table-striped\"><thead style=\" background-color:#dbd9d0;\"><tr><td style=\"text-align:left;\">Scheduled for : " + EnteredDate + "</td></tr></thead><tbody style=\"text-align:left;\"><tr><th scope=\"col\"><spanwrap class=\"spanwrap\">" + objRow["Purpose_Code"] + " -- : >> " + objRow["Activity"] + "</spanwrap></th></tr></tbody><thead style=\" background-color:#dbd9d0;\"><tr><td style=\"text-align:left; background-color:" + Convert.ToString(objRow["Color_Code"]) + "; \">" + objRow["Status_Name"] + "</td></tr></thead>";
                                    //Dynamic action button starting from here.

                                    aryLodData[intLoop] += "<tr style=\"background-color:#e0dfde; text-align:center;\" align=\"center\" ><td colspan=\"2\" style=\"align:center;\"></td></tbody></table>More " + objRow["OrderNo"] + "<span class=\"caret\"></span></button>";
                                    //big button with name/type table on it - end

                                    //open buttons - start
                                    //Open-Modal
                                    aryLodData[intLoop] += "<center><div>";

                                    if (Convert.ToString(objRow["Status_Id"]) == "1")
                                    {
                                        aryLodData[intLoop] += "<a class=\"arefPlain\"  style=\"color:transparent;\" href=\"Time_Sheet_Master_Popup.aspx?RequestType=1&Action=P&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "\" ><input type='button' class=\"btn btn-danger btn-sm\" value='Start' style=\" border-radius:7px; width:75px; display:inline; margin-top:-10px; background-color:#ebe8ed\"/></a>";
                                    }
                                    else if (Convert.ToString(objRow["Status_Id"]) == "2")
                                    {
                                        aryLodData[intLoop] += "<a class=\"arefPlain\"  style=\"color:transparent;\" href=\"Time_Sheet_Master_Popup.aspx?RequestType=1&Action=P&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "\" ><input type='button' class=\"btn btn-danger btn-sm\" value='Done' style=\" border-radius:7px; width:75px; display:inline; margin-top:-10px; background-color:#ebe8ed\"/></a>";
                                    }
                                    else if (Convert.ToString(objRow["Status_Id"]) == "3")
                                    {
                                        aryLodData[intLoop] += "<a class=\"arefPlain\"  style=\"color:transparent;\" href=\"Time_Sheet_Master_Popup.aspx?RequestType=1&Action=P&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "\" ><input type='button' class=\"btn btn-danger btn-sm\" value='PostPone' style=\" border-radius:7px; width:75px; display:inline; margin-top:-10px; background-color:#ebe8ed\"/></a>";
                                    }
                                    else if (Convert.ToString(objRow["Status_Id"]) == "4")
                                    {
                                        aryLodData[intLoop] += "<a class=\"arefPlain\"  style=\"color:transparent;\" href=\"Time_Sheet_Master_Popup.aspx?RequestType=1&Action=P&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "\" ><input type='button' class=\"btn btn-danger btn-sm\" value='Done' style=\" border-radius:7px; width:75px; display:inline; margin-top:-10px; background-color:#ebe8ed\"/></a>";
                                    }
                                    aryLodData[intLoop] += "</div></center>";
                                    aryLodData[intLoop] += "<div class=\"collapse\" id=\"" + DynId2 + "\"><div style=\"margin-bottom:-30px; margin-top:-20px;\" class=\"card card-body\"><div id=\"jumbo-center\" class=\"jumbotron\" style=\"padding:10px; margin-top:0px;><div style=\"float:center; padding:5px;width:10%;background-color:" + Convert.ToString(objRow["Color_Code"]) + "; border-radius: 10px;" + strBorder + "\"><table class=\"table  table-striped table-bordered\"> <thead><tr> <th scope=\"col\">Entered By</th><th scope=\"row\">" + objRow["Entered_By"].ToString() + "</th></tr> <tr><th scope=\"col\">Entered On</th><th scope=\"col\">Scheduled for</th></tr> </thead> <tbody> <tr><td>" + Convert.ToDateTime(objRow["Entered_Date"]).ToShortDateString() + "</td><td>" + EnteredDate + "</td></tr> </tbody></table><table class=\"table table-striped table-bordered\"> <thead> <tr> <th scope=\"col\">Activity Log</th></tr> </thead> <tbody> <tr><td>" + objRow["Remarks"] + "</td></tr> </tbody></table><table class=\"table table-striped table-bordered\"><thead><tr><th scope=\"col\">Start Location</th><th scope=\"col\">End Location</th></tr></thead><tbody><tr><td>" + objRow["Location"] + "</td><td>" + objRow["End_Location"] + "</td></tr></tbody></table></div></div><p><a class=\"arefPlain\" href=\"Time_Sheet_Master_Popup.aspx?RequestType=1&Action=P&Date=" + Convert.ToDateTime(aryFullDate[intLoop]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "&StatusID=" + Convert.ToString(objRow["Status_Id"]) + "&Location=" + Convert.ToString(objRow["Location"]) + "&task_Id=" + Convert.ToString(objRow["task_name"]) + "&Staff_Id=" + strStaff_Id + "\"  >" +
                                   "<input type='button' class=\"btn btn-default btn-sm\"  value='Done..' style=\" border-radius: 10px;\"/>" +
                                  "</p></a><p><a href=\"TimeSheetMap.aspx?StaffID=" + Convert.ToString(objRow["Staff_Id"]) + "&Time_Sheet_Id=" + Convert.ToString(objRow["Time_Sheet_Id"]) + "\" target=\"_blank\" >" + "<input type='button' class=\"btn btn-default btn-sm\"  value='Map' style=\" border-radius: 10px;\"/></a></p></div>";
                                    aryLodData[intLoop] += "</table>";
                                }

                            }
                        }
                        aryCheck[intLoop] = true;
                        aryApprovecheck[intLoop] = Convert.ToString(objRow["Day_Different"]);
                        aryApprove[intLoop] = Convert.ToString(objRow["Approve_Status"]);
                    }
                }
            strStaffName = Convert.ToString(objRow["Staff_Name"]);
            strDateTime = Convert.ToString(objRow["Time_Sheet_Date"]);
            strStaff_Id = Convert.ToString(objRow["Staff_Id"]);
        }

        UnPickedLab.Text = Count8.ToString();
        Label1.Text = Count3.ToString();
        Label2.Text = Count2.ToString();
        Label3.Text = Count1.ToString();
        Label4.Text = Count4.ToString();
        Label5.Text = Count5.ToString();
        Label6.Text = Count6.ToString();
        Label22.Text = Count7.ToString();
        Label7.Text = Count12.ToString();
        Label8.Text = Count13.ToString();
        Label9.Text = Count17.ToString();
        int Count10 = Count9;
        RushOrdersCount.Text = Count10.ToString();
        DealineOrdersCount.Text = Count11.ToString();
        NormalLbl.Text = Count14.ToString();
        CancelledLbl.Text = Count15.ToString();
        ReturnsLab.Text = Count16.ToString();
        int AllOrdersCount = Count14 + Count15 + Count11 + Count10 + Count8 + Count13 + Count12 + Count16;
        if (Count8 > 0)
        {
            AllOrdersLab.Text = (AllOrdersCount - Count8).ToString();
            AllOrdersBtn.Text = "Picked Up Orders";
        }
        else
        {
            AllOrdersLab.Text = AllOrdersCount.ToString();
            AllOrdersBtn.Text = "All Orders";
        }

        if (Count8 > 0)
        {
            UnpickedDiv.Visible = true;
            AcceptAllUnpickedDiv.Visible = true;
        }
        else
        {
            UnpickedDiv.Visible = false;
            AcceptAllUnpickedDiv.Visible = false;
        }
        if (Count11 > 0)
        {
            DeadlineDiv.Visible = true;
        }
        else
        {
            DeadlineDiv.Visible = false;
        }
        if (Count10 > 0)
        {
            RushDiv.Visible = true;
        }
        else
        {
            RushDiv.Visible = false;
        }
        if (Count12 > 0)
        {
            WaitingDiv.Visible = true;
        }
        else
        {
            WaitingDiv.Visible = false;
        }
        if (Count13 > 0)
        {
            CustPickUpDiv.Visible = true;
        }
        else
        {
            CustPickUpDiv.Visible = false;
        }
        if (Count14 > 0)
        {
            NormalOrdersDiv.Visible = true;
        }
        else
        {
            NormalOrdersDiv.Visible = false;
        }
        if (Count15 > 0)
        {
            CancelledOrdersDiv.Visible = true;
        }
        else
        {
            CancelledOrdersDiv.Visible = false;
        }
        if (Count16 > 0)
        {
            CustReturns.Visible = true;
        }
        else
        {
            CustReturns.Visible = false;
        }
        if (Count17 > 0)
        {
            DeadLinedPickup.Visible = true;
        }
        else
        {
            DeadLinedPickup.Visible = false;
        }
        if (strStaffName != "")
        {
            for (int intPrintLoop = 0; intPrintLoop < aryLodData.Length; intPrintLoop++)
            {
                string But44 = "#" + strStaff_Id;
                string But55 = "" + strStaff_Id;
                string But66 = "" + strStaff_Id + "##";
                string strToolTipText2 = "Click this button to plan and schedule various tasks or reminders.";
                string tooltip2 = " onMouseover=\"ddrivetip('" + strToolTipText2 + "')\" onmouseout=\"hideddrivetip()\"";
                string[] arySignInSignOut;
                string strFullDate = Convert.ToString(FormattedDate(Convert.ToDateTime(aryFullDate[intPrintLoop])));
                if (Convert.ToInt32(Session["Login_Id"]) == Convert.ToInt32(strStaff_Id) && strFullDate == Convert.ToString(FormattedDate(DateTime.UtcNow.AddHours(5).AddMinutes(30))))
                {
                    strEmptyCell = "";
                    arySignInSignOut = FnSignInSignOut(strStaff_Id, strFullDate, true, ApproveRights);
                    if (aryCheck[intPrintLoop])
                    {
                        strEmptyCell = "<tr><td style=\"text-align:center;\"><div style=\"text-align:center;\">" +
                           "<br /><br /><button type =\"button\" class=\"btn btn-danger btn-sm\" style=\"font-size:medium;float:center;   background-color:#acb39d;\" data-whatever=\"Time_Sheet_Master_Plan.aspx?RequestType=1 &Date=" + Convert.ToString(FormattedDate(Convert.ToDateTime(aryFullDate[intPrintLoop]))) + "&Staff_Id=" + strStaff_Id + "&Time_Sheet_Id=0&id=&Action=A\" style=\"zoom:0.60\" frameborder=\"0\" height=\"900\" width=\"99.6%\"  data-toggle=\"modal\" data-target=\"#orderModal\" " + tooltip2 + " >Create an <span style=\"font-weight:bold;\">Activity / Reminder / Memo</span></button><br /><br />";
                    }
                }
                else
                {
                    arySignInSignOut = FnSignInSignOut(strStaff_Id, strFullDate, false, ApproveRights);
                }
                if (Convert.ToString(FormattedDate(Convert.ToDateTime(aryFullDate[intPrintLoop]))) == Convert.ToString(FormattedDate(DateTime.UtcNow.AddHours(5).AddMinutes(30))))
                {
                    strRowProperty = "style=\"background-color:#c0c0c0; border-radius:10px;\"";
                }
                strHTML += "";
                strEmptyCell = "<br /><br /><button type =\"button\" class=\"btn btn-danger btn-sm\" style=\"font-size:medium;float:center; text-align:center; background-color:#acb39d;\" data-whatever=\"Time_Sheet_Master_Plan.aspx?RequestType=1 &Date=" + Convert.ToString(FormattedDate(Convert.ToDateTime(aryFullDate[intPrintLoop]))) + "&Staff_Id=" + strStaff_Id + "&Time_Sheet_Id=0&id=&Action=A\" style=\"zoom:0.60\" frameborder=\"0\" height=\"900\" width=\"99.6%\"  data-toggle=\"modal\" data-target=\"#orderModal\" " + tooltip2 + " >Create an <span style=\"font-weight:bold;\">Activity / Reminder / Memo</span></button><br /><br />";
                if (aryLodData[intPrintLoop] != "")
                {
                    if (aryApprove[intPrintLoop] == "" && Convert.ToInt32(aryApprovecheck[intPrintLoop]) > 0 && ApproveRights)
                    {
                        aryApprove[intPrintLoop] = "<div style=\"float:left;\" class=\"label\">Time Line:</div><div style=\"float:right;\" class=\"label\"><nobr><input type='button' class=\"smallbutton\" onclick=\"AjaxCallBack(this.parentNode.parentNode,'" + strFullDate + "','" + strStaff_Id + "','Approved')\"  value='AP'>&nbsp;<input type='button' class=\"smallbutton\" onclick=\"AjaxCallBack(this.parentNode.parentNode,'" + strFullDate + "','" + strStaff_Id + "','Not Approved')\"  value='NA'></nobr></div>";
                    }
                    else if (aryApprove[intPrintLoop] != "")
                    {
                        aryApprove[intPrintLoop] = "<div style=\"float:left;\" class=\"label\">Time Line:</div><div style=\"float:right;\">" + aryApprove[intPrintLoop] + "</div>";
                    }
                }
                string ThisDate = Convert.ToDateTime(aryFullDate[intPrintLoop]).ToString();
                aryLeaveApprove = Leave_Approve(strFullDate, strStaff_Id, ApproveRights, ThisDate, IsField);
                if (Convert.ToString(aryLeaveApprove[0]).Trim() == "0")
                {
                    arySignInSignOut[0] = "";
                    arySignInSignOut[1] = "";
                }
                strHTML += "<tr><td " + strRowProperty + "  colspan=\"4\" width=\"100%\">" + strStaffName + " : " + aryDate[intPrintLoop] + " </td></tr>";
                strHTML += "<tr><td  width=\"100%\" colspan=\"4\" align=\"center\">" + arySignInSignOut[0] + " " + arySignInSignOut[1] + "</td></tr>";

                if (string.IsNullOrWhiteSpace(arySignInSignOut[4]) || arySignInSignOut[4] == "No location found" || arySignInSignOut[4] == "Office" || arySignInSignOut[4] == "test_location" || arySignInSignOut[4] == "Location not available." || arySignInSignOut[4] == "." || arySignInSignOut[4] == "")
                {
                    strHTML += "";
                }
                else
                {
                    strHTML += "<tr><td colspan=\"4\" width=\"100%\" align=\"center\" style=\"text-align:center;\" >" + arySignInSignOut[4] + "</td></tr>";
                }
                if (string.IsNullOrWhiteSpace(arySignInSignOut[5]) || arySignInSignOut[5] == "No location found" || arySignInSignOut[5] == "Office" || arySignInSignOut[5] == "test_location" || arySignInSignOut[5] == "Location not available." || arySignInSignOut[5] == "." || arySignInSignOut[5] == "")
                {
                    strHTML += "";
                }
                else
                {
                    strHTML += "<tr><td colspan=\"4\" width=\"100%\" align=\"center\" style=\"text-align:center;\">" + arySignInSignOut[5] + "</td></tr>";
                }
                strHTML += "<tr><td width=\"100%\" colspan=\"4\" align=\"center\">" + aryLeaveApprove[1] + "&nbsp&nbsp" + aryApprove[intPrintLoop] + "</td></tr>";
                strHTML += "<tr><td  colspan=\"4\" width=\"100%\" ><center>" + aryLodData[intPrintLoop] + "</center></td></tr>";
                strHTML += "<tr><td  colspan=\"4\" width=\"100%\" ><center>" + strEmptyCell + "</center></td></tr>";
                strRowProperty = "";
                aryLodData[intPrintLoop] = "";
                aryApprovecheck[intPrintLoop] = "0";
            }
        }
        Excel.Enabled = true;
        TdReport.InnerHtml = strHTML + "</table></div>";
        Session["HtmlTableCell"] = TdReport;
    }

    protected string[] FnSignInSignOut(string strStaffId, string strDate, bool intNeed, bool intNeedRights)
    {

        string[] aryReturn = new string[] { "", "", "", "", "", "" };
        string Qry = "SELECT Case When In_Time IS NOT NULL AND Out_Time IS NULL THEN CAST('23:59' AS TIME) ELSE Out_Time END As Out_DTime, * FROM Attendance_Master WHERE Staff_Name='" + strStaffId + "' AND Attendance_Date='" + strDate + "' and Entered_Unit= '" + SessionHelper.GetSessionValue<string>(_unitIdKey, "0") + "' ";

        DataTable objTable = FillTable(Qry);

        foreach (DataRow objRow in objTable.Rows)
        {
            if (!string.IsNullOrWhiteSpace(Convert.ToString(objRow["In_Time"])))
            {
                aryReturn[0] = "<span class=\"label\">In @-" + Convert.ToString(objRow["In_Time"]).Substring(0, 5) + "</span>";
            }
            else
            {
                aryReturn[0] = Convert.ToString(objRow["In_Time"]);
            }
            if (!string.IsNullOrWhiteSpace(Convert.ToString(objRow["Out_Time"])))
            {
                aryReturn[1] = "<span class=\"label\">Out @-" + Convert.ToString(objRow["Out_Time"]).Substring(0, 5) + "</span>";
            }
            else
            {
                aryReturn[1] = Convert.ToString(objRow["Out_Time"]);
            }
            aryReturn[2] = Convert.ToString(objRow["Attendance_Id"]);
            string OutDTime = "";
            if (!string.IsNullOrWhiteSpace(Convert.ToString(objRow["Out_DTime"])))
            {
                aryReturn[3] = "<span class=\"label\">Out @-" + Convert.ToString(objRow["Out_DTime"]).Substring(0, 5) + "</span>";
                OutDTime = "<span class=\"label\">Out @-" + Convert.ToString(objRow["Out_DTime"]).Substring(0, 5) + "</span>";
            }
            else
            {
                aryReturn[3] = "<span class=\"label\">Out @-" + Convert.ToString(objRow["Out_DTime"]) + "</span>";
                OutDTime = "<span class=\"label\">Out @-" + Convert.ToString(objRow["Out_DTime"]) + "</span>";
            }
            if (string.IsNullOrWhiteSpace(Convert.ToString(objRow["SignIn_Location"])) || Convert.ToString(objRow["SignIn_Location"]) == "No location found" || Convert.ToString(objRow["SignIn_Location"]) == "Office" || Convert.ToString(objRow["SignIn_Location"]) == "test_location" || Convert.ToString(objRow["SignIn_Location"]) == "Location not available." || Convert.ToString(objRow["SignIn_Location"]) == "." || Convert.ToString(objRow["SignIn_Location"]) == "")
            {
                aryReturn[4] = "<span class=\"label\">In @- Location not available.</span>";
            }
            else
            {
                string input = Convert.ToString(objRow["SignIn_Location"]);

                aryReturn[4] = "<spanwrap class=\"spanwrap\">In @-" + input + "</spanwrap>";
            }
            if (string.IsNullOrWhiteSpace(Convert.ToString(objRow["SignOut_Location"])) || Convert.ToString(objRow["SignOut_Location"]) == "No location found" || Convert.ToString(objRow["SignOut_Location"]) == "Office" || Convert.ToString(objRow["SignOut_Location"]) == "test_location" || Convert.ToString(objRow["SignOut_Location"]) == "Location not available." || Convert.ToString(objRow["SignOut_Location"]) == "." || Convert.ToString(objRow["SignOut_Location"]) == "")
            {
                //aryReturn[5] = "<span class=\"label\">Out @- Location not available.</span>";
            }
            else
            {
                string input2 = Convert.ToString(objRow["SignOut_Location"]);

                aryReturn[5] = "<spanwrap class=\"spanwrap\" >Out @-" + input2 + "</spanwrap>";
            }

            if (Convert.ToDateTime(strDate) < Convert.ToDateTime(FormattedDate(DateTime.UtcNow.AddHours(5).AddMinutes(30))))
            {
                aryReturn[1] = OutDTime;
            }
        }
        string strNeedEdit = "1";
        if (intNeed && (!intNeedRights) && (!Convert.ToBoolean(Session["Admin"])))
        {
            strNeedEdit = "0";
        }

        string strIsMobile = " style=\"color:DarkOliveGreen;width:50%; display:none;\"";
        if (Convert.ToBoolean(Session["Is_Mible"]))
        {
            strIsMobile = " readOnly style=\"color:#ededed;width:50%; display:none;\"";
        }
        string Location = "";
        if (!string.IsNullOrWhiteSpace(Convert.ToString(Session["Location"])))
        {
            Location = Convert.ToString(Session["Location"]);
        }

        if (intNeed && aryReturn[0] == "" && aryReturn[1] == "")
        {
            aryReturn[0] = "<input type=\"button\"   style=\"width:25%; border:3px; margin-bottom:5px;\" class=\"btn-sm btn-default\" onclick=\"AjaxCallBack1(this.parentNode,'" + strDate + "'," + strStaffId + ",1," + strNeedEdit + ",this.nextSibling)\" value=\"In\" /><br/>" +
                            "<textarea  rows=\"3\"" + strIsMobile + "  value=\"" + Location + "\">" + Location + "</textarea>";
        }
        else if (intNeed && aryReturn[0] != "" && aryReturn[1] == "")
        {
            aryReturn[1] = "<input type=\"button\"  style=\"width:25%; border:3px; margin-bottom:5px;\"  class=\"btn-sm btn-default\" onclick=\"AjaxCallBack1(this.parentNode,'" + strDate + "'," + strStaffId + ",0," + strNeedEdit + ",this.nextSibling)\" value=\"Out\"><br/>" +
                            "<textarea rows=\"3\"  " + strIsMobile + " value=\"" + Location + "\">" + Location + "</textarea>";

            aryReturn[0] = "<span class=\"label\">" + aryReturn[0] + "</span>";
        }
        else if (intNeedRights && aryReturn[0] == "" && aryReturn[1] == "" && Convert.ToBoolean(Session["Admin"]))
        {
            aryReturn[0] = "<a href=\"Attendance_Master.aspx?RequestType=1&Date=" + strDate + "&Staff_Id=" + strStaffId + "&Time_Sheet_Id=" + aryReturn[2] + "\">Enter Attendance</a>";
        }
        else if (intNeedRights && aryReturn[0] != "" && aryReturn[1] == "" && Convert.ToBoolean(Session["Admin"]))
        {
            aryReturn[1] = "<a href=\"Attendance_Master.aspx?RequestType=1&Date=" + strDate + "&Staff_Id=" + strStaffId + "&Time_Sheet_Id=" + aryReturn[2] + "\">Enter Attendance</a>";
        }
        else if (intNeedRights && aryReturn[0] == "" && aryReturn[1] == "" && strStaffId != Convert.ToString(Session["Login_Id"]))
        {
            aryReturn[0] = "<a  href=\"Attendance_Master.aspx?RequestType=1&Date=" + strDate + "&Staff_Id=" + strStaffId + "&Time_Sheet_Id=" + aryReturn[2] + "\">Enter Attendance</a>";
        }
        else if (intNeedRights && aryReturn[0] != "" && aryReturn[1] == "" && strStaffId != Convert.ToString(Session["Login_Id"]))
        {
            aryReturn[1] = "<a  href=\"Attendance_Master.aspx?RequestType=1&Date=" + strDate + "&Staff_Id=" + strStaffId + "&Time_Sheet_Id=" + aryReturn[2] + "\">Enter Attendance</a>";
        }
        else if (intNeedRights && strStaffId != Convert.ToString(Session["Login_Id"]))
        {
            aryReturn[0] = "<a href=\"Attendance_Master.aspx?RequestType=1&Time_Sheet_Id=" + aryReturn[2] + "\">" + aryReturn[0] + "</a>";
            aryReturn[1] = "<a href=\"Attendance_Master.aspx?RequestType=1&Time_Sheet_Id=" + aryReturn[2] + "\">" + aryReturn[3] + "</a>";
        }
        else if (Convert.ToBoolean(Session["Admin"]))
        {
            aryReturn[0] = "<a  href=\"Attendance_Master.aspx?RequestType=1&Time_Sheet_Id=" + aryReturn[2] + "\">" + aryReturn[0] + "</a>";
            aryReturn[1] = "<a  href=\"Attendance_Master.aspx?RequestType=1&Time_Sheet_Id=" + aryReturn[2] + "\">" + aryReturn[3] + "</a>";
        }
        return aryReturn;
    }
    protected void Time_Sheet_Master_ExcelDownload(object sender, EventArgs e)
    {
        try
        {
            string strWhere = strWhere = "SELECT [Staff_Id] FROM VW_Active_Staff_Master " + ((Company_Unit_Name.SelectedValue != "") ? " Where Company_Unit_Master=" + Company_Unit_Name.SelectedValue : "");
            string strEmpId = Convert.ToString(Session["Login_Id"]);
            string strQuery = "select Staff_Name as 'Staff Name', Task_Date as 'Task Date', Start_Time as 'Start time', End_Time as 'End time'," +
                                    " Purpose_Name as 'Task name',Activity,Remarks,Location as 'Start Location',End_Location as 'End Location', Status, Entered_By as 'Entered by', Entered_Date as 'Entered Date' from vw_Time_Sheet_Master WHERE Task_Date BETWEEN '" + DateFrom.Text + "' AND '" + DateTo.Text + "' ";

            if (Staff_Name.SelectedValue != "")
            {
                strQuery += " AND Staff_Id IN (" + Staff_Name.SelectedValue + ")";
            }
            else
            {
                if (!Convert.ToBoolean(Session["Admin"]))
                {
                    strWhere = " SELECT [Staff_Id] FROM VW_Active_Staff_Master WHERE Company_Unit_Name=" + Convert.ToString(Session["Unit_Id"]) + " AND Staff_Id IN('" + Convert.ToString(strEmpId) + "')" +
                                " UNION " +
                                " SELECT [Staff_Id] FROM VW_Active_Staff_Master WHERE Company_Unit_Name=" + Convert.ToString(Session["Unit_Id"]) + " AND Staff_Id IN(SELECT ISNULL(Reporting_Staff,0) FROM Reporting_Master WHERE Responsible_Staff IN('" + Convert.ToString(strEmpId) + "') ) ";
                }
            }

            Session["DataTable"] = FillTable(strQuery + " AND Staff_Id IN(" + strWhere + ") ORDER BY Staff_Name, Task_Date Desc, Start_Time Asc ");
            Response.Redirect("/ExcelDownload.aspx");
        }
        catch (Exception err)
        {
            WarningMessage("Error occurred in Constructor of 'Time_Sheet_Master_ExcelDownload' error details:" + Convert.ToString(err.Message), tdMessage);
        }
    }

    protected void Staff_Master_Staff_Name()
    {
        Staff_Name.SelectedValue = (Convert.ToString(Session["Staff_Id"]) == "") ? Convert.ToString(Session["Login_Id"]) : Convert.ToString(Session["Staff_Id"]);

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DateTime DateFrom1 = Convert.ToDateTime(DateFrom.Text).AddDays(-1);
        DateFrom.Text = DateFrom1.ToString("dd-MMM-yyyy");
        Load_Data1("");

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DateTime DateTo1 = Convert.ToDateTime(DateTo.Text).AddDays(1);
        DateTo.Text = DateTo1.ToString("dd-MMM-yyyy");
        Load_Data1("");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Staff_Name.SelectedIndex = 0;
        Load_Data1("");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {

        DateTime DateTo1 = CurrentTime.Date;
        DateTo.Text = DateTo1.ToString("dd-MMM-yyyy");
        DateTime DateFrom1 = CurrentTime.Date;
        DateFrom.Text = DateFrom1.ToString("dd-MMM-yyyy");
        Load_Data1("");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Staff_Name.SelectedValue = Session["Login_Id"].ToString();
        Load_Data1("");
    }
    protected void ImageMap1_Click(object sender, ImageClickEventArgs e)
    {
        string Query = " and TblLeadMaster.Name is not null";
        Load_Data1(Query);
    }
    protected void CRMClick_Click(object sender, EventArgs e)
    {
        string Query = " and TblLeadMaster.Name is not null";
        Load_Data1(Query);
    }

    protected void ImageMap2_Click(object sender, ImageClickEventArgs e)
    {
        string Query = " and Time_Sheet_Master.task_Id is null";
        Load_Data1(Query);
    }
    protected void RoutineActivitiesBtn_Click(object sender, EventArgs e)
    {
        string Query = " and Time_Sheet_Master.task_Id is null";
        Load_Data1(Query);
    }
    protected void UnPickedOrdersBtn_Click(object sender, EventArgs e)
    {
        string Query = " and Time_Sheet_Master.Display=2";
        Load_Data1(Query);
        displayHeadingLab.Text = "Displaying results for Unpicked orders.";
    }
    protected void RushOrders_Click(object sender, EventArgs e)
    {
        string Query = " DMode =1 ";
        Load_Data1(Query);
        displayHeadingLab.Text = "Displaying results for Rush orders.";
    }
    protected void NormalBtn_Click(object sender, EventArgs e)
    {
        string Query = " DMode =0  ";
        Load_Data1(Query);
        displayHeadingLab.Text = "Displaying results for Normal orders.";
    }
    protected void CancelledBtn_Click(object sender, EventArgs e)
    {
        string Query = " DMode=6";
        Load_Data1(Query);
        displayHeadingLab.Text = "Displaying results for Cancelled orders.";
    }
    protected void DeadlineOrders_Click(object sender, EventArgs e)
    {
        string Query = " DMode =2 ";
        Load_Data1(Query);
        displayHeadingLab.Text = "Displaying results for Deadline orders.";
    }
    protected void CustWaiting_Click(object sender, EventArgs e)
    {
        string Query = " DMode =4 ";
        Load_Data1(Query);
        displayHeadingLab.Text = "Displaying results for Customer Waiting orders.";
    }
    protected void CustCollect_Click(object sender, EventArgs e)
    {
        string Query = " DMode =5 ";
        Load_Data1(Query);
        displayHeadingLab.Text = "Displaying results for Customer Collect orders.";
    }
    protected void DeadlinePickup_Click(object sender, EventArgs e)
    {
        string Query = " DMode =7  and Status_Id = 1";
        Load_Data1(Query);
        displayHeadingLab.Text = "Displaying results for Deadline Pickup orders.";
    }
    protected void Return_Click(object sender, EventArgs e)
    {
        string Query = " DMode =3  and Status_Id = 1";
        Load_Data1(Query);
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string Query = " and Time_Sheet_Master.task_Id is not null and TblLeadMaster.Name is null";
        Load_Data1(Query);
    }
    protected void TasksBtn_Click(object sender, EventArgs e)
    {
        string Query = " and Time_Sheet_Master.task_Id is not null and TblLeadMaster.Name is null";
        Load_Data1(Query);
    }
    protected void FromMobileBtn_Click(object sender, EventArgs e)
    {
        string Query = " and Time_Sheet_Master.Location != 'Office' and Time_Sheet_Master.Location is not null";
        Load_Data1(Query);
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        string Query = " and Time_Sheet_Master.Location != 'Office' and Time_Sheet_Master.Location is not null";
        Load_Data1(Query);
    }
    protected void ReplanBtn_Click(object sender, EventArgs e)
    {
        string Query = " and Time_Sheet_Master.Replan = 'r' and Time_Sheet_Master.End_Date > CONVERT(date, '" + GetDateAsDatetime() + "')";
        Load_Data1(Query);
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        string Query = " and Time_Sheet_Master.Replan = 'r' and Time_Sheet_Master.End_Date > CONVERT(date, '" + GetDateAsDatetime() + "')";
        Load_Data1(Query);
    }
    protected void WarningBtn_Click(object sender, EventArgs e)
    {
        string Query = " and DATEADD(minute,30, CAST(Time_Sheet_Master.Start_Time AS TIME)) < CONVERT(VARCHAR(8),'" + GetDateAsDatetime() + "',108) and Status_Id = 1";
        Load_Data1(Query);
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        string Query = " and DATEADD(minute,30, CAST(Time_Sheet_Master.Start_Time AS TIME)) < CONVERT(VARCHAR(8),'" + GetDateAsDatetime() + "',108) and Time_Sheet_Master.Status = 1";
        Load_Data1(Query);
    }
    protected void DelayedBtn_Click(object sender, EventArgs e)
    {
        string Query = " and Time_Sheet_Master.End_Date < CONVERT(date, '" + GetDateAsDatetime() + "') and Time_Sheet_Master.Status != 3";
        Load_Data1(Query);
    }
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        string Query = " and Time_Sheet_Master.End_Date < CONVERT(date, '" + GetDateAsDatetime() + "') and Time_Sheet_Master.Status != 3";
        Load_Data1(Query);
    }
    protected void ProjectDD_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ProjectDD.SelectedIndex != 0)
        {
            string strPQuery = " SELECT Entered_Date from Project_Master where ProjectId ='" + ProjectDD.SelectedValue + "' ";

            DataTable objTableProgress = FillTable(strPQuery);

            DateTime DateStart = Convert.ToDateTime(objTableProgress.Rows[0]["Entered_Date"].ToString());
            //Response.Write(DateStart);
            //Response.End();
            DateFrom.Text = DateStart.ToString("dd-MMM-yyyy"); ;
        }

        string Query = " and Project_Master.Project_Name ='" + ProjectDD.SelectedValue + "'";
        Load_Data1(Query);
        DateFrom.Text = CurrentTime.Date.ToString("dd-MMM-yyyy");
    }
    protected void UnpickedBtn_Click(object sender, EventArgs e)
    {
        string Query = " Display=2";
        Load_Data1(Query);
        displayHeadingLab.Text = "Displaying Unpicked orders.";
    }
    protected void AcceptAllUnpickedOrdersBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Time_Sheet_Master_Popup.aspx?RequestType=1&Action=UPVV&Date=" + GetDateAsDatetime() + "&Time_Sheet_Id=&StatusID=&Location=&task_Id=&Staff_Id=" + Staff_Name.SelectedItem.Value + "");
    }
    protected void AllOrders_Click(object sender, EventArgs e)
    {
        Load_Data1("");
        displayHeadingLab.Text = "Displaying all orders.";
    }

    protected void Button6_Click(object sender, EventArgs e)
    {

        if (TextBox4.Text != "")
        {
            string Query = " and Name like '%" + TextBox4.Text + "%' or Mobile_No like '%" + TextBox4.Text + "' ";
            Load_Data1(Query);
            displayHeadingLab.Text = "Displaying search results.";
        }
        else
        {

        }
    }

    protected void GoToMiniBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("../CRM/minicrm.aspx");
    }

    protected void bt1_Click(object sender, EventArgs e)
    {
        //string url = "Time_Sheet_Master_Plan.aspx?RequestType=1&Date=" + GetDate2() + "&Staff_Id=" + Session["Login_Id"].ToString() + "&id=0&Action=A&Vis=" + InputTxt.Text + "";
        //Response.Write("<script language=\"javascript\">window.open('" + url + "','SportZip',toolbar='-1,scrollbars=-1,resizable=-1');void(0);</script>");
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "RedirectScript", "window.parent.location='" + url + "'", true);
        Response.Redirect("Time_Sheet_Master_Plan.aspx?RequestType=1&Date=" + GetDateAsDatetime() + "&Staff_Id=" + Session["Login_Id"].ToString() + "&id=0&Action=A&Vis=" + InputTxt.Text + "");
    }

    protected void bt2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Time_Sheet_Master_Plan.aspx?RequestType=1&Date=" + GetDateAsDatetime() + "&Staff_Id=" + Session["Login_Id"].ToString() + "&id=0&Action=R&Mode=11&Vis=" + InputTxt.Text + "");
    }

    protected void bt3_Click(object sender, EventArgs e)
    {
        //ClientScriptManager.RegisterClientScriptBlock(this.GetType(),
        //    "RedirectScript", "window.parent.location = 'Time_Sheet_Master_Plan.aspx?RequestType=1&Date=" + GetDate2() + "&Staff_Id=" + Session["Login_Id"].ToString() + "&id=0&Action=R&Mode=10&Vis=" + InputTxt.Text + "", true);

        Response.Redirect("Time_Sheet_Master_Plan.aspx?RequestType=1&Date=" + GetDateAsDatetime() + "&Staff_Id=" + Session["Login_Id"].ToString() + "&id=0&Action=R&Mode=10&Vis=" + InputTxt.Text + "");
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect("Time_Sheet_Master_Plan.aspx?RequestType=1&Date=" + GetDateAsDatetime() + "&Staff_Id=" + Session["Login_Id"].ToString() + "&id=0&Action=R&Mode=13&Location=" + LastLocation.Value + "&Vis=" + InputTxt.Text + "");
    }

    //protected void AttendanceInBtn_Click(object sender, EventArgs e)
    //{
    //    string insertAttendance="Insert into Attendance_Master ("
    //}


    #region static methods


    private static DataTable GetEnquiries(DateTime dateTime, int bmode, int excemptedStatus)
    {
        const string query = "Getenquiries";
        return DataAccess.FillDataSet(query, CommandType.StoredProcedure, new SqlParameter[] { new SqlParameter("@date", dateTime),
            new SqlParameter("@bMode", bmode),
            new SqlParameter("@excepmtedStatus", excemptedStatus) }).Tables[0];
    }

    private static DateTime GetDateAsDatetime()
    {
        return Convert.ToDateTime(CurrentTime.ToString("yyyy-MM-dd HH:mm:ss"));
    }

    private static string GetDateAsString()
    {
        return CurrentTime.ToString("yyyy-MM-dd HH:mm:ss");

    }
    #endregion
}