<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer class="footer">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__logo">
                        <a href="home" style="margin-left: 100px;width: 55px;height: 55px;filter: brightness(0) invert(1);
                           -webkit-filter: brightness(0) invert(1);"><img src="FrontEnd/img/logo1.png" alt=""></a>
                    </div>
                    <p>The customer is at the heart of our unique business model, which includes design.</p>
                    <a href="#"><img src="FrontEnd/img/payment.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-2 col-md-3 col-sm-6">
                <div class="footer__widget">
                    <h6>About Us</h6>
                    <ul>
                        <li>
                            <a href="./contact">Contact Us</a> 
                            <a style="margin-left: 5px" href="https://www.facebook.com/profile.php?id=100090338780761"><i class="fa-brands fa-facebook" style="color: #fff"></i></a>
                            <a style="margin-left: 5px" href="https://zalo.me/0389651974"><img style="filter: invert(100%); width: 25px" src="https://i.pinimg.com/originals/9a/49/f5/9a49f5ec44c243204290ce9076f27699.png" alt="zalo"/></a>
                        </li>
                        <li><a href="Shop">Go to Shop</a></li>

                    </ul>
                </div>
            </div>
            <div class="col-lg-2 col-md-6 col-sm-6 ">
                <div class="footer__widget">
                    <h6 class="text-light">News</h6>
                    <ul class="d-grid row">
                        <c:forEach items="${newsGroup}" var="newsGroup">
                            <li class="col-12"><a href="./${newsGroup.url}-${newsGroup.code}">${newsGroup.newsgroup_name}</a></li>
                            </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4  col-md-3 col-sm-3">

                <h4 class="text-light">FBT University</h4>
                <br>
                <p class="text-light">Education Zone, Hoa Lac Hi-tech Park, Km29, Thang Long Boulevard, Thach Hoa, Thach That, Ha Noi, Vietnam <br/>Tel: 0366780698</p>

            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="footer__copyright__text">
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    <p>
                        <script>
                            document.write(new Date().getFullYear());
                        </script>, made by Team 6
                    </p>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </div>
            </div>
        </div>
    </div>
</footer>
