<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="invoice.generator.jpa.People_dataDaoImpl"%>
<%@page import="invoice.generator.pojo.People_data"%>
<%@page import="invoice.generator.pojo.Invoice_data"%>
<%@page import="java.util.List"%>
<%@page import="invoice.generator.pojo.TimeSheet_data"%>
<%@page import="java.util.ArrayList"%>
<%@page import="invoice.generator.pojo.Client_data"%>
<%@page import="invoice.generator.jpa.TimeSheet_dataDaoImpl"%>
<%@page import="invoice.generator.jpa.Client_dataDaoImpl"%>
<%@page import="invoice.generator.pojo.Project_data"%>
<%@page import="invoice.generator.jpa.Project_dateDaoImpl"%>
<%
	TimeSheet_dataDaoImpl timeSheet_dataDaoImpl = new TimeSheet_dataDaoImpl();
	List<Object[]> timesheetdata = timeSheet_dataDaoImpl.getworkedhours();
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

			<%
				if (session.getAttribute("usertype") == null
							|| session.getAttribute("usertype").equals("1")) {
			%>
			<jsp:include page="adminmenu.jsp" />
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

												<h2 style="margin-left: 220px;margin-bottom: 30px;">Payroll  Report</h2>


											<div class="col-xs-8 col-md-offset-2">
												<div class="">
													<div class="box-body table-responsive no-padding">

														<table class="table table-bordered table-striped"
															id="example2">
															<thead>
																<tr>
																	<th>Employee Id</th>
																	<th>Employee Name</th>
																	<th>Number of hours</th>
																	<th>Amount</th>
																</tr>
															</thead>
															<tbody>

																<%
																	for (Object[] timesheet : timesheetdata) {
																								  long hours = (Long)timesheet[0];
																							         int userid = (Integer)timesheet[1];
																%>
																<tr>

																	<td>
																		<%
																			out.print(userid);
																		%>
																	</td>
																	<td>
																		<%
																			People_dataDaoImpl people_dataDaoImpl = new People_dataDaoImpl();
																								         People_data people_data =  people_dataDaoImpl.read(userid);

																											out.print(people_data.getName());
																		%>
																	</td>
																	<td>
																		<%
																			out.print(hours);
																		%>
																	</td>

																	<td>
																		<%
																			out.print((int)hours * people_data.getBill_rate());
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







</body>

</html>
