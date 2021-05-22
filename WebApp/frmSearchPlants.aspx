<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmSearchPlants.aspx.cs" Inherits="welcome" %>

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
        if (document.getElementById("<%=txtSearch.ClientID%>").value == "") {
            alert("Please enter Plant name!");
            document.getElementById("<%=txtSearch.ClientID%>").focus();
            return false;
        }
        return true;
    }
        </script>
<div class="container-fluid">
<br /><br /><center>
    <h2>Search for plant from database</h2><br /><br />
    <div style="width:50%">
    <div class="container-fluid">
  <div class="input-container">
    <i class="fa fa-search icon"></i>
    <%--<input class="input-field" type="text" placeholder="Email" name="email">--%>
    <asp:TextBox ID="txtSearch" runat="server" placeholder="Search" TextMode="SingleLine" class="input-field"></asp:TextBox>
  </div>
  
  <%--<button type="submit" class="btn">Continue Registration by Adding your Plant</button>--%>
  <asp:Button ID="btnSubmit" runat="server" Text="Search for Plant in our Database" 
            class="btn" onclick="btnSubmit_Click" OnClientClick=" return validateform();"/>
  </div>
  </div>
  <br />
  <asp:LinkButton ID="lnkbtnAddPlant" runat="server" Text="Add Custom Plant instead" 
            Font-Size="12" onclick="lnkbtnAddPlant_Click"></asp:LinkButton>
  </center>
  <br /><br /><br />
</div>
</asp:Content>

