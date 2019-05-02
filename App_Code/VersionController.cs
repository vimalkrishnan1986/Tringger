using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Data.SqlClient;
using System.Net.Http;
using System.Net;
using System.Net.Http.Formatting;

/// <summary>
/// Summary description for VersionController
/// </summary>
[RoutePrefix("api/version")]
public class VersionController : ApiController
{
    public VersionController()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    [HttpGet]
    [Route("{version}")]
    public HttpResponseMessage GetVersionDetails([FromUri]string version)
    {
        if (string.IsNullOrWhiteSpace(version))
        {
            return new HttpResponseMessage(HttpStatusCode.BadRequest)
            {
                Content = new StringContent("Version number should not be empty! ")
            };
        }
        string sql = "Select * from versionSettings where versionNumber=@versionNumber";
        DataTable dataTable = DataAccess.FillDataSet(sql, CommandType.Text, new SqlParameter[] { new SqlParameter("@versionNumber", version) }).Tables[0];

        if (dataTable.Rows.Count == 0)
        {
            return new HttpResponseMessage(HttpStatusCode.BadRequest)
            {
                Content = new StringContent("Invalid version number! ")
            };
        }
        return new HttpResponseMessage(HttpStatusCode.OK)
        {
            Content = new ObjectContent(
                typeof(UpdateResponseModel),
                new UpdateResponseModel
                {
                    ForceUpdate = Convert.ToBoolean(dataTable.Rows[0]["ForceUpdate"]),
                    AppUpdate = Convert.ToBoolean(dataTable.Rows[0]["AppUpdate"]),
                    ErrorCode = Convert.ToString(dataTable.Rows[0]["ErrorCode"])
                },
                new JsonMediaTypeFormatter())

        };
    }
}