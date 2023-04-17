<%-- Document : admin Created on : Feb 9, 2023, 12:48:02 AM Author : ASUS --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="AdminPage/assets/"
      data-template="vertical-menu-template-free">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport"
              content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

        <title>Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

        <meta name="description" content="" />

        <!-- include libraries(jQuery, bootstrap) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <style>
            a:hover {
                text-decoration: none;
            }
        </style>
        
        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="AdminPage/assets/img/favicon/favicon.ico" />

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet" />

        <!-- Icons. Uncomment required icon fonts -->
        <link rel="stylesheet" href="AdminPage/assets/vendor/fonts/boxicons.css" />

        <!-- Core CSS -->
        <link rel="stylesheet" href="AdminPage/assets/vendor/css/core.css" class="template-customizer-core-css" />
        <link rel="stylesheet" href="AdminPage/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
        <link rel="stylesheet" href="AdminPage/assets/css/demo.css" />

        <!-- Vendors CSS -->
        <link rel="stylesheet" href="AdminPage/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

        <link rel="stylesheet" href="AdminPage/assets/vendor/libs/apex-charts/apex-charts.css" />

        <!-- Page CSS -->

        <!-- Helpers -->
        <script src="AdminPage/assets/vendor/js/helpers.js"></script>

        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="AdminPage/assets/js/config.js"></script>
    </head>

    <body>
        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <!-- Menu -->
                <%@ include file="/AdminPage/Template/menu.jsp" %>
                <!-- / Menu -->

                <!-- Layout container -->
                <div class="layout-page">
                    <!-- Navbar -->

                    <%@ include file="/AdminPage/Template/navbar.jsp" %>

                    <!-- / Navbar -->

                    <!-- Content wrapper -->
                    <div class="content-wrapper">
                        <!-- Content -->
                        <div class="container-xxl flex-grow-1 container-p-y">
                            <h4 class="fw-bold py-3 mb-4"><a href="admin-view-user"><span class="text-muted fw-light">USER LIST /</span></a>
                                USER</h4>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card mb-4">
                                        <h5 class="card-header">User Details</h5>
                                        <form action="admin-update-user" id="formAccountSettings" method="POST">
                                            <div class="card-body">
                                                <div class="d-flex align-items-start align-items-sm-center gap-4">
                                                    <img src="AdminPage/assets/img/avatars/1.png" alt="user-avatar"
                                                         class="d-block rounded" height="100" width="100" id="uploadedAvatar" />
                                                    <div class="button-wrapper">
                                                        <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
                                                            <span class="d-none d-sm-block">Upload new avatar</span>
                                                            <i class="bx bx-upload d-block d-sm-none"></i>
                                                            <input name="file" multiple type="file" id="upload" class="account-file-input" hidden
                                                                   accept="image/png, image/jpeg" />
                                                        </label>
                                                        <button type="button"
                                                                class="btn btn-outline-secondary account-image-reset mb-4">
                                                            <i class="bx bx-reset d-block d-sm-none"></i>
                                                            <span class="d-none d-sm-block">Reset</span>
                                                        </button>

                                                        <p class="text-muted mb-0">Allowed JPG, GIF or PNG. Max size of 800K</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr class="my-0" />
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="mb-3 col-md-6">
                                                        <label for="userCode" class="form-label">User Code</label>
                                                        <input class="form-control" type="text" id="userCode"
                                                               name="userCode" value="${user.code}" autofocus readonly/>
                                                    </div>
                                                    <div class="mb-3 col-md-6">
                                                        <label for="productName" class="form-label">Full Name</label>
                                                        <input class="form-control" type="text" name="userName"
                                                               id="userName" value="${user.fullname}" />
                                                    </div>
                                                    <div class="mb-3 col-md-6">
                                                        <label for="userIDCard" class="form-label">ID Card</label>
                                                        <input class="form-control" type="text" name="userIDCard"
                                                               id="userIDCard" value="${user.id_card}"/>
                                                    </div>
                                                    <div class="mb-3 col-md-6">
                                                        <label for="userGender" class="form-label">Gender</label>
                                                        <select name="userGender" id="userGender" class="select2 form-select">
                                                            <option value="Male" ${user.gender.equalsIgnoreCase("male")?"selected":""}>Male</option>
                                                            <option value="Female" ${user.gender.equalsIgnoreCase("female")?"selected":""}>Female</option>
                                                        </select>
                                                    </div>
                                                    <div class="mb-3 col-md-6">
                                                        <label for="userDob" class="form-label">DOB</label>
                                                        <input class="form-control" type="date" name="userDob"
                                                               id="userDob" value="${user.dobConverted}"/>
                                                    </div>
                                                    <div class="mb-3 col-md-6">
                                                        <label for="userAddress" class="form-label">Address</label>
                                                        <input class="form-control" type="text" name="userAddress"
                                                               id="userAddress" value="${user.address}"/>
                                                    </div>

                                                    <div class="mb-3 col-md-6">
                                                        <label for="userEmail" class="form-label">Email</label>
                                                        <input class="form-control" type="email" name="userEmail"
                                                               id="userEmail" value="${user.email}"/>
                                                    </div>
                                                    <div class="mb-3 col-md-6 form-password-toggle">
                                                        <label class="form-label" for="basic-default-password32">Password</label>
                                                        <div class="input-group input-group-merge">
                                                            <input
                                                                type="password"
                                                                class="form-control"
                                                                id="basic-default-password32"
                                                                placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                                                                aria-describedby="basic-default-password"
                                                                value="${user.password}"
                                                                name ="userPassword"
                                                                />
                                                            <span class="input-group-text cursor-pointer" id="basic-default-password"
                                                                  ><i class="bx bx-hide"></i
                                                                ></span>
                                                        </div>
                                                    </div>
                                                    <input name="createdAt" type="text" style="display: none" value="${user.created_at}"/>
                                                    <input name="createdBy" type="text" style="display: none" value="${user.created_by}"/>
                                                    <input name="userID" type="text" style="display: none" value="${user.user_id}"/>
                                                </div>
                                                <div class="mt-2">
                                                    <button type="submit" class="btn btn-primary me-2">Update User</button>
                                                    <button type="reset" class="btn btn-outline-secondary">Reset</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- / Content -->

                        <!-- Footer -->
                        <%@ include file="/AdminPage/Template/footer.jsp" %>
                        <!-- / Footer -->

                        <div class="content-backdrop fade"></div>
                    </div>
                    <!-- Content wrapper -->
                </div>
                <!-- / Layout page -->
            </div>

            <!-- Overlay -->
            <div class="layout-overlay layout-menu-toggle"></div>
        </div>
        <!-- / Layout wrapper -->
        <!-- Core JS -->
        <!-- build:js assets/vendor/js/core.js -->
<!--        <script src="AdminPage/assets/vendor/libs/jquery/jquery.js"></script>
        <script src="AdminPage/assets/vendor/libs/popper/popper.js"></script>
        <script src="AdminPage/assets/vendor/js/bootstrap.js"></script>-->
        <script src="AdminPage/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

        <script src="AdminPage/assets/vendor/js/menu.js"></script>
        <!-- endbuild -->

        <!-- Vendors JS -->
        <script src="AdminPage/assets/vendor/libs/apex-charts/apexcharts.js"></script>

        <!-- Main JS -->
        <script src="AdminPage/assets/js/main.js"></script>

        <!-- Page JS -->
        <script src="AdminPage/assets/js/dashboards-analytics.js"></script>

        <!-- Place this tag in your head or just before your close body tag. -->
        <script async defer src="https://buttons.github.io/buttons.js"></script>
    </body>

</html>