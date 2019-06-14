using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Xml.Linq;


public partial class ToucheAdmin_RightsValidation : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Request.QueryString["Type"]) == "B")
        {
            SqlConnection Con = new SqlConnection(ConfigurationManager.AppSettings["connectionstring"]);
            Con.Open();
            SqlCommand cmd4 = new SqlCommand("Update tblAccessInfo set flag='n' where DeviceId in (Select DeviceId from BiometricTypes where Type='o') and flag ='y' ", Con);
            cmd4.ExecuteNonQuery();
            Con.Close();
        }
       
        if(!IsPostBack)
        {
            SqlConnection Con = new SqlConnection(ConfigurationManager.AppSettings["connectionstring"]);
            Con.Open();
            SqlCommand cmd2 = new SqlCommand("SELECT t2.Company_Unit_Name as 'Unit_Name', t6.Department_Name as 'Dept', t4.Department, t5.Department as 'FinalDepartment', * FROM VW_StaffAndLeadMaster t1 join Company_Unit_Master t2 on t1.Company_Unit_Name = t2.Unit_Id left outer Join InitialProcessDepartment t4 on t1.Department_Name = t4.Department left outer join FinalProcessDepartment t5 on t1.Department_Name= t5.Department left outer Join Department_Master t6 on t1.Department_Name = t6.Department_Id where t1.Staff_Id='" + Convert.ToString(Request.QueryString["Staff_Id"]) + "'", Con);
            SqlDataAdapter adp = new SqlDataAdapter();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable(); 
            adp.SelectCommand = cmd2;
            adp.Fill(ds);
            dt= ds.Tables[0];
            //Response.Write(dt.Rows.Count);
           
            if (dt.Rows.Count > 0)
            {
                Session["Login_Identity"] = dt.Rows[0]["Staff_Id"];  
                Session["Login_Name"] = dt.Rows[0]["Emp_Name"];
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
                Session["Level"] = dt.Rows[0]["Level"];
                Session["AptNo"] = dt.Rows[0]["ApartmentNo"];

                if (!string.IsNullOrWhiteSpace(dt.Rows[0]["Department"].ToString()))
                {
                    Session["IsInitialDepartment"] = dt.Rows[0]["Department"];
                }
                else
                {
                    Session["IsInitialDepartment"] = "0";
                   
                }
                if (!string.IsNullOrWhiteSpace(dt.Rows[0]["FinalDepartment"].ToString()))
                {
                    Session["IsFinalDepartment"] = dt.Rows[0]["FinalDepartment"];
                }
                else
                {
                    Session["IsFinalDepartment"] = "0";
                   
                }
                if (Request.QueryString["BioLoc"] != "" && Request.QueryString["BioLoc"] != null)
                {
                    string BioLocation = Request.QueryString["BioLoc"].ToString();
                    Session["Location"] = (Convert.ToString(Request.QueryString["Loaction"]) != "") ? Convert.ToString(Request.QueryString["Loaction"]) : BioLocation;
                    Session["Is_Mobile"] = (Convert.ToString(Request.QueryString["Loaction"]) != "") ? true : false;
                }
                else
                {
                    if (string.IsNullOrWhiteSpace(Convert.ToString(Request.QueryString["Loaction"])))
                    {
                        if (!string.IsNullOrWhiteSpace(Request.QueryString["Latitude"]) && !string.IsNullOrWhiteSpace(Request.QueryString["Longitude"]))
                        {
                            calcularRota(Convert.ToString(Request.QueryString["Latitude"]), Convert.ToString(Request.QueryString["Longitude"]));

                            Session["Location"] = LastLocation.Value;
                        }
                       
                    }                    
                    else
                    { 
                    if (Request.Browser.IsMobileDevice)
                    {
                        Session["Location"] = (Convert.ToString(Request.QueryString["Loaction"]) != "") ? Convert.ToString(Request.QueryString["Loaction"]) : "From a Mobile Device";
                    }
                    else
                    {
                        Session["Location"] = (Convert.ToString(Request.QueryString["Loaction"]) != "") ? Convert.ToString(Request.QueryString["Loaction"]) : "Office";
                    }
                    Session["Is_Mobile"] = (Convert.ToString(Request.QueryString["Loaction"]) != "") ? true : false;
                    }
                }
                

                foreach (string Key in Session.Keys)
                {
                    HttpCookie mycookie = new HttpCookie(Key);
                    mycookie.Expires = DateTime.UtcNow.AddHours(5).AddMinutes(30).AddDays(10);
                    mycookie.Value = Convert.ToString(Session[Key]);
                    Response.Cookies.Add(mycookie);
                }

                //For tracking LoginUsers
                //SqlCommand cmd3 = new SqlCommand("INSERT INTO Tbl_LogDetails (LoginID,LoginName,LoginTime) VALUES('" + Session["Login_Id"] + "','" + Session["Login_Name"] + "',GETDATE())", Con);
                //cmd3.ExecuteNonQuery();
                Con.Close();
			    if (Convert.ToBoolean(dt.Rows[0]["Is_Admin"]))
			    {
				    //Response.Redirect("~/Task_Master/Employee_Task_Master.aspx");
			    }
                new clsTime_Sheet_Master().Login_DedailsUpdate
                (
                    Convert.ToString(Session["User_Log_Id"]),
                    Convert.ToString(Request.QueryString["Staff_Id"]),
                    Convert.ToString(Request.QueryString["Latitude"]),
                    Convert.ToString(Request.QueryString["Longitude"]),
                    Convert.ToString(Request.QueryString["Loaction"])

                );

                //if (Request.Browser.IsMobileDevice)
                //{
                //    Response.Redirect("~/Time_Sheet_Master/Time_Sheet_View.aspx?ResponseType=2");
                //}
                //else
                //{
                if (dt.Rows[0]["Dept"].ToString() == "Resident")
                {
                    Session["Resident"] = "Resident";
                    Response.Redirect("Time_Sheet_View.aspx?ResponseType=2");
                }
                else
                {
                    Session["Resident"] = "Office";
                    Response.Redirect("Time_Sheet_View.aspx?ResponseType=2");
                }
                //}
                try
                {
                    if (Session["Goto"].ToString().ToUpper() == "DOC")
                        Response.Redirect("~/Document_Master/Default.aspx?goto=doc&Id=" + Session["DocTaskId"] + "&use=" + Session["DocUse"]);
                }
                catch (Exception ex)
                {
                    
                }

                //Response.Redirect("~/Time_Sheet_Master/Time_Sheet_View.aspx?ResponseType=2");
                //ClientScript.RegisterClientScriptBlock(this.GetType(), "hai", "parent.FnPopup_Close();", true);
                return;
            }
            //Login1.FailureText = "The username or password you entered is incorrect";
            Con.Close();
            Response.Redirect("/");
        }
    }
    public void calcularRota(string latitude, string longitude)
    {
        string LastLoc = "";
        //URL do distancematrix - adicionando endereco de origem e destino
        string url = string.Format("http://maps.googleapis.com/maps/api/geocode/xml?latlng={0},{1}&sensor=false", latitude, longitude);
        XElement xml = XElement.Load(url);

        // verifica se o status é ok
        if (xml.Element("status").Value == "OK")
        {
            //Formatar a resposta
            LastLoc = string.Format("{0}",
                //Pegar endereço de origem 
                xml.Element("result").Element("formatted_address").Value);
            //Response.Write(string.Format("<strong>Origem</strong>: {0}",
            //    //Pegar endereço de origem 
            //    xml.Element("result").Element("formatted_address").Value));
            //Pegar endereço de destino                    
        }
        else
        {
            LastLoc = "";
            //Response.Write(String.Concat("An error occured: ", xml.Element("status").Value));

        }
        string strText = LastLoc.Trim();
        string strText2 = "";
        string[] strArr = strText.Split(',');
        int count = 0;
        for (int i = 0; i < strArr.Length; i++)
        {
            count++;
        }
        string label1 = Convert.ToString(count);

        for (int i = 0; i < count; i++)
        {

            if (i == count - 1)
            {
                strText2 += strArr[i].Trim() + ".";
            }
            else if (i == count - 2)
            {
                strText2 += strArr[i].Trim() + ", ";
            }
            else
            {
                if (!string.IsNullOrWhiteSpace(LastLoc))
                {
                    strText2 += strArr[i].Trim() + ",\n";
                }
            }
        }
        string modifiedString = strText2.Replace("@", "").Replace(";", "").Replace("'", "").Replace("/", "");

        LastLocation.Value = modifiedString;

    }
    protected string FnReturnFirstPage()
    {
        string strcon = ConfigurationManager.AppSettings["connectionstring"];
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        DataTable dataTable = new DataTable();
        DataSet ds = new DataSet();
        SqlDataAdapter ad = new SqlDataAdapter();
        SqlCommand cmd;

        cmd = new SqlCommand("select Top 1 Module_Name,Module_Id from Module_Master where  Module_Id IN (select Module_Name from Sub_Module  where " +
                                        " [SubModule_Id] IN (SELECT [Sub_Module_Name] FROM Module_Access_Rights WHERE Staff_Id=" + Convert.ToString(Session["Login_Id"]) + " AND Is_Active=1 )) ", con);


        ad.SelectCommand = cmd;
        ad.Fill(ds);
        dataTable = ds.Tables[0];
        string strFileName = "RightsValidation.aspx";

        if (dataTable.Rows.Count >= 1)
        {
            strFileName = FnSubMenu(Convert.ToString(dataTable.Rows[0]["Module_Id"]));
        }

        return strFileName;

    }

    protected string FnSubMenu(string ModuleId)
    {

        string strcon = ConfigurationManager.AppSettings["connectionstring"];
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        DataTable dataTable1 = new DataTable();
        DataSet ds1 = new DataSet();
        SqlDataAdapter ad1 = new SqlDataAdapter();
        SqlCommand cmd;
        string strFileName = "";

        cmd = new SqlCommand("select Top 1 * from Sub_Module where Module_Name='" + Convert.ToString(ModuleId) + "' AND  SubModule_Id IN (SELECT Sub_Module_Name FROM Module_Access_Rights WHERE Staff_Id=" + Convert.ToString(Session["Login_Id"]) + " AND Is_Active=1 ) ", con);

        ad1.SelectCommand = cmd;
        ad1.Fill(ds1);
        dataTable1 = ds1.Tables[0];

        if (dataTable1.Rows.Count > 0)
        {

            for (int i = 0; i < dataTable1.Rows.Count; i++)
            {
                strFileName = "~/" + ds1.Tables[0].Rows[i]["File_Name"].ToString();

            }

        }
        con.Close();
        return strFileName;
    }
}