<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="backend_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Savina - Backend Admin</title>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap -->
    <link href="../backend/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../backend/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../backend/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="../backend/vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../backend/build/css/custom.min.css" rel="stylesheet">
</head>
<body class="login">
    <form id="form1" runat="server" novalidate="novalidate">
        <div id="bodymodal" class="bodymodal" runat="server"></div>
        <div>
          <a class="hiddenanchor" id="signup"></a>
          <a class="hiddenanchor" id="signin"></a>

          <div class="login_wrapper">
            <div class="animate form login_form">
              <section class="login_content">
                
                  <h1>LOGIN</h1>
                  <div>
                    <input type="text" id="txtUsername" name="txtUsername" runat="server" class="form-control" placeholder="Username"/>
                  </div>
                  <div style="margin-top:5px;">
                    <input type="password" id="txtPassword" name="txtPassword" runat="server" class="form-control" placeholder="Password"/>
                  </div>
                  <div>
                    <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" class="btn btn-info" style="margin-top:10px;" OnClick="btnLogin_Click" />
                      <div id="Div1" class="bodymodal" style="display: block; color: red; font-size:12px; margin-top:5px;" runat="server"></div>
                  </div>

                  <div class="clearfix"></div>

                  <div class="separator">
                    <div class="clearfix"></div>
                    <br />

                    <div>
                      <h1><i class="fa fa-paw"></i> SAVINA</h1>
                      <p>©2018 All Rights Reserved.</p>
                    </div>
                  </div>
                
              </section>
            </div>

          </div>
        </div>
    </form>
  </body>
</html>
