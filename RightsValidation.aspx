<%@ Page Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RightsValidation.aspx.cs" Inherits="ToucheAdmin_RightsValidation" %>
<asp:Content ID="HeadContentId"  ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="MainContentId" ContentPlaceHolderID="MainContent" runat="server">

   <script type="text/javascript">

       // settinng the timezone value over here

        function CallSuccess() {

        }

        // alert message on some failure
        function CallFailed(res) {
            alert(res.get_message());
        }
        function SetTimeZone() {
            var offset = new Date().getTimezoneOffset();
            PageMethods.SetTimeZone(offset, CallSuccess, CallFailed);
        }
   </script>
<div id="DivFormLayout" class="Heading" valign="Middle"   >

    You have no rights for accessing the page. Please contact your administrator.<br />
   <asp:HiddenField ID="LastLocation" runat="server" Value="Location not available." />
    
</div>
</asp:Content>
    

