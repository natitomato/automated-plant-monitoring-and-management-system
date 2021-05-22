<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmUserRegistration.aspx.cs" Inherits="welcome" %>

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
        if (document.getElementById("<%=txtEmailId.ClientID%>").value == "") {
            alert("Please enter Email Id!");
            document.getElementById("<%=txtEmailId.ClientID%>").focus();
            return false;
        }
        else if (document.getElementById("<%=txtUserName.ClientID%>").value == "") {
            alert("Please enter User Name!");
            document.getElementById("<%=txtUserName.ClientID%>").focus();
            return false;
        }
        else if (document.getElementById("<%=txtPassword.ClientID%>").value == "") {
            alert("Please enter Password!");
            document.getElementById("<%=txtPassword.ClientID%>").focus();
            return false;
        }
        return true;
    }
        </script>
<br /><br /><center>
    <h2>Registration Form</h2><br /><br />
    <div style="width:50%">
    <div class="container-fluid">
  <div class="input-container">
    <i class="fa fa-envelope icon"></i>
    <%--<input class="input-field" type="text" placeholder="Email" name="email">--%>
    <asp:TextBox ID="txtEmailId" runat="server" placeholder="Email" TextMode="SingleLine" class="input-field"></asp:TextBox>
  </div>
  <div class="input-container">
    <i class="fa fa-user icon"></i>
   <%-- <input class="input-field" type="text" placeholder="Username" name="usrnm">--%>
    <asp:TextBox ID="txtUserName" runat="server" placeholder="User Name" TextMode="SingleLine" class="input-field"></asp:TextBox>
  </div>

  <div class="input-container">
    <i class="fa fa-key icon"></i>
    <%--<input class="input-field" type="password" placeholder="Password" name="psw">--%>
    <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" TextMode="Password" class="input-field"></asp:TextBox>
  </div>

  <%--<button type="submit" class="btn">Continue Registration by Adding your Plant</button>--%>
  <asp:Button ID="btnSubmit" runat="server" 
            Text="Continue Registration by Adding your Plant" class="btn" 
            onclick="btnSubmit_Click" OnClientClick=" return validateform();"/>
  </div>
  </div>
  <br />
  <div>
    <asp:Label ID="lblMsg" runat="server" Font-Bold=true Font-Size=Large></asp:Label>
  </div>
  </center>
  <br /><br /><br />
</asp:Content>

