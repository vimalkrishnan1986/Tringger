<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="ToucheDefault" %>




<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <script type="text/javascript">

        function CallFailed(res) {
            alert(res.get_message());
        }
        function CallSuccess(res) {

        }
        function SetTimeZone() {
            var offset = new Date().getTimezoneOffset();
            PageMethods.SetTimeZone(offset, CallSuccess, CallFailed);
        }
    </script>

    <div class="container-fluid">

        <table class="table">
            <tr>
                <th style="width: 40%;">
                    <nobr>
                 <a href="ChangePassword.aspx" class="menu">Reset Your Password</a>
                     </nobr>
                </th>

                <th style="width: 60%;"></th>
            </tr>
        </table>
        <div class="col-md-6 col-lg-8 col-xs-12 col-sm-12">

            <div style="margin-top: -20px; padding: 0px;">

                <div class="jumbotron" style="padding: 50px; padding-bottom: 150px; padding-top: 150px; background-color: #e2e2e2; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); width: 100%">
                    <table class="table">
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">
                                <h3>Sign Into your TaskThru Page</h3>
                            </th>
                        </tr>
                    </table>

                    <asp:Panel ID="LoginPanel" runat="server" Visible="true">

                        <table class="table">
                            <tr>
                                <asp:Label ID="Label1" runat="server" Text="" CssClass="warningstyle"></asp:Label>
                            </tr>
                            <tr>
                                <th scope="col"><span>Username</span></th>
                                <th scope="col">
                                    <asp:TextBox ID="UserIDText" runat="server" Width="50%"></asp:TextBox></th>
                            </tr>

                            <tr>
                                <th scope="col"><span>Password</span></th>
                                <th scope="col">
                                    <asp:TextBox TextMode="Password" runat="server" ID="txtPassword" class="labelText" Width="50%"></asp:TextBox></th>
                            </tr>

                            <tr>
                                <th scope="col"></th>
                                <th scope="col">
                                    <input id="Login1_RememberMe" style="width: 10%" type="checkbox" name="Login1$RememberMe" /><label for="Login1_RememberMe">Remember me </label>
                                </th>
                            </tr>
                            <tr>
                                <th scope="col"></th>
                                <th scope="col">
                                    <asp:Button ID="btnLogin" CssClass="loginbutton" Width="50%" Style="margin-top: 20px;" runat="server" Text="Log In" OnClientClick="SetTimeZone();" OnClick="FnCheckLogin" />
                                </th>
                            </tr>

                        </table>

                        <asp:HiddenField ID="AttendanceID" runat="server" Value="0" />
                        <asp:HiddenField ID="StaffIDHdn" runat="server" />


                        <asp:Button ID="Button1" CssClass="loginbutton" runat="server" Visible="false" Width="100px" Text="Biometrics" OnClick="FnCheckLogin2" />

                        <asp:Label runat="server" ID="BiometricStatus" Visible="false"></asp:Label>

                    </asp:Panel>


                    <asp:Panel ID="SelectDepartmentPan" runat="server" Visible="false">

                        <table class="table">
                            <tr>
                                <th scope="col">
                                    <h5>Select department that you are signing into today.</h5>
                                </th>
                            </tr>
                            <tr>
                                <th scope="col">

                                    <asp:DropDownList runat="server" ID="DepartmentDD" class="dropdown"
                                        Style="width: 50%" AutoPostBack="true">
                                    </asp:DropDownList></th>
                            </tr>
                            <tr>
                                <th scope="col">
                                    <asp:Button ID="proceedBtn" CssClass="loginbutton" runat="server" Text="Proceed" Width="50%" OnClientClick="SetTimeZone();" OnClick="Button1_Click" />

                                </th>
                            </tr>
                            <tr>
                                <th scope="col">
                                    <asp:Button ID="Button2" CssClass="loginbutton" Text="Back" runat="server" Style="margin-top: 30px; float: left;" Width="20%" OnClientClick="SetTimeZone();" OnClick="Button2_Click" />
                                </th>
                            </tr>
                        </table>

                    </asp:Panel>



                </div>


            </div>

        </div>


    </div>



    <%--  <input type="text" class="controlborder allfont" title="Filter the Staff Name" style="width:80%" onkeyup="FilterText(this,'<%=ddUserId.ClientID %>')" /><br />
                                <asp:DropDownList ID="ddUserId" runat="server" class="labelText" name="TableId" style="width:80%" Visible="false" >
                                 </asp:DropDownList>--%>
    <%-- <input type="text" class="controlborder allfont" title="Filter the Staff Name" style="width:80%" /><br />
                                <asp:DropDownList ID="ddUserId" runat="server" class="labelText" name="TableId" style="width:80%"  >
                                 </asp:DropDownList>--%>
</asp:Content>
