<%@ Page language="C#" MaintainScrollPositionOnPostback="true"  MasterPageFile="~/MainMasterPage.master" CodeFile="Leave_Master.aspx.cs" Inherits="Leave_Master"%>
  
		<asp:Content runat="server" id="HeadContentId" ContentPlaceHolderID="HeadContent">
			<script language = "javascript" type="text/javascript" src="../Script/FormResize.js"></script>
			 <script language = "javascript" type="text/javascript" src="../Script/Calender.js"></script>
             <script language = "javascript" type="text/javascript">
                function FnDateDifference1() {
                    FnDateDifference('<%=Leave_From.ClientID  %>', '<%=Leave_To.ClientID  %>', '<%=Total_Leave.ClientID  %>');
                }
             </script>
             <link href="../css/bootstrap_Flatly.css" rel="stylesheet" /> 
		</asp:Content>
  
		<asp:Content runat="server" id="MainContentId" ContentPlaceHolderID="MainContent">
                
    <div style="margin-top:150px; background-color:#f0f0f0; padding:0px;"class="container-fluid">
    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
        <ProgressTemplate>
            <div style="position: fixed; top: 0px; bottom: 0px; left: 0px; right: 0px; overflow: hidden; padding: 0; margin: 0; background-color: #F0F0F0; filter: alpha(opacity=50); opacity: 0.5; z-index: 100000;">
            </div>
            <div style="position: fixed; top: 40%; left: 40%; height: 20%; width: 20%; z-index: 100001; background-color: #FFFFFF; border: 2px solid #000000; background-image: url('../images/updateimg.gif'); background-repeat: no-repeat; background-position: center;">
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
			<table class="table-responsive" cellpadding="0" align="center" style="width:100%" cellspacing="0">
				<tr>
					<td align="center">
						<table class="table-responsive" cellpadding="0" cellspacing="0" style="width:100%">
							<tr>
								<td class="pageheading" style="width:75%" align="left">
									Leave Entry
								</td>
								<td style="width:25%">
									<div>
										<span><asp:Button runat="server" Id="Save_Button" CssClass="btn-sm btn-default" Text="Save" OnClick="Leave_Master_SaveToSql" /></span>
                                        <span><asp:Button runat="server" Id="Button2" CssClass="btn-sm btn-default" Text="Clear" OnClick="Leave_Master_NewForm" /></span>
                                         <span><asp:Button runat="server" Id="Button3" CssClass="btn-sm btn-default" Text="Delete" OnClick="Leave_Master_DeleteFromSql" /></span>
										<span onmouseover="FnShowFeatures(this)" onmouseout="FnHideFeatures(this)"><asp:Button Visible="false" runat="server" Id="More_Button" CssClass="menubutton" Text="More..." /></span>
									</div>
									<table cellpadding="5" cellspacing="0" id="featuresmenu" class="featuresmenu" onmouseout="FnHideFeatures(this)" border="0" onmouseover="this.style.display='';" style="width:100%;display:none">
										<tr>
											<td><asp:LinkButton runat="server" ID="Leave_Master_NewFormButtonId" onmouseover="featuremenuselected(this,1)" onmouseout="featuremenuselected(this,0)"  OnClick="Leave_Master_NewForm"  Text="New Form"></asp:LinkButton></td>
										</tr>
										<tr>
											<td><asp:LinkButton runat="server" ID="Leave_Master_Save"  onmouseover="featuremenuselected(this,1)" onmouseout="featuremenuselected(this,0)"  OnClick="Leave_Master_SaveToSql"  Text="Save"></asp:LinkButton></td>
										</tr>
										<tr>
											<td><asp:LinkButton runat="server" ID="Leave_Master_Delete" onmouseover="featuremenuselected(this,1)" onmouseout="featuremenuselected(this,0)"   OnClick="Leave_Master_DeleteFromSql"  Text="Delete"></asp:LinkButton></td>
										</tr>
										<tr style="display:none">
											<td>Report</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td runat="server" id="tdMessage" align="center" onclick="this.innerHTML='&nbsp;'">&nbsp;</td>
				</tr>
				<tr>
					<td align="center">
						<div class="divformlayout" style="width:100%;overflow:auto;">
							<table cellspacing="0"  class="formlayout" style="width:85%" cellpadding="4">
								<tr style="display:none">
									<td style="width:15%" class="label" align="left">
										Leave Id
									</td>
									<td style="width:50%" align="left">
										<asp:TextBox runat="server" class="form-control"  style="width:25%;" id="Leave_Id" name="Leave_Id" TextMode="SingleLine"></asp:TextBox>
									</td>
								</tr>
								<tr >
									<td style="width:15%" class="label" align="left">
										Company Name
									</td>
									<td style="width:50%" align="left">
										<asp:DropDownList runat="server"  style="width:50%;"  AutoPostBack="true" OnSelectedIndexChanged="Company_Name_OnSelectedIndexChanged" DataTextField="Company_Name"  DataValueField="Company_Id" CssClass="dropdown"  id="Company_Name" AppendDataBoundItems="true" name="Company_Name"><asp:ListItem Value="" Text="---Select---"></asp:ListItem></asp:DropDownList>
									</td>
								</tr>
								<tr >
									<td style="width:15%" class="label" align="left">
										Company Unit Name
									</td>
									<td style="width:50%" align="left">
										<asp:DropDownList runat="server"  style="width:50%;"  DataTextField="Company_Unit_Name"  DataValueField="Unit_Id" CssClass="dropdown" AutoPostBack="true" OnSelectedIndexChanged="Designation_Name_OnSelectedIndexChanged" id="Company_Unit_Name" AppendDataBoundItems="true" name="Company_Unit_Name"><asp:ListItem Value="" Text="---Select---"></asp:ListItem></asp:DropDownList>
									</td>
								</tr>
								<tr >
									<td style="width:15%" class="label" align="left">
										Department Name
									</td>
									<td style="width:50%" align="left">
										<asp:DropDownList runat="server"  style="width:50%;"  AutoPostBack="true" OnSelectedIndexChanged="Department_Name_OnSelectedIndexChanged" DataTextField="Department_Name"  DataValueField="Department_Id" CssClass="dropdown"  id="Department_Name" AppendDataBoundItems="true" name="Department_Name"><asp:ListItem Value="" Text="---Select---"></asp:ListItem></asp:DropDownList>
									</td>
								</tr>
								<tr >
									<td style="width:15%" class="label" align="left">
										Team Name
									</td>
									<td style="width:50%" align="left">
										<asp:DropDownList runat="server"  style="width:50%;"  DataTextField="Team_Name"  DataValueField="Team_Id" CssClass="dropdown"  id="Team_Name" AppendDataBoundItems="true" name="Team_Name"><asp:ListItem Value="" Text="---Select---"></asp:ListItem></asp:DropDownList>
									</td>
								</tr>
								<tr >
									<td style="width:15%" class="label" align="left">
										Designation Name
									</td>
									<td style="width:50%" align="left">
										<asp:DropDownList runat="server"  style="width:50%;"  AutoPostBack="true" OnSelectedIndexChanged="Designation_Name_OnSelectedIndexChanged" DataTextField="Designation_Name"  DataValueField="Designation_Id" CssClass="dropdown"  id="Designation_Name" AppendDataBoundItems="true" name="Designation_Name"><asp:ListItem Value="" Text="---Select---"></asp:ListItem></asp:DropDownList>
									</td>
								</tr>
								<tr >
									<td style="width:15%" class="label" align="left">
										Staff Name
									</td>
									<td style="width:50%" align="left">
                                   
                                    <asp:DropDownList runat="server"  style="width:50%;"  DataTextField="Staff_Name" AutoPostBack="true"  OnDataBinding="Approve_Control_Validation"  OnSelectedIndexChanged="Approve_Control_Validation" DataValueField="Staff_Id" CssClass="dropdown"  id="Staff_NameTxt" AppendDataBoundItems="true" name="Staff_Name"><asp:ListItem Value="0" Text="---Select---"></asp:ListItem></asp:DropDownList>
									</td>
								</tr>
                                <asp:Panel ID="OnlyLeave" Visible="true" runat="server">
                                <tr >
									<td style="width:15%" class="label" align="left">
										Leave Type
									</td>
									<td style="width:50%" align="left">
                                   
                                    <asp:DropDownList runat="server"  style="width:50%;"   CssClass="dropdown"  id="LeaveType" name="LeaveType">
                                        <asp:ListItem Value="C" Text="Casual"></asp:ListItem>
                                        <asp:ListItem Value="M" Text="Medical"></asp:ListItem>
                                     </asp:DropDownList>
									</td>
								</tr>
								<tr >
									<td style="width:15%" class="label" align="left">
										Leave From
									</td>
									<td style="width:50%" align="left">
										<asp:TextBox runat="server" class="form-control" style="width:50%;"  onchange="FnDateDifference1()"   id="Leave_From" name="Leave_From"  TextMode="SingleLine"></asp:TextBox><a href="#" onclick="javascript:showCalender(this,'<%=Leave_From.ClientID%>');"><img src="../images/cal.gif"  class="calenderimg" border="0"></a>
									</td>
								</tr>
								<tr >
									<td style="width:15%" class="label" align="left">
										Leave To
									</td>
									<td style="width:50%" align="left">
										<asp:TextBox runat="server" class="form-control" style="width:50%;" onchange="FnDateDifference1()"  id="Leave_To" name="Leave_To"  TextMode="SingleLine"></asp:TextBox><a href="#" onclick="javascript:showCalender(this,'<%=Leave_To.ClientID%>');"><img src="../images/cal.gif"  class="calenderimg" border="0"></a><span class="label"> For 1 day leave request, select same date as 'Leave From'.</span>
									</td>
								</tr>
								<tr >
									<td style="width:15%" class="label" align="left">
										Total Leave
									</td>
									<td style="width:50%" align="left">
										<asp:TextBox runat="server" class="form-control" style="width:50%;" id="Total_Leave" name="Total_Leave" TextMode="SingleLine"></asp:TextBox><span class="label"> For 1/2 day leave request, select same date for 'Leave From' and 'Leave To' and modify the Total Leave as 0.5 from 1.</span>
									</td>
								</tr>
								<tr >
									<td style="width:15%" class="label" align="left">
										Reason for leave 
									</td>
									<td style="width:50%" align="left">
										<asp:TextBox runat="server"  class="form-control"  style="width:95%" rows="4" id="Reason_for_leave" name="Reason_for_leave" TextMode="MultiLine"></asp:TextBox>
									</td>
								</tr>
								<tr >
									<td style="width:15%" class="label" align="left">
										Remarks
									</td>
									<td style="width:50%" align="left"><span class="label"> For 1/2 day leaves, please specify the Start Time of Leave and the End Time of Leave in the remarks.</span>
										<asp:TextBox runat="server"  class="form-control"  style="width:95%" rows="4" id="Remarks" name="Remarks" TextMode="MultiLine"></asp:TextBox>
									</td>
								</tr>     
                                    <asp:Panel ID="trApprove" runat="server" Visible="false">                       
                                <tr >
									<td style="width:15%" class="label" align="left">
										Select Leave Status
									</td>
									<td style="width:50%"  class="label" align="left">
                                    <asp:DropDownList  runat="server"  style="width:50%;"  CssClass="dropdown"  id="Leave_Approve" name="Leave_Approve">
                                        <asp:ListItem Value="" Text="---Select---"></asp:ListItem>
                                        <asp:ListItem Value="Cancelled" Text="Cancelled"></asp:ListItem>
                                        <asp:ListItem Value="Approved" Text="Approved"></asp:ListItem>
                                        <asp:ListItem Value="Not Approved" Text="Not Approved"></asp:ListItem>
                                    </asp:DropDownList>
									</td>
								</tr>
                                        </asp:Panel>  <br />
                                    </asp:Panel>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="right">
                                        <asp:Button CssClass="btn-sm btn-default" runat="server" ID="TargetBtn" text="Targets-Incentives" OnClick="TargetBtn_Click"   />&nbsp&nbsp<asp:Button CssClass="btn-sm btn-default" runat="server" ID="AdvancesRqst" text="Advances" OnClick="AdvancesRqst_Click" />&nbsp&nbsp<asp:Button CssClass="btn-sm btn-default" runat="server" ID="RateOrganization" text="Rate My Organization" OnClick="RateOrganizationClick"  />&nbsp&nbsp<asp:Button CssClass="btn-sm btn-default" runat="server" ID="RateCoWorkersBtn" text="Rate My Co-Workers" OnClick="RateCoWorkersBtnClick"   />
                                    </td>
                                </tr>  
                                 <asp:Panel ID="TargetsNIncentivesPanel" runat="server" Visible="false">
                                     <tr><td colspan="2">
                                          <asp:Label ID="TargetStatusLab" runat="server" CssClass="label" Font-Size="Medium" ></asp:Label>
                                         </td></tr>
                                       <tr>
                                           <td>
                                               <span class="label">Active Targets for the period :</span>
                                           </td>
                                           <td>
                                               <asp:Label ID="ActiveTargetLab" runat="server" CssClass="label" ></asp:Label>
                                           </td>
                                       </tr>   
                                      <tr>
                                           <td>
                                               <span class="label">Term of the target :</span>
                                           </td>
                                           <td>
                                               <asp:Label ID="TargetTerm" runat="server" CssClass="label"></asp:Label>
                                           </td>
                                       </tr>                                 
                                     <tr>
                                         <td>
                                             <span class="label">Total target amount :</span>
                                         </td>
                                         <td>
                                               <asp:Label ID="TargetAmtLab" runat="server" CssClass="label"></asp:Label>
                                           </td>
                                     </tr>
                                     <tr>
                                         <td>
                                             <span class="label">Total no of sales :</span>
                                         </td>
                                         <td>
                                               <asp:Label ID="TotalNoSaleLab" runat="server" CssClass="label" ></asp:Label>
                                           </td>
                                     </tr>
                                     <tr>
                                         <td>
                                             <span class="label">Total amount of sales acheived :</span>
                                         </td>
                                         <td>
                                               <asp:Label ID="TotalSaleAmtLab" runat="server" CssClass="label" ></asp:Label>
                                           </td>
                                     </tr>
                                     <tr>
                                         <td colspan="2">
                                                    <asp:GridView ID="TargetsGrid" runat="server" Width="100%" Font-Names="arial" Font-Size="small"  Caption="Active Targets for the term." ></asp:GridView>
                                         </td>
                                     </tr>
                                       <tr>
                                         <td colspan="2">
                                                    <asp:GridView ID="IncentivesGrid" runat="server" Width="100%" Font-Names="arial" Font-Size="small" Caption="Your sales records for the month." ></asp:GridView>
                                         </td>
                                     </tr>
                                    </asp:Panel>                            
                                 <asp:Panel ID="AdvanceApproval" runat="server" Visible="false">
                                       <tr><td colspan="2">
                                           <table cellspacing="0"  class="table-bordered" style="width:100%" cellpadding="4">
                                               <tr style="display:none">
									<td style="width:15%" class="label" align="left">
										Advance Id
									</td>
									<td style="width:50%" align="left">
										<asp:TextBox runat="server" class="form-control"  style="width:25%;" id="Advance_Id" name="Advance_Id" TextMode="SingleLine"></asp:TextBox>
									</td>
								</tr>
                                               <tr>
                                                <td style="width:15%" class="label" align="left"><span class="label">Advance Amount :</span></td>
                                                <td style="width:50%" align="left"><asp:TextBox ID="AdvanceAmount" runat="server" CssClass="form-control" OnTextChanged="AdvanceAmount_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                     <span class="label">Enter whole amount with out spaces or '.' or ','.</span>
                                                </td>
                                              </tr>
                                               <tr>
                                                <td style="width:15%" class="label" align="left"><span class="label">Instalments :</span></td>
                                                <td style="width:50%" align="left"><asp:TextBox ID="InstalmentsTxt" runat="server" CssClass="form-control" Text="1" ReadOnly="true"></asp:TextBox>
                                                    <%-- <span class="label">Approvals might be difficult for multiple instalments.</span>--%>
                                                    <asp:RadioButtonList ID="InstRad" runat="server" CssClass="label" AutoPostBack="true" OnSelectedIndexChanged="InstRad_SelectedIndexChanged"><asp:ListItem Selected="True" Text="1 Month" Value="1"></asp:ListItem><asp:ListItem  Text="2 Months" Value="2"></asp:ListItem><asp:ListItem  Text="3 Months" Value="3"></asp:ListItem></asp:RadioButtonList>
                                                </td>
                                              </tr>
                                                <tr>
                                                <td style="width:15%" class="label" align="left"><span class="label">Instalment Amount :</span></td>
                                                <td style="width:50%" align="left"><asp:TextBox ID="InstalmentAmotText" runat="server" CssClass="form-control" Text="" ReadOnly="true" ></asp:TextBox>
                                                   
                                                </td>
                                                    
                                              </tr>
                                                <tr>
                                                <td style="width:15%" class="label" align="left"><span class="label">Remarks :</span></td>
                                                <td style="width:50%" align="left"><asp:TextBox ID="AdvanceRemarksTxt" runat="server" CssClass="form-control" Text="" TextMode="MultiLine" rows="4" style="width:95%;"></asp:TextBox></td>
                                              </tr>                                              
                                               <tr>
                                                <td colspan="2" align="right"><asp:Button CssClass="btn-sm btn-default" runat="server" ID="SubmitRequest" text="Submit" OnClick="SubmitRequest_Click"   /><asp:Button CssClass="btn-sm btn-default" runat="server" ID="DeleteAdvanceBtn" text="Delete" OnClick="Button2_Click1"  visible="false" /></td>
                                              </tr>
                                               <tr runat="server" id="trAdvanceApprovals" visible="false">
                                                 <td colspan="2"><table width="100%" class="table-bordered">
                                                     <tr>
                                                         <td style="width:15%" class="label" align="left">
										Advances Approval
									</td>
									<td style="width:50%" align="left">
                                    <asp:DropDownList runat="server"  style="width:50%;"   CssClass="dropdown"  id="AdvancesApprovalDD" name="AdvancesApprovalDD">
                                        <asp:ListItem Value="" Text="---Select---"></asp:ListItem>
                                        <asp:ListItem Value="Cancelled" Text="Cancelled"></asp:ListItem>
                                        <asp:ListItem Value="Approved" Text="Approved"></asp:ListItem>
                                        <asp:ListItem Value="Not Approved" Text="Not Approved"></asp:ListItem>
                                    </asp:DropDownList>
									</td>
                                                     </tr>
                                                     <tr>
                                                          <td style="width:15%" class="label" align="left">
										Approval Remarks
									</td>
									<td style="width:50%" align="left">
                                        <asp:TextBox ID="ApprovalRemarks" runat="server" CssClass="form-control" Text="" TextMode="MultiLine" rows="4" ></asp:TextBox>
                                        </td>
                                                     </tr>
                                                     <tr>
                                                         <td style="width:15%" class="label" align="left"></td>
                                                         <td style="width:50%" align="left">
                                                             <asp:Button CssClass="btn-sm btn-default" runat="server" ID="ApproveButton" text="Save Status" OnClick="ApproveButton_Click"   />
                                                         </td>
                                                     </tr>
                                                                 </table></td>
								</tr>
                                           </table>
                                    </td></tr>
                                    </asp:Panel>
                                <asp:Panel ID="AdvancesGridPanel" runat="server" Visible="false">
                                <tr>
                                    <td colspan="2" style="padding-bottom:0px">
                                        <table class="table-bordered"" >
                                            <tr>
                                                <td style="width:30%">
                                                    <asp:DropDownList style="width:80%" runat="server"  class="dropdown" ID="DropDownList1">
                                                        <asp:ListItem Text="Staff Name" Value="Staff_Name"></asp:ListItem>
                                                        <asp:ListItem Text="Company Unit Name" Value="Entered_Unit"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                 <td style="width:30%">
                                                    <asp:TextBox runat="server" style="width:80%" class="form-control" ID="TextBox1"></asp:TextBox>
                                                </td>
                                                <td style="width:20%">
                                                    <asp:Button runat="server" Id="Button1" CssClass="btn-sm btn-default" Text="Search" OnClick="Search_AdvancesGridValue" />
                                                </td>
                                                 <td style="width:20%">
                                                    &nbsp;
                                                 </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
										<td style="width:100%;padding-top:0px" align="center" colspan="2">
<asp:GridView runat="server" style="width:100%" align="center" ID="AdvancesGrid" AllowPaging="true" OnPageIndexChanging="AdvancesGrid_OnPageIndexChanging" PageSize="10" AutoGenerateColumns="false">
											<Columns>
												<asp:TemplateField HeaderText="#" ItemStyle-Wrap="true" HeaderStyle-Wrap="false">
													<ItemTemplate>
														<asp:Label runat="server" ID="labelSerialNo" Text='<%#Eval("ID")%>'></asp:Label>
													</ItemTemplate>
													<HeaderStyle CssClass="gridcaption" />
													<ItemStyle CssClass="gridvalue" />
												</asp:TemplateField>
											</Columns>
											<Columns>
												<asp:TemplateField HeaderText="Staff Name " ItemStyle-Wrap="true" HeaderStyle-Wrap="false">
													<ItemTemplate>
														<asp:LinkButton runat="server" ID="LinkStaff_Name"  CommandName='<%#Eval("ID") %>'  CommandArgument='<%#Eval("ID") %>'  OnCommand="AdvancesGrid_Master_EditReload"  Text='<%#Eval("Staff_Name")%>'></asp:LinkButton>
													</ItemTemplate>
													<HeaderStyle CssClass="gridcaption" />
													<ItemStyle CssClass="gridvalue" />
												</asp:TemplateField>
											</Columns>
											<Columns>
												<asp:TemplateField HeaderText="Advance Amount " ItemStyle-Wrap="true" HeaderStyle-Wrap="false">
													<ItemTemplate>
														<asp:Label runat="server" ID="labelLeave_From" Text='<%#Eval("Advance_Amt")%>'></asp:Label>
													</ItemTemplate>
													<HeaderStyle CssClass="gridcaption" />
													<ItemStyle CssClass="gridvalue" />
												</asp:TemplateField>
											</Columns>
											<Columns>
												<asp:TemplateField HeaderText="Instalments " ItemStyle-Wrap="true" HeaderStyle-Wrap="false">
													<ItemTemplate>
														<asp:Label runat="server" ID="labelLeave_To" Text='<%#Eval("Instalments")%>'></asp:Label>
													</ItemTemplate>
													<HeaderStyle CssClass="gridcaption" />
													<ItemStyle CssClass="gridvalue" />
												</asp:TemplateField>
											</Columns>
											<Columns>
												<asp:TemplateField HeaderText="Instalment Amount " ItemStyle-Wrap="true" HeaderStyle-Wrap="false">
													<ItemTemplate>
														<asp:Label runat="server" ID="labelTotal_Leave" Text='<%#Eval("Instalment_Amt")%>'></asp:Label>
													</ItemTemplate>
													<HeaderStyle CssClass="gridcaption" />
													<ItemStyle CssClass="gridvalue" />
												</asp:TemplateField>
											</Columns>
											<Columns>
												<asp:TemplateField HeaderText="Remarks " ItemStyle-Wrap="true" HeaderStyle-Wrap="false">
													<ItemTemplate>
														<asp:Label runat="server" ID="labelReason_for_leave" Text='<%#Eval("Remarks")%>'></asp:Label>
													</ItemTemplate>
													<HeaderStyle CssClass="gridcaption" />
													<ItemStyle CssClass="gridvalue" />
												</asp:TemplateField>
											</Columns>
                                            <Columns>
												<asp:TemplateField HeaderText="Approval Status " ItemStyle-Wrap="true" HeaderStyle-Wrap="false">
													<ItemTemplate>
														<asp:Label runat="server" ID="labelApprovalStatus" Text='<%#Eval("Approval_Status")%>'></asp:Label>
													</ItemTemplate>
													<HeaderStyle CssClass="gridcaption" />
													<ItemStyle CssClass="gridvalue" />
												</asp:TemplateField>
											</Columns>
                                             <Columns>
												<asp:TemplateField HeaderText="Approval Date " ItemStyle-Wrap="true" HeaderStyle-Wrap="false">
													<ItemTemplate>
														<asp:Label runat="server" ID="labelApprovalDate" Text='<%#Eval("ApprovedDate")%>'></asp:Label>
													</ItemTemplate>
													<HeaderStyle CssClass="gridcaption" />
													<ItemStyle CssClass="gridvalue" />
												</asp:TemplateField>
											</Columns>
                                             <Columns>
												<asp:TemplateField HeaderText="Approved By " ItemStyle-Wrap="true" HeaderStyle-Wrap="false">
													<ItemTemplate>
														<asp:Label runat="server" ID="labelApprovedBy" Text='<%#Eval("ApprovedBy")%>'></asp:Label>
													</ItemTemplate>
													<HeaderStyle CssClass="gridcaption" />
													<ItemStyle CssClass="gridvalue" />
												</asp:TemplateField>
											</Columns>

											<PagerTemplate>
												<table class="table-bordered">
													<tr>
														<td>
															<asp:Button runat = "server" CssClass="btn-sm btn-default" CommandName="Page" CommandArgument="First" Text = "First" Id = "MoveFirst" />
														</td>
														<td>
															<asp:Button runat = "server" CssClass="btn-sm btn-default" CommandName="Page" CommandArgument="Prev" Text = "Previous" Id = "MovePrevious" />
														</td>
														<td>
															<asp:Textbox runat = "server" CssClass="btn-sm btn-default" size="5" ReadOnly="true" Id = "CurrentPageIndex" ></asp:Textbox>
														</td>
														<td>
															<asp:Button runat = "server" CssClass="btn-sm btn-default" CommandName="Page" CommandArgument="Next" Text = "Next" Id = "MoveNext" />
														</td>
														<td>
															<asp:Button runat = "server" CssClass="btn-sm btn-default" CommandName="Page" CommandArgument="Last" Text = "Last" Id = "MoveLast" />
														</td>
													</tr>
												</table>
											</PagerTemplate>
										</asp:GridView>									</td>
								</tr>
                                    </asp:Panel>
		                         <tr>
                                    <td colspan="2" width="100%">
                                        <table class="table-bordered" style="margin-top:20px; margin-bottom:20px;" >
                                            <tr><td colspan="3"><span class="label" style="font-size:medium;">Search among the leave records.</span><br /><br /></td></tr>
                                              <tr><td style="width:30%"><span class="label" style="visibility:hidden;">Search mode</span></td>
                                                  <td style="width:40%"><span class="label">Enter employee name</span></td>
                                                  <td style="width:30%"><span class="label">Hit button to submit query</span></td>
                                              </tr>
                                            <tr>
                                                <td style="width:30%">
                                                    <asp:DropDownList runat="server" CssClass="dropdown" ID="Search_Field" Visible="false">
                                                        <asp:ListItem Text="Staff Name" Value="Staff_Name"></asp:ListItem>
                                                        <asp:ListItem Text="Company Unit Name" Value="Entered_Unit"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                 <td style="width:40%">
                                                    <asp:TextBox runat="server" class="form-control" ID="Search_Value"></asp:TextBox>
                                                </td>
                                                <td style="width:30%">
                                                    <asp:Button runat="server" Id="Search_Button" CssClass="btn-sm btn-default" Text="Search" OnClick="Search_GridValue" />
                                                </td>                                                 
                                            </tr>
                                        </table>
                                    </td>
                                </tr>

								<tr>
										<td style="width:100%;padding-top:0px" align="center" colspan="2">
<asp:GridView runat="server" style="width:100%" align="center" ID="Grid_Leave_Master" AllowPaging="true" OnPageIndexChanging="Grid_Leave_Master_OnPageIndexChanging" PageSize="10" AutoGenerateColumns="false">
											<Columns>
												<asp:TemplateField HeaderText="#" ItemStyle-Wrap="true" HeaderStyle-Wrap="false">
													<ItemTemplate>
														<asp:Label runat="server" ID="labelSerialNo" Text='<%#Eval("Leave_Id")%>'></asp:Label>
													</ItemTemplate>
													<HeaderStyle CssClass="gridcaption" />
													<ItemStyle CssClass="gridvalue" />
												</asp:TemplateField>
											</Columns>
											<Columns>
												<asp:TemplateField HeaderText="Staff Name" ItemStyle-Wrap="true" HeaderStyle-Wrap="false">
													<ItemTemplate>
														<asp:LinkButton runat="server" ID="LinkStaff_Name"  CommandName='<%#Eval("Leave_Id") %>'  CommandArgument='<%#Eval("Leave_Id") %>'  OnCommand="Grid_Leave_Master_EditReload"  Text='<%#Eval("Staff_Name")%>'></asp:LinkButton>
													</ItemTemplate>
													<HeaderStyle CssClass="gridcaption" />
													<ItemStyle CssClass="gridvalue" />
												</asp:TemplateField>
											</Columns>
											<Columns>
												<asp:TemplateField HeaderText="Leave From" ItemStyle-Wrap="true" HeaderStyle-Wrap="false">
													<ItemTemplate>
														<asp:Label runat="server" ID="labelLeave_From" Text='<%#Eval("Leave_From")%>'></asp:Label>
													</ItemTemplate>
													<HeaderStyle CssClass="gridcaption" />
													<ItemStyle CssClass="gridvalue" />
												</asp:TemplateField>
											</Columns>
											<Columns>
												<asp:TemplateField HeaderText="Leave To" ItemStyle-Wrap="true" HeaderStyle-Wrap="false">
													<ItemTemplate>
														<asp:Label runat="server" ID="labelLeave_To" Text='<%#Eval("Leave_To")%>'></asp:Label>
													</ItemTemplate>
													<HeaderStyle CssClass="gridcaption" />
													<ItemStyle CssClass="gridvalue" />
												</asp:TemplateField>
											</Columns>
											<Columns>
												<asp:TemplateField HeaderText="Total Leave" ItemStyle-Wrap="true" HeaderStyle-Wrap="false">
													<ItemTemplate>
														<asp:Label runat="server" ID="labelTotal_Leave" Text='<%#Eval("Total_Leave")%>'></asp:Label>
													</ItemTemplate>
													<HeaderStyle CssClass="gridcaption" />
													<ItemStyle CssClass="gridvalue" />
												</asp:TemplateField>
											</Columns>
											<Columns>
												<asp:TemplateField HeaderText="Reason for leave " ItemStyle-Wrap="true" HeaderStyle-Wrap="false">
													<ItemTemplate>
														<asp:Label runat="server" ID="labelReason_for_leave" Text='<%#Eval("Reason_for_leave")%>'></asp:Label>
													</ItemTemplate>
													<HeaderStyle CssClass="gridcaption" />
													<ItemStyle CssClass="gridvalue" />
												</asp:TemplateField>
											</Columns>
                                            <Columns>
												<asp:TemplateField HeaderText="Approval Status " ItemStyle-Wrap="true" HeaderStyle-Wrap="false">
													<ItemTemplate>
														<asp:Label runat="server" ID="labelApprovalStatus" Text='<%#Eval("ApprovalStatus")%>'></asp:Label>
													</ItemTemplate>
													<HeaderStyle CssClass="gridcaption" />
													<ItemStyle CssClass="gridvalue" />
												</asp:TemplateField>
											</Columns>
                                             <Columns>
												<asp:TemplateField HeaderText="Approval Date " ItemStyle-Wrap="true" HeaderStyle-Wrap="false">
													<ItemTemplate>
														<asp:Label runat="server" ID="labelApprovalDate" Text='<%#Eval("ApprovedDate")%>'></asp:Label>
													</ItemTemplate>
													<HeaderStyle CssClass="gridcaption" />
													<ItemStyle CssClass="gridvalue" />
												</asp:TemplateField>
											</Columns>
                                             <Columns>
												<asp:TemplateField HeaderText="Entered By " ItemStyle-Wrap="true" HeaderStyle-Wrap="false">
													<ItemTemplate>
														<asp:Label runat="server" ID="labelApprovedBy" Text='<%#Eval("ApprovedBy")%>'></asp:Label>
													</ItemTemplate>
													<HeaderStyle CssClass="gridcaption" />
													<ItemStyle CssClass="gridvalue" />
												</asp:TemplateField>
											</Columns>

											<PagerTemplate>
												<table class="table-bordered">
													<tr>
														<td>
															<asp:Button runat = "server" CssClass="btn-sm btn-default" CommandName="Page" CommandArgument="First" Text = "First" Id = "MoveFirst" />
														</td>
														<td>
															<asp:Button runat = "server" CssClass="btn-sm btn-default" CommandName="Page" CommandArgument="Prev" Text = "Previous" Id = "MovePrevious" />
														</td>
														<td>
															<asp:Textbox runat = "server" CssClass="btn-sm btn-default" size="5" ReadOnly="true" Id = "CurrentPageIndex" ></asp:Textbox>
														</td>
														<td>
															<asp:Button runat = "server" CssClass="btn-sm btn-default" CommandName="Page" CommandArgument="Next" Text = "Next" Id = "MoveNext" />
														</td>
														<td>
															<asp:Button runat = "server" CssClass="btn-sm btn-default" CommandName="Page" CommandArgument="Last" Text = "Last" Id = "MoveLast" />
														</td>
													</tr>
												</table>
											</PagerTemplate>
										</asp:GridView>									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			</table>
             </ContentTemplate>
    </asp:UpdatePanel>
        </div>
</asp:Content>