<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="java.util.* , com.prod.model.ProdVO" %>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Minimal Shop Theme">
<meta name="keywords" content="responsive, retina ready, html5, css3, shop, market, onli store, bootstrap theme" />
<meta name="author" content="KingStudio.ro">

<!-- favicon -->
<link rel="icon" href="images/favicon.png">
<!-- page title -->
<title>MS - Minimal Shop Theme</title>
<!-- bootstrap css -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- css -->
<link href="css/style.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<!-- fonts -->
<link href="https://fonts.googleapis.com/css?family=Rubik:400,500,700,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lily+Script+One" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href='fonts/FontAwesome.otf' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/linear-icons.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
    
</head>

<body>

<!-- preloader -->
<div id="preloader">
    <div class="spinner spinner-round"></div>
</div>
<!-- / preloader -->

<div id="top"></div>

<!-- header -->
<header>

    <!-------------------------------------- nav ------------------------------------------>
<%
              Integer or_total=0; 
              Integer count = 0;
			
                Vector<ProdVO> buylist = (Vector<ProdVO>) session.getAttribute("shoppingcart");
                if (buylist != null && (buylist.size() > 0)) {
				for (int index = 0; index < buylist.size(); index++) {
				count = (index+1);
				                     }
	                                 }
%>

        <nav class="navbar navbar-default nav-sec navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html"><img src="images/logo.png" alt="logo"></a>
                </div><!-- / navbar-header -->
                <div class="secondary-nav">
                    <a href="login-register.html" class="my-account space-right"><i class="fa fa-user"></i></a>
                    <a href="Cart.jsp" class="shopping-cart"><i class="fa fa-shopping-cart"></i> <span class="cart-badge"><%=count%></span></a>
                </div>
                <div class="navbar-collapse collapse text-center">
                    <ul class="nav navbar-nav">
                        <li><a href="EShop.jsp"><span>HOME</span></a></li>
                        <li><a href="about.html"><span>ABOUT</span></a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span>BLOG</span> <span class="dropdown-icon"></span></a>
                            <ul class="dropdown-menu animated zoomIn fast">
                                <li><a href="blog.html"><span>BLOG FULLWIDTH</span></a></li>
                                <li><a href="blog-masonry.html"><span>BLOG MASONRY</span></a></li>
                                <li><a href="blog-sidebar.html"><span>BLOG SIDEBAR</span></a></li>
                                <li><a href="single-post-full.html"><span>POST FULLWIDTH</span></a></li>
                                <li><a href="single-post.html"><span>POST SIDEBAR</span></a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span>SHOP</span> <span class="dropdown-icon"></span></a>
                            <ul class="dropdown-menu animated zoomIn fast">
                                <li class="active"><a href="ESop.jsp"><span>FULL WIDTH</span></a></li>
                                <li><a href="shop-right.html"><span>RIGHT SIDEBAR</span></a></li>
                                <li><a href="shop-left.html"><span>LEFT SIDEBAR</span></a></li>
                                <li><a href="shop-masonry.html"><span>MASONRY</span></a></li>
                                <li><a href="single-product.html"><span>SINGLE PRODUCT</span></a></li>
                                <li><a href="single-product2.html"><span>SINGLE PRODUCT 2</span></a></li>
                                <li><a href="single-product3.html"><span>SINGLE PRODUCT 3</span></a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span>PAGES</span> <span class="dropdown-icon"></span></a>
                            <ul class="dropdown-menu animated zoomIn fast">
                                <li><a href="faq.html"><span>FAQ</span></a></li>
                                <li><a href="Cart.jsp"><span>SHOPPING CART</span></a></li>
                                <li><a href="login-register.html"><span>LOGIN / REGISTER</span></a></li>
                                <li><a href="my-account.html"><span>MY ACCOUNT</span></a></li>
                                <li><a href="checkout.html"><span>CHECKOUT</span></a></li>
                                <li><a href="404.html"><span>404 PAGE</span></a></li>
                                <li><a href="components.html"><span>COMPONENTS</span></a></li>
                            </ul>
                        </li>
                        <li><a href="contact.html"><span>CONTACT</span></a></li>
                    </ul>
                </div>
                <!--/ nav-collapse -->
            </div><!-- / container -->
        </nav>
        <!------------------------------------ / nav -------------------------------------------->
        

    <!-- header-banner -->
    <div id="header-banner">
        <div class="banner-content single-page text-center">
            <div class="banner-border">
                <div class="banner-info">
                    <h1>Shopping Cart</h1>
                </div><!-- / banner-info -->
            </div><!-- / banner-border -->
        </div><!-- / banner-content -->
    </div>
    <!-- / header-banner -->
</header>
<!-- / header -->

<!-- content -->

<!-- shopping-cart -->
<div id="shopping-cart">
    <div class="container">
    
    
       
        <!-------------------------------------- shopping cart table ------------------------------------>
   
        
        
<%
if (buylist != null && (buylist.size() > 0)) {
%> 
    


        <table class="shopping-cart">
            <thead>
                <tr>
                    <th class="image">&nbsp;</th>
                    <th>商品</th>
                    <th>商品價格</th>
                    <th>購買數量</th>
                    <th>總金額</th>
                    <th>&nbsp;</th>
                </tr>
            </thead>

<%	 for (int index = 0; index < buylist.size(); index++) {
	ProdVO order = buylist.get(index);
    int prod_qty = order.getProd_qty();
	int prod_price = order.getProd_price();
	int prod_no = order.getProd_no();
	 or_total += prod_qty * prod_price;
	 count = index;
%>
            
            <tbody>
                <tr class="cart-item">
 <td class="image">
<form  action="<%=request.getContextPath()%>/frontend/shop/shopping" method="POST" enctype="multipart/form-data">
  <input type="hidden" name="prod_no" value="<%=order.getProd_no()%>">
  <input type="hidden" name="action" value="getOne_For_Detail">		
  <button type="submit" name="Submit" value="商品詳情"   class="view-btn" data-toggle="tooltip" title="View Product" style="width:60px;height:60px;">
  <img src="<%=request.getContextPath()%>/frontend/shop/prod.pic?action=getpic&prod_no=<%=order.getProd_no()%>"  alt="">
  </button>   
</form>             
 </td>
                    <td><%=order.getProd_name()%></a></td>
                    <td><%=order.getProd_price()%></td>
                    <td class="qty"><%=order.getProd_qty()%></td>
                    <td><%=order.getProd_price()*order.getProd_qty()%></td>
                    
                    
              <td>
              <form name="deleteForm" action="<%=request.getContextPath()%>/frontend/shop/cart" method="POST">
              <input type="hidden" name="action" value="DELETE">
              <input type="hidden" name="del" value="<%= index %>">
              <input type="submit" value="X" class="btn btn-danger-filled x-remove">
              </form>
              </td>
             
                </tr>
                 
<%}%> 

            </tbody>
        </table>
<%}%>  
    
    
        
        <!-- / shopping cart table -->

        <div class="row cart-footer">
            <div class="coupon col-sm-6">
            
            
<FORM METHOD="post" action="<%=request.getContextPath()%>/frontend/shop/shopping"  enctype="multipart/form-data"  > 
                <div class="input-group">
                    <input type="text" name="prod_name" class="form-control rounded" id="coupon-code" placeholder="輸入你想找的商品">
                    <span class="input-group-btn">
                    <input type="hidden" name="action" value="Fuzzy_Search">
                    <input type="submit" value="再找找你想要的商品"  class="btn btn-primary-filled btn-rounded" type="button"><i class="lnr lnr-tag"></i> 
                    <span>再找找想要的商品</span>>  
                    </span>
</FORM>	 
                </div>
            
       
        
        

                
                
                
            </div><!-- / input-group -->
            <div class="update-cart col-sm-6">
            
            <form  action="<%=request.getContextPath()%>/frontend/shop/shopping" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="action" value="Clear_Cart">
            <button  type="submit" name="Submit" value="清空購物車" class="btn btn-default-filled btn-rounded" type="button"><i class="lnr lnr-sync"></i> <span>清空購物車</span></button>
            </form>
            </div><!-- / update-cart -->



            <div class="col-sm-6 cart-total">
                <h4>此次消費總金額:</h4>
                <h3 style="color:deeppink;">NT$ <%=or_total%></h3>
              
            </div><!-- / cart-total -->

            <div class="col-sm-6 cart-checkout">
                <a href="EShop.jsp" class="btn btn-default-filled btn-rounded"><i class="lnr lnr-cart"></i> <span>再逛逛</span></a>
                <a href="Checkout.jsp" class="btn btn-primary-filled btn-rounded"><i class="lnr lnr-exit"></i> <span>結帳去</span></a>
            </div><!-- / cart-checkout -->


        </div><!-- / row -->
    </div><!-- / container -->
</div>
<!-- / shopping-cart -->

<!-- / content -->

<!-- scroll to top -->
<a href="#top" class="scroll-to-top page-scroll is-hidden" data-nav-status="toggle"><i class="fa fa-angle-up"></i></a>
<!-- / scroll to top -->

<!-- footer -->
<footer class="light-footer">
    <div class="widget-area">
        <div class="container">
            <div class="row">

                <div class="col-md-4 widget">
                    <div class="about-widget">
                        <div class="widget-title-image">
                            <img src="images/logo2.png" alt="">
                        </div>
                        <p>Vivamus consequat lacus quam, nec egestas quam egestas sit amet. Suspendisse et risus gravida tellus aliquam ullamcorper. Pellentesque elit dolor, ornare ut lorem nec, convallis nibh accumsan lacus morbi leo lipsum.</p>
                    </div><!-- / about-widget -->
                </div><!-- / widget -->
                <!-- / first widget -->

                <div class="col-md-2 widget">
                    <div class="widget-title">
                        <h4>BRANDS</h4>
                    </div>
                    <div class="link-widget">
                        <div class="info">
                            <a href="#x">Brand 1</a>
                        </div>
                        <div class="info">
                            <a href="#x">Brand 2</a>
                        </div>
                        <div class="info">
                            <a href="#x">Brand 3</a>
                        </div>
                        <div class="info">
                            <a href="#x">Brand 4</a>
                        </div>
                    </div>
                </div><!-- / widget -->
                <!-- / second widget -->

                <div class="col-md-2 widget">
                    <div class="widget-title">
                        <h4>SUPPORT</h4>
                    </div>
                    <div class="link-widget">
                        <div class="info">
                            <a href="#x">Terms & Conditions</a>
                        </div>
                        <div class="info">
                            <a href="#x">Shipping & Return</a>
                        </div>
                        <div class="info">
                            <a href="faq.html">F.A.Q</a>
                        </div>
                        <div class="info">
                            <a href="contact.html">Contact</a>
                        </div>
                    </div>
                </div><!-- / widget -->
                <!-- / third widget -->

                <div class="col-md-4 widget">
                    <div class="widget-title">
                        <h4>CONTACT</h4>
                    </div>
                    <div class="contact-widget">
                        <div class="info">
                            <p><i class="lnr lnr-map-marker"></i><span>Miami, S Miami Ave, SW 20th, Store No.1</span></p>
                        </div>
                        <div class="info">
                            <a href="tel:+0123456789"><i class="lnr lnr-phone-handset"></i><span>+0123 456 789</span></a>
                        </div>
                        <div class="info">
                            <a href="mailto:hello@yoursite.com"><i class="lnr lnr-envelope"></i><span>office@yoursite.com</span></a>
                        </div>
                        <div class="info">
                            <i class="lnr lnr-thumbs-up"></i>
                            <span class="social text-left">
                                <a class="no-margin" href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-google-plus"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                            </span>
                        </div>
                    </div><!-- / contact-widget -->
                </div><!-- / widget -->
                <!-- / fourth widget -->

            </div><!-- / row -->
        </div><!-- / container -->
    </div><!-- / widget-area -->
    <div class="footer-info">
        <div class="container">
                <div class="pull-left copyright">
                    <p><strong>© MS - MINIMAL SHOP THEME</strong></p>
                </div>
                <span class="pull-right">
                    <img src="images/visa.png" alt="">
                    <img src="images/mastercard.png" alt="">
                    <img src="images/discover.png" alt="">
                    <img src="images/paypal.png" alt="">
                </span>
        </div><!-- / container -->
    </div><!-- / footer-info -->
</footer>
<!-- / footer -->

<!-- javascript -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<!-- sticky nav -->
<script src="js/jquery.easing.min.js"></script>
<script src="js/scrolling-nav-sticky.js"></script>
<!-- / sticky nav -->

<!-- hide nav -->
<script src="js/hide-nav.js"></script>
<!-- / hide nav -->

<!-- preloader -->
<script src="js/preloader.js"></script>
<!-- / preloader -->

<!-- / javascript -->
</body>

</html>