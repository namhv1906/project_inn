<%-- 
    Document   : addRoom
    Created on : Mar 1, 2022, 10:20:30 PM
    Author     : firem
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Created by CodingLab |www.youtube.com/CodingLabYT-->
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <!--<title> Drop Down Sidebar Menu | CodingLab </title>-->
    <link rel="stylesheet" href="../css/addRoom.css">
    <!-- Boxiocns CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <!-- boostrap link -->
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
    <div class="sidebar">
        <div class="logo-details">
            <i class='bx bxl-c-plus-plus'></i>
            <span class="logo_name">InnManager</span>
        </div>
        <ul class="nav-links">
            <li>
                <a href="#">
                    <i class='bx bx-grid-alt'></i>
                    <span class="link_name">Thống kê chung</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="#">Thống kê chung</a></li>
                </ul>
            </li>
            <li>
                <div class="iocn-link">
                    <a href="#">
                        <i class='bx bx-home'></i>
                        <span class="link_name">Phòng trọ</span>
                    </a>
                    <i class='bx bxs-chevron-down arrow'></i>
                </div>
                <ul class="sub-menu">
                    <li><a class="link_name" href="#">Phòng trọ</a></li>
                    <li><a href="#">Thêm phòng</a></li>
                </ul>
            </li>
            <li>
                <div class="iocn-link">
                    <a href="list">
                        <i class='bx bx-book-alt'></i>
                        <span class="link_name">Loại phòng</span>
                    </a>
                    <i class='bx bxs-chevron-down arrow'></i>
                </div>
                <ul class="sub-menu">
                    <li><a class="link_name" href="list">Loại phòng</a></li>
                    <li><a href="add">Thêm phòng</a></li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class='bx bx-pie-chart-alt-2'></i>
                    <span class="link_name">Khách trọ</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="#">Khách trọ</a></li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class='bx bx-line-chart'></i>
                    <span class="link_name">Thông báo</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="#">Thông báo</a></li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class='bx bx-compass'></i>
                    <span class="link_name">Hóa đơn</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="#">Hóa đơn</a></li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class='bx bx-history'></i>
                    <span class="link_name">Doanh thu</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="#">Doanh thu</a></li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class='bx bx-cog'></i>
                    <span class="link_name">Thiết lập</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="#">Thiết lập</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <section class="home-section">
        <div class="home-content">
            <span class="text">Tạo phòng trọ mới</span>
        </div>
    </section>
    <section class="content-section">
        <c:if test="${requestScope.successful != null && requestScope.successful == 1}">
        <div class="successful">
            <span>Tạo phòng trọ thành công.</span>
            <a href="list">Nhấn vào đây để xem danh sách phòng vừa tạo</a>
        </div>
        </c:if>
        <div class="detail">
            <form class="detail-content" action="add" method="POST">
                <div class="detail-container">
                    <label for="name">Tên phòng trọ, ví dụ: P101</label>
                    <input type="text" name="name" id="name" class="detail-input">
                    <c:if test="${requestScope.errorName != null}">
                        </br><p class="detail-name-error">${requestScope.errorName}</p>
                    </c:if>
                </div>
                <div class="detail-container">
                    <label for="floor">Tầng phòng trọ:(Nhập số)</label>
                    <input type="text" name="floor" id="floor" class="detail-input">
                    <c:if test="${requestScope.errorFloor != null}">
                        </br><p class="detail-name-error">${requestScope.errorFloor}</p>
                    </c:if>
                    <c:if test="${requestScope.errorSimilar != null}">
                        </br><p class="detail-name-error">${requestScope.errorSimilar}</p>
                    </c:if>
                </div>
                <div class="detail-container">
                    <label for="type">Kiểu phòng trọ:</label>
                    <select name="type" id="type" class="detail-input">
                        <option value="-1">--Chọn kiểu phòng--</option>
                        <c:forEach items="${requestScope.listRoomType}" var="rt">
                            <option value="${rt.id}">${rt.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="detail-container">
                    <button class="detail-submit">
                        <i class='bx bx-plus'></i>
                        <input type="submit" value="Tạo mới">
                    </button>
                </div>

            </form>
        </div>
    </section>



    <script>
        let arrow = document.querySelectorAll(".arrow");
        for (var i = 0; i < arrow.length; i++) {
            arrow[i].addEventListener("click", (e) => {
                let arrowParent = e.target.parentElement.parentElement;
                arrowParent.classList.toggle("showMenu");
            });
        }
    </script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>

</html>
