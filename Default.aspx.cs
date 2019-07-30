using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class ToucheDefault : BasePage
{

    protected void page_Load(object sender, System.EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            //FnLoadStaffInfo();
            if (Request.QueryString["Type"] == "LogO")
            {
                // **/  Uncomment to sign out  Attendance on logging out

                //LogOut(Session["Login_Id"].ToString(), GetDate2().ToString(), AttendanceID.Value);

                // **/  Ends here
                Session["Login_Id"] = "";
                Session["Login_Name"] = "";
                //Response.Redirect("http://" + Request.ServerVariables["Server_Name"] + "/ToucheAdmin/Default.aspx");
                Session.Abandon();
                Response.Redirect("~\\Default.aspx");
            }

        }

    }
    public DateTime GetDate2()
    {
        DateTime T = DateTime.UtcNow.AddHours(5).AddMinutes(30);
        string TT = T.ToString("yyyy-MM-dd HH:mm:ss");
        return Convert.ToDateTime(TT);
    }
    protected void FnCheckLogin(object sender, System.EventArgs e)
    {

        SqlConnection Con = new SqlConnection(ConfigurationManager.AppSettings["connectionstring"]);
        Con.Open();

        //Response.Write("SELECT * FROM STAFF where Staffname='" + ddUserId.SelectedItem.Text  + "' and password='" + txtPassword.Text + "'");

        SqlCommand cmd2 = new SqlCommand("SELECT * FROM Staff_Master where Staff_Name='" + UserIDText.Text.Trim() + "' and password='" + txtPassword.Text.Trim() + "'", Con);
        SqlDataAdapter adp = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        adp.SelectCommand = cmd2;
        adp.Fill(ds);
        dt = ds.Tables[0];
      
       
        if (dt.Rows.Count > 0)
        {
           
            StaffIDHdn.Value = Convert.ToString(dt.Rows[0]["Staff_Id"]);
            LoadDetails();
           
            //FnSignIn(UserIDText.Text.Trim(), GetDate2().ToString());
            //if (dt.Rows[0]["Company_Unit_Name"].ToString() == "27")
            //{
            //    string DepName = "";
            //    DepName = dt.Rows[0]["Department_Name"].ToString();
            //    if (DepName == "1035" || DepName == "1039" || DepName == "1042")
            //    {
            //        Response.Redirect("~/RightsValidation.aspx?Loaction=&Latitude=&Longitude=&Staff_Id=" + Convert.ToString(dt.Rows[0]["Staff_Id"]));

            //        return;

            //    }
            //    else
            //    {
            //        Label1.Text = "Sorry Web Login is restricted for your Department.";

            //    }
            //}
            //else
            //{

            //Response.Redirect("~/RightsValidation.aspx?Loaction=&Latitude=&Longitude=&Staff_Id=" + Convert.ToString(dt.Rows[0]["Staff_Id"]));

            //return;
            //}
        }
        else
        {
            
            StaffIDHdn.Value = "0";
            Label1.Text = "Invalid Password or UserId";
        }
        Con.Close();
    }
    protected void FnCheckLogin2(object sender, System.EventArgs e)
    {

        SqlConnection Con = new SqlConnection(ConfigurationManager.AppSettings["connectionstring"]);
        Con.Open();


        //SqlCommand cmd1 = new SqlCommand("select top 1 * from tblAccessInfo where DeviceId in (Select DeviceId from BiometricTypes where Type='o') and flag ='y' order by Id desc", Con);
        SqlCommand cmd1 = new SqlCommand("select top 1 * from DeviceAccessInfo where Type='o' and flag ='y' order by Id desc", Con);
        SqlDataAdapter adp1 = new SqlDataAdapter();
        DataSet ds1 = new DataSet();
        DataTable dt1 = new DataTable();
        adp1.SelectCommand = cmd1;
        adp1.Fill(ds1);
        dt1 = ds1.Tables[0];
        //Response.Write(dt1.Rows.Count);
        //Response.End();
        if (dt1.Rows.Count > 0)
        {

            string ThisAccess = dt1.Rows[0]["AccessTime"].ToString();
            string StaffName = dt1.Rows[0]["Staff_Id"].ToString();
            string DeviceLocation = dt1.Rows[0]["Location"].ToString();
            DateTime ThisAccess2 = Convert.ToDateTime(ThisAccess).AddMinutes(1.0);

            if (ThisAccess2 < DateTime.UtcNow.AddHours(5).AddMinutes(30))
            {
                //Response.Write("Priya");
                //Response.End();
                //SqlCommand cmd2 = new SqlCommand("Update tblAccessInfo set flag='n' where DeviceId in (Select DeviceId from BiometricTypes where Type='o') and flag ='y' ", Con);
                //cmd2.ExecuteNonQuery();
                BiometricStatus.Text = "Please try the biometric input again, as there are no active sessions.";
                BiometricStatus.Visible = true;

                return;
            }
            else
            {
                //Response.Write("Jiby");
                //Response.End();
                BiometricStatus.Visible = false;
                Con.Close();

                Response.Redirect("~/RightsValidation.aspx?Loaction=&Latitude=&Longitude=&Staff_Id=" + StaffName + "&Type=B&BioLoc=" + DeviceLocation + "");


                return;

            }
            SqlCommand cmd4 = new SqlCommand("Update tblAccessInfo set flag='n' where DeviceId in (Select DeviceId from BiometricTypes where Type='o') and flag ='y' ", Con);
            cmd4.ExecuteNonQuery();

        }
        else
        {
            BiometricStatus.Text = "Please try the biometric input again, as there are no active sessions.";
            BiometricStatus.Visible = true;
        }

        Con.Close();

    }
    //protected void FnLoadStaffInfo()
    //{
    //    SqlConnection Con = new SqlConnection(ConfigurationManager.AppSettings["connectionstring"]);
    //    Con.Open();
    //    SqlCommand cmd2 = new SqlCommand("select [Staff_Name] As Staff_Name,LTRIM(RTRIM(Password)) AS Password   from VW_ACtive_STAFF_Master  ", Con);
    //    SqlDataAdapter ad = new SqlDataAdapter();
    //    DataSet ds = new DataSet();
    //    ad.SelectCommand = cmd2;
    //    ad.Fill(ds);
    //    ddUserId.DataValueField = "Staff_Name";
    //    ddUserId.DataTextField = "Staff_Name";
    //    ddUserId.DataSource = ds;
    //    ddUserId.DataBind();
    //}
    protected void btnLogin_Click(object sender, EventArgs e)
    {

    }
    protected void FnSignIn(string strStaffId, string strDate)
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.AppSettings["connectionstring"]);
        Con.Open();
        string INTime = DateTime.UtcNow.AddHours(5).AddMinutes(30).ToShortTimeString();
        SqlCommand cmd4 = new SqlCommand("insert into Attendance_Master (Staff_Name, Attendance_Date, In_Time, Entered_By, Entered_Date, Entered_Unit) values ('" + Session["Login_Id"].ToString() + "', '" + strDate + "','" + INTime + "', '" + strStaffId + "', '" + strDate + "', '" + Session["Unit_Id"].ToString() + "')" +
                     ";SELECT CAST(scope_identity() AS int)", Con);
        SqlDataAdapter ad = new SqlDataAdapter();
        DataSet ds = new DataSet();
        ad.SelectCommand = cmd4;
        ad.Fill(ds);
        //DataTable objDataTableTaskId = objclsTask_Master.ReturnDataTable(strTaskEntry);

        string AttId = ds.Tables[0].Rows[0][0].ToString();
        AttendanceID.Value = AttId;
        Con.Close();

    }
    protected void LoadDetails()
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.AppSettings["connectionstring"]);
        Con.Open();
        SqlCommand cmd2 = new SqlCommand("SELECT t2.Company_Unit_Name as 'Unit_Name', t3.Closed, * FROM Staff_Master t1 join Company_Unit_Master t2 on t1.Company_Unit_Name = t2.Unit_Id join Department_Master t3 on t1.Department_Name = t3.Department_Id where t1.Staff_Id='" + StaffIDHdn.Value + "'", Con);
        SqlDataAdapter adp = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        adp.SelectCommand = cmd2;
        adp.Fill(ds);
        dt = ds.Tables[0];
        string Closed = "0";
        if (dt.Rows.Count > 0)
        {
            Session["Login_Identity"] = dt.Rows[0]["Staff_Id"];
            Session["Login_Name"] = dt.Rows[0]["Staff_Name"];
            Session["Login_Id"] = dt.Rows[0]["Staff_Id"];
            Session["Unit_Id"] = dt.Rows[0]["Company_Unit_Name"];
            Session["Unit_Name"] = dt.Rows[0]["Unit_Name"];
            Session["Admin"] = dt.Rows[0]["Is_Admin"];
            Session["Is_MasterAdmin"] = dt.Rows[0]["Is_MasterAdmin"];
            Session["Department_Id"] = dt.Rows[0]["Department_Name"];
            Session["Company_Name"] = dt.Rows[0]["Company_Name"];
            Session["Designation_Id"] = dt.Rows[0]["Designation_Name"];
            Session["Team_Name"] = dt.Rows[0]["Team_Name"];
            Session["PicPath"] = dt.Rows[0]["PicPath"];
            Closed = dt.Rows[0]["Closed"].ToString();
        }

    if(Closed =="1")
        {

            // **/  Uncomment to insert Attendance right  from login page


            //FnSignIn(StaffIDHdn.Value, GetDate2().ToString());


            // **/  Ends here

            Response.Redirect("~/RightsValidation.aspx?Loaction=&Latitude=&Longitude=&Staff_Id=" + StaffIDHdn.Value);
      
        return;
        }
        else
        {

       
        SqlCommand com = new SqlCommand("SELECT Department_Id, Department_Name from Department_Master where Entered_Unit='" + Session["Unit_Id"] + "' and Closed != 1 ", Con); // table name 
        //Response.Write("SELECT Department_Id, Department_Name from Department_Master where Entered_Unit='" + Session["Unit_Id"] + "' and Closed != 1 ");
        //Response.End();
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds1 = new DataSet();
            da.Fill(ds1);  // fill dataset
            DepartmentDD.DataTextField = ds1.Tables[0].Columns["Department_Name"].ToString(); // text field name of table dispalyed in dropdown
        DepartmentDD.DataValueField = ds1.Tables[0].Columns["Department_Id"].ToString();             // to retrive specific  textfield name 
        DepartmentDD.DataSource = ds1.Tables[0];      //assigning datasource to the dropdownlist
        DepartmentDD.DataBind();  //binding dropdownlist



            DepartmentDD.Items.Insert(0, new ListItem("--Select Department--", "0"));
            LoginPanel.Visible = false;
        SelectDepartmentPan.Visible = true;
        }
        Con.Close();
    }
    protected void LogOut(string strStaffId, string strDate, string AtId)
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.AppSettings["connectionstring"]);
        Con.Open();
        string OutTime = DateTime.UtcNow.AddHours(5).AddMinutes(30).ToShortTimeString();
       
        string Qry = "";
        if (AttendanceID.Value != "0")
        {
            Qry = "Update Attendance_Master set Out_Time ='" + OutTime + "' where Staff_Name='" + strStaffId + "' and Attendance_Date='" + strDate + "' and Attendance_Id='" + AtId + "'";
        }
        else
        {
            Qry = "Update Attendance_Master set Out_Time ='" + OutTime + "' where Staff_Name='" + strStaffId + "' and Attendance_Date='" + strDate + "'";
        }
        SqlCommand cmd4 = new SqlCommand(Qry, Con);
        cmd4.ExecuteNonQuery();
        Con.Close();
       
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
        string Qry = "";
        if (DepartmentDD.SelectedIndex != 0 && StaffIDHdn.Value != "0")
        {
            Qry = "Update Staff_Master set Department_Name = '" + DepartmentDD.SelectedValue + "' where Staff_Id ='" + StaffIDHdn.Value + "' ";
            SqlConnection Con = new SqlConnection(ConfigurationManager.AppSettings["connectionstring"]);
            Con.Open();
            SqlCommand cmd4 = new SqlCommand(Qry, Con);
        cmd4.ExecuteNonQuery();
        Con.Close();

            // **/  Uncomment to insert Attendance right  from login page


            //FnSignIn(StaffIDHdn.Value, GetDate2().ToString());


            // **/  Ends here

            Response.Redirect("~/RightsValidation.aspx?Loaction=&Latitude=&Longitude=&Staff_Id=" + StaffIDHdn.Value);
        }
        return;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        LoginPanel.Visible = true;
        SelectDepartmentPan.Visible = false;
    }
}
