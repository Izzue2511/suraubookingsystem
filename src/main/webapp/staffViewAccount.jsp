<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title> View Staff Profile </title>
    <link rel="stylesheet" href="accountHandler.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("staffid")==null)
        response.sendRedirect("index.jsp");
%>
<sql:setDataSource
        var="ic"
        driver="org.postgresql.Driver"
        url="jdbc:postgresql://containers-us-west-141.railway.app:7894/railway"
        user="postgres"
        password="UyduWFTEPVisrjXTehXg"/>

<sql:query dataSource="${ic}" var="oc">
    <%
        int jstaffid = 0;

        if(request.getParameter("staffid")==null){
            jstaffid = (Integer) session.getAttribute("staffid");
        }
        else{
            jstaffid = Integer.parseInt(request.getParameter("staffid"));
            session.setAttribute("staffid", jstaffid);
        }
    %>


    <c:set var="jstaffid" value="<%=jstaffid%>"/>
    SELECT staffid,staffname,staffic,staffdateofbirth,staffaddress,staffemail,staffphone,staffrole,staffusername,staffpassword
    from staff
    WHERE staffid=?
    <sql:param value="${jstaffid}" />
</sql:query>



<div class="sidebar">
    <div class="logo-details">
        <img src="logoWhite.png">
    </div>
    <ul class="nav-links">
        <li>
            <a class="main-menu" href="homepageStaff.jsp">
                <i class='bx bx-home'></i>
                <span class="links_name">LAMAN UTAMA</span>
            </a>
        </li>

        <li>
            <a class="main-menu" href="staffViewSpace.jsp">
                <i class='bx bx-box' ></i>
                <span class="links_name">RUANG</span>
            </a>
        </li>

        <li>
            <a class="main-menu" href="staffApproveBooking.jsp">
                <i class='bx bx-bookmark'></i>
                <span class="links_name">TEMPAHAN</span>
            </a>
        </li>

        <li>
            <a class="main-menu" href="staffViewAccount.jsp">
                <i class='bx bx-user'></i>
                <span class="links_name">AKAUN</span>
            </a>
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
            <a href="https://www.instagram.com/surau_ar_rahman_pchg/"><i class="fab fa-instagram"></i></a>
        </div>
    </nav>
    <c:forEach var="staff" items="${oc.rows}">
        <div class="home-content">
            <div class="container-staff">
                <div class="rightbox">
                    <form action="" method="post">
                        <div class="profile tabShow">
                            <h1>MAKLUMAT STAFF</h1>
                            <input type="hidden" name="staffid" value="${staff.staffid}">
                            <h2>NAMA PENUH</h2>
                            <p class="input">${staff.staffname}</p>
                            <h2>Kad Pengenalan</h2>
                            <p class="input">${staff.staffic}</p>
                            <h2>Tarikh Lahir</h2>
                            <p class="input">${staff.staffdateofbirth}</p>
                            <h2>Alamat</h2>
                            <p class="input">${staff.staffaddress}</p>
                            <h2>Email</h2>
                            <p class="input">${staff.staffemail}</p>
                            <h2>Nombor Telefon</h2>
                            <p class="input">${staff.staffphone}</p>
                            <h2>Jawatan</h2>
                            <p class="input">${staff.staffrole}</p>

                               <c:forEach var="staff" items="${oc.rows}">
                                <h2>Nombor Staf</h2>
                                <p class="input">${staff.staffusername}</p>
                                <h2>Kata Laluan</h2>
                                <p class="input">${staff.staffpassword}</p>
                            </c:forEach>

                            <input type="hidden" name="action" value="deleteStaff">
                            <button class="btn update" onclick="form.action='staffUpdateAccount.jsp'">KEMASKINI</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </c:forEach>
</section>
</body>
</html>


