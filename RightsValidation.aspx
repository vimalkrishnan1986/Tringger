<%@ Page Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="RightsValidation.aspx.cs" Inherits="ToucheAdmin_RightsValidation" %>

<asp:Content ID="HeadContentId" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="MainContentId" ContentPlaceHolderID="MainContent" runat="server">

    <div id="DivFormLayout" class="Heading" style="vertical-align: middle">
        You have no rights for accessing the page. Please contact your administrator.<br />
        <asp:HiddenField ID="LastLocation" runat="server" Value="Location not available." />

    </div>
</asp:Content>


