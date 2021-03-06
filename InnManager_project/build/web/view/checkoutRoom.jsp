<%-- 
    Document   : checkoutRoom
    Created on : Mar 11, 2022, 8:09:48 PM
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
        <link rel="stylesheet" href="../../css/checkoutRoom.css">
        <!-- Boxiocns CDN Link -->
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <!-- boostrap link -->
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            .sidebar .nav-links .notification::before{
                content: "${sessionScope.listPaymentToCreate.size()}";
                width: 20px;
                height: 20px;
                border-radius: 50%;
                position: absolute;
                background-color: red;
                color: white;
                top: 50%;
                right: 20px;
                transform: translateY(-50%);
                display: flex;
                align-items: center;
                justify-content: center;
                transition: all 0.5s ease;
            }

            .sidebar .nav-links .bill::before{
                content: "${sessionScope.listPaymentToPay.size()}";
                width: 20px;
                height: 20px;
                border-radius: 50%;
                position: absolute;
                background-color: red;
                color: white;
                top: 50%;
                right: 20px;
                transform: translateY(-50%);
                display: flex;
                align-items: center;
                justify-content: center;
                transition: all 0.5s ease;
            }

            @media (max-width: 768px){
                .sidebar .nav-links .notification::before{
                    width: 20px;
                    height: 20px;
                    border-radius: 50%;
                    position: absolute;
                    background-color: red;
                    color: white;
                    top: 50%;
                    right: 5px;
                    transform: translateY(-50%);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }

                .sidebar .nav-links .bill::before{
                    width: 20px;
                    height: 20px;
                    border-radius: 50%;
                    position: absolute;
                    background-color: red;
                    color: white;
                    top: 50%;
                    right: 5px;
                    transform: translateY(-50%);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }
            }
        </style>
    </head>

    <body>
        <div class="sidebar">
            <div class="logo-details">
                <i class='bx bxl-c-plus-plus'></i>
                <span class="logo_name">InnManager</span>
            </div>
            <ul class="nav-links">
                <li>
                    <a href="../home">
                        <i class='bx bx-grid-alt'></i>
                        <span class="link_name">Th???ng k?? chung</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a class="link_name" href="../home">Th???ng k?? chung</a></li>
                    </ul>
                </li>
                <li>
                    <div class="iocn-link">
                        <a href="list">
                            <i class='bx bx-home'></i>
                            <span class="link_name">Ph??ng tr???</span>
                        </a>
                        <i class='bx bxs-chevron-down arrow'></i>
                    </div>
                    <ul class="sub-menu">
                        <li><a class="link_name" href="list">Ph??ng tr???</a></li>
                        <li><a href="add">Th??m ph??ng</a></li>
                    </ul>
                </li>
                <li>
                    <div class="iocn-link">
                        <a href="../roomtype/list">
                            <i class='bx bx-book-alt'></i>
                            <span class="link_name">Lo???i ph??ng</span>
                        </a>
                        <i class='bx bxs-chevron-down arrow'></i>
                    </div>
                    <ul class="sub-menu">
                        <li><a class="link_name" href="../roomtype/list">Lo???i ph??ng</a></li>
                        <li><a href="../roomtype/add">Th??m ph??ng</a></li>
                    </ul>
                </li>
                <li>
                    <a href="../customer/list">
                        <i class='bx bx-pie-chart-alt-2'></i>
                        <span class="link_name">Kh??ch tr???</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a class="link_name" href="../customer/list">Kh??ch tr???</a></li>
                    </ul>
                </li>
                <li
                    <c:if test="${sessionScope.listPaymentToCreate.size() > 0}">
                        class="notification"
                    </c:if>
                    >
                    <a href="../notification">
                        <i class='bx bx-line-chart'></i>
                        <span class="link_name">Th??ng b??o</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a class="link_name" href="../notification">Th??ng b??o</a></li>
                    </ul>
                </li>
                <li
                    <c:if test="${sessionScope.listPaymentToPay.size() > 0}">
                        class="bill"
                    </c:if>
                    >
                    <a href="../bill/add">
                        <i class='bx bx-compass'></i>
                        <span class="link_name">H??a ????n</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a class="link_name" href="../bill/add">H??a ????n</a></li>
                    </ul>
                </li>
                <li>
                    <a href="../revenue/list">
                        <i class='bx bx-history'></i>
                        <span class="link_name">Doanh thu</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a class="link_name" href="../revenue/list">Doanh thu</a></li>
                    </ul>
                </li>
                <li>
                    <div class="iocn-link">
                        <a href="">
                            <i class='bx bx-book-alt'></i>
                            <span class="link_name">Thi???t l???p</span>
                        </a>
                        <i class='bx bxs-chevron-down arrow'></i>
                    </div>
                    <ul class="sub-menu">
                        <li><a class="link_name" href="">Thi???t l???p</a></li>
                        <li><a href="../setting/service">Ti???n d???ch v???</a></li>
                        <li><a href="../setting/conduct">Ti???n ????? d??ng</a></li>
                    </ul>
                </li>
                <li>
                    <a href="../../logout">
                        <i class='bx bx-exit'></i>
                        <span class="link_name">????ng xu???t</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a class="link_name" href="../../logout">????ng xu???t</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <section class="home-section">
            <div class="home-content">
                <span class="text">Checkout ph??ng ${requestScope.contract.room.name}</span>
            </div>
        </section>
        <section class="content-section">
            <div class="detail">
                <form class="table-responsive detail-container-information" action="checkout" method="POST">
                    <div class="detail-tittle">
                        <p>Thi???t b??? trong ph??ng</p>
                    </div>
                    <table class="table detail-information">
                        <tr class="table-light">
                            <th class="text-center align-middle">S??? th??? t???</th>
                            <th class="text-center align-middle">T??n thi???t b???</th>
                            <th class="text-center align-middle">T??nh tr???ng</th>
                            <th class="text-center align-middle">L?? do</th>
                        </tr>
                        <c:set var="number" scope="page" value="0"/>
                        <c:forEach items="${requestScope.listConduct}" var="cd">
                            <c:if test="${cd.conductType.id == 1}">
                                <c:set var="number" scope="page" value="${pageScope.number + 1}"/>
                                <tr>
                                    <td class="text-center align-middle">${pageScope.number}</td>
                                    <td class="text-center align-middle">${cd.name}</td>
                                    <td class="text-center align-middle"><input type="checkbox" name="conduct${cd.id}"></td>
                                    <td class="text-center align-middle"><input type="text" name="reason${cd.id}" id="" style="width: 100%;"></td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </table>
                    <div class="detail-tittle">
                        <p>Thi???t b??? trong nh?? v??? sinh</p>
                    </div>
                    <table class="table detail-information">
                        <tr class="table-light">
                            <th class="text-center align-middle">S??? th??? t???</th>
                            <th class="text-center align-middle">T??n thi???t b???</th>
                            <th class="text-center align-middle">T??nh tr???ng</th>
                            <th class="text-center align-middle">L?? do</th>
                        </tr>
                        <c:set var="number" scope="page" value="0"/>
                        <c:forEach items="${requestScope.listConduct}" var="cd">
                            <c:if test="${cd.conductType.id == 2}">
                                <c:set var="number" scope="page" value="${pageScope.number + 1}"/>
                                <tr>
                                    <td class="text-center align-middle">${pageScope.number}</td>
                                    <td class="text-center align-middle">${cd.name}</td>
                                    <td class="text-center align-middle"><input type="checkbox" name="conduct${cd.id}"></td>
                                    <td class="text-center align-middle"><input type="text" name="reason${cd.id}" id="" style="width: 100%;"></td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </table>
                    <div class="detail-container">
                        <div class="detail-submit" style="padding-bottom: 30px">
                            <input type="hidden" name="idContract" value="${requestScope.contract.id}">
                            <input class="btn btn-primary" type="submit" value="Checkout">
                            <a class="btn btn-danger" href="information?id=${requestScope.contract.room.id}&status=1" role="button">H???y</a>
                        </div>
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
