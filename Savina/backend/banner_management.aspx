<%@ Page Title="" Language="C#" MasterPageFile="~/backend/adTemplate.master" AutoEventWireup="true" CodeFile="banner_management.aspx.cs" Inherits="backend_banner_management" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- page content -->
        <div class="right_col" role="main">
            <div class="">
              <div class="page-title">
                <div class="title_left">
                  <h3>QUẢN LÝ CÁC BANNER TRANG INDEX</h3>
                </div>
              </div>
            </div>
  
              <div class="clearfix"></div>
                <form runat="server">
                  <div class="row">                                           

                    <div class="col-md-12 col-sm-12 col-xs-12"> <!-- 3 BANNER under main-slider  -->
                        <div class="x_panel">
                          <div class="x_title">
                                <h2>3 banner dưới main slider</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                  <li><a class="expand-link"><i class="fa fa-chevron-down"></i></a>
                                  </li>
                                </ul>
                                <div class="clearfix"></div>
                          </div>
                          <div class="x_content">
                            <table class="table table-striped table-bordered">
                              <thead>
                                <tr>
                                  <th>STT</th>
                                  <th>Vị trí hiển thị</th>
                                  <th>Trang đích</th>
                                  <th>Ngày upload</th>
                                  <th>Image sẽ hiễn thị</th>
                                  <th style="width:25%">Thao tác</th>                              
                                </tr>
                              </thead>
       
                              <tbody>                         
                                <tr>
                                  <td>1</td>
                                  <td>Banner hiển thị bên trái <br />320px x 144px</td>
                                  <td id="group1_Landingpage1" runat="server"></td>
                                  <td id="group1_UploadTime1" runat="server">23/3/2018 10:00</td>
                                  <td id="group1_Avatar1" runat="server"></td>
                                  <td>
                                        <asp:FileUpload ID="fileGr1_banner1" CssClass="btn-group btn btn-info btn-xs" runat="server" />
                                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-xs"  OnClick="btnGr1_banner1" Text="Upload" />
                                      <span><a href="#" class="btn btn-danger btn-xs" onclick="Disable($(this))"><i class="fa fa-trash"></i>&nbsp Disable</a></span>
                                  </td>
                                </tr>
                                <tr>
                                  <td>2</td>
                                  <td>Banner hiển thị ở giữa <br />320px x 144px</td>
                                    <td id="group1_Landingpage2" runat="server"></td>
                                  <td id="group1_UploadTime2" runat="server">23/3/2018 10:00</td>
                                  <td id="group1_Avatar2" runat="server"></td>
                                  <td>
                                        <asp:FileUpload ID="fileGr1_banner2" CssClass="btn-group btn btn-info btn-xs" runat="server" />
                                        <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary btn-xs"  OnClick="btnGr1_banner2" Text="Upload" /> 
                                      <span><a href="#" class="btn btn-danger btn-xs" onclick="Disable($(this))"><i class="fa fa-trash"></i>&nbsp Disable</a></span>
                                  </td>
                                </tr>   
                                <tr>
                                  <td>3</td>
                                  <td>Banner hiển thị bên phải <br />320px x 144px</td>
                                  <td id="group1_Landingpage3" runat="server"></td>
                                  <td id="group1_UploadTime3" runat="server">23/3/2018 10:00</td>
                                   <td id="group1_Avatar3" runat="server"></td>
                                  <td>
                                        <asp:FileUpload ID="fileGr1_banner3" CssClass="btn-group btn btn-info btn-xs" runat="server" />
                                        <asp:Button ID="Button3" runat="server" CssClass="btn btn-primary btn-xs"  OnClick="btnGr1_banner3" Text="Upload" /> 
                                      <span><a href="#" class="btn btn-danger btn-xs" onclick="Disable($(this))"><i class="fa fa-trash"></i>&nbsp Disable</a></span>
                                  </td>
                                </tr>                                                   
                              </tbody>
                            </table>
                          </div>
                        </div>
                    </div>  <!-- /3 BANNER under main-slider -->
              
                    <div class="col-md-12 col-sm-12 col-xs-12"> <!-- 3 BANNER on top horizontal  -->
                        <div class="x_panel">
                          <div class="x_title">
                            <h2>3 BANNER NGANG Ở TRÊN</h2>
                            <ul class="nav navbar-right panel_toolbox">
                              <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                              </li>
                            </ul>
                            <div class="clearfix"></div>
                          </div>
                          <div class="x_content">
                            <table class="table table-striped table-bordered">
                              <thead>
                                <tr>
                                  <th>STT</th>
                                  <th>Vị trí hiển thị</th>
                                    <th>Trang đích</th>
                                  <th>Ngày upload</th>
                                    <th>Image sẽ hiễn thị</th>
                                  <th style="width:25%">Thao tác</th>                              
                                </tr>
                              </thead>
       
                              <tbody>                         
                                <tr>
                                  <td>1</td>
                                  <td>Banner hiển thị bên trái <br />410px x 190px</td>
                                   <td id="group2_Landingpage1" runat="server"></td>
                                  <td id="group2_UploadTime1" runat="server">23/3/2018 10:00</td>
                                    <td id="group2_Avatar1" runat="server"></td>
                                  <td>
                                        <asp:FileUpload ID="fileGr2_banner1" CssClass="btn-group btn btn-info btn-xs" runat="server" />
                                        <asp:Button ID="Button4" runat="server" CssClass="btn btn-primary btn-xs"  OnClick="btnGr2_banner1" Text="Upload" />
                                      <span><a href="#" class="btn btn-danger btn-xs" onclick="Disable($(this))"><i class="fa fa-trash"></i>&nbsp Disable</a></span>
                                  </td>
                                </tr>
                                <tr>
                                  <td>2</td>
                                  <td>Banner hiển thị ở giữa <br />410px x 190px</td>
                                    <td id="group2_Landingpage2" runat="server"></td>
                                  <td id="group2_UploadTime2" runat="server">23/3/2018 10:00</td>
                                    <td id="group2_Avatar2" runat="server"></td>
                                  <td>
                                      <asp:FileUpload ID="fileGr2_banner2" CssClass="btn-group btn btn-info btn-xs" runat="server" />
                                        <asp:Button ID="Button5" runat="server" CssClass="btn btn-primary btn-xs"  OnClick="btnGr2_banner2" Text="Upload" />
                                      <span><a href="#" class="btn btn-danger btn-xs" onclick="Disable($(this))"><i class="fa fa-trash"></i>&nbsp Disable</a></span>
                                  </td>
                                </tr>   
                                <tr>
                                  <td>3</td>
                                  <td>Banner hiển thị bên phải <br />410px x 190px</td>
                                    <td id="group2_Landingpage3" runat="server"></td>
                                  <td id="group2_UploadTime3" runat="server">23/3/2018 10:00</td>
                                    <td id="group2_Avatar3" runat="server"></td>
                                  <td>
                                      <asp:FileUpload ID="fileGr2_banner3" CssClass="btn-group btn btn-info btn-xs" runat="server" />
                                        <asp:Button ID="Button6" runat="server" CssClass="btn btn-primary btn-xs"  OnClick="btnGr2_banner3" Text="Upload" />
                                      <span><a href="#" class="btn btn-danger btn-xs" onclick="Disable($(this))"><i class="fa fa-trash"></i>&nbsp Disable</a></span>
                                  </td>
                                </tr>                                                  
                              </tbody>
                            </table>
                          </div>
                        </div>
                    </div>  <!-- /3 BANNER on top horizontal -->         
                  
                      <div class="col-md-12 col-sm-12 col-xs-12"> <!-- 5 vertical banner on right panel -->
                        <div class="x_panel">
                          <div class="x_title">
                            <h2>5 BANNER ĐỨNG BÊN CỘT PHẢI</h2>
                            <ul class="nav navbar-right panel_toolbox">
                              <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                              </li>
                            </ul>
                            <div class="clearfix"></div>
                          </div>
                          <div class="x_content">
                            <table class="table table-striped table-bordered">
                              <thead>
                                <tr>
                                  <th>STT</th>
                                  <th>Vị trí hiển thị</th>
                                    <th>Trang đích</th>
                                  <th>Ngày upload</th>
                                    <th>Image sẽ hiễn thị</th>
                                  <th style="width: 25%">Thao tác</th>                              
                                </tr>
                              </thead>
       
                              <tbody>                         
                                <tr>
                                  <td>1</td>
                                  <td>Thứ 1 từ trên xuống <br />200px x 360px</td>
                                   <td id="group3_Landingpage1" runat="server"></td>
                                  <td id="group3_UploadTime1" runat="server">23/3/2018 10:00</td>
                                  <td id="group3_Avatar1" runat="server"></td>
                                  <td>
                                      <asp:FileUpload ID="fileGr3_banner1" CssClass="btn-group btn btn-info btn-xs" runat="server" />
                                        <asp:Button ID="Button7" runat="server" CssClass="btn btn-primary btn-xs"  OnClick="btnGr3_banner1" Text="Upload" />
                                      <span><a href="#" class="btn btn-danger btn-xs" onclick="Disable($(this))"><i class="fa fa-trash"></i>&nbsp Disable</a></span>
                                  </td>
                                </tr>
                                <tr>
                                  <td>2</td>
                                  <td>Thứ 2 từ trên xuống <br />200px x 360px</td>
                                    <td id="group3_Landingpage2" runat="server"></td>
                                  <td id="group3_UploadTime2" runat="server">23/3/2018 10:00</td>
                                   <td id="group3_Avatar2" runat="server"></td>
                                  <td>
                                     <asp:FileUpload ID="fileGr3_banner2" CssClass="btn-group btn btn-info btn-xs" runat="server" />
                                        <asp:Button ID="Button8" runat="server" CssClass="btn btn-primary btn-xs"  OnClick="btnGr3_banner2" Text="Upload" />
                                      <span><a href="#" class="btn btn-danger btn-xs" onclick="Disable($(this))"><i class="fa fa-trash"></i>&nbsp Disable</a></span>
                                  </td>
                                </tr>   
                                <tr>
                                  <td>3</td>
                                  <td>Thứ 3 từ trên xuống <br />200px x 360px</td>
                                    <td id="group3_Landingpage3" runat="server"></td>
                                  <td id="group3_UploadTime3" runat="server">23/3/2018 10:00</td>
                                   <td id="group3_Avatar3" runat="server"></td>
                                  <td>
                                      <asp:FileUpload ID="fileGr3_banner3" CssClass="btn-group btn btn-info btn-xs" runat="server" />
                                        <asp:Button ID="Button9" runat="server" CssClass="btn btn-primary btn-xs"  OnClick="btnGr3_banner3" Text="Upload" />
                                      <span><a href="#" class="btn btn-danger btn-xs" onclick="Disable($(this))"><i class="fa fa-trash"></i>&nbsp Disable</a></span>
                                  </td>
                                </tr> 
                                <tr>
                                  <td>4</td>
                                  <td>Thứ 4 từ trên xuống <br />200px x 360px</td>
                                    <td id="group3_Landingpage4" runat="server"></td>
                                  <td id="group3_UploadTime4" runat="server">23/3/2018 10:00</td>
                                  <td id="group3_Avatar4" runat="server"></td>
                                  <td>
                                      <asp:FileUpload ID="fileGr3_banner4" CssClass="btn-group btn btn-info btn-xs" runat="server" />
                                        <asp:Button ID="Button10" runat="server" CssClass="btn btn-primary btn-xs"  OnClick="btnGr3_banner4" Text="Upload" />
                                      <span><a href="#" class="btn btn-danger btn-xs" onclick="Disable($(this))"><i class="fa fa-trash"></i>&nbsp Disable</a></span>
                                  </td>
                                </tr>  
                                <tr>
                                  <td>5</td>
                                  <td>Thứ 5 từ trên xuống <br />200px x 360px</td>
                                    <td id="group3_Landingpage5" runat="server"></td>
                                  <td id="group3_UploadTime5" runat="server">23/3/2018 10:00</td>
                                   <td id="group3_Avatar5" runat="server"></td>
                                  <td>
                                      <asp:FileUpload ID="fileGr3_banner5" CssClass="btn-group btn btn-info btn-xs" runat="server" />
                                        <asp:Button ID="Button11" runat="server" CssClass="btn btn-primary btn-xs"  OnClick="btnGr3_banner5" Text="Upload" />
                                      <span><a href="#" class="btn btn-danger btn-xs" onclick="Disable($(this))"><i class="fa fa-trash"></i>&nbsp Disable</a></span>
                                  </td>
                                </tr>                                              
                              </tbody>
                            </table>
                          </div>
                        </div>
                    </div>  <!-- /5 vertical banner on right panel -->  
                  
                      <div class="col-md-12 col-sm-12 col-xs-12"> <!-- 3 BANNER at the bottom -->
                        <div class="x_panel">
                          <div class="x_title">
                            <h2>3 BANNER Ở DƯỚI (1 TRÁI 2 PHẢI)</h2>
                            <ul class="nav navbar-right panel_toolbox">
                              <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                              </li>
                            </ul>
                            <div class="clearfix"></div>
                          </div>
                          <div class="x_content">
                            <table class="table table-striped table-bordered">
                              <thead>
                                <tr>
                                  <th>STT</th>
                                  <th>Vị trí hiển thị</th>
                                    <th>Trang đích</th>
                                  <th>Ngày upload</th>
                                    <th>Image sẽ hiễn thị</th>
                                  <th style="width: 25%">Thao tác</th>                              
                                </tr>
                              </thead>
       
                              <tbody>                         
                                <tr>
                                  <td>1</td>
                                  <td>Banner lớn hiển thị bên trái <br />1440px x 1080px</td>
                                  <td id="group4_Landingpage1" runat="server"></td>
                                  <td id="group4_UploadTime1" runat="server">23/3/2018 10:00</td>
                                  <td id="group4_Avatar1" runat="server"></td>
                                  <td>
                                      <asp:FileUpload ID="fileGr4_banner1" CssClass="btn-group btn btn-info btn-xs" runat="server" />
                                        <asp:Button ID="Button12" runat="server" CssClass="btn btn-primary btn-xs"  OnClick="btnGr4_banner1" Text="Upload" />
                                      <span><a href="#" class="btn btn-danger btn-xs" onclick="Disable($(this))"><i class="fa fa-trash"></i>&nbsp Disable</a></span>
                                  </td>
                                </tr>
                                <tr>
                                  <td>2</td>
                                  <td>Banner nhỏ hiển thị bên phải trên <br />720px x 540px</td>
                                  <td id="group4_Landingpage2" runat="server"></td>
                                  <td id="group4_UploadTime2" runat="server">23/3/2018 10:00</td>
                                  <td id="group4_Avatar2" runat="server"></td>
                                  <td>
                                      <asp:FileUpload ID="fileGr4_banner2" CssClass="btn-group btn btn-info btn-xs" runat="server" />
                                        <asp:Button ID="Button13" runat="server" CssClass="btn btn-primary btn-xs"  OnClick="btnGr4_banner2" Text="Upload" />
                                      <span><a href="#" class="btn btn-danger btn-xs" onclick="Disable($(this))"><i class="fa fa-trash"></i>&nbsp Disable</a></span>
                                  </td>
                                </tr>   
                                <tr>
                                  <td>3</td>
                                  <td>Banner nhỏ hiển thị bên phải dưới <br />720px x 540px</td>
                                  <td id="group4_Landingpage3" runat="server"></td>
                                  <td id="group4_UploadTime3" runat="server">23/3/2018 10:00</td>
                                  <td id="group4_Avatar3" runat="server"></td>
                                  <td>
                                       <asp:FileUpload ID="fileGr4_banner3" CssClass="btn-group btn btn-info btn-xs" runat="server" />
                                        <asp:Button ID="Button14" runat="server" CssClass="btn btn-primary btn-xs"  OnClick="btnGr4_banner3" Text="Upload" />
                                      <span><a href="#" class="btn btn-danger btn-xs" onclick="Disable($(this))"><i class="fa fa-trash"></i>&nbsp Disable</a></span>
                                  </td>
                                </tr>                                                 
                              </tbody>
                            </table>
                          </div>
                        </div>
                    </div>  <!-- /3 BANNER at the bottom -->          
                     
                                                
                  </div>    
                  </form>            
            </div>
        <!-- /page content -->
        
</asp:Content>
    

