

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DBconnection.SQLconnection"%>
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
    <style>
        #customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            font-size: 20px;
            border-collapse: collapse;
            width: 100%;
        }

        #customers td, #customers th {
            border: 1px solid white;
            padding: 15px;
        }


        #customers th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #e91e63;
            color: white;
        }
    </style>
    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top ">
            <div class="container d-flex align-items-center justify-content-between">

                <h1 class="logo"><a>iTourX</a></h1>
                <!-- Uncomment below if you prefer to use an image logo -->
                <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

                <nav class="nav-menu d-none d-lg-block">
                    <ul>
                        <li><a href="userHome.jsp">Home</a></li>
                        <li><a style="color: #ff6633" href="timeline.jsp">Timeline</a></li>
                        <li><a href="people.jsp">People</a></li>
                        <li><a href="tweet.jsp">Tweet</a></li>
                        <li><a href="rating.jsp">Give Rating</a></li>
                        <li><a href="recommendation.jsp">Recommendation</a></li>
                        <li><a href="message.jsp">Message</a></li>
                        <li><a href="viewMessage.jsp">View Message</a></li>
                        <li><a href="followers.jsp">Followers</a></li>
                        <li><a href="following.jsp">Following</a></li>
                        <li><a href="index.jsp">Logout</a></li>
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

            <!-- ======= About Section ======= -->
            <section id="about" class="about">
                <div class="container" data-aos="fade-up">
                    <center><h2>Timeline</h2></center><br>
                    <div class="row">
                        <div class="col-lg-12">
                            <table id="customers">
                                <%                                                //while(rs2.next()){
                                    //fid=rs2.getInt("fid");
                                    //fname=rs2.getString("fname");
                                    //System.out.println("friend id"+fid);

                                    Statement st1 = null;
                                    ResultSet rs1 = null;
                                    String statusb = "Allow";
                                    String setting = "public";
                                    try {
                                        Connection con = SQLconnection.getconnection();
                                        st1 = con.createStatement();
                                        String sql3 = "SELECT * FROM tweet ORDER BY `tweet`.`tid` DESC";

                                        rs1 = st1.executeQuery(sql3);
                                        while (rs1.next()) {
                                            //rs.getString
%>
                                <tr>
                                    <td>
                                        <font style="color: black"><%=rs1.getString("username").toUpperCase()%><font>&nbsp;&nbsp; <font style="color: #c43c35">@<%=rs1.getString("username")%></font>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h4><p>Tweet:</p></h4><textarea readonly="" style="width: 400px; height: 90px; border-color: white; color: black"><%=rs1.getString("msg")%></textarea>
                                    </td>
                                    <td> 
                                        <img src="tweet_img?id=<%=rs1.getInt("tid")%>" alt="" width="400" height="300" /><br><br><br><br><br>
                                    </td>
                                </tr>

                                <%
                                        }
                                    } catch (Exception e3) {
                                        System.out.println(e3);
                                    }

                                %>
                            </table>
                        </div>
                    </div>
                </div>
            </section><!-- End About Section -->

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