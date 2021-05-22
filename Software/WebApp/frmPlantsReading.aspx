<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmPlantsReading.aspx.cs" Inherits="welcome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

.input-container {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  width: 100%;
  margin-bottom: 15px;
}

.icon {
  padding: 10px;
  background: #2F3601 ;
  color: white;
  min-width: 50px;
  text-align: center;
}

.input-field {
  width: 100%;
  padding: 10px;
  outline: none;
}

.input-field:focus {
  border: 2px solid #2F3601 ;
}

/* Set a style for the submit button */
.btn {
  background-color: #2F3601 ;
  color: white;
  padding: 15px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.btn:hover {
  opacity: 1;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="row">
    <table width="100%">
        <tr>
            <td style="color:Black; font-weight:bolder;">Plant Name:- <asp:Label ID="lblPlantName" runat="server"></asp:Label></td>
            <td style="text-align:right;color:Black; font-weight:bolder;">
                User Name:- <asp:Label id="lblUserName" runat="server"></asp:Label>
                <asp:LinkButton ID="lnkbtnLogout" runat="server" Text="[LogOut]" 
                    onclick="lnkbtnLogout_Click"></asp:LinkButton>
            </td>
        </tr>
    </table>
</div>
<br /><br /><center>
    <h2>Your Plants Reading</h2><br /><br />
    <div style="width:50%">
    <div class="container-fluid">
  <div class="input-container">
    <i class="fa fa-thermometer-half icon"></i>
    <asp:TextBox ID="txtTemp" runat="server"  TextMode="SingleLine" class="input-field" ReadOnly="true" Font-Size="12" Font-Bold="true" ForeColor="#FBFCFC"></asp:TextBox>
  </div>

  <div class="input-container">
    <i class="fa fa-sun-o icon"></i>
    <asp:TextBox ID="txtSunLighLevel" runat="server"  TextMode="SingleLine" class="input-field" ReadOnly="true" Font-Size="12" Font-Bold="true" ForeColor="#FBFCFC"></asp:TextBox>
  </div>

  <div class="input-container">    
    <i class="fa fa-tint icon"></i>
    <asp:TextBox ID="txtSoilMoisture" runat="server"  TextMode="SingleLine" class="input-field" ReadOnly="true" Font-Size="12" Font-Bold="true" ForeColor="#FBFCFC"></asp:TextBox>
  </div>

  <div class="input-container">
    <i class="fa fa-soundcloud icon"></i>
    <asp:TextBox ID="txtHumidity" runat="server"  TextMode="SingleLine" class="input-field" ReadOnly="true" Font-Size="12" Font-Bold="true" ForeColor="#FBFCFC"></asp:TextBox>
  </div>

  </div>
  <div>
    <table>
        <tr>
            <td>
                <svg width="20" height="20">
                <rect width="20" height="20" style="fill:#0F9309;stroke-width:3;stroke:rgb(0,0,0)" />
                </svg>
            </td>
            <td>
                &nbsp;<span style="color:Black; font-weight:bolder">Ideal</span>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <svg width="20" height="20">
                <rect width="20" height="20" style="fill:#FF3333;stroke-width:3;stroke:rgb(0,0,0)" />
                </svg>
            </td>
            <td>
                &nbsp;<span style="color:Black; font-weight:bolder">Non-Ideal</span>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <svg width="20" height="20">
                <rect width="20" height="20" style="fill:#E9E612;stroke-width:3;stroke:rgb(0,0,0)" />
                </svg>
            </td>
            <td>
                &nbsp;<span style="color:Black; font-weight:bolder">DNC*</span>
            </td>
        </tr>
        
    </table>
  </div>
  </div>
  <br /><br /><br />
  <div>
    <span style="color:#033001; font-weight:bolder;">The above readings are the latest readings shared by your smart deivce.</span>
  </div>
  <br />
  <div>
    <span style="color:#033001; font-weight:bolder;">*DNC --> Device Not Connected. Kindly connect the device to observe sesnsor readings.</span>
  </div>
  </center>
  <br /><br /><br />
  <asp:HiddenField ID="hdnTemp" runat="server" />
  <asp:HiddenField ID="hdnSunLight" runat="server" />
  <asp:HiddenField ID="hdnMoisture" runat="server" />
  <asp:HiddenField ID="hdnHumidity" runat="server" />
</asp:Content>

