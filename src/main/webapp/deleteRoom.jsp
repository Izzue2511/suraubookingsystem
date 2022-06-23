<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>

<head>
    <title>Delete room</title>
  <link rel="stylesheet"  href="roomHandler.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
 <div class="sidebar">
    <div class="logo-details">
      <img src="logoWhite.png">
    </div>
      <ul class="nav-links">
        <li>
          <a class="main-menu" href="homepage.html">
            <i class='bx bx-home'></i>
            <span class="links_name">LAMAN UTAMA</span>
          </a>
        </li>

        <li>
          <a class="main-menu" href="#">
            <i class='bx bx-box' ></i>
            <span class="links_name" id="min">BILIK</span>
          </a>
          <ul class="sub-menu">
            <li><a href="createRoom.jsp">CIPTA INFO BILIK</a></li>
            <li><a href="createHall.jsp">CIPTA INFO DEWAN</a></li>
            <li><a href="viewRoom.jsp">LIHAT INFO BILIK</a></li>
            <li><a href="updateRoom.jsp">KEMASKINI INFO BILIK</a></li>
            <li><a href="deleteRoom.jsp">PADAM INFO BILIK</a></li>
          </ul>
        </li>

        <li>
          <a class="main-menu" href="#">
            <i class='bx bx-bookmark'></i>
            <span class="links_name" id="min">TEMPAHAN</span>
          </a>
          <ul class="sub-menu">
            <li><a href="staffBooking.html">TEMPAH BILIK</a></li>
            <li><a href="staffViewBooking.html">LIHAT TEMPAHAN</a></li>
            <li><a href="staffUpdateBooking.html">KEMASKINI TEMPAHAN</a></li>
            <li><a href="staffDeleteBooking.html">PADAM TEMPAHAN</a></li>
            <li><a href="staffApproveBooking.html">SAHKAN TEMPAHAN</a></li>
          </ul>
        </li>

        
       <li>
          <a class="main-menu" href="#">
            <i class='bx bx-user'></i>
            <span class="links_name">AKAUN</span>
          </a>
          <ul class="sub-menu">
            <li><a href="viewStaff.html">LIHAT AKAUN</a></li>
            <li><a href="updateStaff.html">KEMASKINI AKAUN</a></li>
            <li><a href="deleteStaff.html">PADAM AKAUN</a></li>
          </ul>
        </li>
        
        <li class="log_out">
          <a class="main-menu" href="index.jsp">
            <i class='bx bx-log-out'></i>
            <span class="links_name">LOG KELUAR</span>
          </a>
        </li>
      </ul>
  </div>

  <section class="home-section">
    <nav>
      <div class="sidebar-button">
        <span class="dashboard">SURAU AR-RAHMAN BANDAR PUCHONG JAYA</span>
      </div>
        <div class="media_icons">
          <a href="https://www.facebook.com/sarpuchongjaya/"><i class="fab fa-facebook-f"></i></a>
          <a href="https://www.instagram.com.surau_ar_rahman_pchg"><i class="fab fa-instagram"></i></a>
        </div>
    </nav>

  <sql:setDataSource
        var="ic"
        driver="org.postgresql.Driver"
        url="jdbc:postgresql://ec2-52-72-56-59.compute-1.amazonaws.com:5432/d274lnoegak379"
        user="dnzxqagexabepj"
        password="edb330e6fe55ed3bb6d1ee1eb3c1f995e6b205eb5d464bee634abc3345b2d294"/>

  <sql:query dataSource="${ic}" var="oc">
      SELECT * from room
  </sql:query>

<div class="home-content">
    <div class="container">
       
        <header class="main_title">PILIHAN DEWAN</header>
  <c:forEach var="result" items="${oc.rows}">
  <form class="form first" action="" method="">
  <fieldset id="fields" style="border-radius: 5px;">    
    <!--div class="roompic"><img src="pic/${result.roomimagepic}"></div-->
    <!--center><img src="b01.jpeg" height="250px" width="300px" alt="pic1"></center-->
      <div class="containerRoom flex">
        <div class="left">
            <div class="img">
              <img src="hall-2.jpg" alt="" class="image1">
            </div>
        </div>
        <div class="right">
            <div class="heading">
              <h2><c:out value="Dewan ${result.roomname}"/></h2>
              <p>Merupakan dewan utama bagi surau-Ar-Rahman, Puchong Jaya. Tujuan dewan ini adalah sebagai ruang solat dan tempat bagi aktiviti-aktiviti keagamaan seperti ceramah agama, majlis akad nikah dan sebagai.</p>
              <p>Diharapkan setiap jemaah dapat menjaga dan menggunakan dewan ini dengan sebaiknya bagi kegunaan bersama.</p>
              <button class="update" formaction="deleteHall.jsp">LIHAT TERPERINCI</button>
            </div>
        </div>
      </div> 
    <!--  <img alt="pic2">-->

    <input type="hidden" name="roomid" value="${result.roomid}">

    <div class="button staff">
          <!--a href="viewhall-1.jsp"><input type="button" value="Lihat"></a-->
        </div>
  </fieldset><br>
  
  </form>
</c:forEach>
</div>
</div>
</section>
  <!--<script src="script.js"></script>-->
</body>

</html>