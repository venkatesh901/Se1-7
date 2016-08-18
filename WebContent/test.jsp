<%@page import="java.util.Locale"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="invoice.generator.jpa.Project_dateDaoImpl"%>
<%@page import="invoice.generator.jpa.TimeSheet_dataDaoImpl"%>
<%@page import="invoice.generator.jpa.Test_dataDaoImpl"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="invoice.generator.pojo.Project_data"%>

<%
	
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
												<div class="">
												<h2 style="margin-left: 220px;margin-bottom: 30px;">Counts</h2>

													<table class="table table-bordered table-striped"
														id="example2">
														<thead>
															<tr>
																<th></th>
																<th>Count</th>


															</tr>
														</thead>
														<tbody>

															<tr>
																<td>Active Employees</td>
																<td>
																	<%
																		Test_dataDaoImpl test_dataDaoImpl = new Test_dataDaoImpl();
																																																out.print(test_dataDaoImpl.employeecount(0));
																	%>
																</td>
															</tr>

															<tr>
																<td>In Active Employees</td>
																<td>
																	<%
																		out.print(test_dataDaoImpl.employeecount(1));
																	%>
																</td>
															</tr>
															<tr>
																<td>Active Projects</td>
																<td>
																	<%
																		out.print(test_dataDaoImpl.projectcount("In Progress")
																																																		+ test_dataDaoImpl.projectcount("Open"));
																	%>
																</td>
															</tr>

															<tr>
																<td>In Active Projects</td>
																<td>
																	<%
																		out.print(test_dataDaoImpl.projectcount("Closed"));
																	%>
																</td>
															</tr>

															<tr>
																<td>Active Projects</td>
																<td>
																	<%
																		out.print(test_dataDaoImpl.projectcount("In Progress")
																																																		+ test_dataDaoImpl.projectcount("Open"));
																	%>
																</td>
															</tr>

															<tr>
																<td>In Active Projects</td>
																<td>
																	<%
																		out.print(test_dataDaoImpl.projectcount("Closed"));
																	%>
																</td>
															</tr>

															<tr>
																<td>Active Clients</td>
																<td>
																	<%
																		out.print(test_dataDaoImpl.clientcount(0));
																	%>
																</td>
															</tr>

															<tr>
																<td>In Active Clients</td>
																<td>
																	<%
																		out.print(test_dataDaoImpl.clientcount(1));
																	%>
																</td>
															</tr>

														</tbody>
													</table>
													<hr></hr>



												</div>

												<div class="">
																								<h2 style="margin-left: 220px;margin-bottom: 30px;">Projects that crossed budget horizon</h2>
												
													<%
													List<Project_data> projectsData = new Project_dateDaoImpl().findAll();

													DecimalFormat df = new DecimalFormat("0", DecimalFormatSymbols.getInstance(Locale.ENGLISH));
													df.setMaximumFractionDigits(340);
													System.out.println(); 
													%>

													<div class="table-responsive">

 
														<table class="table table-bordered table-striped"
															id="example2">
															<thead>
																<tr>

																	<th>Project Number</th>
																	<th>Project Name</th>
																	<th>Actual Budget</th>
																	<th>Used Budget</th>
																	<th>Additional Budget</th>

																</tr>
															</thead>
															<tbody>

																<%
																	for (Project_data project : projectsData) {
																		
																		TimeSheet_dataDaoImpl timeSheet_dataDaoImpl = new TimeSheet_dataDaoImpl();
																		double usedbudget = timeSheet_dataDaoImpl.usedbudget(project.getProject_number());
																        if(project.getBudget()>=usedbudget){
																        	
																        	continue;
																        }
																%>
																<tr>


																	<td>
																		<%
																			out.print(project.getProject_number());
																		%>
																	</td>
																	<td>
																		<%
																			out.print(project.getProject_name());
																		%>
																	</td>


																	<td>
																		<%
																			out.print(project.getBudget());
																		%>

																	</td>
																	<td>
																		<%
																			out.print(df.format(usedbudget));
																		%>

																	</td>
																	<td>
																		<%
																			out.print(df.format(usedbudget-project.getBudget()));
																		%>

																	</td>
																</tr>
																<%
																	}
																%>

															</tbody>
														</table>
													</div>


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
