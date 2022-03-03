<%-- 
    Document   : informationCutomer
    Created on : Mar 3, 2022, 8:49:31 PM
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
        <link rel="stylesheet" href="../css/informationCustomer.css">
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
                        <a href="#">
                            <i class='bx bx-book-alt'></i>
                            <span class="link_name">Loại phòng</span>
                        </a>
                        <i class='bx bxs-chevron-down arrow'></i>
                    </div>
                    <ul class="sub-menu">
                        <li><a class="link_name" href="#">Loại phòng</a></li>
                        <li><a href="#">Thêm phòng</a></li>
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
                <span class="text">Thông tin khách hàng</span>
            </div>
        </section>
        <section class="content-section">
            <div class="detail">
                <div class="detail-container">
                    <div class="detail-avata">
                        <img src="../image/female.png" alt="">
                    </div>
                </div>
                <div class="detail-container">
                    <div class="detail-information">
                        <div class="detail-name">
                            <p>${requestScope.customer.name}</p>
                        </div>
                        <table class="table">
                            <tr>
                                <td>Giới tính</td>
                                <td>${requestScope.customer.gender ? "Male" : "Female"}</td>
                            </tr>
                            <tr>
                                <td>Ngày sinh</td>
                                <td>${requestScope.customer.dob}</td>
                            </tr>
                            <tr>
                                <td>Số điện thoại</td>
                                <td>${requestScope.customer.phone}</td>
                            </tr>
                            <tr>
                                <td>CMND/CCCD</td>
                                <td>${requestScope.customer.identity}</td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td>${requestScope.customer.email}</td>
                            </tr>
                            <tr>
                                <td>Nơi ở</td>
                                <td>${requestScope.customer.address}</td>
                            </tr>
                            <tr>
                                <td>Ngày thuê</td>
                                <td>${requestScope.customer.hireDate}</td>
                            </tr>
                            <tr>
                                <td>Tên tài khoản</td>
                                <td>${requestScope.customer.account.username}</td>
                            </tr>
                            <tr>
                                <td>Mật khẩu</td>
                                <td>${requestScope.customer.account.password}</td>
                            </tr>
                            <tr>
                                <td>Tên phòng</td>
                                <td>${requestScope.customer.room.name}</td>
                            </tr>
                            <tr>
                                <td>Trạng thái</td>
                                <td>
                                    <c:if test="${requestScope.customer.status}">
                                        <span style="color: green">Đang thuê</span>
                                    </c:if>
                                    <c:if test="${!requestScope.customer.status}">
                                        <span style="color: red">Dừng thuê</span>
                                    </c:if>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
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