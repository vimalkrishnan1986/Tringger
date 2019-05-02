using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UpdateResponseModel
/// </summary>
public class UpdateResponseModel
{
    public string ErrorCode { get; set; }
    public bool AppUpdate { get; set; }
    public bool ForceUpdate { get; set; }

    public UpdateResponseModel()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}