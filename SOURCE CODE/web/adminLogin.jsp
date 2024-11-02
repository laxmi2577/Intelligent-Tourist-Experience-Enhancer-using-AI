

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Intelligent Tourist Experience Enhancer using AI</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">

    </head>
    <%
        if (request.getParameter("Failed") != null) {
    %>
    <script>alert('Login Failed');</script>
    <%            }
    %>
    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top ">
            <div class="container d-flex align-items-center justify-content-between">

                <h1 class="logo"><a>iTourX</a></h1>
                <!-- Uncomment below if you prefer to use an image logo -->
                <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

                <nav class="nav-menu d-none d-lg-block">
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="userLogin.jsp">User</a></li>
                        <li><a style="color: #ff6633" href="adminLogin.jsp">Admin</a></li>
                    </ul>
                </nav><!-- .nav-menu -->

            </div>
        </header><!-- End Header -->

        <!-- ======= Hero Section ======= -->
        <section id="hero" class="d-flex align-items-center justify-content-center">
            <div class="container" data-aos="fade-up">

                <div class="row justify-content-center" data-aos="fade-up" data-aos-delay="150">
                    <div class="col-xl-12 col-lg-8">
                        <h1>Intelligent Tourist Experience Enhancer using AI</h1>
                    </div>
                </div>

            </div>
        </section><!-- End Hero -->

        <main id="main">

            <!-- ======= contact Section ======= -->
            <section id="contact" class="contact">
                <div class="container" data-aos="fade-up">                        
                    <center><h3>Admin Login</h3></center><br>
                    <div class="row mt-5">
                        <div class="col-lg-6 mt-5 mt-lg-0">
                            <img src="assets/img/login.jpg" width="450" height="400" />
                        </div>
                        <div class="col-lg-6 mt-5 mt-lg-0">
                            <form action="adminLogin" method="post" role="form">
                                <div class="form-group">
                                    <label>Email :</label>
                                    <input type="text" class="form-control" name="name" placeholder="Enter Your Email" required="" />
                                </div>
                                <div class="form-group">
                                    <label>Password :</label>
                                    <input type="password" class="form-control" name="pass" placeholder="Enter Your Password" required="" />
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-block btn-success">Login</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section><!-- End Contact Section -->

        </main><!-- End #main -->

        <!-- ======= Footer ======= -->
        <footer id="footer">
            <div class="container">
                <div class="copyright">
                      &copy; <strong><span><a href="https://github.com/laxmi2577">DEVELOPED BY LAXMIRANJAN SAHU</a></span></strong>
                </div>
            </div>
        </footer><!-- End Footer -->

        <a href="#" class="back-to-top"><i class="ri-arrow-up-line"></i></a>
        <div id="preloader"></div>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/venobox/venobox.min.js"></script>
        <script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
        <script src="assets/vendor/counterup/counterup.min.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>
