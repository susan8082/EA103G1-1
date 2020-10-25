<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, 
  initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Login</title>
  <style>
  .submit1
  {
  border-style:none !important;
  border-bottom-style:none;
  background:#4e73df;
  }
  .error1{
  text-align:left;
  }
  </style>

  <!-- Custom fonts for this template-->
  <link href="<%=request.getContextPath()%>/backend/template/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<%=request.getContextPath()%>/backend/template/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                  
                  
                  <c:if test="${not empty errorMsgs}">
	<ul>                             
	    <c:forEach var="message" items="${errorMsgs}">
			<li class="error1" style="color:red">${message}</li>
		</c:forEach>          
	</ul>
</c:if>
                  
				  <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                  </div>
                  
                  
                  
                  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/emp/emp.login" >
<!--                   <form class="user"> -->
                    <div class="form-group">
                      <input type="text" class="form-control form-control-user" name = "emp_no" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Enter EmpNo...">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" name = "emp_pwd" id="exampleInputPassword" placeholder="Password">
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">    
                      </div>
                    </div>
                    
					<button class="btn btn-primary btn-icon-split mt-1 ml-3 float-right"  type="submit" name="action" value="login">  
					<span class="text">Login Account</span>                             
					</button>                             

					<button  class="btn btn-secondary btn-icon-split mt-1 ml-3 float-right"  type="submit" name="action" value="forget">                                 
					<span class="text">Forgot Password?</span>                             
					</button>
                                                                         
                    </FORM>    
                    

<!--                     <div class="btn btn-primary btn-user btn-block"> -->
<!--                         <input type="hidden" name="action" value="login"> -->
<!--                         <input class="submit1" type="submit" value="Login"> -->
<!--                     </div>  -->

<%--                     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/emp/forget.jsp" > --%>
<!--                     <div class="btn btn-primary btn-user btn-block"> -->
<!--                         <input class="submit1" type="submit" value="Forgot your password?"> -->
<!--                     </div>                                                       -->
<!--                     </FORM>  -->
                    
<!--                      <div class="btn btn-primary btn-user btn-block"> -->
<%--                      <a href="<%=request.getContextPath()%>/backend/emp/forget.jsp"></a>  --%>
<!--                      <b>&nbsp</b><button class="btn btn-primary " type="submit" name="action" value="forget"  >forget</button>  -->
<!--                     </div>  -->                     
                              
<!--                         https://www.itread01.com/content/1550257936.html -->
<!--                         https://blog.csdn.net/sdewendong/article/details/72849462 -->
<!--                         https://gist.github.com/xsddz/ada698d4835eda8b1029 -->
                                               
<!-- <b>&nbsp</b><button class="btn btn-primary " type="submit" name="action" value="login"  >Login</button> --> 
                  
<%-- <a href="<%=request.getContextPath()%>/backend/emp/emp.login?action=login emp_no=E0001"></a>     --%>
<!--               </form>  -->
                             
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

</body>

</html>
