<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmAddCustomPlant.aspx.cs" Inherits="welcome" %>

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
<script language="javascript" type="text/javascript">
    function validateform() {
        if (document.getElementById("<%=txtPlantName.ClientID%>").value == "") {
            alert("Please enter Plant name!");
            document.getElementById("<%=txtPlantName.ClientID%>").focus();
            return false;
        }
        else if (document.getElementById("<%=txtTempL.ClientID%>").value == "") {
            alert("Please enter Plant temperature!");
            document.getElementById("<%=txtTempL.ClientID%>").focus();
            return false;
        }
        else if (document.getElementById("<%=txtTempH.ClientID%>").value == "") {
            alert("Please enter Plant temperature!");
            document.getElementById("<%=txtTempH.ClientID%>").focus();
            return false;
        }
        else if (document.getElementById("<%=txtSunLighLevelL.ClientID%>").value == "") {
            alert("Please enter Sunlight level!");
            document.getElementById("<%=txtSunLighLevelL.ClientID%>").focus();
            return false;
        }
        else if (document.getElementById("<%=txtSunLighLevelH.ClientID%>").value == "") {
            alert("Please enter Sunlight level!");
            document.getElementById("<%=txtSunLighLevelH.ClientID%>").focus();
            return false;
        }
        else if (document.getElementById("<%=txtSoilMoistureL.ClientID%>").value == "") {
            alert("Please enter Soil moisture level!");
            document.getElementById("<%=txtSoilMoistureL.ClientID%>").focus();
            return false;
        }
        else if (document.getElementById("<%=txtSoilMoistureH.ClientID%>").value == "") {
            alert("Please enter Soil moisture level!");
            document.getElementById("<%=txtSoilMoistureH.ClientID%>").focus();
            return false;
        }
        else if (document.getElementById("<%=txtHumidityL.ClientID%>").value == "") {
            alert("Please enter Humidity level!");
            document.getElementById("<%=txtHumidityL.ClientID%>").focus();
            return false;
        }
        else if (document.getElementById("<%=txtHumidityH.ClientID%>").value == "") {
            alert("Please enter Humidity level!");
            document.getElementById("<%=txtHumidityH.ClientID%>").focus();
            return false;
        }
        return true;
    }
        </script>
<br /><br /><center>

    <h2>Add Custom Plant</h2><br /><br />
    <div style="width:50%">
    <div class="container-fluid">
  <div class="input-container">
    <i class="fa fa-leaf icon"></i>
    <asp:TextBox ID="txtPlantName" runat="server" placeholder="Plant Name" TextMode="SingleLine" class="input-field"></asp:TextBox>
  </div>
  <div class="input-container">
    <i class="fa fa-thermometer-half icon"></i>
    <asp:TextBox ID="txtTempL" runat="server" placeholder="Temperature Low" TextMode="SingleLine" class="input-field"></asp:TextBox>
    <i class="fa fa-thermometer-half icon"></i>
    <asp:TextBox ID="txtTempH" runat="server" placeholder="Temperature High" TextMode="SingleLine" class="input-field"></asp:TextBox>
  </div>

  <div class="input-container">
    <i class="fa fa-sun-o icon"></i>
    <asp:TextBox ID="txtSunLighLevelL" runat="server" placeholder="Sunlight Low Level" TextMode="SingleLine" class="input-field"></asp:TextBox>
    <i class="fa fa-sun-o icon"></i>
    <asp:TextBox ID="txtSunLighLevelH" runat="server" placeholder="Sunlight High Level" TextMode="SingleLine" class="input-field"></asp:TextBox>
  </div>

  <div class="input-container">
    <i class="fa fa-tint icon"></i>
    <asp:TextBox ID="txtSoilMoistureL" runat="server" placeholder="Soil Moisture Low Level" TextMode="SingleLine" class="input-field"></asp:TextBox>
    <i class="fa fa-tint icon"></i>
    <asp:TextBox ID="txtSoilMoistureH" runat="server" placeholder="Soil Moisture High Level" TextMode="SingleLine" class="input-field"></asp:TextBox>
  </div>

  <div class="input-container">
    <i class="fa fa-soundcloud icon"></i>
    <asp:TextBox ID="txtHumidityL" runat="server" placeholder="Humidity Low Level" TextMode="SingleLine" class="input-field"></asp:TextBox>
    <i class="fa fa-soundcloud icon"></i>
    <asp:TextBox ID="txtHumidityH" runat="server" placeholder="Humidity High Level" TextMode="SingleLine" class="input-field"></asp:TextBox>
  </div>
  
  <asp:Button ID="btnSubmit" runat="server" 
            Text="Save Details and Complete Registration" class="btn" onclick="btnSubmit_Click"  OnClientClick=" return validateform();"/>
  </div>
  </div>
  <br />
  <div>
    <asp:Label ID="lblMsg" runat="server" Font-Bold=true Font-Size=Large></asp:Label>
  </div>
  <div>
    <span style=" color:Black;">Please enter Temperature in ०C and the rest in numbers between 0 to 100, with 0 corresponding to LOW and 100 corresponding to HIGH.</span>
  </div>
  </center>
  <br /><br /><br />
  <asp:HiddenField id="hdnPlantId" runat="server" />
</asp:Content>

