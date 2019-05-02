using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

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
    public UpdateResponseModel GetVersionDetails([FromUri]string version)

    {
        return new UpdateResponseModel { ForceUpdate = false, AppUpdate = false, ErrorCode = "0" };
    }
}