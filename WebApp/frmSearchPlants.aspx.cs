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
        if (!IsPostBack)
        {
            if (Session["user_type"] == "" || Session["user_type"] == null)
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string querySearchPlant = @"select id,plant_name from tbl_Plant_Details where plant_name='" + txtSearch.Text + "' AND status='false'";
            DataTable dtSearchPlant = clsObj.GetDataTable(querySearchPlant);
            if (dtSearchPlant.Rows.Count > 0)
            {
                Session["plant_name"] = dtSearchPlant.Rows[0]["plant_name"].ToString();
                Response.Redirect("frmPlantsReading.aspx?id=" + dtSearchPlant.Rows[0]["id"].ToString());
            }
            else
            {
                Response.Write("<script>alert('Sorry! The Plant you want to search is not available in our database!')</script>");
            }
        }
        catch
        {
        }
    }
    protected void lnkbtnAddPlant_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("frmAddCustomPlant.aspx");
        }
        catch
        {
        }
    }
}