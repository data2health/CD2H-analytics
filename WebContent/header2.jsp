<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<style>

#center {
 margin-left: 2%;
}
nav,
nav a,
nav ul,
nav li,
nav ul li,
.dropdown-menu{
  background-color:  #393f4d;
  text-transform: uppercase;
}
nav a,
nav a:hover,
.dropdown-item,
#main-nav .dropdown-item:focus,
#main-nav .dropdown-item:hover{
  color:white;
}
#main-nav .dropdown-item:hover,
#main-nav nav ul li.current-menu-parent>a,
#main-nav nav ul li.current_page_parent>a,
#main-nav nav ul li.current-menu-item>a{
  background: white;
  background-color: #393f4d;
}
@media (min-width: 768px)
.pl-md-0, .px-md-0 {
    padding-left: 0!important;
}

@media only screen and (min-width: 900px)
.CD2H #site-logo {
    max-width: 33%;
    padding-left: 0%;
}

.pl-1, .px-1 {
    padding-left: 5rem!important;
}

</style>
<div id="outer">
<div id="main-nav" class="row no-gutters">
  	<div class="col-12 d-none d-lg-block">
  		<div id="header-logos"	class="row no-gutters   pt-3 pt-md-0 mt-2 mt-md-3 mb-4">
			<div class="pl-1 pl-md-0 col-9 col-md-8">
				<div id="center">
				<div id="site-logo" class="d-inline-block float-left">
					<a href="https://ctsa.ncats.nih.gov/cd2h/"><img width="321"
						height="112"
						src="https://ctsa.ncats.nih.gov/cd2h/wp-content/uploads/sites/7/2018/10/site_logo-768x229.png"
						class="image wp-image-15  attachment-full size-full" alt=""
						style="max-width: 100%; height: auto;" 
						sizes="(max-width: 321px) 200vw, 641px"/></a>
				</div>
				<div id="site-logo" class="d-inline-block float-center">
					<a href="https://ncats.nih.gov/"><img width="321"
						height="112"
						src="https://ctsa.ncats.nih.gov/cd2h/wp-content/uploads/sites/7/2018/10/NIHlogo-300x69.png"
						class="image wp-image-15  attachment-full size-full" alt=""
						style="max-width: 100%; height: auto;"
						sizes="(max-width: 321px) 200vw, 641px" /></a>
				</div>
				<div id="site-logo" class="d-inline-block float-left">
					<a href="https://ctsa.ncats.nih.gov/"><img width="321"
						height="112"
						src="https://ctsa.ncats.nih.gov/cd2h/wp-content/uploads/sites/7/2018/10/ctsa-g-logo.png"
						class="image wp-image-15  attachment-full size-full" alt=""
						style="max-width: 100%; height: auto;"
						sizes="(max-width: 321px) 200vw, 641px" /></a>
				</div>
				</div>
				
				
			</div>
			<div class="col-2 text-center d-md-none">
				<a class="btn btn-light" data-toggle="collapse"
					href="#searchform-mobile" role="button" aria-expanded="false"
					aria-controls="searchform-mobile"> <i class="fas fa-search"></i>
				</a>
			</div>
		</div>	
	
	
		<div id="main-nav" class="row no-gutters">
		<div class="col-12 d-none d-lg-block">
			<nav id="nav-primary" class="menu-main-menu-container">
				<ul id="menu-main-menu" class="nav nav-fill">
					<li itemscope="itemscope" itemtype="https://www.schema.org/SiteNavigationElement" id="menu-item-2185" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-home current-menu-item page_item page-item-16 current_page_item active menu-item-2185 nav-item">
						<a title="ABOUT" href="<util:applicationRoot/>" class="nav-link">Analytics Home</a>
					</li>
					<li itemscope="itemscope" itemtype="https://www.schema.org/SiteNavigationElement" id="menu-item-2182" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children dropdown menu-item-2182 nav-item">
						<a title="EXPLORE" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle nav-link" id="menu-item-dropdown-2182">EXPLORE</a>
						<ul class="dropdown-menu" aria-labelledby="menu-item-dropdown-2182" role="menu">
							<li itemscope="itemscope" itemtype="https://www.schema.org/SiteNavigationElement" id="menu-item-2248" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-2248 nav-item"><a title="cd2h_phase2" href="<util:applicationRoot/>/cd2h/dashboard.jsp" class="dropdown-item">CD2H Phase 2 Project Dashboard</a></li>
							<li itemscope="itemscope" itemtype="https://www.schema.org/SiteNavigationElement" id="menu-item-2254" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-2254 nav-item"><a title="ctsa_website" href="<util:applicationRoot/>/cd2h/projects.jsp?mode=org" class="dropdown-item">Explore Current CD2H Projects</a></li>
							<li itemscope="itemscope" itemtype="https://www.schema.org/SiteNavigationElement" id="menu-item-2254" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-2254 nav-item"><a title="ctsa_website" href="<util:applicationRoot/>/github/repos.jsp?mode=org" class="dropdown-item">Explore CD2H GitHub Organization</a></li>
							<li itemscope="itemscope" itemtype="https://www.schema.org/SiteNavigationElement" id="menu-item-2254" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-2254 nav-item"><a title="ctsa_website" href="<util:applicationRoot/>/proposals/display.jsp" class="dropdown-item">Explore CD2H Phase 2 Proposals</a></li>
							<li itemscope="itemscope" itemtype="https://www.schema.org/SiteNavigationElement" id="menu-item-2254" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-2254 nav-item"><a title="ctsa_website" href="<util:applicationRoot/>/incite/browse.jsp" class="dropdown-item">Explore CTSA Hub Website Content</a></li>
						</ul>
					</li>
					<li itemscope="itemscope" itemtype="https://www.schema.org/SiteNavigationElement" id="menu-item-2257" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children dropdown menu-item-2257 nav-item">
						<a title="Coordinating Centers" href="#" onclick="dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle nav-link" id="menu-item-dropdown-2257">Coordinating Centers</a>
							<ul class="dropdown-menu" aria-labelledby="menu-item-dropdown-2257" role="menu">
								<li itemscope="itemscope" itemtype="https://www.schema.org/SiteNavigationElement" id="menu-item-2260" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2260 nav-item"><a title="CD2H" href="/cd2h/" class="dropdown-item">CD2H</a></li>
								<li itemscope="itemscope" itemtype="https://www.schema.org/SiteNavigationElement" id="menu-item-2263" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2263 nav-item"><a title="CLIC" href="https://clic-ctsa.org/" class="dropdown-item">CLIC</a></li>
							</ul>
					</li>
				</ul>
			</nav>			
		</div>
	</div>
	<nav class="d-lg-none navbar navbar-expand-lg" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<button class="navbar-toggler text-light" type="button" data-toggle="collapse" data-target="#main-nav-mobile" aria-controls="main-nav-mobile" aria-expanded="false" aria-label="Toggle navigation">
				<i class="fas fa-bars"></i> Menu
			</button>
			<div id="main-nav-mobile" class="collapse navbar-collapse">
				<ul id="menu-main-menu-1" class="nav navbar-nav">
					<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-home current-menu-item page_item page-item-16 current_page_item menu-item-2185"><a href="https://ctsa.ncats.nih.gov/">ABOUT</a></li>
						<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2197">
							<a href="https://ctsa.ncats.nih.gov/initiatives/">Initiatives</a>
						</li>
						<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-2182">
							<a href="https://ctsa.ncats.nih.gov/updates/">COMMUNICATIONS</a>
							<ul class="sub-menu">
								<li class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-2248"><a href="https://ctsa.ncats.nih.gov/./newsletters/">Newsletters</a></li>
								<li class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-2254"><a href="https://ctsa.ncats.nih.gov/./pi-calls/">CTSA Program Webinar</a></li>
								<li class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-2251"><a href="https://ctsa.ncats.nih.gov/./sc-calls/">SC Meetings</a></li>
							</ul>
						</li>
						<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2179"><a href="https://ctsa.ncats.nih.gov/governance-guidelines/">GOVERNANCE &#038; GUIDELINES</a></li>
						<li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-2257"><a href="#">Coordinating Centers</a>
							<ul class="sub-menu">
								<li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2260"><a href="/cd2h/">CD2H</a></li>
								<li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2263"><a href="https://clic-ctsa.org/">CLIC</a></li>
							</ul>
						</li>
				</ul>
			</div>			
		</div>
	</nav>
	

	
</div>
</div>
</div>

<script>
	jQuery('.nav li.dropdown').hover(function() {
		jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
		}, function() {
		jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
	});
</script>