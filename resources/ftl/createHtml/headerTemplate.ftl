
<link rel="stylesheet" href="fh_static_1/css/bootstrap.min.css">
<link rel="stylesheet" href="fh_static_1/css/bootsnav.css">
<link rel="stylesheet" href="fh_static_1/css/animate.css">
<link rel="stylesheet" href="fh_static_1/css/color.css">
<link rel="stylesheet" href="fh_static_1/css/overwrite.css">

<script src="fh_static_1/js/bootsnav.js"></script>
<script src="fh_static_1/js/bootstrap.min.js"></script>
<#--<header class="header">-->

    <nav class="navbar navbar-default navbar-fixed dark bootsnav on no-full navbar-transparent">

        <!-- Start Top Search -->
        <div class="top-search" style="display: none;">
            <div class="container">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                    <input type="text" class="form-control" placeholder="Search">
                    <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                </div>
            </div>
        </div>
        <!-- End Top Search -->

        <div class="container">
            <!-- Start Atribute Navigation -->
            <#--<div class="attr-nav">-->
                <#--<ul>-->
                    <#--<li class="dropdown">-->
                        <#--<a href="#" class="dropdown-toggle" data-toggle="dropdown">-->
                            <#--<i class="fa fa-shopping-bag"></i>-->
                            <#--<span class="badge">3</span>-->
                        <#--</a>-->
                        <#--<ul class="dropdown-menu cart-list animated fadeOutUp" style="display: none; opacity: 1;">-->
                            <#--<li>-->
                                <#--<a href="#" class="photo"><img src="images/thumb/thumb01.jpg" class="cart-thumb" alt=""></a>-->
                                <#--<h6><a href="#">Delica omtantur </a></h6>-->
                                <#--<p>2x - <span class="price">$99.99</span></p>-->
                            <#--</li>-->
                            <#--<li>-->
                                <#--<a href="#" class="photo"><img src="images/thumb/thumb02.jpg" class="cart-thumb" alt=""></a>-->
                                <#--<h6><a href="#">Omnes ocurreret</a></h6>-->
                                <#--<p>1x - <span class="price">$33.33</span></p>-->
                            <#--</li>-->
                            <#--<li>-->
                                <#--<a href="#" class="photo"><img src="images/thumb/thumb03.jpg" class="cart-thumb" alt=""></a>-->
                                <#--<h6><a href="#">Agam facilisis</a></h6>-->
                                <#--<p>2x - <span class="price">$99.99</span></p>-->
                            <#--</li>-->
                            <#--<li class="total">-->
                                <#--<span class="pull-right"><strong>Total</strong>: $0.00</span>-->
                                <#--<a href="#" class="btn btn-default btn-cart">Cart</a>-->
                            <#--</li>-->
                        <#--</ul>-->
                    <#--</li>-->
                    <#--<li class="search"><a href="#"><i class="fa fa-search"></i></a></li>-->
                    <#--<li class="side-menu"><a href="#"><i class="fa fa-bars"></i></a></li>-->
                <#--</ul>-->
            <#--</div>-->
            <!-- End Atribute Navigation -->

            <!-- Start Header Navigation -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="/">
                    <img src="${LOGO}" alt="${NAME}" class="logo logo-display" title="${NAME}" />
                    <img src="${LOGO}" alt="${NAME}" class="logo logo-scrolled" title="${NAME}" />
                    <#--<img src="images/brand/logo-white.png" class="logo logo-display" alt="">-->
                    <#--<img src="images/brand/logo-black.png" class="logo logo-scrolled" alt="">-->
                </a>
            </div>
            <!-- End Header Navigation -->

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
                    <li><a href="index.html">首页</a></li>
                    <li><a href="webaboutus.html">关于我们</a></li>
                    <li class="dropdown megamenu-fw" onclick="javascript:window.location.href =  '${basePath}/webproduct.html'">
                        <a href="webproduct.html" class="dropdown-toggle" data-toggle="dropdown">产品案例</a>
                        <ul id="webproductUl" class="dropdown-menu megamenu-content animated fadeOutUp" role="menu" style="width:100vw !important;position: absolute;left:-100px;">
                            <li>
                                <div class="row">
                                    <div class="col-menu col-md-3">
                                        <h6 class="title">Title Menu One</h6>
                                        <div class="content">
                                            <ul class="menu-col">
                                                <li><a href="#">Custom Menu</a></li>
                                                <li><a href="#">Custom Menu</a></li>
                                                <li><a href="#">Custom Menu</a></li>
                                                <li><a href="#">Custom Menu</a></li>
                                                <li><a href="#">Custom Menu</a></li>
                                                <li><a href="#">Custom Menu</a></li>
                                            </ul>
                                        </div>
                                    </div><!-- end col-3 -->
                                    <div class="col-menu col-md-3">
                                        <h6 class="title">Title Menu Two</h6>
                                        <div class="content">
                                            <ul class="menu-col">
                                                <li><a href="#">Custom Menu</a></li>
                                                <li><a href="#">Custom Menu</a></li>
                                                <li><a href="#">Custom Menu</a></li>
                                                <li><a href="#">Custom Menu</a></li>
                                                <li><a href="#">Custom Menu</a></li>
                                                <li><a href="#">Custom Menu</a></li>
                                            </ul>
                                        </div>
                                    </div><!-- end col-3 -->
                                    <div class="col-menu col-md-3">
                                        <h6 class="title">Title Menu Three</h6>
                                        <div class="content">
                                            <ul class="menu-col">
                                                <li><a href="#">Custom Menu</a></li>
                                                <li><a href="#">Custom Menu</a></li>
                                                <li><a href="#">Custom Menu</a></li>
                                                <li><a href="#">Custom Menu</a></li>
                                                <li><a href="#">Custom Menu</a></li>
                                                <li><a href="#">Custom Menu</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-menu col-md-3">
                                        <h6 class="title">Title Menu Four</h6>
                                        <div class="content">
                                            <ul class="menu-col">
                                                <li><a href="#">Custom Menu</a></li>
                                                <li><a href="#">Custom Menu</a></li>
                                                <li><a href="#">Custom Menu</a></li>
                                                <li><a href="#">Custom Menu</a></li>
                                                <li><a href="#">Custom Menu</a></li>
                                                <li><a href="#">Custom Menu</a></li>
                                            </ul>
                                        </div>
                                    </div><!-- end col-3 -->
                                </div><!-- end row -->
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="webcooperation.html" class="dropdown-toggle" data-toggle="dropdown">合作共赢</a>
                        <ul class="dropdown-menu animated">
                            <li><a href="#">Custom Menu</a></li>
                            <li><a href="#">Custom Menu</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Sub Menu</a>
                                <ul class="dropdown-menu animated">
                                    <li><a href="#">Custom Menu</a></li>
                                    <li><a href="#">Custom Menu</a></li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Sub Menu</a>
                                        <ul class="dropdown-menu animated">
                                            <li><a href="#">Custom Menu</a></li>
                                            <li><a href="#">Custom Menu</a></li>
                                            <li><a href="#">Custom Menu</a></li>
                                            <li><a href="#">Custom Menu</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">Custom Menu</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Custom Menu</a></li>
                            <li><a href="#">Custom Menu</a></li>
                            <li><a href="#">Custom Menu</a></li>
                            <li><a href="#">Custom Menu</a></li>
                        </ul>
                    </li>
                    <li><a href="webnews.html">新闻动态</a></li>
                    <li><a href="webcontactus.html">联系我们</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div>
        <script src="/fh_static_1/js/custom.js"></script>
		<script>
            function resetProductUl(){
                var menu = $('#navbar-menu');
                $('#webproductUl').css({left:-menu.offset().left});
            }
            $(function(){
                resetProductUl();
			});
			$(window).resize(resetProductUl);

		</script>
        <!-- Start Side Menu -->
        <div class="side">
            <a href="#" class="close-side"><i class="fa fa-times"></i></a>
            <div class="widget">
                <h6 class="title">Custom Pages</h6>
                <ul class="link">
                    <li><a href="#">About</a></li>
                    <li><a href="#">Services</a></li>
                    <li><a href="#">Blog</a></li>
                    <li><a href="#">Portfolio</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
            <div class="widget">
                <h6 class="title">Additional Links</h6>
                <ul class="link">
                    <li><a href="#">Retina Homepage</a></li>
                    <li><a href="#">New Page Examples</a></li>
                    <li><a href="#">Parallax Sections</a></li>
                    <li><a href="#">Shortcode Central</a></li>
                    <li><a href="#">Ultimate Font Collection</a></li>
                </ul>
            </div>
        </div>
        <!-- End Side Menu -->
    </nav>
		<#--<div class="container">
			<div class="logos columns">
				<h1 class="logo">
					<a href="index.html"><img src="${LOGO}" alt="${NAME}" title="${NAME}" /></a>
				</h1>
			</div>
			<!-- logo &ndash;&gt;




				<nav class="main_menu">

					<ul>
						<li id="index">
							<a href="index.html"> 首页
								<div class="sub"> Home </div>
							</a>
						</li>

						<li id="aboutus">
							<a href="webaboutus.html"> 关于我们
								<div class="sub">About Us</div>
							</a>
						</li>

						<li id="Product">
							<a href="webproduct.html"> 产品案例
								<div class="sub">Product case</div>
							</a>
						</li>

						<li id="cooperation">
							<a href="webcooperation.html">合作共赢
								<div class="sub">Cooperation</div>
							</a>
						</li>

						<li id="News">
							<a href="webnews.html"> 新闻动态
								<div class="sub">News & Events</div>
							</a>
						</li>

						<li id="contactus">
							<a href="webcontactus.html"> 联系我们
								<div class="sub">Contact US</div>
							</a>
						</li>
					</ul>

				</nav>
				<!-- navigation &ndash;&gt;
			</div>
			<div class="clearfix"></div>
		</div>-->
	<#--</header>-->