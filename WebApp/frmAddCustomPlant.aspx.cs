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
    string plantName = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            Random rnd = new Random();
            int temp = rnd.Next(13, 35);
            int sunlight = rnd.Next(35, 85);
            int moisture = rnd.Next(10, 85);
            int humidity = rnd.Next(30, 90);
            string query = @"insert into tbl_Plant_Details (plant_name,temperature,sunlight_level,soil_moister_leve,humidity,temp_low_range, temp_high_range, sunlight_low_range, sunlight_high_range, moisture_low_range, moisture_high_range, humidity_low_range, humidity_high_range, created_by,created_on,status) values (@plant_name,@temperature,@sunlight_level,@soil_moister_leve,@humidity, @temp_low_range, @temp_high_range, @sunlight_low_range, @sunlight_high_range, @moisture_low_range, @moisture_high_range, @humidity_low_range, @humidity_high_range, @created_by,@created_on,@status)";
            SqlParameter plant_name = new SqlParameter("@plant_name", txtPlantName.Text);
            SqlParameter temperature = new SqlParameter("@temperature", temp);
            SqlParameter sunlight_level = new SqlParameter("@sunlight_level", sunlight);
            SqlParameter soil_moister_leve = new SqlParameter("@soil_moister_leve", moisture);
            SqlParameter humiditi = new SqlParameter("@humidity", humidity);

            SqlParameter temp_low_range = new SqlParameter("@temp_low_range", txtTempL.Text);
            SqlParameter temp_high_range = new SqlParameter("@temp_high_range", txtTempH.Text);
            SqlParameter sunlight_low_range = new SqlParameter("@sunlight_low_range", txtSunLighLevelL.Text);
            SqlParameter sunlight_high_range = new SqlParameter("@sunlight_high_range", txtSunLighLevelH.Text);
            SqlParameter moisture_low_range = new SqlParameter("@moisture_low_range", txtSoilMoistureL.Text);
            SqlParameter moisture_high_range = new SqlParameter("@moisture_high_range", txtSoilMoistureH.Text);
            SqlParameter humidity_low_range = new SqlParameter("@humidity_low_range", txtHumidityL.Text);
            SqlParameter humidity_high_range = new SqlParameter("@humidity_high_range", txtHumidityH.Text);

            SqlParameter created_by = new SqlParameter("@created_by", Session["user_id"].ToString());
            SqlParameter created_on = new SqlParameter("@created_on", DateTime.Now.Date);
            SqlParameter status = new SqlParameter("@status", '0');
            int i = clsObj.ExecuteSql(query, new SqlParameter[] { plant_name, temperature, sunlight_level, soil_moister_leve, humiditi,temp_low_range, temp_high_range, sunlight_low_range, sunlight_high_range, moisture_low_range, moisture_high_range, humidity_low_range, humidity_high_range, created_by, created_on, status });
            if (i > 0)
            {
                Session["plant_name"] = txtPlantName.Text;
                Session["temperature"] = temp;
                Session["sunlight_level"] = sunlight;
                Session["soil_moister_leve"] = moisture;
                Session["humidity"] = humidity;
                Response.Redirect("frmPlantsReading.aspx?id=" + hdnPlantId.Value);
                Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                clear();
            }
            else
            {
                Response.Write("<script>alert('Registration failed! Try Again!')</script>");
            }
        }
        catch
        {
        }
    }
    void clear()
    {
        try
        {
            //txtPlantName.Text = string.Empty;
            //txtTemp.Text = string.Empty;
            //txtSunLighLevel.Text = string.Empty;
            //txtSoilMoisture.Text = string.Empty;
            //txtHumidity.Text = string.Empty;
        }
        catch
        {
        }
    }
}