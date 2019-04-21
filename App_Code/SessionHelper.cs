using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SessionHelper
/// </summary>
public static class SessionHelper
{

    public static T GetSessionValue<T>(String key)
    {
        object sessionVal = HttpContext.Current.Session[key];

        if (sessionVal == null)
        {
            throw new KeyNotFoundException(key);
        }

        return (T)TypeDescriptor.GetConverter(typeof(T))
            .ConvertFromInvariantString(sessionVal.ToString());
    }
    public static T GetSessionValue<T>(String key, T defaultValue)
    {
        object sessionVal = HttpContext.Current.Session[key];
        if (sessionVal == null)
        {
            return defaultValue;
        }

        return (T)TypeDescriptor.GetConverter(typeof(T))
            .ConvertFromInvariantString(sessionVal.ToString());
    }

    public static void AddtoSession<T>(string key, T val)
    {
        HttpContext.Current.Session[key] = val;
    }

    public static void Clear()
    {
        HttpContext.Current.Session.Abandon();

    }
}