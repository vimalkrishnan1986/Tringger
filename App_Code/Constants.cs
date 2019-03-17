using System.Configuration;

/// <summary>
/// Summary description for Constants
/// </summary>
public static class Constants
{
    public static string ConnectionString
    {
        get
        {
            return  ConfigurationManager.AppSettings["connectionstring"];
        }
    }
}