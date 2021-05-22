using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    clsPlantRegistrationMonitoring clsObj = new clsPlantRegistrationMonitoring();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lnkbtnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmUserRegistration.aspx");
    }
    protected void btlLogin_Click(object sender, EventArgs e)
    {
        try
        {
            if (clsObj.checkLogin(txtEmail, txtPassword) == true)
            {
                string queryLogin = @"select user_type,email_id,user_id from tbl_Login where status='false' and email_id='" + txtEmail.Text + "'";
                DataTable dtLogin = clsObj.GetDataTable(queryLogin);
                if (dtLogin.Rows.Count > 0)
                {
                    Session["user_type"] = dtLogin.Rows[0]["user_type"].ToString();
                    Session["user_id"] = dtLogin.Rows[0]["user_id"].ToString();
                    Session["email_id"] = dtLogin.Rows[0]["email_id"].ToString();
                    Response.Redirect("frmPlantsReading.aspx");
                }
            }
            else
            {
                lblMsg.Text = "Invalid User name or Password!";
            }
        }
        catch
        {
        }
    }
}