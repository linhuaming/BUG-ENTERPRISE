<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8">
    <title>${TITLE}</title>
    <meta name="keywords" content="${KEYWORDS}"/>
    <meta name="description" content="${DESCRIPTION}">
    <meta name="author" content="fhadmin">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- CSS -->
    <link rel="stylesheet" href="fh_static_1/css/style2.css">
    <link rel="stylesheet" href="fh_static_1/css/style.css">
    <link rel="stylesheet" type="text/css"
          href="fh_static_1/css/settings.css" media="screen"/>
    <!-- JS -->
    <script src="fh_static_1/js/jquery-1.8.2.min.js" type="text/javascript"></script>
    <!-- jQuery -->
    <script src="fh_static_1/js/jquery.easing.1.3.js" type="text/javascript"></script>
    <!-- jQuery easing -->
    <script src="fh_static_1/js/modernizr.custom.js" type="text/javascript"></script>
    <!-- Modernizr -->
    <script src="fh_static_1/js/jquery-ui-1.10.1.custom.min.js"
            type="text/javascript"></script>
    <!-- tabs, toggles, accordion -->
    <script src="fh_static_1/js/custom.js" type="text/javascript"></script>
    <!-- jQuery initialization -->
    <!-- Responsive Menu -->
    <script src="fh_static_1/js/jquery.meanmenu.js"></script>
    <script>
        jQuery(document).ready(function () {
            jQuery('header nav').meanmenu();
        });
    </script>
    <!-- Revolution Slider -->
    <script src="fh_static_1/js/jquery.themepunch.plugins.min.js"></script>
    <script src="fh_static_1/js/jquery.themepunch.revolution.min.js"></script>
    <script src="fh_static_1/js/revolution-slider-options.js"></script>
    <!-- Prety photo -->
    <script src="fh_static_1/js/jquery.prettyPhoto.js"></script>
    <script>
        $(document).ready(function () {
            $("a[data-gal^='prettyPhoto']").prettyPhoto();
        });
    </script>
    <!-- Tooltip -->
    <script src="fh_static_1/js/tooltip.js"></script>
    <!-- Flexisel -->
    <script type="text/javascript" src="fh_static_1/js/jquery.flexisel.js"></script>
    <!-- Favicons  -->
    <link rel="shortcut icon" href="fh_static_1/images/favicon.ico">
    <link rel="apple-touch-icon" href="fh_static_1/images/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="fh_static_1/images/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="fh_static_1/images/apple-touch-icon-114x114.png">
</head>
<body>

<div id="bkbg">

    <!-- header 包含导航菜单 -->
	<#include "headerTemplate.ftl">
    <!-- header 包含导航菜单 -->

    <!-- 轮播图 -->
    <link rel="stylesheet" href="/fh_static_1/css/swiper.min.css">
    <#--<div class="swiper-container">
        <div class="swiper-wrapper">
            <#list fieldList1 as var>
            <div class="swiper-slide">
                <div style="height: 500px;background-image:url('${var[1]}');background-repeat: no-repeat;background-position: center;background-attachment: local;background-size: contain;"></div>
            </div>
            </#list>
        </div>
        <!-- Add Pagination &ndash;&gt;
        <div class="swiper-pagination">
            &lt;#&ndash;<#list fieldList1 as var>
            <span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 1"></span>
            </#list>&ndash;&gt;
        </div>
        <!-- Add Arrows &ndash;&gt;
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>-->
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <#list fieldList1 as var>
                <div class="swiper-slide">
                    <div class="slide-imgs" style="background-image:url('${var[1]}');background-color:${var[4]!};background-repeat: no-repeat;background-position: center;background-attachment: local; "></div>
                </div>
            </#list>
        </div>
        <!-- 如果需要分页器 -->
        <div class="swiper-pagination"></div>

        <!-- 如果需要导航按钮 -->
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>

        <!-- 如果需要滚动条 -->
        <!--<div class="swiper-scrollbar"></div>-->
    </div>

</div>

    <!-- Swiper JS -->
    <script src="/fh_static_1/js/swiper.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
        var swiper = new Swiper('.swiper-container', {
            loop: true,
            autoplay:1000,
            speed:2000,
            pagination: '.swiper-pagination',
            paginationClickable: true,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            autoplayDisableOnInteraction : false  //用户操作swiper之后，是否禁止autoplay。默认为 true：停止。false是播放
        });


    </script>
    <div class="container" style="padding:20px 0;">
        <h3 class="text-center"> ${TITLE1}</h3>
        <p class="text-center" style="color:#999;"> ${TITLE2}</p>
        <div class="wrapper" id="services" style="margin:20px 0; min-height:auto !important;height:255px;">
            <div class="col-md-2 col-sm-5 col-xs-6" id="service01"  onclick="javascript:window.location.href = '${CPTOURL1}'">
                <p></p>
                <h5 class="text-center"><a href="#">${CPTITLE1}</a></h5>
                <span>${CPCONTENT1}</span>
            </div>
            <div class="col-md-2 col-sm-5 col-xs-6" id="service02" onclick="javascript:window.location.href = '${CPTOURL2}'">
                <p></p>
                <h5 class="text-center"><a href="#">${CPTITLE2}</a></h5>
                <span>${CPCONTENT2}</span>
            </div>
            <div class="col-md-2 col-sm-5 col-xs-6" id="service03" onclick="javascript:window.location.href = '${CPTOURL3}'">
                <p></p>
                <h5 class="text-center"><a href="#">${CPTITLE3}</a></h5>
                <span>${CPCONTENT3}</span>
            </div>
            <div class="col-md-2 col-sm-5 col-xs-6" id="service04" onclick="javascript:window.location.href = '${CPTOURL4}'">
                <p></p>
                <h5 class="text-center"><a href="#">${CPTITLE4}</a></h5>
                <span>${CPCONTENT4}</span>
            </div>
            <div class="col-md-2 col-sm-5 col-xs-6" id="service05"  onclick="javascript:window.location.href = '${CPTOURL5}'" style="margin-right:0;">
                <p></p>
                <h5 class="text-center"><a href="#">${CPTITLE5}</a></h5>
                <span>${CPCONTENT5}</span>
            </div>
        </div>

    </div>

   <#-- <div class="fullwidthbanner-container top-shadow">
        <div class="fullwidthbanner">
            <ul>
				<#list fieldList1 as var>
                    <li data-transition="boxfade" data-slotamount="${var_index+1+1}" data-masterspeed="300">
                        <img src="${var[1]}" alt="${var[0]}">
                    </li>
                </#list>
            </ul>
        </div>
    </div>-->
    <!-- END REVOLUTION SLIDER  -->
    <div class="copyrights">
    </div>
    <div class="container">


        <div class="clearfix"></div>

        <div class="separator"></div>
<#--
        <div class="sixteen columns">
            <h4 class="headline">项目案例&nbsp;&gt</h4>
        </div>

		<#list fieldList2 as var>
		<div class="four columns identity">
            <div class="work">
                <a href="${var[1]}" data-gal="prettyPhoto" class="work-image">
                    <img src="${var[1]}" alt="${var[0]}">
                    <div class="link-overlay fa fa-search"></div>
                </a>
                <a href="${var[2]}" class="work-name">${var[0]}</a>
                <div class="tags">${var[3]}</div>
            </div>
        </div>
        </#list>-->
        <div class="container">
            <div class="works" id="portfolio">
                <div class=" port-top">
                <#--<h3 class="port">Latest Works</h3>-->
                    <ul id="filters">
                        <li class="active"><span class="filter " data-filter="<#list proDicts as var>${var.DICTIONARIES_ID}  </#list>">所有</span></li>
            <#list proDicts as var>
                <li><span class="filter" data-filter="${var.DICTIONARIES_ID}">${var.NAME}</span></li>
            </#list>
                    </ul>
                    <div class="clearfix"> </div>
                </div>
                <div id="portfoliolist">
        <#list fieldList2 as var >
        <div class="portfolio ${var[6]} mix_all" data-cat="${var[6]}" style="display: inline-block; opacity: 1;">
            <div class="portfolio-wrapper ">
                <a href="${var[2]}" class="b-link-stripe b-animate-go">
                    <img class="img-responsive" src="${var[1]}" alt="${var[0]}"  />
                    <div class="b-wrapper">
                        <h2 class="b-animate b-from-left ">
                            <span>${var[0]}</span>
                            <p style="color:#fff;">查看案例</p>
                        <#--<button>查看案例</button>-->
                        </h2>
                    </div>
                </a>
            </div>
        </div>
        </#list>

                    <div class="clearfix"> </div>
                </div>
                <!-- Script for gallery Here -->
                <script type="text/javascript" src="/fh_static_1/js/jquery.mixitup.min.js"></script>
                <script type="text/javascript">
                    $(function () {

                        var filterList = {

                            init: function () {

                                // MixItUp plugin
                                // http://mixitup.io
                                $('#portfoliolist').mixitup({
                                    targetSelector: '.portfolio',
                                    filterSelector: '.filter',
                                    effects: ['fade'],
                                    easing: 'snap',
                                    // call the hover effect
                                    onMixEnd: filterList.hoverEffect()
                                });

                            },

                            hoverEffect: function () {

                                // Simple parallax effect
                                $('#portfoliolist .portfolio').hover(
                                        function () {
                                            $(this).find('.label').stop().animate({bottom: 0}, 200, 'easeOutQuad');
                                            $(this).find('img').stop().animate({top: -30}, 500, 'easeOutQuad');
                                        },
                                        function () {
                                            $(this).find('.label').stop().animate({bottom: -40}, 200, 'easeInQuad');
                                            $(this).find('img').stop().animate({top: 0}, 300, 'easeOutQuad');
                                        }
                                );

                            }

                        };

                        // Run the show!
                        filterList.init();
                    });
                </script>
                <!-- Gallery Script Ends -->
            </div>
        </div>


        <div class="clearfix"></div>

        <#--<!-- begin promobox &ndash;&gt;
        <div class="sixteen columns">
            <div class="promo-box clearfix">
                <div class="text">
                    <h3>${CONTENT1}</h3>
                    <p>${CONTENT2}</p>
                </div>
                <a class="btn big colored" href="${TOURL}" target="_blank">
                    <i class="fa fa-hand-o-right"></i>了解更多</a>
            </div>
        </div>-->
        <!-- end promobox -->

        <div class="separator"></div>

        <!-- Our Clients  -->
        <div class="sixteen columns clients">
            <h4 class="headline">合作伙伴&nbsp;&gt</h4>

            <!-- Start brand carousel -->
            <ul id="flexiselDemo2">
			<#list fieldList3 as var>
                <li onclick="window.location.href='${var[2]}'"><img src="${var[1]}" alt="${var[0]}"/></li>
            </#list>
            </ul>
            <div class="clearout"></div>
            <!-- End brand carousel -->
        </div>

    </div>
    <!-- container -->

    <!-- footer 包含底部 -->
	<#include "footerTemplate.ftl">
    <!-- footer 包含底部  -->

</div>

<script type="text/javascript">
    $(window).load(function () {

        $("#index").addClass("current_page_item");

        $("#flexiselDemo2").flexisel({
            visibleItems: 5,
            animationSpeed: 1000,
            autoPlay: true,
            autoPlaySpeed: 3000,
            pauseOnHover: true,
            enableResponsiveBreakpoints: true,
            responsiveBreakpoints: {
                portrait: {
                    changePoint: 480,
                    visibleItems: 1
                },
                landscape: {
                    changePoint: 640,
                    visibleItems: 2
                },
                tablet: {
                    changePoint: 768,
                    visibleItems: 3
                }
            }
        });

    });
</script>
<!-- End Document  -->
</body>
</html>