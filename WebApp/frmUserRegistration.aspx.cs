using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class welcome : System.Web.UI.Page
{
    clsPlantRegistrationMonitoring clsObj = new clsPlantRegistrationMonitoring();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string queryEmail = @"select * from tbl_Login where email_id='" + txtEmailId.Text.Trim() + "' OR user_id='" + txtUserName.Text + "' AND status='false'";
            DataTable dtEmail = clsObj.GetDataTable(queryEmail);
            if (dtEmail.Rows.Count > 0)
            {
                lblMsg.Text = "This Email Id or User Name already exist!";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                string query = @"insert into tbl_Login (user_type,email_id,user_id,password,status) values (@user_type,@email_id,@user_id,@password,@status)";
                SqlParameter user_type = new SqlParameter("@user_type", "user");
                SqlParameter email_id = new SqlParameter("@email_id", txtEmailId.Text);
                SqlParameter user_id = new SqlParameter("@user_id", txtUserName.Text);
                SqlParameter password = new SqlParameter("@password", txtPassword.Text);
                SqlParameter status = new SqlParameter("@status", '0');
                int i = clsObj.ExecuteSql(query, new SqlParameter[] { user_type, email_id, user_id, password, status });
                if (i > 0)
                {
                    Session["user_type"] = "user";
                    Session["emailId"] = txtEmailId.Text;
                    Session["User_id"] = txtUserName.Text;
                    txtUserName.Text = "";
                    txtPassword.Text = "";
                    txtEmailId.Text = "";
                    Response.Redirect("frmSearchPlants.aspx");
                    Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                }
                else
                {
                    Response.Write("<script>alert('Registration failed! Try Again!')</script>");
                }
            }
        }
        catch
        {
        }
    }
}