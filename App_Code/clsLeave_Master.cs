using System;using System.Collections.Generic;using System.Web;using System.Web.UI;using System.Web.UI.WebControls;using System.Web.UI.HtmlControls;using System.Configuration;using System.Data.SqlClient;using System.Data;public  class clsLeave_Master : System.Web.UI.Page{	string connectionstring;	public clsLeave_Master()	{		try		{			 connectionstring=Convert.ToString(ConfigurationManager.AppSettings["connectionstring"]);		}		catch(Exception err)		{			 //tdMessage.innerHtml=		}	}	public void BindGridView(string strQuery, GridView GridObject)	{		GridObject.DataSource = ReturnDataTable(strQuery);		GridObject.DataBind();	}	public void WarningMessage(string strMessage,HtmlTableCell objCell)	{		objCell.InnerHtml = "<span class='warningstyle'>"+ strMessage + "</span>";	}	public void SuccessMessage(string strMessage,HtmlTableCell objCell)	{		objCell.InnerHtml ="<span class='msgstyle'>"+ strMessage + "</span>";	}	public void BindDropDownList(string strQuery, DropDownList DropDownObject)	{		DropDownObject.DataSource = ReturnDataTable(strQuery);		DropDownObject.DataBind();	}	public void Sql_ExecuteNoNQuery(string strQuery)	{		using (SqlConnection con = new SqlConnection(connectionstring))		{			con.Open();			using (SqlCommand cmd = new SqlCommand(strQuery, con))			{				cmd.ExecuteNonQuery();			}		}	}

    public bool IsRecordExists(string strQuery)
    {
        using (SqlConnection con = new SqlConnection(connectionstring))
        {
            con.Open();
            using (SqlCommand cmd = new SqlCommand(strQuery, con))
            {
                using(SqlDataReader objReader = cmd.ExecuteReader())
                {
                    return objReader.HasRows;
                }
            }
        }
        
    }	public DataTable ReturnDataTable(string strQuery)	{		DataTable objTable = new DataTable();		DataSet objDataSet = new DataSet();		using (SqlConnection con = new SqlConnection(connectionstring))		{			con.Open();			using (SqlCommand cmd = new SqlCommand(strQuery, con))			{				using (SqlDataAdapter adaper = new SqlDataAdapter())				{					adaper.SelectCommand = cmd;					adaper.Fill(objDataSet);					objTable = objDataSet.Tables[0];				}			}		}		return objTable;	}	 public object ReturnValue(string strValue,string strDataType)	 {		 object objReturn = strValue;		 if (Convert.ToString(strValue)=="")		 {			 objReturn=DBNull.Value;		 }		switch (strDataType) 		{			    case "INT":				        objReturn = Convert.ToInt32(strValue);				 break;			  case "TINYINT":				objReturn = Convert.ToInt16(strValue);				break;			case "SMALLINT":				objReturn = Convert.ToInt32(strValue);				break;			case "BIGINT":				     objReturn = Convert.ToInt64(strValue);				     break;			case "VARCHAR":			case "CHAR":				     objReturn = Convert.ToString(strValue);				         break;			case "NVARCHAR":			case "NCHAR":				         objReturn = Convert.ToString(strValue);				         break;			case "DECIMAL":			case "NUMERIC":				         objReturn = Convert.ToDecimal(strValue);				         break;			case "FLOAT":			case "REAL":			case "MONEY":			case "SMALLMONEY":				         objReturn = Convert.ToDouble(strValue);				         break;			case "SMALLDATETIME":			case "DATETIME":			case "DATE":			case "TIME":				         Convert.ToDateTime(strValue);				    break;			case "BIT":				         Convert.ToBoolean(strValue);				    break;			}		 return objReturn;	}	public void GridTopPagerPosition(GridView Grid)	{		if (Grid.PageCount> 1)		{			TextBox objText = ((TextBox)(Grid.TopPagerRow.FindControl("CurrentPageIndex")));			if (objText is TextBox)			{				objText.Text = Convert.ToString(Grid.PageIndex + 1) + "/" + Convert.ToString(Grid.PageCount);			}		}	}	public void GridBottomPagerPosition(GridView Grid)	{		if (Grid.PageCount> 1)		{			TextBox objText = ((TextBox)(Grid.BottomPagerRow.FindControl("CurrentPageIndex")));			if (objText is TextBox)			{				objText.Text = Convert.ToString(Grid.PageIndex + 1) + "/" + Convert.ToString(Grid.PageCount);			}		}	}

    public string FnFormatCondition(string strValue, string strField, string strExists, string Session_Name)
    {
        string strReturn = strExists;
        if (strValue != "")
        {
            strReturn += (strExists != "") ? " AND " + strField + "='" + strValue + "'" : " Where " + strField + "='" + strValue + "'";
        }
        Session[Session_Name] = strValue;
        return strReturn;
    }}