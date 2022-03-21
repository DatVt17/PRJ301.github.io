<%@page import="DTO.OrderDetail"%>
<%@page import="DTO.User"%>
<%@page import="DTO.Product"%>
<%@page import="DTO.Category"%>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>
            Logistic</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <%
          String currentUserID = "";
            try {
                currentUserID = session.getAttribute("currentUserID").toString();
            } catch (Exception e) {
            }
            User currentUser = new User();
            if (!currentUserID.isEmpty()) {
                currentUser = DAO.UserDAO.getUserByID(Integer.parseInt(currentUserID));
            }
        
        %>
    </head>
<body class="sb-nav-fixed">
          <!-- Page Preloder -->
      
        <!-- Header Section Begin -->
        <header class="header">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="header__top__left">
                                <ul>
                                    <li><i class="fa fa-envelope"></i> ogani@gmail.com</li>
                                    <li>Free Shipping for all Order of $99</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="header__top__right">
                                <div class="header__top__right__auth">
                                    <a href="./login.jsp">
                                        <%                                            if (currentUser.getUserID() == 0) {
                                        %>
                                        <i class="fa fa-user"></i>Login
                                        <%
                                        } else {
                                        %>
                                        <i class="fa fa-user"></i><%= currentUser.getFullName()%>
                                        <a href="./logoutServlet">Logout</a>
                                        <%
                                            }
                                        %>

                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="header__logo">
                            <div class="footer__about__logo">
                                <a class="navbar-brand" href="index.html">
                                    <span>

                                        Logistic 
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <nav class="header__menu">
                            <ul>
                                <li><a href="./home.jsp">Home</a></li>
                                <li><a href="./contact.jsp">Contact</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3">
                      
                    </div>
                </div>
                <div class="humberger__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </header>
        <!-- Header Section End -->
    <div id="layoutSidenav_content">
        <main class="container">
            <div class="container-fluid px-4">
                <form action="AdminServlet" method="post">
                  
                    <div class="form-row">
                        <div class="form-group">
                            <label for="inputEmail4">Product Name</label>
                            <input name="name" type="text" class="form-control" id="inputEmail4">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputAddress">Image</label>
                        <input name="img" type="text" class="form-control" id="inputAddress">
                    </div>
                    <div class="form-group">
                        <label for="inputAddress2">Price</label>
                        <input name="price" type="text" class="form-control" id="inpu2">
                    </div>
                      <div class="form-group">
                        <label for="inputAddress2">quantity</label>
                        <input name="quantity" type="number" class="form-control" id="inputAddress2" >
                          <label for="inputAddress2">Category</label>
                          <select class="form-control" name="cate">
                              <%
                              ArrayList<Category> arrayList = DAO.CategoryDAO.getAllCategory();
                              for(Category category : arrayList){
                                  %>
                                  <option value="<%=category.getCategoryID()%>"><%=category.getCategoryName()%></option>
                              <%
                              }
                              %>
                          </select>
                                <label for="inputAddress2">usingDate</label>
                        <input name="usingDate" type="number" class="form-control" id="inputAddress2" >
                    </div>
                    <button name="Add" value="add" type="submit" class="btn btn-primary">Add</button>
                </form>
            </div>
        </main>
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted"> DatvtLogistic</div>
                            <div>
                                <a href="#">Fast</a>
                                &middot;
                                <a href="#">Convenient &amp; Optimized</a>
                            </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

<script type="text/javascript">
</script>
</body>
</html>
