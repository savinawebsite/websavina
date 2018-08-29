<%@ Page Title="" Language="C#" MasterPageFile="~/backend/adTemplate.master" AutoEventWireup="true" CodeFile="message_contact.aspx.cs" Inherits="backend_message_contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
              <div class="page-title">
                <div class="title_left">
                  <h3>QUẢN LÝ TIN NHẮN TỪ TRANG CONTACT</h3>
                </div>
              </div>
  
              <div class="clearfix"></div>
  
              <div class="row">   
                <div class="col-md-12 col-sm-12 col-xs-12">   <!-- Show detail of message -->
                  <div class="x_panel">
                    <div class="x_content">
                        <br />
                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">  
                            <div class="col-md-6 col-sm-6 col-xs-12">  
                                  <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Họ khách hàng</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                      <input type="text" id="last-name" name="last-name" disabled="disabled" class="form-control col-md-7 col-xs-12">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Tên khách hàng</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                      <input type="text" id="first-name" name="first-name" disabled="disabled" class="form-control col-md-7 col-xs-12">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Số điện thoại</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                      <input type="text" id="phoneNumber" name="phone-number" disabled="disabled" class="form-control col-md-7 col-xs-12">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Email</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="EmailAdd" name="email-address" disabled="disabled" class="form-control col-md-7 col-xs-12">
                                      
                                    </div>
                                  </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12"> 
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Tiêu đề tin nhắn</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="ContactTitle" name="contact-title" disabled="disabled" class="form-control col-md-7 col-xs-12">                                      
                                    </div>
                                  </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Nội dung tin nhắn</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <textarea class="resizable_textarea form-control" disabled="disabled" id="messageContent" style="margin: 0px 2px 0px 0px; height: 150px; width: 308px;"></textarea>
                                    </div>
                                </div>
                            </div>
                          <div class="ln_solid"></div>
                          <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                              <button type="reset" class="btn btn-info" >Clear thông tin</button>
                              <button type="submit" class="btn btn-success">Xác nhận đã đọc</button>
                            </div>
                          </div>
    
                        </form>
                      </div>
                  </div>
                </div> <!-- /Show detail of message -->

                <div class="col-md-12 col-sm-12 col-xs-12"> <!-- Table  -->
                    <div class="x_panel">
                      <div class="x_title">
                        <h2>DANH SÁCH TIN NHẮN ĐANG CÓ</h2>
                        <ul class="nav navbar-right panel_toolbox">
                          <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                          </li>
                          <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                          </li>
                          <li><a class="close-link"><i class="fa fa-close"></i></a>
                          </li>
                        </ul>
                        <div class="clearfix"></div>
                      </div>
                      <div class="x_content">
                        <table id="datatable" class="table table-striped table-bordered">
                          <thead>
                            <tr>
                              <th>STT</th>
                              <th>Tên người gửi</th>
                              <th>Số điện thoại</th>
                              <th>Email</th>
                                <th>Ngày gửi</th>
                              <th>Tiêu đề</th>                          
                              <th>Tình trạng</th>
                              <th>Thao tác</th>
                            </tr>
                          </thead>
       
                          <tbody>                         
                            <tr>
                              <td>1</td>
                              <td>Siyosa company</td>
                              <td>0909 123 456</td>
                              <td>siyosa@siyosa.net</td>
                              <td>23/02/2018 15:25:50</td>
                                <td>Tiêu đề Siyosa</td>
                              <td><span class="btn btn-warning btn-xs">Chưa đọc</span></td>
                              <td><a href="#" class="btn btn-primary btn-xs" onclick="Edit($(this))"><i class="fa fa-edit"></i>&nbsp Xem chi tiết</a>
                                <span><a href="#" class="btn btn-danger btn-xs" onclick="Edit($(this))"><i class="fa fa-edit"></i>&nbsp Xóa tin</a></span></td>
                            </tr>
                            <tr>
                              <td>2</td>
                              <td>Antoine Vans</td>
                              <td>0933 444 666</td>
                              <td>antoine@gmail.com</td>
                              <td>30/02/2018 8:25:50</td>
                                <td>Tiêu đề Antoine</td>
                              <td><span class="btn btn-info btn-xs">Đã đọc</span></td>
                              <td><a href="#" class="btn btn-primary btn-xs" onclick="Edit($(this))"><i class="fa fa-edit"></i>&nbsp Xem chi tiết</a>
                                <span><a href="#" class="btn btn-danger btn-xs" onclick="Edit($(this))"><i class="fa fa-edit"></i>&nbsp Xóa tin</a></span></td>
                            </tr>                                                     
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>  <!-- /Table -->
              </div> 
            </div>
          </div>
        <!-- /page content -->
</asp:Content>

