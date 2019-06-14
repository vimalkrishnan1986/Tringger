using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for BasePage
/// </summary>
public class BasePage : Page
{
    protected string _loginId { get; set; }
    const string _loginIdKey = "Login_Id";

    public static string connectionstring
    {
        get
        {
            return Constants.ConnectionString;
        }
    }

    public static DateTime CurrentTime
    {
        get
        {
            return DateTime.UtcNow.AddHours(5).AddMinutes(30);
        }

    }

    protected T GetQueryStringValue<T>(String key)
    {
        if (Request.QueryString[key] == null)
        {
            return default(T);

        }
        return (T)TypeDescriptor.GetConverter(typeof(T)).ConvertFromInvariantString(Request.QueryString[key]);
    }

    protected virtual void Page_Init(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // to be removed after testing
          //  SessionHelper.AddtoSession<int>(_loginIdKey, 8027);
            try
            {
                _loginId = SessionHelper.GetSessionValue<string>(_loginIdKey);
            }
            catch (KeyNotFoundException)
            {
                FormsAuthentication.SignOut();
            }
        }

    }


    public string FormattedDate(DateTime dateValue)
    {
        string[] aryMonth = new string[] { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
        return dateValue.Day + "-" + aryMonth[dateValue.Month - 1] + "-" + dateValue.Year;
    }

    protected void BindGridView(string strQuery, GridView GridObject)
    {
        GridObject.DataSource = FillTable(strQuery);
        GridObject.DataBind();

    }

    public void BindDataSet(string strQuery, DataList DataListObject)
    {
        DataListObject.DataSource = FillTable(strQuery);
        DataListObject.DataBind();
    }

    protected void BindListBox(string strQuery, ListBox ListBoxObject)
    {
        ListBoxObject.DataSource = FillTable(strQuery);
        ListBoxObject.DataBind();

    }

    protected void WarningMessage(string strMessage, HtmlTableCell objCell)
    {
        try
        {
            objCell.InnerHtml = "<span class='warningstyle'>" + strMessage + "</span>";
        }
        catch
        {
        }
    }

    protected bool IsValid_Duration(string DateFrom, string DateTo)
    {
        if (!string.IsNullOrEmpty(DateFrom) && !string.IsNullOrEmpty(DateTo))
            return (Convert.ToDateTime(DateFrom) <= Convert.ToDateTime(DateTo));

        return false;

    }

    protected bool Validate_Duration(DataRow objRow, string Start_Field, string End_Field, DateTime dateValue, bool IsDayCheck)
    {
        if (objRow[Start_Field] != DBNull.Value && objRow[End_Field] != DBNull.Value)
        {
            if (IsDayCheck)
            {
                return ((dateValue >= Convert.ToDateTime(objRow[Start_Field]) && dateValue <= Convert.ToDateTime(objRow[End_Field])));
            }
            else
            {
                if ((dateValue >= Convert.ToDateTime(objRow[Start_Field]) && dateValue <= Convert.ToDateTime(objRow[End_Field])))
                {
                    return true;
                }
                else
                {
                    DateTime dateEnd = dateValue.AddMonths(1).AddDays(-1);
                    return ((dateValue.Month >= Convert.ToDateTime(objRow[Start_Field]).Month && dateValue.Month <= Convert.ToDateTime(objRow[End_Field]).Month)
                            &&
                           (dateValue.Year >= Convert.ToDateTime(objRow[Start_Field]).Year && dateValue.Year <= Convert.ToDateTime(objRow[End_Field]).Year));
                }

            }
        }
        else
        {
            return false;
        }
    }

    protected void SuccessMessage(string strMessage, HtmlTableCell objCell)
    {
        objCell.InnerHtml = "<span class='msgstyle'>" + strMessage + "</span>";
    }

    protected void BindDropDownList(string strQuery, DropDownList DropDownObject)
    {
        DropDownObject.DataSource = FillTable(strQuery);
        DropDownObject.DataBind();
    }

    public void Sql_ExecuteNoNQuery(string strQuery)
    {
        using (SqlConnection con = new SqlConnection(connectionstring))
        {
            con.Open();
            using (SqlCommand cmd = new SqlCommand(strQuery, con))
            {
                cmd.ExecuteNonQuery();
            }
        }
    }

    public bool IsRecordExists(string strQuery)
    {
        using (SqlConnection con = new SqlConnection(connectionstring))
        {
            con.Open();
            using (SqlCommand cmd = new SqlCommand(strQuery, con))
            {
                return cmd.ExecuteReader().HasRows;
            }
        }
    }

    public static DataTable FillTable(string strQuery, CommandType commandType = CommandType.Text)
    {

        DataTable objTable = new DataTable();
        DataSet objDataSet = new DataSet();
        using (SqlConnection con = new SqlConnection(connectionstring))
        {
            using (SqlCommand cmd = new SqlCommand(strQuery, con)
            {
                CommandType = commandType,
                CommandTimeout=900
            })
            {

                using (SqlDataAdapter adaper = new SqlDataAdapter())
                {
                    adaper.SelectCommand = cmd;
                    adaper.Fill(objDataSet);
                    objTable = objDataSet.Tables[0];
                }
            }
        }
        return objTable;
    }


    public void GridTopPagerPosition(GridView Grid)
    {
        if (Grid.PageCount > 1)
        {
            TextBox objText = ((TextBox)(Grid.TopPagerRow.FindControl("CurrentPageIndex")));
            if (objText is TextBox)
            {
                objText.Text = Convert.ToString(Grid.PageIndex + 1) + "/" + Convert.ToString(Grid.PageCount);
            }
        }
    }
    public void GridBottomPagerPosition(GridView Grid)
    {
        if (Grid.PageCount > 1)
        {
            TextBox objText = ((TextBox)(Grid.BottomPagerRow.FindControl("CurrentPageIndex")));
            if (objText is TextBox)
            {
                objText.Text = Convert.ToString(Grid.PageIndex + 1) + "/" + Convert.ToString(Grid.PageCount);
            }
        }
    }

    public void BindYearDropDownList(DropDownList objDropDownList, int StartYear, int EndYear)
    {
        for (int intYearLoop = StartYear; intYearLoop <= EndYear + 5; intYearLoop++)
        {
            ListItem objList = new ListItem();
            objList.Value = Convert.ToString(intYearLoop);
            objList.Text = objList.Value;
            if (EndYear == intYearLoop) objList.Selected = true;
            objDropDownList.Items.Add(objList);


        }
    }

    public T ConvertTo<T>(string strValue)
    {
        return (T)TypeDescriptor.GetConverter(typeof(T))
            .ConvertFromInvariantString(strValue);
    }


    public void BindMonthDropDownList(DropDownList objDropDownList)
    {
        string[] aryMonthList = DateTimeFormatInfo.CurrentInfo.MonthNames;
        // all to be added
        objDropDownList.DataSource = aryMonthList;
        objDropDownList.DataBind();
    }

    public void AddToParameterList<T>(string strValue, string strField, List<SqlParameter> sqlParams)
    {
        sqlParams.Add(new SqlParameter(strField, ConvertTo<T>(strValue)));
    }
}