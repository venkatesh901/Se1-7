<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>

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
														<h2>Clients</h2>
													</div>

													<div id="exTab2" class="container">
														<ul class="nav nav-tabs">
															<li class="active"><a href="#1" data-toggle="tab">Clients
																	List </a></li>
															<li><a href="#2" data-toggle="tab">Add Client</a></li>
															<li><a href="#3" data-toggle="tab">Update Client</a></li>
															<li><a href="#4" data-toggle="tab">Inactive
																	Client</a></li>

														</ul>

														<div class="tab-content mr50">
															<div class="tab-pane active" id="1" align="center">
								
												            			<jsp:include page="listclients.jsp" />

															</div>

															<div class="tab-pane" id="2" align="center">
												            			<jsp:include page="addclient.jsp" />
												            

															</div>

															<div class="tab-pane" id="3" align="center">
																<form action="homepage" method="post" role="form">




																	<button class="btn btn-success btn-add mr30"
																		type="submit">Submit</button>

																</form>

															</div>

															<div class="tab-pane" id="4" align="center">
																<form action="homepage" method="post" role="form">



																	<button class="btn btn-success btn-add mr30"
																		type="submit">Submit</button>

																</form>

															</div>

															<div class="tab-pane" id="5" align="center">
																<form action="homepage" method="post" role="form">




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
    <script type="text/javascript">
      $(function () {
        $('#example2').dataTable({
          "bPaginate": true,
          "bLengthChange": false,
          "bFilter": false,
          "bSort": true,
          "bInfo": true,
          "bAutoWidth": false
        });
      });
    </script>
</html>
