<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MainMasterPage.master" CodeFile="Time_Sheet_View.aspx.cs" Inherits="Time_Sheet_Master_Time_Sheet_View" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content runat="server" ID="HeadContentId" ContentPlaceHolderID="HeadContent">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <%--<meta http-equiv="refresh" content="60" />--%>

    <script language="javascript" type="text/javascript" src="../Script/FormResize.js"></script>
    <script language="javascript" type="text/javascript" src="../Script/Calender.js"></script>


    <script language="javascript" type="text/javascript" src="../Script/jquery.min.js"></script>
    <link href="../Script/highslide/highslide_popup.css" rel="stylesheet" />
    <script type="text/javascript" src="../Script/highslide/highslide-with-html-mobile.js"></script>

    <!-- ***************************************************TIME PICKER -->
    <link rel="Stylesheet" href="../Script/TimePicker/dist/bootstrap-clockpicker.css" type="text/css" />

    <!-- ***************************************************TIME PICKER -->


    <script type="text/javascript">    
        hs.graphicsDir = '../Script/highslide/graphics/';
        hs.outlineType = 'rounded-white';
        hs.outlineWhileAnimating = true;

    </script>

    <%--<link href="../Script/fancybox/jquery.fancybox-1.3.1.css" rel="stylesheet" />
    <script src="../Script/fancybox/jquery.fancybox-1.3.1.js" type="text/javascript"></script>--%>

    <script language="javascript" type="text/javascript" src="../Script/ToolTip/Tooltip.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $("a.quotepopup").fancybox(
                {
                    'type': 'iframe',
                    'width': 800,
                    'height': 800,
                    'titleShow': false
                }
            );
        });

        function AjaxCallBack(objThis, strDate, intStaffId, status, strType) {
            if (window.XMLHttpRequest) {
                xmlhttp = new XMLHttpRequest();
            }
            else {
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            objThis.innerHTML = "<img src=\"/images/busy.gif\" border=0>";
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    objThis.innerHTML = xmlhttp.responseText;
                    return true;
                }
                if (xmlhttp.readyState == 4 && xmlhttp.status != 200) {
                    return false;
                }
            }
            xmlhttp.open("POST", "Time_Sheet_Approve.aspx?Type=" + strType, true);
            xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
            xmlhttp.send("Date=" + strDate + "&Staff_Id=" + intStaffId + "&Status=" + status);
            return true;
        }

        function AjaxCallBack1(objThis, strDate, intStaffId, intNeed, intEditNeed, objLocation) {

            if (window.XMLHttpRequest) {
                xmlhttp = new XMLHttpRequest();
            }
            else {
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }

            //alert(objLocation);
            //   alert(objLocation.value);
            var strLocation = objLocation.value;
            //alert(strLocation);

            objThis.innerHTML = "<img src=\"/images/busy.gif\" border=0>";
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    if (intNeed == 1) {

                        objThis.parentNode.cells[5].innerHTML = "<input type=\"button\" class=\"smallbutton\" onclick=\"AjaxCallBack1(this.parentNode,'" + strDate + "'," + intStaffId + ",0," + intEditNeed + ",this.nextSibling)\" value=\"Out\">" +
                                                                  "<textarea rows=\"2\" cols=\"5\"  name=\"Location\" value=\"<%=Session["Location"] %>\"><%=Session["Location"] %></textarea>";
                    }
                    objThis.innerHTML = xmlhttp.responseText;
                    return true;
                }
                if (xmlhttp.readyState == 4 && xmlhttp.status != 200) {
                    objThis.innerHTML = xmlhttp.responseText;
                    return false;
                }
            }
            //alert(intStaffId);
            var objDate = new Date();
            xmlhttp.open("POST", "Time_Sheet_Approve.aspx?Type=Attendance", true);
            xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
            //  alert("Location=" + strLocation +"&Date=" + strDate + "&Staff_Id=" + intStaffId + "&Rights=" + intEditNeed + "&Timing=" + objDate.getHours() + ":" + objDate.getMinutes());
            xmlhttp.send("Location=" + strLocation + "&Date=" + strDate + "&Staff_Id=" + intStaffId + "&Rights=" + intEditNeed + "&Timing=" + objDate.getHours() + ":" + objDate.getMinutes());
            return true;
        }
        function AjaxCallBack2(TimeSheetID, StatusId, Location) {
            if (window.XMLHttpRequest) {
                xmlhttp = new XMLHttpRequest();
            }
            else {
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }

            //   alert(objLocation);
            //   alert(objLocation.value);
            var strLocation = Location.value;
            var strTimeSheetID = TimeSheetID.value;
            var strStatusId = StatusId.value;
            //   alert(strLocation);

            objThis.innerHTML = "<img src=\"/images/busy.gif\" border=0>";
            //xmlhttp.onreadystatechange = function () {

            //}
            //alert(intStaffId);
            //var objDate = new Date();
            xmlhttp.open("POST", "Time_Sheet_Master_Popup.aspx?Action=T", true);
            xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
            alert("Location=" + strLocation + "&TimeSheetID=" + strTimeSheetID + "&StatusID=" + strStatusId + "");
            xmlhttp.send("Location=" + strLocation + "&TimeSheetID=" + strTimeSheetID + "&StatusID=" + strStatusId + "");
            return true;
        }
        function EventPreventing(e) {

            if (!e) var e = window.event;

            //e.cancelBubble is supported by IE - this will kill the bubbling process.
            e.cancelBubble = true;
            e.returnValue = false;
            //e.stopPropagation works only in Firefox.
            if (e.stopPropagation) {
                e.stopPropagation();
                e.preventDefault();
            }

        }

    </script>
    <!--<script type="text/javascript" src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization','version':'1','packages':['corechart']}]}"></script>-->
    <style type="text/css">
        #dhtmltooltip {
            position: absolute;
            left: -300px;
            width: 175px;
            border: 1px solid black;
            padding: 5px;
            background-color: #00375e;
            font-family: Verdana;
            font-size: 11px;
            color: #FFFFFF;
            font-weight: normal;
            visibility: hidden;
            z-index: 100;
            /*Remove below line to remove shadow. Below line should always appear last within this CSS*/
            filter: progid:DXImageTransform.Microsoft.Shadow(color=gray,direction=135);
        }



        #dhtmlpointer {
            position: absolute;
            left: -300px;
            z-index: 101;
            visibility: hidden;
        }



        .style1 {
            color: #000000;
            font-family: Calibri;
            font-weight: bolder;
            font-size: 18px;
            width: 45%;
        }

        .standoutstyle {
            color: orangered;
            font-family: Arial;
            font-weight: bolder;
            font-style: italic;
            font-size: x-small;
        }
    </style>
    <style type="text/css">
        .overview {
            width: 100%;
            float: left;
            font-family: 'Helvetica Neue', 'Open Sans', Arial, sans-serif;
            padding-bottom: 20px;
            margin: 2px 3% 0 2%;
        }

            .overview h1 {
                font-size: 36px;
                font-weight: normal;
                color: #4a4a4a;
                padding: 10px 0;
                margin: 0px;
                text-align: left;
            }

        .task {
            width: 14%;
            float: left;
            background: #f4f4f4;
            text-align: center;
            margin-right: 2%;
        }

        .text-muted {
            color: #999;
            font-size: 10px;
        }

        .widget-body {
            min-height: 120px;
            padding: 10px;
            position: relative;
            background: #FFFFFF;
            border-bottom: 1px solid #FFFFFF;
        }

        .text-large {
            font-size: 30px;
            line-height: 40px;
            padding: 10px 0px;
            font-family: 'Helvetica Neue', 'Open Sans', Arial, sans-serif;
            color: #4a4a4a;
        }

        .widget-primary {
            box-shadow: 0 3px 0 0 #c72a25;
            -moz-box-shadow: 0 3px 0 0 #c72a25;
            -webkit-box-shadow: 0 3px 0 0 #c72a25;
        }

        .widget-warning {
            box-shadow: 0 3px 0 0 #c58a2c;
            -moz-box-shadow: 0 3px 0 0 #c58a2c;
            -webkit-box-shadow: 0 3px 0 0 #c58a2c;
        }

        .widget-info {
            box-shadow: 0 3px 0 0 #2f65a7;
            -moz-box-shadow: 0 3px 0 0 #2f65a7;
            -webkit-box-shadow: 0 3px 0 0 #2f65a7;
        }

        #chart_div {
            margin-left: 4px !important;
        }

        #chart_div_project {
            margin-left: 4px !important;
        }


        .modal-body-touch {
            min-height: 100px;
            max-height: 300px;
            overflow: auto;
            -webkit-overflow-scrolling: touch;
        }

        @media (min-height: 600px) {
            .modal-body-touch {
                max-height: 500px;
            }
        }

        @media (min-height: 800px) {
            .modal-body-touch {
                max-height: 700px;
            }
        }

        @media (min-height: 1000px) {
            .modal-body-touch {
                max-height: 800px;
            }
        }

        @media (min-height: 1200px) {
            .modal-body-touch-body {
                max-height: 1000px;
            }
        }


        @media only screen and (max-device-width:768px) {

            body.modal-open {
                overflow: hidden;
                position: fixed;
            }
        }

        #menuOnNav:hover {
            color: #470202;
        }

        .sidenav {
            height: 100%; /* 100% Full-height */
            width: 0; /* 0 width - change this with JavaScript */
            position: fixed; /* Stay in place */
            z-index: 1; /* Stay on top */
            top: 0; /* Stay at the top */
            left: 0;
            background-color: #111; /* Black*/
            overflow-x: hidden; /* Disable horizontal scroll */
            padding-top: 60px; /* Place content 60px from the top */
            transition: 0.5s; /* 0.5 second transition effect to slide in the sidenav */
        }

            /* The navigation menu links */
            .sidenav a {
                padding: 8px 8px 8px 32px;
                text-decoration: none;
                font-size: 25px;
                color: #c9c9cf;
                display: block;
                transition: 0.3s;
            }

                /* When you mouse over the navigation links, change their color */
                .sidenav a:hover {
                    color: #f1f1f1;
                }

            /* Position and style the close button (top right corner) */
            .sidenav .closebtn {
                position: absolute;
                top: 0;
                right: 25px;
                font-size: 36px;
                margin-left: 50px;
            }

        /* Style page content - use this if you want to push the page content to the right when you open the side navigation */
        #main {
            transition: margin-left .5s;
            padding: 20px;
        }

        /* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
        @media screen and (max-height: 450px) {
            .sidenav {
                padding-top: 15px;
            }

                .sidenav a {
                    font-size: 18px;
                }
        }
    </style>

    <script language="javascript" type="text/javascript">

        function FnShowTaskEntry(objThis, staff_Id, Task_Id, strStatus, strDate) {
            var objPosition = getOffset(objThis);
            with (document) {
                // getElementById("DivTaskEntry").style.display = "inline";
                // getElementById("DivTaskEntry").style.top = (objPosition.top - 220) + "px";
                // getElementById("frmTaskEntry").src = "Task_Entry.aspx?Staff_Id=" + staff_Id + "&Task_Id=" + Task_Id + "&Status=" + strStatus + "&Task_Date=" + strDate; 
            }

        }
        function disablingEvent(e) {
            // disabling
            e = e ? e : window.event;
            if (e.preventDefault)
                e.preventDefault();
            else
                e.returnValue = false;
            return false;
        }


        function FnValidation(evt) {

            var aryObject = ["<%=DateFrom.ClientID%>", "<%=DateTo.ClientID%>"];
            var aryMessage = ["Enter the From date.", "Enter the To date."];

            for (var intLoop = 0; intLoop < aryObject.length; intLoop++) {
                obj = document.getElementById(aryObject[intLoop])

                if (obj.value == "") {
                    alert(aryMessage[intLoop]);
                    obj.focus();
                    return disablingEvent(evt);
                }
            }

            return true;
        }

        <%-- function FnPopupReload() {
             //document.getElementById("DivTaskEntry").style.display = "none";
             $.fancybox.close();
             document.getElementById("<%=Load_Button.ClientID %>").onclick();
         }--%>


        function FnAssignDateDuration(strFrom, objTo, intBefore, strType) {

            var objFrom = document.getElementById(strFrom);
            var objTo = document.getElementById(objTo);

            var aryMonth = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
            var objCurrentDate = new Date();
            var objDate = new Date();
            if (strType.toString().toUpperCase() == "D") {
                objDate.setDate(objCurrentDate.getDate() - intBefore);
            }
            else if (strType.toString().toUpperCase() == "M") {
                objDate.setMonth(objCurrentDate.getMonth() - intBefore)
            }
            else if (strType.toString().toUpperCase() == "Y") {
                objDate.setFullYear(objCurrentDate.getFullYear() - intBefore)

            }
            objFrom.value = objDate.getDate() + "-" + aryMonth[objDate.getMonth()] + "-" + objDate.getFullYear();
            objTo.value = objCurrentDate.getDate() + "-" + aryMonth[objCurrentDate.getMonth()] + "-" + objCurrentDate.getFullYear();

        }

        var win = null;
         //function OpenPopUp(mypage, myname, w, h, scroll, pos) {
         //    if (pos == "random") { LeftPosition = (screen.width) ? Math.floor(Math.random() * (screen.width - w)) : 100; TopPosition = (screen.height) ? Math.floor(Math.random() * ((screen.height - h) - 75)) : 100; }
         //    if (pos == "center") { LeftPosition = (screen.width) ? (screen.width - w) / 2 : 100; TopPosition = (screen.height) ? (screen.height - h) / 2 : 100; }
         //    else if ((pos != "center" && pos != "random") || pos == null) { LeftPosition = 0; TopPosition = 20 }
         //    settings = 'width=' + w + ',height=' + h + ',top=' + TopPosition + ',left=' + LeftPosition + ',scrollbars=' + scroll + ',location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=yes';
         //    win = window.open(mypage, myname, settings);
         //}
    </script>

    <link href="../css/bootstrap_Flatly.css" rel="stylesheet" />
    <%-- <link rel="stylesheet" href="~/css/site.css" />   --%>
    <style type="text/css">
        spanwrap {
            font-family: Calibri;
            color: #aba6a6;
            text-align: center;
            padding: .2em .6em .3em;
            ;
            vertical-align: baseline;
            border-radius: .25cm;
            line-height: 1;
            font-weight: bold;
            font-size: 90%;
            display: inline-block;
            width: 100%;
            white-space: normal;
            word-wrap: break-word;
        }
    </style>
</asp:Content>
<asp:Content runat="server" ID="MainContentId" style="height: 100%" ContentPlaceHolderID="MainContent">


    <%--<asp:ScriptManager runat="server">
    </asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
        <ProgressTemplate>
            <div style="position: fixed; top: 0px; bottom: 0px; left: 0px; right: 0px; overflow: hidden; padding: 0; margin: 0; background-color: #F0F0F0; filter: alpha(opacity=50); opacity: 0.5; z-index: 100000;">
            </div>
            <div style="position: fixed; top: 40%; left: 40%; height: 20%; width: 20%; z-index: 100001; background-color: #FFFFFF; border: 2px solid #000000; background-image: url('../images/updateimg.gif'); background-repeat: no-repeat; background-position: center;">
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>


    <!--<div style="clear:both; margin-top:25px;"></div>-->

    <div style="margin-top: 150px; background-color: #f0f0f0; padding: 0px;" class="container-fluid">



        <div style="padding: 0px;">


            <div id="mysidenavOpt" class="sidenav" style="margin-top: 114px; background-color: rgb(146, 146, 146); padding-right: 5px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                <!-- <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>  -->
                <div class="jumbotron" style="padding: 0px; margin-left: 5px; background-color: transparent; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">

                    <!--<p class="h3">TEST</p>-->

                    <a style="background-color: transparent; font-size: small; color: #f0f0f0" class="btn btn-default btn-xs" href="../AllUsersOnAMapToday.aspx" target="_blank">View Map  <span class="glyphicon glyphicon-map-marker"></span></a>
                    <asp:ObjectDataSource ID="ProjectDataSource" runat="server" TypeName="ObjectDataSet" SelectMethod="GetProjects" />
                    <div class="dropdown">
                        <asp:DropDownList runat="server" DataTextField="Project_Name" DataValueField="ProjectId" CssClass="btn btn-default btn-sm" ID="ProjectDD" AppendDataBoundItems="true" name="ProjectDD" OnSelectedIndexChanged="ProjectDD_SelectedIndexChanged" DataSourceID="ProjectDataSource" AutoPostBack="true">
                            <asp:ListItem Value="" Text="---Order Id---"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="dropdown">

                        <asp:ObjectDataSource ID="StaffDataSource" TypeName="ObjectDataSet" runat="server"
                            SelectMethod="GetStaffs" />
                        <asp:DropDownList runat="server" ID="Staff_Name" Name="Staff_Name" DataTextField="Staff_Name" DataValueField="Staff_Id" CssClass="btn btn-default btn-sm" DataSourceID="StaffDataSource" AppendDataBoundItems="true">
                            <asp:ListItem Text="--- Staff Name---" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <span>
                        <input type="button" value="Apply" runat="server" class="btn btn-default btn-xs" style="background-color: white;" onclick="if (FnValidation(event))" onserverclick="Load_Data" /></span>

                    <div style="margin-top: 10px;">
                        <asp:Button ID="Button3" CssClass="btn btn-default btn-sm" Text="Show all Users" runat="server" OnClick="Button3_Click" />
                    </div>
                    <div>
                        <asp:Button ID="Button5" CssClass="btn btn-default btn-sm" Text="Your Records" runat="server" OnClick="Button5_Click" />
                    </div>

                    <div style="margin-top: 10px;">
                        <asp:Button ID="Button2" CssClass="btn btn-default btn-sm" Text="Previous Day" OnClick="Button2_Click" runat="server" />
                    </div>
                    <div>
                        <asp:Button ID="Button1" CssClass="btn btn-default btn-sm" Text="Following Day" runat="server" OnClick="Button1_Click" />
                    </div>
                    <div>
                        <asp:Button ID="Button4" CssClass="btn btn-default btn-sm" Text="Today" OnClick="Button4_Click" runat="server" />
                    </div>


                    <div class="label">
                        <asp:TextBox runat="server" CssClass="form-control" ID="DateFrom" name="DateFrom" TextMode="SingleLine"></asp:TextBox>
                    </div>
                    <div class="label">
                        <asp:TextBox runat="server" CssClass="form-control" ID="DateTo" name="DateTo" TextMode="SingleLine"></asp:TextBox>
                    </div>
                    <div>
                        <span>
                            <input type="button" value="Apply" runat="server" id="Load_Button" class="btn btn-default btn-xs" style="background-color: white;" onclick="if (FnValidation(event))" onserverclick="Load_Data" /></span>
                    </div>

                </div>
                <br />
                <br />
                <br />
                <br />
            </div>

            <div id="main" style="padding: 0px">
                <button type="button" class="badge" onclick="openNav()" style="border-top-left-radius: 0px; border-bottom-left-radius: 0px; background-color: rgb(146, 146, 146); position: fixed; z-index: 1; border-color: transparent; outline: none !important;">

                    <span onclick="openNav()" style="border-top-left-radius: 0px; border-bottom-left-radius: 0px; background-color: transparent;" class="glyphicon glyphicon-th-list"></span>
                    OPTIONS</button>
            </div>

        </div>
        <!--md3-->


        <span class="glyphicon glyphicon-hand-right" style="margin: 4px; margin-top: -18px; float: right;"></span>
        <asp:Button ID="GoToMiniBtn" runat="server" CssClass="btn btn btn-danger btn-xs" Style="float: right; margin-top: -27px; font-size: small; color: rgb(245, 245, 245); color: white; background-color: rgb(146, 146, 146);" Text="Customer Service" OnClick="GoToMiniBtn_Click" />

        <div class="col-md-6 col-lg-6 col-xs-12 col-sm-12 col-md-offset-3 col-lg-offset-3">

            <div style="margin: 0px; margin-top: 18px; padding: 0px;">

                <table class="table table-sm" style="margin: 0px; padding: 0px;">
                    <thead>
                        <tr>
                            <td align="center">
                                <asp:Button ID="SyncBtn" OnClick="ModalCloseClick" runat="server" CssClass="btn btn-danger" Style="font-weight: bold; background-color: rgb(191, 214, 201); color: rgb(0, 0, 0); border-radius: 5px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" Text="SYNC NEW DATA" />
                            </td>
                        </tr>
                    </thead>
                </table>


            </div>
            <center><span id="SyncBadge" style="margin-top: 0px; margin-bottom: 20px; border-radius: 5px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" class="badge badge-secondary">Sync in progress..</span></center>


            <div style="display: none; margin-bottom: 20px; margin-left: -5px; margin-right: -10px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); padding: 15px; border-radius: 15px; background-color: #dfdfdf;">
                <asp:Panel ID="ActiveOrdersNameSearch" runat="server" DefaultButton="Button6" Style="text-align: center; margin-top: 5px; margin-bottom: 5px;">
                    <center style="display: inline; text-align: center;" visible="true" runat="server" id="SearchCustomerDiv">
                        <asp:TextBox ID="TextBox4" CssClass="form-control" Style="text-align: center;" runat="server" PlaceHolder="Search orders by Name or Ph#"></asp:TextBox><asp:Button ID="Button6" runat="server" CssClass="btn btn btn-danger btn-sm" OnClick="Button6_Click" Style="border-radius: 10px; font-size: small; background-color: #cfd6d2; text-align: center; margin-top: 5px;" Text="Search Order" />
                    </center>
                </asp:Panel>

            </div>
            <%--  <div style="margin-bottom:20px; margin-left:-5px; margin-right:-10px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); padding:15px; border-radius:15px; background-color:#dfdfdf; ">
            <center><asp:Button ID="AttendanceInBtn" runat="server" CssClass="btn-sm" OnClick="AttendanceInBtn_Click" /><br />
                <asp:Button ID="AttendanceOutBtn" runat="server" CssClass="btn-sm" OnClick="AttendanceInBtn_Click" />
            </center>
        </div>--%>
            <center>
                <h4 class="badge" style="background-color: gray; font-size: medium; margin-top: 0px; margin-bottom: 15px;">Task Management</h4>
            </center>

            <center>
                <div style="width: auto; display: none; margin-bottom: 20px; margin-left: -5px; margin-right: -10px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); padding: 0px; border-radius: 15px; background-color: #dfdfdf;">

                    <div style="display: inline;" visible="false" runat="server" id="UnpickedDiv">
                        <asp:Button ID="UnpickedOrdersBtn" runat="server" CssClass="btn btn btn-danger btn-sm" Style="border-radius: 10px; font-size: small; background-color: #d3b4f5;" OnClick="UnpickedBtn_Click" Text="Un-Picked" /><span style="background-color: #d3b4f5" class="badge badge-secondary"><asp:Label ID="UnPickedLab" runat="server" Font-Bold="true" ForeColor="#0e0e0e" Font-Size="small"></asp:Label></span><asp:HiddenField ID="UnPickedHdn" runat="server" Value="0" />
                    </div>
                    <div style="display: inline;" visible="false" runat="server" id="NormalOrdersDiv">
                        <asp:Button ID="NormalOrdersBtn" runat="server" CssClass="btn btn btn-danger btn-sm" Style="border-radius: 10px; font-size: small; background-color: #FFFFFF;" OnClick="NormalBtn_Click" Text="Normal" /><span style="background-color: #ffffff;" class="badge badge-secondary"><asp:Label ID="NormalLbl" runat="server" Font-Bold="true" ForeColor="#0e0e0e" Font-Size="small"></asp:Label></span>
                    </div>
                    <div style="display: inline;" visible="false" runat="server" id="CancelledOrdersDiv">
                        <asp:Button ID="CancelledBtn" runat="server" CssClass="btn btn btn-danger btn-sm" Style="border-radius: 10px; font-size: small; background-color: #f3edd1;" OnClick="CancelledBtn_Click" Text="Cancelled" /><span style="background-color: #f3edd1;" class="badge badge-secondary"><asp:Label ID="CancelledLbl" runat="server" Font-Bold="true" ForeColor="#0e0e0e" Font-Size="small"></asp:Label></span>
                    </div>
                    <div style="display: inline;" visible="false" runat="server" id="RushDiv">
                        <asp:Button ID="RushOrdersBtn" runat="server" CssClass="btn btn btn-danger btn-sm" OnClick="RushOrders_Click" Style="border-radius: 10px; font-size: small; background-color: #f77474;" Text="Rush" /><span style="background-color: #f77474" class="badge badge-secondary"><asp:Label ID="RushOrdersCount" ForeColor="#0e0e0e" runat="server" Font-Size="small"></asp:Label><asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
                        </span>
                    </div>
                    <div style="display: inline;" visible="false" runat="server" id="DeadlineDiv">
                        <asp:Button ID="DeadlineBtn" runat="server" CssClass="btn btn btn-danger btn-sm" OnClick="DeadlineOrders_Click" Style="border-radius: 10px; font-size: small; background-color: #f5d2b9;" Text="Deadline" /><span style="background-color: #f5d2b9;" class="badge badge-secondary"><asp:Label ID="DealineOrdersCount" ForeColor="#0e0e0e" runat="server" Font-Size="small"></asp:Label><asp:HiddenField ID="HiddenField4" runat="server" Value="0" />
                        </span>
                    </div>
                    <div style="display: inline;" visible="false" runat="server" id="WaitingDiv">
                        <asp:Button ID="CustWaitingByn" runat="server" CssClass="btn btn btn-danger btn-sm" OnClick="CustWaiting_Click" Style="border-radius: 10px; font-size: small; background-color: #ccf7db;" Text="Customer Waiting" /><span style="background-color: #ccf7db" class="badge badge-secondary"><asp:Label ID="Label7" runat="server" Font-Size="small" ForeColor="#0e0e0e"></asp:Label><asp:HiddenField ID="HiddenField2" runat="server" Value="0" />
                        </span>
                    </div>
                    <div style="display: inline;" visible="false" runat="server" id="CustPickUpDiv">
                        <asp:Button ID="CustomerCollectBtn" runat="server" CssClass="btn btn btn-danger btn-sm" OnClick="CustCollect_Click" Style="border-radius: 10px; font-size: small; background-color: #d1f5fb;" Text="Customer Pickup" /><span style="background-color: #d1f5fb" class="badge badge-secondary"><asp:Label ID="Label8" runat="server" ForeColor="#0e0e0e" Font-Size="small"></asp:Label><asp:HiddenField ID="HiddenField3" runat="server" Value="0" />
                        </span>
                    </div>
                    <div style="display: inline;" visible="false" runat="server" id="DeadLinedPickup">
                        <asp:Button ID="DeadlinedPickupBtn" runat="server" CssClass="btn btn btn-danger btn-sm" OnClick="DeadlinePickup_Click" Style="border-radius: 10px; font-size: small; background-color: #d1f5fb;" Text="Deadline P/U" /><span style="background-color: #d1f5fb" class="badge badge-secondary"><asp:Label ID="Label9" runat="server" ForeColor="#0e0e0e" Font-Size="small"></asp:Label><asp:HiddenField ID="HiddenField8" runat="server" Value="0" />
                        </span>
                    </div>
                    <div style="display: inline;" visible="false" runat="server" id="CustReturns">
                        <asp:Button ID="CustomerReturnBtn" runat="server" CssClass="btn btn btn-danger btn-sm" OnClick="Return_Click" Style="border-radius: 10px; font-size: small; background-color: #f8ccef;" Text="Returns" /><span style="background-color: #f8ccef;" class="badge badge-secondary"><asp:Label ID="ReturnsLab" runat="server" ForeColor="#0e0e0e" Font-Size="small"></asp:Label><asp:HiddenField ID="HiddenField6" runat="server" Value="0" />
                        </span>
                    </div>
                    <div style="display: inline;" visible="true" runat="server" id="AllOrdersDiv">
                        <asp:Button ID="AllOrdersBtn" runat="server" CssClass="btn btn btn-danger btn-sm" OnClick="AllOrders_Click" Style="border-radius: 10px; font-size: small; background-color: #dbd9d0;" Text="All Orders" /><span style="background-color: #dbd9d0;" class="badge badge-secondary"><asp:Label ID="AllOrdersLab" runat="server" ForeColor="#0e0e0e" Font-Size="small"></asp:Label><asp:HiddenField ID="HiddenField5" runat="server" Value="0" />
                        </span>
                    </div>
                </div>
            </center>
            <div id="jumbo-center" class="jumbotron" style="padding: 0px; margin: 0px; background-color: transparent; margin-left: -5px; margin-right: -10px;">

                <center>
                    <div style="margin-bottom: 0px; background-color: #efefef; padding-top: 5px; padding-bottom: 5px;">
                        <div visible="false" runat="server" id="UnAssignedDiv">
                            <span style="background-color: #ece5f0; color: black; border-top-left-radius: 0px; border-bottom-left-radius: 0px;" font-size="medium" class="badge badge-secondary">
                                <asp:Label ID="UnAssigneCount" runat="server" ForeColor="#0e0e0e" Font-Size="medium"></asp:Label>
                                Unassigned Orders</span><span class="glyphicon glyphicon-arrow-right"></span><asp:HiddenField ID="HiddenField7" runat="server" Value="0" />
                            <asp:Button ID="UnAssignedBtn" runat="server" CssClass="btn btn btn-danger btn-sm" OnClick="DistributeOrders_Click" Style="border-radius: 7px; border-top-left-radius: 7px; border-bottom-left-radius: 7px; font-size: small; background-color: #dac7e4;" Text="Auto Assign Now" />
                        </div>
                        <div visible="false" runat="server" id="UnAssignedProcessDiv">
                            <span style="background-color: #ece5f0; color: black; border-top-left-radius: 0px; border-bottom-left-radius: 0px;" font-size="medium" class="badge badge-secondary">
                                <asp:Label ID="UnAssignedProcessCount" runat="server" ForeColor="#0e0e0e" Font-Size="medium"></asp:Label>
                                Unassigned - Staff Offline</span><span class="glyphicon glyphicon-arrow-right"></span><asp:HiddenField ID="HiddenField9" runat="server" Value="0" />
                            <asp:Button ID="Button7" runat="server" CssClass="btn btn btn-danger btn-sm" OnClick="DistributeAllProcessOrders_Click" Style="border-radius: 7px; border-top-left-radius: 7px; border-bottom-left-radius: 7px; font-size: small; background-color: #dac7e4;" Text="Auto Assign Now" /><br />
                            <asp:Label ID="StaffStatus" runat="server" ForeColor="#0e0e0e" Font-Size="medium" Visible="false"></asp:Label>
                        </div>
                        <div visible="false" runat="server" id="UnassignedDeliveriesDiv">
                            <asp:Button ID="UnAssignedDeliveriesBtn" runat="server" CssClass="btn btn btn-danger btn-sm" OnClick="UnAssignedDeliveries_Click" Style="border-radius: 7px; border-top-left-radius: 7px; border-bottom-left-radius: 7px; font-size: small; background-color: #e7cfaa;" Text="Unassigned Deliveries" /><span style="background-color: #e7cfaa" class="badge badge-secondary"><asp:Label ID="UnAssignedDeliveryCount" runat="server" Font-Bold="true" ForeColor="#0e0e0e" Font-Size="small"></asp:Label></span>
                        </div>
                        <div visible="false" runat="server" id="AcceptAllUnpickedDiv">
                            <asp:Button ID="AcceptAllUnpickedBtn" runat="server" CssClass="btn btn btn-danger btn-sm" OnClick="AcceptAllUnpickedOrdersBtn_Click" Style="border-radius: 7px; border-top-left-radius: 7px; border-bottom-left-radius: 7px; font-size: small; background-color: #d3b4f5; margin-top: 10px; margin-bottom: 10px;" Text="Accept All Un-Picked Orders" /><asp:Label ID="Label10" runat="server" ForeColor="#0e0e0e" Font-Size="medium"></asp:Label>
                        </div>
                    </div>
                </center>
                <asp:HiddenField ID="UnAssignedDvryHdn" runat="server" Value="0" />
                <asp:HiddenField ID="ExceptionDriverHdn" runat="server" Value="0" />
                <div style="text-align: center;" class="container">
                    <span class="label" style="color: rgb(95, 146, 117); font-size: small">Enter Real time activities.</span><asp:TextBox ID="InputTxt" runat="server" CssClass="form-control" placeholder="Enter Activity"></asp:TextBox>
                    <center>
                        <table style="text-align: center; padding: 10px;" align="center">
                            <%-- <tr><td><asp:Button ID="bt1" runat="server" CssClass="btn-sm btn-default" Text="Set a Reminder" style="display:inline;"   OnClick="bt1_Click" /></td><td>
<asp:Button ID="bt2" runat="server" CssClass="btn-sm btn-default" Text="Travelling" OnClick="bt2_Click" style="display:inline;" /></td></tr>
              <td><asp:Button ID="bt3" runat="server" CssClass="btn-sm btn-default" Text="Expecting Visitor" OnClick="bt3_Click" style="display:inline;" /></td><td>--%>
                            <tr>
                                <td>
                                    <asp:Button ID="Button8" runat="server" CssClass="btn-sm btn-default" Text="Set an Activity" OnClick="Button8_Click" Style="display: inline;" /></td>
                            </tr>
                        </table>
                    </center>
                </div>
                <br />
                <center>
                    <asp:Label ID="displayHeadingLab" runat="server" class="label" Style="color: rgb(95, 146, 117); font-size: small"></asp:Label></center>
                <div style="text-align: center;">
                    <tr>
                        <td runat="server" style="height: 20px;" id="tdMessage" align="center" onclick="this.innerHTML='&nbsp;'">&nbsp;</td>
                    </tr>
                </div>
                <asp:HiddenField ID="LastLocation" runat="server" Value="0" />
                <div runat="server" id="TdReport"></div>

                <!-- **********************************************************************************************NEW MODAL SYSTEM FOR ORDERS -->
                <div class="modal fade" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="orderModalLabel" aria-hidden="true" data-backdrop="static">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="orderModalLabel">Assign Tasks</h5>
                                <asp:Button OnClick="ModalCloseClick" runat="server" CssClass="btn btn-secondary btn-xs" Style="float: right; font-size: large; background-color: white; color: black; border-radius: 5px;" Text="&times;" />
                            </div>
                            <div class="modal-body modal-body-touch">
                                <iframe id="orderIframe" frameborder="0" height="85%" width="99.6%"></iframe>

                            </div>
                            <div class="modal-footer">
                                <asp:Button Mvalue="0" ID="ModalCloseBtn" OnClick="ModalCloseClick" runat="server" CssClass="btn btn-secondary" Style="background-color: white; color: black; border-radius: 5px;" Text="Close" />
                            </div>
                        </div>
                    </div>
                </div>

                <!-- **********************************************************************************************NEW MODAL SYSTEM FOR ORDERS -->

                <asp:Panel ID="chartsDiv" runat="server" Visible="false">
                    <!--Purpose task-->
                    <div class="task widget-primary" style="width: 30%; height: 340px; visibility: hidden;">
                        <div class="widget-body">
                            <div class="text-muted">Activity chart </div>
                            <br />
                            <div style="width: 100%; height: 300px;" id="chart_div"></div>
                        </div>
                        <div>
                            <asp:Label ID="lbActivityChart" runat="server" CssClass="text-muted"></asp:Label>
                        </div>
                    </div>

                    <!--Purpose task-->

                    <!--Progress task-->

                    <%--<div class="task widget-warning">
            <div class="widget-body">
                <div class="text-muted">Progress Chart</div><br />
                <div style="width:100px;height:100px;" id="chart_div_Progress"></div>
            </div>
            <div><asp:Label ID="lbProgressChart" runat="server" CssClass="text-muted"></asp:Label></div>
        </div>
        <!--Progress task-->

        <!--Completed-->
        <div class="task widget-info">
            <div class="widget-body">
                <div class="text-muted">Task Progress</div><br />
                <div style="width:100px;height:100px;" id="chart_div_TaskStatus"></div>
            </div>
            <div><asp:Label ID="lbTaskProgress" runat="server" CssClass="text-muted"></asp:Label> </div>
        </div>

        <!--Completed-->
        <!--Routine Tasks-->
        <div class="task widget-info">
            <div class="widget-body">
                <div class="text-muted">Routine Task</div><br />
                <div style="width:100px;height:100px;" id="chart_div_PurposeStatus"></div>
            </div>
            
            <div><asp:Label ID="lbRoutineTask" runat="server" CssClass="text-muted"></asp:Label> </div>
        </div>
        
      

        <!--Warning Tasks-->
        <div class="task widget-info">
            <div class="widget-body">
                <div class="text-muted">Warning Task</div><br />
                <div style="width:100px;height:100px;" id="chart_div_WarningTask"></div>
            </div>
            
            <div><asp:Label ID="lbWarningTask" runat="server" CssClass="text-muted"></asp:Label> </div>
        </div>--%>
                    <div class="task widget-info" style="width: 32%; height: 340px; visibility: hidden;">
                        <div class="widget-body">
                            <div class="text-muted">Status Nature - Denoted by Border Style. Sorted by priority (descending manner). </div>
                            <br />
                            <div style="width: 100%; height: 310px;" id="All Status">
                                <div style="border-width: 3px; border-style: solid; border-color: #B500FF; width: 100%; height: 40px; border-radius: 15px;">
                                    <asp:ImageButton runat="server" ImageAlign="Left" ID="ImageButton1" BorderStyle="Outset" BorderColor="White" BorderWidth="2" Width="12%" Height="37px" ImageUrl="~/images/Tasks.jpg" OnClick="ImageButton1_Click"></asp:ImageButton>
                                    <asp:Button ID="TasksBtn" runat="server" Style="background-color: white; height: 40px; width: 73%; border-style: outset; border-width: 3px; border-color: white; cursor: pointer; font-family: Arial; font-size: small; font-weight: 200;" Text="Project Tasks" OnClick="TasksBtn_Click" />
                                    <asp:Label ID="Label2" Width="10%" runat="server" CssClass="label" Font-Bold="true" Font-Size="medium"></asp:Label>&nbsp
                                </div>
                                <div style="border-width: 3px; border-style: solid; border-color: #DAA520; width: 100%; height: 43px; border-radius: 15px;">
                                    <asp:ImageButton runat="server" ImageAlign="Left" ID="ImageMap2" BorderStyle="Outset" BorderColor="White" BorderWidth="2" Width="12%" Height="37px" ImageUrl="~/images/RoutineTasks.PNG" OnClick="ImageMap2_Click"></asp:ImageButton>
                                    <asp:Button ID="RoutineActivitiesBtn" runat="server" Style="background-color: white; height: 40px; width: 73%; border-style: outset; border-width: 3px; border-color: white; cursor: pointer; font-family: Arial; font-size: small; font-weight: 200;" Text="Routine Activities" OnClick="RoutineActivitiesBtn_Click" />
                                    <asp:Label ID="Label1" runat="server" Width="10%" CssClass="label" Font-Bold="true" Font-Size="medium"></asp:Label>
                                </div>
                                <div style="border-width: 3px; border-style: inset; border-color: #CCFF00; width: 100%; height: 43px; border-radius: 15px;">

                                    <asp:ImageButton runat="server" ImageAlign="Left" ID="ImageMap1" BorderStyle="Outset" BorderColor="White" BorderWidth="2" Width="12%" Height="37px" ImageUrl="~/images/Crm.PNG" OnClick="ImageMap1_Click"></asp:ImageButton>
                                    <asp:Button ID="CRMClick" runat="server" Style="background-color: white; height: 40px; width: 73%; border-style: outset; border-width: 3px; border-color: white; cursor: pointer; font-family: Arial; font-size: small; font-weight: 200;" Text="CRM Related Tasks" OnClick="CRMClick_Click" />
                                    <asp:Label ID="Label6" Width="10%" runat="server" CssClass="label" Font-Bold="true" Font-Size="medium"></asp:Label>
                                </div>
                                <div style="border-width: 3px; border-style: groove; border-color: #F0AEE6; width: 100%; height: 43px; border-radius: 15px;">
                                    <asp:ImageButton runat="server" ImageAlign="Left" ID="ImageButton2" BorderStyle="Outset" BorderColor="White" BorderWidth="2" Width="12%" Height="37px" ImageUrl="~/images/FromMobile.png" OnClick="ImageButton2_Click"></asp:ImageButton>
                                    <asp:Button ID="FromMobileBtn" runat="server" Style="background-color: white; height: 40px; width: 73%; border-style: outset; border-width: 3px; border-color: white; cursor: pointer; font-family: Arial; font-size: small; font-weight: 200;" Text="Tasks from field" OnClick="FromMobileBtn_Click" />
                                    <asp:Label ID="Label3" Width="10%" runat="server" CssClass="label" Font-Bold="true" Font-Size="medium"></asp:Label>
                                </div>
                                <div style="border-width: 3px; border-style: solid; border-color: #FF4500; width: 100%; height: 43px; border-radius: 15px;">
                                    <asp:ImageButton runat="server" ImageAlign="Left" ID="ImageButton3" BorderStyle="Outset" BorderColor="White" BorderWidth="2" Width="12%" Height="37px" ImageUrl="~/images/Replan.PNG" OnClick="ImageButton3_Click"></asp:ImageButton>
                                    <asp:Button ID="ReplanBtn" runat="server" Style="background-color: white; height: 40px; width: 73%; border-style: outset; border-width: 3px; border-color: white; cursor: pointer; font-family: Arial; font-size: small; font-weight: 200;" Text="Tasks carried forward." OnClick="ReplanBtn_Click" />
                                    <asp:Label ID="Label4" Width="10%" runat="server" CssClass="label" Font-Bold="true" Font-Size="medium"></asp:Label>

                                </div>
                                <div style="border-width: 3px; border-style: outset; border-color: #000000; width: 100%; height: 43px; border-radius: 15px;">
                                    <asp:ImageButton runat="server" ImageAlign="Left" ID="ImageButton4" BorderStyle="Outset" BorderColor="White" BorderWidth="2" Width="12%" Height="37px" ImageUrl="~/images/warning.png" OnClick="ImageButton4_Click"></asp:ImageButton>
                                    <asp:Button ID="WarningBtn" runat="server" Style="background-color: white; height: 40px; width: 73%; border-style: outset; border-width: 3px; border-color: white; cursor: pointer; font-family: Arial; font-size: small; font-weight: 200;" Text="Warnings - Tasks Delayed" OnClick="WarningBtn_Click" />
                                    <asp:Label ID="Label5" Width="10%" runat="server" CssClass="label" Font-Bold="true" Font-Size="medium"></asp:Label>
                                </div>
                                <div style="border-width: 3px; border-style: Dashed; border-color: #000000; width: 100%; height: 43px; border-radius: 15px;">
                                    <asp:ImageButton runat="server" ImageAlign="Left" ID="ImageButton5" BorderStyle="Outset" BorderColor="White" BorderWidth="2" Width="12%" Height="37px" ImageUrl="~/images/DelayedIcon.png" OnClick="ImageButton5_Click"></asp:ImageButton>
                                    <asp:Button ID="DelayedBtn" runat="server" Style="background-color: white; height: 40px; width: 73%; border-style: outset; border-width: 3px; border-color: white; cursor: pointer; font-family: Arial; font-size: small; font-weight: 200;" Text="Delayed beyond the expiry" OnClick="DelayedBtn_Click" />
                                    <asp:Label ID="Label22" Width="10%" runat="server" CssClass="label" Font-Bold="true" Font-Size="medium"></asp:Label>

                                </div>

                            </div>
                        </div>
                        <div>
                            <asp:Label ID="lbTaskProgress" runat="server" CssClass="text-muted"></asp:Label>
                        </div>
                    </div>
                    <div class="task widget-warning" style="width: 30%; height: 340px; visibility: hidden;">
                        <div class="widget-body">
                            <div class="text-muted">Progress Chart</div>
                            <br />
                            <div style="width: 100%; height: 280px;" id="chart_div_Progress"></div>
                            <asp:Label ID="Label13" runat="server" CssClass="label" Text="Planned - "></asp:Label><asp:Label ID="Label14" runat="server" CssClass="label"></asp:Label>&nbsp<asp:Label ID="Label15" runat="server" CssClass="label" Text="Running - "></asp:Label>
                            <asp:Label ID="Label16" runat="server" CssClass="label" ForeColor="DarkOliveGreen"></asp:Label>&nbsp<asp:Label ID="Label17" runat="server" CssClass="label" Text="Pending - "></asp:Label><asp:Label ID="Label18" runat="server" CssClass="label"></asp:Label>&nbsp<asp:Label ID="Label19" runat="server" CssClass="label" Text="Completed - "></asp:Label><asp:Label ID="Label20" runat="server" CssClass="label" ForeColor="DarkOliveGreen"></asp:Label>
                        </div>
                        <div>
                            <asp:Label ID="lbProgressChart" runat="server" CssClass="text-muted"></asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <%--   <asp:Panel ID="ForHorror" runat="server" Visible="false">--%>
                <input id="ForModalHdn" name="ForModalHdn" value="<%= this.InputValue %>" type="text" style="visibility: hidden;" />
                <input id="ForModalHdn2" name="ForModalHdn2" value="<%= this.InputValue %>" type="text" style="visibility: hidden;" />

                <div class="overview" style="width: 100%; max-width: 100%; min-width: 100%; text-align: center;">
                    <asp:HiddenField ID="PickUpHdn" runat="server" Value="0" />
                    <asp:ObjectDataSource ID="CompanyDataSource" runat="server" SelectMethod="GetCompany" TypeName="ObjectDataSet" />
                    <telerik:RadComboBox ID="Company_Unit_Name" runat="server" DataTextField="Company_Unit_Name" DataSourceID="CompanyDataSource" DataValueField="Unit_Id"></telerik:RadComboBox>
                    <asp:LinkButton Visible="false" runat="server" ID="Excel" OnClick="Time_Sheet_Master_ExcelDownload" Enabled="false" Text="Excel Sheet" />
                </div>

            </div>
        </div>
        <!--md9-->


    </div>
    <!--container-->
    <!-- <div style="color:#ebebeb"></div> -->
    <!-- ***************************************************************************************************** -->

    <script type="text/javascript">
        $(document).ready(function () {

            $("table").footable();
        }
        )
    </script>


    <%-- </ContentTemplate>
    </asp:UpdatePanel>--%>
    <script language="javascript" type="text/javascript">

        if (document.getElementById("<%=DateFrom.ClientID %>").value == "") {
            FnAssignDateDuration("<%=DateFrom.ClientID %>", "<%=DateTo.ClientID %>", 2, "D");
        }

    </script>

    <script src="~/js/jquery.js"></script>
    <script src="~/js/bootstrap.js"></script>
    <script src="~/js/site.js" asp-append-version="true"></script>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script type="text/javascript">

        var myframe = document.getElementById('orderIframe')

        if (document.getElementById('ForModalHdn').value !== '0' && document.getElementById('ForModalHdn').value !== '') {
            // alert(document.getElementById('ForModalHdn').value);
            $('#orderModal').modal('show');
            var isrc = document.getElementById('ForModalHdn').value;
            myframe.src = isrc;
            document.getElementById('ForModalHdn').value = "0";


        }
        else {
            $('#orderModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget)
                var isrc = button.data('whatever') // Extract info from data-* attributes
                var modal = $(this)
                myframe.src = isrc;
            })
        }

        function setModalHeight() {

            var myheight = document.documentElement.clientHeight;
            var fixedheight = (Math.floor((myheight * 68) / 100)).toString();
            var finalheight = fixedheight + "px";
            myframe.style.height = finalheight;

        }
        window.onload = setModalHeight;

    </script>


    <script type="text/javascript">

        var startDateTime = new Date(); // YYYY (M-1) D H m s ms (start time and date from DB)
        var startStamp = startDateTime.getTime();

        var newDate = new Date();
        var newStamp = newDate.getTime();

        var timer;

        var secForAuto = 0;
        var secForAutoCheck = 30;

        function updateClock() {
            newDate = new Date();
            newStamp = newDate.getTime();
            var diff = Math.round((newStamp - startStamp) / 1000);

            var d = Math.floor(diff / (24 * 60 * 60)); /* though I hope she won't be working for consecutive days :) */
            diff = diff - (d * 24 * 60 * 60);
            var h = Math.floor(diff / (60 * 60));
            diff = diff - (h * 60 * 60);
            var m = Math.floor(diff / (60));
            diff = diff - (m * 60);
            var s = diff;



            if (h === 0 && m === 0) {
                document.getElementById("SyncBadge").innerHTML = "Since last Sync : " + s + " sec";
                secForAuto += 1;
                secForAutoCheck += 1;
            } else if (h === 0 && m > 0) {
                document.getElementById("SyncBadge").innerHTML = "Since last Sync : " + m + " min : " + s + " sec";

                secForAuto += 1;
                secForAutoCheck += 1;
            }
            else {
                document.getElementById("SyncBadge").innerHTML = "Since last Sync : " + h + " hr : " + m + " min : " + s + " sec";

                secForAuto += 1;
                secForAutoCheck += 1;
            }

            if (secForAuto > 60) {
                if ($('#orderModal').is(':visible') || $('.collapse').hasClass('in') || $('.modal').hasClass('in')) {
                    secForAuto = 0;
                } else {
                    secForAuto = 0;
                    document.getElementById("<%= SyncBtn.ClientID %>").click();
                }

            }
            if (secForAutoCheck > 600) {

                if ($('#orderModal').is(':visible') || $('.collapse').hasClass('in') || $('.modal').hasClass('in')) {
                    secForAutoCheck = 0;

                } else {
                    secForAutoCheck = 0;
                    document.getElementById("<%= SyncBtn.ClientID %>").click();
                       <%-- if (navigator.onLine) {
                            document.getElementById("<%= SyncBtn.ClientID %>").click();
                        }
                        else {
                             document.getElementById("<%= SyncBtn.ClientID %>").click();
                            alert('No Net');
                        }--%>

                    //hostReachable();
                }

            }
        }
        setInterval(updateClock, 1000);

        document.onmousemove = resetTimer;
        document.onkeypress = resetTimer;
        document.onmousedown = resetTimer;
        document.ontouchstart = resetTimer;
        document.onclick = resetTimer;
        document.onscroll = resetTimer;

        function resetTimer() {
            secForAuto = 0;
            secForAutoCheck = 0;
        }

    </script>
    <script type="text/javascript">
        function hostReachable() {

            // Handle IE and more capable browsers
            var xhr = new (window.ActiveXObject || XMLHttpRequest)("Microsoft.XMLHTTP");
            var status;

            // Open new request as a HEAD to the root hostname with a random param to bust the cache
            xhr.open("HEAD", "//" + window.location.hostname + "/?rand=" + Math.floor((1 + Math.random()) * 0x10000), false);

            // Issue request and handle response
            try {
                xhr.send();
     <%-- if (document.getElementById("<%=PickUpHdn.ClientID %>").value == "1") {
          document.getElementById("<%= SyncBtn.ClientID %>").click()
          //alert("Order to be Picked up. In 1 minute the order will expire. Close this popup to continue recieving service requests.");
      }
      else {
           <%--document.getElementById("<%= SyncBtn.ClientID %>").click();
      }--%>
                return (xhr.status >= 200 && (xhr.status < 300 || xhr.status === 304));
            } catch (error) {
                alert("Internet not Available");
                document.getElementById("<%= SyncBtn.ClientID %>").click();


                //return false;
            }

        }
    </script>
    <script>

        var openStatus = localStorage['storedStatus'] || 'defaultValue';
        var sidenav = document.getElementById("mysidenavOpt");
        var main = document.getElementById("main");
        if (openStatus === 'open') {

            sidenav.style.width = "250px";
            main.style.marginLeft = "250px";

        }
        //window.localStorage.setItem((1), "test");
        //alert( window.localStorage.getItem(1))
        function openNav() {


            // alert(document.getElementById("mysidenavOpt").style.width)
            if (!document.getElementById("mysidenavOpt").style.width || document.getElementById("mysidenavOpt").style.width === "0px") {

                document.getElementById("mysidenavOpt").style.width = "250px";
                document.getElementById("main").style.marginLeft = "250px";
                localStorage['storedStatus'] = 'open';
            }

            else {
                closeNav();
                localStorage['storedStatus'] = 'close';
            }
        }


        function closeNav() {
            document.getElementById("mysidenavOpt").style.width = "0";
            document.getElementById("main").style.marginLeft = "0";

        }

    </script>

    <!-- ***************************************************************************************************** -->


    <!-- ***************************************************TIME PICKER  -->
    <script type="text/javascript" src="../Script/TimePicker/dist/bootstrap-clockpicker.js"></script>
    <script type="text/javascript">
        $('.clockpicker').clockpicker()
            .find('input').change(function () {
                // TODO: time changed
                //console.log(this.value);
            });
        $('#timeinput').clockpicker({
            autoclose: true



        });

        if (something) {
            // Manual operations (after clockpicker is initialized).
            $('#timeinput').clockpicker('show') // Or hide, remove ...
                .clockpicker('toggleView', 'minutes');
        }
    </script >


    <!-- *************************************************** TIME PICKER-- >

    <!-- *************************************************************************************** -->

            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            $("[id$=DateFrom]").datepicker({
                showOn: 'button',
                buttonImageOnly: true,
                buttonImage: 'https://cdn0.iconfinder.com/data/icons/stuttgart/16/calendar.png'
            });
      });
    </script>
    <script type="text/javascript">
    $(function () {
            $("[id$=DateTo]").datepicker({
                showOn: 'button',
                buttonImageOnly: true,
                buttonImage: 'https://cdn0.iconfinder.com/data/icons/stuttgart/16/calendar.png'
            });
    });
    </script>

    <!-- *************************************************************************************** -->

</asp:Content>
