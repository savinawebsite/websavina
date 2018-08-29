<%@ Page Title="" Language="C#" MasterPageFile="~/backend/adTemplate.master" AutoEventWireup="true" CodeFile="customer_list.aspx.cs" Inherits="backend_customer_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
              <div class="page-title">
                <div class="title_left">
                  <h3>DANH SÁCH KHÁCH HÀNG ĐANG CÓ</h3>
                </div>
  
                <div class="title_right">
                  <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                    <div class="input-group">
                      <input type="text" class="form-control" placeholder="Search for...">
                      <span class="input-group-btn">
                        <button class="btn btn-default" type="button">Search!</button>
                      </span>
                    </div>
                  </div>
                </div>
              </div>
  
              <div class="clearfix"></div>

                <div class="col-md-12 col-sm-12 col-xs-12"> <!-- Table  -->
                    <div class="x_panel">
                      <div class="x_content" id="tblCustomerList" runat="server">
                            <!-- load data table from code behind -->
                        <%--<table id="datatable" class="table table-striped table-bordered">
                          <thead>
                            <tr>
                              <th>Mã khách hàng</th>
                              <th>Họ</th>
                              <th>Tên</th>
                              <th>Thuộc nhóm</th>
                              <th>Đã chi</th>
                              <th>Email</th>
                              <th>Cell number</th>
                              <th>Địa chỉ</th>
                              <th>Giới tính</th>
                              <th>Ngày tạo</th>
                              <th>Thao tác</th>
                            </tr>
                          </thead>
       
                          <tbody>                         
                            <tr>
                              <td>CUS2018001</td>
                              <td>Đăng</td>
                              <td>Lê Nam</td>
                              <td>Khách hàng thân thiết</td>
                              <td>13.500.000</td>
                              <td>nam@gmail.com</td>
                              <td>0909 090 090</td>                              
                              <td>1 Hoang Hoa Tham, quận 1, TP Hồ Chí Minh</td>
                              <td>Nam</td>
                              <td>23/02/2018</td>                     
                              <td><a href="#" class="btn btn-success btn-xs" onclick="Details($(this))"><i class="fa fa-info-circle"></i>&nbsp Lịch sử giao dịch</a>
                                <span><a href="#" class="btn btn-info btn-xs" onclick="Edit($(this))"><i class="fa fa-edit"></i>&nbsp Thay đổi</a></span>
                                <span><a href="#" class="btn btn-danger btn-xs" onclick="Disable($(this))"><i class="fa fa-remove"></i>&nbsp Disable</a></span></td>
                            </tr>
                                                                          
                          </tbody>
                        </table>--%>
                      </div>
                    </div>
                  </div>  <!-- /Table -->
              </div> 
            </div>
         
        <!-- /page content -->
</asp:Content>

