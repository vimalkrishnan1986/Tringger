using System;

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
        
    }

    public string FnFormatCondition(string strValue, string strField, string strExists, string Session_Name)
    {
        string strReturn = strExists;
        if (strValue != "")
        {
            strReturn += (strExists != "") ? " AND " + strField + "='" + strValue + "'" : " Where " + strField + "='" + strValue + "'";
        }
        Session[Session_Name] = strValue;
        return strReturn;
    }