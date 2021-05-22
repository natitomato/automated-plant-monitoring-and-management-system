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
    DataTable dtPlantDetails = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["user_type"]== "" || Session["user_type"]==null)
            {
                Response.Redirect("Default.aspx");
            }
            lblUserName.Text = Session["User_id"].ToString();
            string user = Session["user_type"].ToString();
            string queryPlantDetails = @"select * from tbl_Plant_Details where created_by='" + Session["User_id"].ToString() + "' AND status='false'";
            dtPlantDetails = clsObj.GetDataTable(queryPlantDetails);
            if (dtPlantDetails.Rows.Count > 0)
            {
                
                if (user == "admin")
                {
                    //if (dtPlantDetails.Rows[0]["temp_low_range"].ToString() == "" || dtPlantDetails.Rows[0]["temp_high_range"].ToString() == "" || dtPlantDetails.Rows[0]["sunlight_low_range"].ToString() == "" || dtPlantDetails.Rows[0]["sunlight_high_range"].ToString() == "" || dtPlantDetails.Rows[0]["moisture_low_range"].ToString() == "" || dtPlantDetails.Rows[0]["moisture_high_range"].ToString() == "" || dtPlantDetails.Rows[0]["humidity_low_range"].ToString() == "" || dtPlantDetails.Rows[0]["humidity_high_range"].ToString() == "")
                    //{
                    //    Response.Write("<script language='javascript'>window.alert('Sorry! Your Device can not identify the range. Kindly update the range.');window.location='frmRangeValue.aspx';</script>");
                    //}
                    //else
                    //{
                    txtTemp.Text = "Temperature              [" + dtPlantDetails.Rows[0]["temperature"].ToString() + "]°C";
                    txtSunLighLevel.Text = "Sunlight                     [" + dtPlantDetails.Rows[0]["sunlight_level"].ToString() + "]";
                    txtSoilMoisture.Text = "Soil Mositure             [" + dtPlantDetails.Rows[0]["soil_moister_leve"].ToString() + "]";
                    txtHumidity.Text = "Humidity                    [" + dtPlantDetails.Rows[0]["humidity"].ToString() + "]";
                    lblPlantName.Text = dtPlantDetails.Rows[0]["plant_name"].ToString();
                    lblUserName.Text = Session["User_id"].ToString();
                    if (Convert.ToInt16(dtPlantDetails.Rows[0]["temperature"].ToString()) >= Convert.ToInt16(dtPlantDetails.Rows[0]["temp_low_range"].ToString()) && Convert.ToInt16(dtPlantDetails.Rows[0]["temperature"].ToString()) <= Convert.ToInt16(dtPlantDetails.Rows[0]["temp_high_range"].ToString()))
                    {
                        txtTemp.BackColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        txtTemp.BackColor = System.Drawing.Color.Red;
                    }

                    if (Convert.ToInt16(dtPlantDetails.Rows[0]["sunlight_level"].ToString()) >= Convert.ToInt16(dtPlantDetails.Rows[0]["sunlight_low_range"].ToString()) && Convert.ToInt16(dtPlantDetails.Rows[0]["sunlight_level"].ToString()) <= Convert.ToInt16(dtPlantDetails.Rows[0]["sunlight_high_range"].ToString()))
                    {
                        txtSunLighLevel.BackColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        txtSunLighLevel.BackColor = System.Drawing.Color.Red;
                    }

                    if (Convert.ToInt16(dtPlantDetails.Rows[0]["soil_moister_leve"].ToString()) >= Convert.ToInt16(dtPlantDetails.Rows[0]["moisture_low_range"].ToString()) && Convert.ToInt16(dtPlantDetails.Rows[0]["soil_moister_leve"].ToString()) <= Convert.ToInt16(dtPlantDetails.Rows[0]["moisture_high_range"].ToString()))
                    {
                        txtSoilMoisture.BackColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        txtSoilMoisture.BackColor = System.Drawing.Color.Red;
                    }

                    if (Convert.ToInt16(dtPlantDetails.Rows[0]["humidity"].ToString()) >= Convert.ToInt16(dtPlantDetails.Rows[0]["humidity_low_range"].ToString()) && Convert.ToInt16(dtPlantDetails.Rows[0]["humidity"].ToString()) <= Convert.ToInt16(dtPlantDetails.Rows[0]["humidity_high_range"].ToString()))
                    {
                        txtHumidity.BackColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        txtHumidity.BackColor = System.Drawing.Color.Red;
                    }
                    //}
                }


                else
                {
                    txtTemp.BackColor = System.Drawing.Color.Yellow;
                    txtSunLighLevel.BackColor = System.Drawing.Color.Yellow;
                    txtSoilMoisture.BackColor = System.Drawing.Color.Yellow;
                    txtHumidity.BackColor = System.Drawing.Color.Yellow;
                    txtTemp.ForeColor = System.Drawing.Color.Blue;
                    txtSunLighLevel.ForeColor = System.Drawing.Color.Blue;
                    txtSoilMoisture.ForeColor = System.Drawing.Color.Blue;
                    txtHumidity.ForeColor = System.Drawing.Color.Blue;
                    txtTemp.Text = "Temperature                    ---DNC*---";
                    txtSunLighLevel.Text = "Sunlight Level                  ---DNC*---";
                    txtSoilMoisture.Text = "Soil Moisture Level          ---DNC*---          ";
                    txtHumidity.Text = "Humidity                           ---DNC*---         ";
                    lblPlantName.Text = dtPlantDetails.Rows[0]["plant_name"].ToString();
                    lblUserName.Text = Session["User_id"].ToString();
                }
            }
            else
            {
                string queryPlantName = @"select * from tbl_Plant_Details where id=" + Request.QueryString["id"].ToString() + " AND status='false'";
                DataTable dtPlantName = clsObj.GetDataTable(queryPlantName);
                if (dtPlantName.Rows.Count > 0)
                {
                    string query = @"insert into tbl_Plant_Details (plant_name,temperature,sunlight_level,soil_moister_leve,humidity,temp_low_range, temp_high_range, sunlight_low_range, sunlight_high_range, moisture_low_range, moisture_high_range, humidity_low_range, humidity_high_range, created_by,created_on,status) values (@plant_name,@temperature,@sunlight_level,@soil_moister_leve,@humidity, @temp_low_range, @temp_high_range, @sunlight_low_range, @sunlight_high_range, @moisture_low_range, @moisture_high_range, @humidity_low_range, @humidity_high_range, @created_by,@created_on,@status)";
                    SqlParameter plant_name = new SqlParameter("@plant_name", dtPlantName.Rows[0]["plant_name"].ToString());
                    SqlParameter temperature = new SqlParameter("@temperature", dtPlantName.Rows[0]["temperature"].ToString());
                    SqlParameter sunlight_level = new SqlParameter("@sunlight_level", dtPlantName.Rows[0]["sunlight_level"].ToString());
                    SqlParameter soil_moister_leve = new SqlParameter("@soil_moister_leve", dtPlantName.Rows[0]["soil_moister_leve"].ToString());
                    SqlParameter humiditi = new SqlParameter("@humidity", dtPlantName.Rows[0]["humidity"].ToString());

                    SqlParameter temp_low_range = new SqlParameter("@temp_low_range", dtPlantName.Rows[0]["temp_low_range"].ToString());
                    SqlParameter temp_high_range = new SqlParameter("@temp_high_range", dtPlantName.Rows[0]["temp_high_range"].ToString());
                    SqlParameter sunlight_low_range = new SqlParameter("@sunlight_low_range", dtPlantName.Rows[0]["sunlight_low_range"].ToString());
                    SqlParameter sunlight_high_range = new SqlParameter("@sunlight_high_range", dtPlantName.Rows[0]["sunlight_high_range"].ToString());
                    SqlParameter moisture_low_range = new SqlParameter("@moisture_low_range", dtPlantName.Rows[0]["moisture_low_range"].ToString());
                    SqlParameter moisture_high_range = new SqlParameter("@moisture_high_range", dtPlantName.Rows[0]["moisture_high_range"].ToString());
                    SqlParameter humidity_low_range = new SqlParameter("@humidity_low_range", dtPlantName.Rows[0]["humidity_low_range"].ToString());
                    SqlParameter humidity_high_range = new SqlParameter("@humidity_high_range", dtPlantName.Rows[0]["humidity_high_range"].ToString());

                    SqlParameter created_by = new SqlParameter("@created_by", Session["user_id"].ToString());
                    SqlParameter created_on = new SqlParameter("@created_on", DateTime.Now.Date);
                    SqlParameter status = new SqlParameter("@status", '0');
                    int i = clsObj.ExecuteSql(query, new SqlParameter[] { plant_name, temperature, sunlight_level, soil_moister_leve, humiditi,temp_low_range, temp_high_range, sunlight_low_range, sunlight_high_range, moisture_low_range, moisture_high_range, humidity_low_range, humidity_high_range, created_by, created_on, status });
                    if (i > 0)
                    {
                        txtTemp.BackColor = System.Drawing.Color.Yellow;
                        txtSunLighLevel.BackColor = System.Drawing.Color.Yellow;
                        txtSoilMoisture.BackColor = System.Drawing.Color.Yellow;
                        txtHumidity.BackColor = System.Drawing.Color.Yellow;
                        txtTemp.ForeColor = System.Drawing.Color.Blue;
                        txtSunLighLevel.ForeColor = System.Drawing.Color.Blue;
                        txtSoilMoisture.ForeColor = System.Drawing.Color.Blue;
                        txtHumidity.ForeColor = System.Drawing.Color.Blue;
                        txtTemp.Text = "Temperature                    ---DNC*---";
                        txtSunLighLevel.Text = "Sunlight Level                  ---DNC*---";
                        txtSoilMoisture.Text = "Soil Moisture Level          ---DNC*---          ";
                        txtHumidity.Text = "Humidity                           ---DNC*---         ";
                        lblPlantName.Text = dtPlantName.Rows[0]["plant_name"].ToString();
                        lblUserName.Text = Session["User_id"].ToString();
                    }
                }
            }
        }
    }
    protected void lnkbtnLogout_Click(object sender, EventArgs e)
    {
        try
        {
            Session["User_id"] = null;
            Session.Abandon();
            Session.RemoveAll();
            Response.Redirect("~/default.aspx");
        }
        catch
        {
        }
    }
    protected void lnkbtnSearchAgain_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("frmSearchPlant.aspx");
        }
        catch
        {
        }
    }
}