<%@ Control Language="C#" ClassName="WebUserControl1" %>
<title>Login</title>
<script runat="server">
   
    protected void FnSignOut(object sender, EventArgs e)
    {
        Session["Login_Id"] = "";
        Session["Login_Name"] = "";
        //Response.Redirect("http://" + Request.ServerVariables["Server_Name"] + "/ToucheAdmin/Default.aspx");
       

        Response.Redirect("~\\Default.aspx");

    }
    protected void Page_Load()
    {

        if (!Page.IsPostBack)
        {
            if (Convert.ToString(Session["Login_Name"])!= "")
            {
                if (Convert.ToString(Session["PicPath"]) != "")
                {
                    //tdSignIn.InnerHtml = "<nobr><img src=\"../Staff_Master/StaffPic/" + Session["PicPath"] + "\" style=\"height:10%; width:10%; \" class=\"img-circle\" /></nobr><nobr>" + Session["Login_Name"] + "</nobr><br>" + Session["Unit_Name"] + "";
                    tdSignIn.InnerHtml = "<img src=\"../Staff_Master/StaffPic/" + Session["PicPath"] + "\" style=\"height:50px; width:50px; \" class=\"img-circle\" /><span style=\"font-size:small; font-weight:bold; \">" + Session["Login_Name"] + "<br />" + Session["Unit_Name"] + "<a href=\"../Default.aspx?Type=LogO \"><button type=\"button\" runat=\"server\" style=\"color:black;\">LogOut</button></span></a>";
                    //donedone.Visible = true;
                    //Div1.Visible = false;
                }
                else
                {
                    tdSignIn.InnerHtml = "<img  src=\"../images/user_male.png\" border=\"0\" id=\"Img\"  /><nobr><span style=\"font-size:small; font-weight:bold; \">" + Session["Login_Name"] + "</nobr><br />" + Session["Unit_Name"] + "<a href=\"../Default.aspx?Type=LogO \"><button type=\"button\" runat=\"server\" style=\"color:black;\" >LogOut</button></span></a>";
                    //donedone.Visible = true;
                    //Div1.Visible = true;
                }
            }
        }
    }
</script>

<script language="javascript" type="text/javascript">
    function FnChangeSignOut(objThis, intNeed) {
        strFile = (intNeed) ? "Logout-01.png" : "Logout-02.png"
        objThis.firstChild.src ="../images/" + strFile;
    }
</script>
 <script type="text/javascript" src="js/custom.js"></script>
 

                    <%-- <div runat="server" id="Div1"></div>--%>
                        <div  runat="server" id="tdSignIn"></div>
                 <%--       <button runat="server"  id="donedone"  class="logimgchange" style="border-color:lightgray; border-style:outset; border-width:0; border-radius:8px; display:inline;"  onserverclick="FnSignOut"></button>--%>
                    
              
