﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Plant Registration & Monitoring</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css" />
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css" />
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css" />
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css" />
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css" />
	<link rel="stylesheet" type="text/css" href="css/main.css" />
<!--===============================================================================================-->
</head>
<body>
    <form id="form1" runat="server">
    <div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
                <div class="row">
                    <div class="col-sm">
				        <div class="login100-pic js-tilt" data-tilt>
					        <img src="images/plant.png" alt="IMG" />
				        </div>
                    </div>
                    <div class="col-sm">
				<form class="login100-form validate-form">
					<span class="login100-form-title">
						Member Login
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<%--<input class="input100" type="text" name="email" placeholder="Email">--%>
                        <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" class="input100" required></asp:TextBox>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<%--<input class="input100" type="password" name="pass" placeholder="Password">--%>
                        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" placeholder="Password" class="input100" required></asp:TextBox>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						<%--<button class="login100-form-btn">
							Login
						</button>--%>
                        <asp:Button ID="btlLogin" runat="server" Text="Login" class="login100-form-btn" onclick="btlLogin_Click" 
                            />
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="#">
							Username / Password?
						</a>
					</div>
                    <div class="text-center p-t-12">
						<asp:Label ID="lblMsg" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="12"></asp:Label>
					</div>
					<div class="text-center p-t-136">
						<a class="txt2" href="#">
							<asp:LinkButton ID="lnkbtnRegister" runat="server" 
                            onclick="lnkbtnRegister_Click">Not a user? Register</asp:LinkButton>
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
                </div>

                </div>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script type="text/javascript" src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/bootstrap/js/popper.js"></script>
	<script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<%--<script type="text/javascript" src="vendor/tilt/tilt.jquery.min.js"></script>
	<script type="text/javascript">
	    $('.js-tilt').tilt({
	        scale: 1.1
	    })
	</script>--%>
<!--===============================================================================================-->
	<script type="text/javascript" src="js/main.js"></script>
    </form>
</body>
</html>
