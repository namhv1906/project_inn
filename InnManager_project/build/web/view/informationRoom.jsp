<%-- 
    Document   : informationRoom
    Created on : Mar 4, 2022, 2:39:33 PM
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
        <link rel="stylesheet" href="../css/informationRoom.css">
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
                <span class="text">Thông tin phòng ${requestScope.contract.room.name}</span>
            </div>
        </section>
        <section class="content-section">
            <div class="detail-container">
                <div class="detail-tittle">
                    <p>Hợp đồng</p>
                    <a class="btn btn-primary button-add" href="#" role="button">
                        <i class='bx bx-edit-alt'></i>
                        <span>Cập nhật thông tin</span>
                    </a>
                </div>
                <div class="detail-content-contract">
                    <table class="detail-information">
                        <tr>
                            <td>Người đại diện</td>
                            <td><a href="">${requestScope.contract.customer.name}</a></td>
                        </tr>
                        <tr>
                            <td>Tiền đặt cọc</td>
                            <td>${requestScope.contract.deposit}</td>
                        </tr>
                        <tr>
                            <td>Ngày hiệu lực</td>
                            <td>${requestScope.contract.hireDate}</td>
                        </tr>
                        <tr>
                            <td>Ngày hết hiệu lực</td>
                            <td>${requestScope.contract.checkOutDate == null ? "1" : "0"}</td>
                        </tr>
                        <tr>
                            <td>Trạng thái</td>
                            <c:if test="${requestScope.contract.status}">
                                <td><span style="color: green;">Còn hiệu lực</span></td>
                            </c:if>
                            <c:if test="${!requestScope.contract.status}">
                                <td><span style="color: red;">Hết hiệu lực</span></td>
                            </c:if>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="detail-container">
                <div class="detail-tittle">
                    <p>Người trọ</p>
                    <a class="btn btn-primary button-add" href="#" role="button">
                        <i class='bx bx-plus'></i>
                        <span>Thêm khách hàng</span>
                    </a>
                </div>
                <div class="detail-content-customer">
                    <table class="table">
                        <tr class="table-light">
                            <th class="text-center">Tên khách hàng</th>
                            <th class="text-center">Ngày sinh</th>
                            <th class="text-center">Số điện thoại</th>
                            <th class="text-center">&ensp;</th>
                        </tr>
                        <c:forEach items="${requestScope.listCustomer}" var="cs">
                        <tr>
                            <td class="text-center">${cs.name}</td>
                            <td class="text-center">${cs.dob}</td>
                            <td class="text-center">${cs.phone}</td>
                            <td class="text-center"><a href="../customer/information?id=${cs.id}" class="button-link"><i class='bx bx-info-circle'></i></a>
                            </td>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <div class="detail-container">
                <div class="detail-tittle">
                    <p>Thiết bị</p>
                </div>
                <div class="row detail-content-conduct">
                    <div class="col-lg-5 detail-conduct">
                        <table class="table">
                            <tr class="table-light">
                                <th class="text-center">STT</th>
                                <th class="text-center">Thiết bị trong phòng</th>
                                <th class="text-center">Số lượng</th>
                            </tr>
                            <c:forEach items="${requestScope.listConductDetail}" var="cd">
                                <c:if test="${cd.conduct.conductType.id == 1}">
                                    <tr>
                                        <td class="text-center">1</td>
                                        <td class="text-center">${cd.conduct.name}</td>
                                        <td class="text-center">${cd.quantity}</td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </table>
                    </div>
                    <div class="col-lg-5 detail-conduct">
                        <table class="table">
                            <tr class="table-light">
                                <th class="text-center">STT</th>
                                <th class="text-center">Thiết bị trong nhà vệ sinh</th>
                                <th class="text-center">Số lượng</th>
                            </tr>
                            <c:forEach items="${requestScope.listConductDetail}" var="cd">
                                <c:if test="${cd.conduct.conductType.id == 2}">
                                    <tr>
                                        <td class="text-center">1</td>
                                        <td class="text-center">${cd.conduct.name}</td>
                                        <td class="text-center">${cd.quantity}</td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
            <div class="detail-container">
                <div class="check-out">
                    <a class="btn btn-danger button-checkOut" href="#" role="button">
                        <span>Check out</span>
                    </a>
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