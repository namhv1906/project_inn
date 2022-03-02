<%-- 
    Document   : listCustomer
    Created on : Mar 2, 2022, 1:33:33 PM
    Author     : firem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!-- Created by CodingLab |www.youtube.com/CodingLabYT-->
<html lang="en" dir="ltr">

    <head>
        <meta charset="UTF-8">
        <!--<title> Drop Down Sidebar Menu | CodingLab </title>-->
        <link rel="stylesheet" href="../css/listCustomer.css">
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
                <span class="text">Danh sách khách hàng</span>
            </div>
        </section>
        <section class="content-section">
            <div class="detail">
                <div class="detail-container-search">
                    <form action="" class="detail-search">
                        <input type="text" name="" class="search-input" placeholder="Nhập tên khách hàng...">
                        <button type="submit" class="search-button">
                            <i class='bx bx-search'></i>
                        </button>
                    </form>
                </div>
                <div class="table-responsive detail-container-information">
                    <table class="table detail-information">
                        <tr class="table-light">
                            <th>&ensp;</th>
                            <th class="text-center">Tên khách hàng</th>
                            <th class="text-center">Ngày sinh</th>
                            <th class="text-center">Số điện thoại</th>
                            <th class="text-center">Phòng thuê</th>
                            <th class="text-center">Trạng thái</th>
                            <th>&ensp;</th>
                        </tr>
                        <c:if test="${requestScope.listCustomer.size() > 0}">
                            <c:forEach items="${requestScope.listCustomer}" var="cs">
                                <tr>
                                    <td class="text-center column-information"><a href="" class="button-link"><i class='bx bx-info-circle'></i></a></td>
                                    <td class="text-center">${cs.name}</td>
                                    <td class="text-center">${cs.dob}</td>
                                    <td class="text-center">${cs.phone}</td>
                                    <td class="text-center">${cs.room.name}</td>
                                    <td class="text-center">${cs.status?"<i class='bx bx-check' style='color: green;'></i>" : "<i class='bx bx-x' style='color: red;'></i>"}</td>
                                    <td class="column-action">
                                        <c:if test="${cs.status}">
                                            <a href="" class="button-link"><i class='bx bx-trash'></i></a>
                                            <a href="" class="button-link"><i class='bx bx-edit'></i></a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </table>
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