<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	response.addHeader(
			"Cache-Control",
			"no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
	response.addHeader("Pragma", "no-cache");
	response.addDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>

        <link rel="stylesheet" href="css/style.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
        <script src="js/jquery-2.1.4.min.js"></script>
        <script src="js/bootstrap.js"></script>

        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/animate.min.css" rel="stylesheet">
        <script src="js/bootbox.js"></script>

    </head>
<body class="login">


	<div class="wrapper" style="width: 500px;">
		<div align="center">
			<h3 style="color: white;">
				<b></b>
			</h3>
		</div>

		<div class="login-body">
			<div class="box">

				<div class="box-title">

					<h2 style="padding: 0px;">Invoice Generator</h2>
				</div>
			</div>

			<form action="LoginServlet" method="post" role="form">
				<h4 align="center">Login</h4>




				<%
					if (request.getAttribute("error") != null) {
				%>

				<script>
					bootbox.alert("Invalid Credentials", function() {

					});
				</script>

				<%
					request.removeAttribute("error");

					}
				%>
				<div class="form-group">

					<label class="">User Name</label>


					<input type="text" class="form-control" name="username"
						placeholder="Userid" required="" autofocus="" />


				</div>


				<div class="form-group">
					<label class="">Password</label>

					<input type="password" class="form-control" name="password"
						placeholder="Password" required="" />
				</div>

				<button class="btn btn-lg btn-primary btn-block" type="submit"
					name="student">Login</button>


			</form>

			<div class="forget">
				<a href="registration"> </a>
			</div>
		</div>
	</div>
</body>
</html>
