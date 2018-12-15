<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8">
    <title>${TITLE}-产品案例</title>
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
    <link rel="stylesheet" type="text/css"
          href="fh_static_1/css/bootstrap.min.css" media="screen"/>
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
    <script src="fh_static_1/js/bootstrap.min.js"></script>
    <!-- Favicons  -->
    <link rel="shortcut icon" href="fh_static_1/images/favicon.ico">
    <link rel="apple-touch-icon" href="fh_static_1/images/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="fh_static_1/images/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="fh_static_1/images/apple-touch-icon-114x114.png">

</head>
<body>

<!-- header 包含导航菜单 -->
	<#include "headerTemplate.ftl">
<!-- header 包含导航菜单 -->
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
        <#list fieldList5 as var >
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




<!-- container -->

<!-- footer 包含底部 -->
	<#include "footerTemplate.ftl">
<!-- footer 包含底部  -->

<script type="text/javascript">
    $(window).load(function () {
        $("#Product").addClass("current_page_item");
    });
</script>
<!-- End Document  -->
</body>
</html>