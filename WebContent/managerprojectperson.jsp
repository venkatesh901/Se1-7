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

			<jsp:include page="managermenu.jsp" />

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

													<div class="container">
														<h2>Project Persons</h2>
													</div>

													<div id="exTab2" class="container">
														<ul class="nav nav-tabs">
															<li class="active"><a href="#1" data-toggle="tab">Project
																	Persons List </a></li>

															<li class=""><a href="#2" data-toggle="tab">Assign Project Person </a></li>

														</ul>

														<div class="tab-content mr50">
															<div class="tab-pane active" id="1" align="center">

																<jsp:include page="listprojectpersons.jsp" />

															</div>
															
															<div class="tab-pane" id="2" align="center">

																<jsp:include page="assignprojectperson.jsp" />

															</div>

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
