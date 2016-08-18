<div class="col-md-3 left_col">
	<div class="left_col scroll-view">

		<div class="navbar nav_title" style="border: 0;"></div>
		<div class="clearfix"></div>




		<br />

		<!-- sidebar menu -->
		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu"
			style="display: block">
			<a href="menu.jsp"></a>
			<div class="menu_section">
				<ul class="nav side-menu">

					<li><a href="projects">
							<i class="fa fa-book"></i> Projects
						</a></li>

					<li><a href="people">
							<i class="fa fa-users"></i> People
						</a></li>



					<li><a href="managerprojectperson">
							<i class="fa fa-book"></i> Project Person
						</a></li>


					<li><a href="timesheets">
							<i class="fa fa-book"></i> Time Sheets
						</a></li>

					<br>
					<br>




					<li><a href="logout">
							<i class="fa fa-sign-out"></i> Logout
						</a></li>


				</ul>
			</div>

			<div class="sidebar-footer hidden-small hide">
				<a data-toggle="tooltip" data-placement="top" title="Settings">
					<span class="glyphicon glyphicon-cog hide" aria-hidden="true"></span>
				</a>
				<a data-toggle="tooltip" data-placement="top" title="">
					<span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
				</a>
				<a data-toggle="tooltip" data-placement="top" title="Lock">
					<span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
				</a>
				<a data-toggle="tooltip" data-placement="top" title="Logout">
					<span class="glyphicon glyphicon-off" aria-hidden="true"></span>
				</a>



			</div>

		</div>

		<!-- /menu footer buttons -->
	</div>
</div>

<!-- top navigation -->
<div class="top_nav">

	<div class="nav_menu">
		<nav class="" role="navigation">
			<div class="nav toggle">
				<a id="menu_toggle">
					<i class="fa fa-bars"></i>
				</a>
			</div>


			<ul class="nav navbar-nav navbar-right">



				<h3 style="padding-top: 7px;">
					<%
						
					%>

					Hi,
					<%
						out.print(session.getAttribute("name"));
					%>
				</h3>
			</ul>
		</nav>
	</div>

</div>