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


<body class="nav-md" >


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
												<div class="col-md-12">

													<div class="container">
														<h2>Import Files</h2>
													</div>

													<div id="exTab2" class="container">
														<ul class="nav nav-tabs">
															<li class="active"><a href="#1" data-toggle="tab">Company
																	Import</a></li>
															<li><a href="#2" data-toggle="tab">Client Import</a></li>
															<li><a href="#3" data-toggle="tab">Project
																	Import</a></li>
															<li><a href="#4" data-toggle="tab">People Import</a></li>
															<li><a href="#5" data-toggle="tab"> Project
																	Person Import</a></li>

														</ul>

														<div class="tab-content mr50">
															<div class="tab-pane active" id="1" align="center">
																<form action="FileUploadServlet" method="post"
																	role="form" enctype="multipart/form-data">

																	<div class="form-group">
																		<h3>Choose Company CSV</h3>
																		<input type="file" class="form-control-file mr30"
																			name="companyfile" aria-describedby="fileHelp">

																	</div>


																	<button class="btn btn-success btn-add mr30"
																		type="submit">Submit</button>

																</form>

															</div>

															<div class="tab-pane" id="2" align="center">
																<form action="FileUploadServlet" method="post"
																	role="form" enctype="multipart/form-data">

																	<div class="form-group">
																		<h3>Choose Client CSV</h3>
																		<input type="file" class="form-control-file mr30"
																			name="clientfile" aria-describedby="fileHelp">

																	</div>


																	<button class="btn btn-success btn-add mr30"
																		type="submit">Submit</button>

																</form>

															</div>

															<div class="tab-pane" id="3" align="center">
																<form action="FileUploadServlet" method="post"
																	role="form" enctype="multipart/form-data">

																	<div class="form-group">
																		<h3>Choose Project CSV</h3>
																		<input type="file" class="form-control-file mr30"
																			name="projectfile" aria-describedby="fileHelp">

																	</div>


																	<button class="btn btn-success btn-add mr30"
																		type="submit">Submit</button>

																</form>

															</div>

															<div class="tab-pane" id="4" align="center">
																<form action="FileUploadServlet" method="post"
																	role="form" enctype="multipart/form-data">

																	<div class="form-group">
																		<h3>Choose People CSV</h3>
																		<input type="file" class="form-control-file mr30"
																			name="peoplefile" aria-describedby="fileHelp">

																	</div>


																	<button class="btn btn-success btn-add mr30"
																		type="submit">Submit</button>

																</form>

															</div>

															<div class="tab-pane" id="5" align="center">
																<form action="FileUploadServlet" method="post"
																	role="form" enctype="multipart/form-data">

																	<div class="form-group">
																		<h3>Choose Project Person CSV</h3>
																		<input type="file" class="form-control-file mr30"
																			name="projectpersonfile" aria-describedby="fileHelp">

																	</div>


																	<button class="btn btn-success btn-add mr30"
																		type="submit">Submit</button>

																</form>

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
