<%@page import="invoice.generator.pojo.Project_data"%>
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
	String tab3class = "";
	String tab4class = "";
	String tab5class = "";

	if (request.getAttribute("activetab") != null) {

		tab1class = "";

		if (request.getAttribute("activetab").equals("1")) {
	tab1class = "active";
		} else if (request.getAttribute("activetab").equals("2")) {
	tab2class = "active";
		} else if (request.getAttribute("activetab").equals("3")) {
	tab3class = "active";
		} else if (request.getAttribute("activetab").equals("4")) {
	tab4class = "active";
		} else if (request.getAttribute("activetab").equals("5")) {
	tab5class = "active";
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



	<div class="container body">


		<div class="main_container">

			<jsp:include page="adminmenu.jsp" />

			<div class="right_col" role="main">



				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="dashboard_graph">

							<div class="fullwidth-block greet-section"
								style="padding-top: 30px;">
								<div class="container">

									<div class="row">


										<div class="row setup-content">



											<div class="col-xs-8 col-md-offset-2">
												<h2 style="margin-left: 220px;margin-bottom: 30px;">Invoice Generation</h2>

												<%
													ArrayList<Project_data> projectdata = (ArrayList<Project_data>) request.getAttribute("projectdata");
												%>

												<form action="invoice" method="post" role="form"
													class="form-horizontal form-label-left">

													<div class="form-group">

														<label class="control-label col-md-3 ">Choose
															Project <span class="required">*</span>
														</label>
														<div class="col-md-5">
															<select class="form-control" name="projectnumber"
																id="projectnumber" required>

																<%
																	if(projectdata !=null) {

																																																									for (Project_data project: projectdata) {
																%>
																<option
																	value="<%out.print(project.getProject_number());%>"
																	class="<%out.print(project.getProject_name());%>">
																	<%
																		out.print(project.getProject_name());
																	%>
																</option>
																<%
																	} }
																%>
															</select>
														</div>
														<button class="btn btn-success btn-add col-md-3"
															type="submit" style="height: 35px;">Generate
															Invoice</button>

													</div>
												</form>
												<div style="margin-top: 50px; margin-left: 90px;">
													<jsp:include page="invoicedata.jsp" />
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
