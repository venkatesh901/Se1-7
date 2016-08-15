<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%
	response.addHeader(
			"Cache-Control",
			"no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
	response.addHeader("Pragma", "no-cache");
	response.addDateHeader("Expires", 0);

	String tab1class = "active";
	String tab2class = "";
	if (request.getAttribute("activetab") != null) {

		tab1class = "";

		if (request.getAttribute("activetab").equals("1")) {
			tab1class = "active";
		}

		else if (request.getAttribute("activetab").equals("2")) {
			tab2class = "active";
		}
	}
%>


<!DOCTYPE html>
<html lang="en">


<jsp:include page="header.jsp" />

<style>
.mr50 {
	margin-top: 50px;
}

.mr30 {
	margin-top: 30px;
}
</style>


<body class="nav-md">


	<%
		if (request.getParameter("uploaded") != null) {
	%>

	<script>
		//bootbox.alert("File Uploaded", function() {

		//});
	</script>

	<%
		request.removeAttribute("uploaded");

		}
	%>


	<div class="container body">


		<div class="main_container">


			<%
				if (session.getAttribute("usertype") == null
						|| session.getAttribute("usertype").equals("3")) {
			%>

			<jsp:include page="developermenu.jsp" />

			<%
				} else {
			%>

			<jsp:include page="managermenu.jsp" />

			<%
				}
			%>

			<div class="right_col" role="main">



				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="dashboard_graph">

							<div class="fullwidth-block greet-section"
								style="padding-top: 30px;">
								<div class="container">

									<div class="row">

										<div class="row setup-content">

											<%
												if (request.getAttribute("message") != null) {
											%>

											<div class="alert alert-info  fade in"
												style="color: #31708f; background-color: #d9edf7; border-color: #bce8f1;">
												<%
													out.print(request.getAttribute("message"));
												%>
											</div>

											<%
												request.removeAttribute("message");

												}
											%>



											<div class="col-xs-8 col-md-offset-2">
												<div class="col-md-12">

													<div class="container">
														<h2></h2>
													</div>

													<div id="exTab2" class="container">
														<ul class="nav nav-tabs">
															<li class="<%out.print(tab1class);%>"><a href="#1"
																	data-toggle="tab">Enter TimeSheet </a></li>
															<%
																if (session.getAttribute("usertype").equals("2")) {
															%>

															<li class="<%out.print(tab2class);%>"><a href="#2"
																	data-toggle="tab">
																	<i class="fa fa-plus"></i> Approve Timesheet
																</a></li>

															<%
																}
															%>

														</ul>

														<div class="tab-content mr50">
															<div class="tab-pane <%out.print(tab1class);%>" id="1"
																align="center">
																<jsp:include page="timesheetform.jsp" />


															</div>

															<%
																if (session.getAttribute("usertype").equals("2")) {
															%>

															<div class="tab-pane <%out.print(tab2class);%>" id="2"
																align="center">
																<jsp:include page="approvetimesheets.jsp" />


															</div>

															<%
																}
															%>

														</div>


													</div>

													<hr></hr>



												</div>
											</div>



										</div>


									</div>
									<!-- .row -->

								</div>
								<!-- .container -->
							</div>

							<div class="clearfix" style="height: 500px;"></div>
						</div>
					</div>

				</div>
				<br />

				<div class="row"></div>


				<div class="row">
					<div class="col-md-4 col-sm-4 col-xs-12"></div>
				</div>


				<div class="col-md-8 col-sm-8 col-xs-12">



					<div class="row"></div>
					<div class="row"></div>
				</div>
			</div>


		</div>
		<!-- /page content -->
	</div>

	</div>






</body>

</html>
