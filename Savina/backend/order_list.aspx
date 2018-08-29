<%@ Page Title="" Language="C#" MasterPageFile="~/backend/adTemplate.master" AutoEventWireup="true" CodeFile="order_list.aspx.cs" Inherits="backend_order_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- page content -->
        <div class="right_col" role="main">
            <div class="">
              <div class="page-title">
                <div class="title_left">
                  <h3>DANH SÁCH ĐƠN HÀNG ĐANG CÓ</h3>
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

                      <div class="x_content">
                        <table id="datatable" class="table table-striped table-bordered">
                          <thead>
                            <tr>
                              <th>Mã đơn hàng</th>
                              <th>Tên khách hàng</th>
                              <th>Tên sản phẩm</th>
                              <th>Ngày thuê</th>
                              <th>Ngày trả</th>
                              <th>Số lượng</th>
                              <th>Loại thuê</th>
                              <th>Thời gian tạo</th>                             
                              <th>Gia hạn</th>
                              <th>Trạng thái xử lý</th>
                              <th>Thao tác</th>
                            </tr>
                          </thead>
       
                          <tbody>                         
                            <tr>
                              <td>#2018001</td>
                              <td>Le Quoc Tuan</td>
                              <td>Máy khoan bosche</td>
                              <td>23/02/2018 09:00</td>
                              <td>25/02/2018 15:00</td>
                              <td>1</td>                              
                              <td><span class="btn btn-success btn-xs">Theo ngày</span></td>
                              <td>20/02/2018 10:15 </td> 
                              <td><span class="btn btn-primary btn-xs">Không</span></td>   
                              <td><span class="btn btn-primary btn-xs">Chưa xử lý</span></td>                    
                              <td><a href="/backend/order_detail" class="btn btn-success btn-xs" onclick="Details($(this))"><i class="fa fa-info-circle"></i>&nbsp Xem chi tiết</a>
                                <span><a href="/backend/order_process" class="btn btn-info btn-xs" onclick="Edit($(this))"><i class="fa fa-edit"></i>&nbsp Xử lý đơn hàng</a></span>
                                <span><a href="/backend/order_renew" class="btn btn-dark btn-xs" onclick="Edit($(this))"><i class="fa fa-edit"></i>&nbsp Gia hạn</a></span>
                                <span><a href="/backend/order_trackchange" class="btn btn-warning btn-xs" onclick="Edit($(this))"><i class="fa fa-magic"></i>&nbsp Xem lịch sử Gia hạn</a></span>
                                <span><a href="#" class="btn btn-danger btn-xs" onclick="Disable($(this))"><i class="fa fa-remove"></i>&nbsp Disable</a></span></td>
                            </tr>
                            <tr>
                                <td>#2018002</td>
                                <td>Nguyen Van Cuong</td>
                                <td>Bình xịch cao áp</td>
                                <td>23/02/2018 09:00</td>
                                <td>25/02/2018 15:00</td>
                                <td>1</td>                              
                                <td><span class="btn btn-primary btn-xs">Theo block</span></td>
                                <td>20/02/2018 10:15 </td> 
                                <td><span class="btn btn-info btn-xs">Lần 2</span></td> 
                                <td><span class="btn btn-info btn-xs">Đã cho thuê</span></td>                        
                                <td><a href="/backend/order-detail.html" class="btn btn-success btn-xs" onclick="Details($(this))"><i class="fa fa-info-circle"></i>&nbsp Xem chi tiết</a>
                                  <span><a href="/backend/order-process.html" class="btn btn-info btn-xs" onclick="Edit($(this))"><i class="fa fa-edit"></i>&nbsp Xử lý đơn hàng</a></span>
                                <span><a href="/backend/order-renew.html" class="btn btn-dark btn-xs" onclick="Edit($(this))"><i class="fa fa-edit"></i>&nbsp Gia hạn</a></span>
                                <span><a href="/backend/order-trackchange.html" class="btn btn-warning btn-xs" onclick="Edit($(this))"><i class="fa fa-magic"></i>&nbsp Xem lịch sử Gia hạn</a></span>
                                <span><a href="#" class="btn btn-danger btn-xs" onclick="Disable($(this))"><i class="fa fa-remove"></i>&nbsp Disable</a></span></td>
                            </tr>
                            <tr>
                                <td>#2018003</td>
                              <td>Dang Le Nam</td>
                              <td>Xe Starex 9 chỗ</td>
                              <td>23/02/2018 09:00</td>
                              <td>25/02/2018 15:00</td>
                              <td>1</td>                              
                              <td><span class="btn btn-success btn-xs">Theo ngày</span></td>
                              <td>20/02/2018 10:15 </td> 
                              <td><span class="btn btn-success btn-xs">lần 1</span></td>
                              <td><span class="btn btn-success btn-xs">Hoàn thành</span></td>                       
                              <td><a href="/backend/order-detail.html" class="btn btn-success btn-xs" onclick="Details($(this))"><i class="fa fa-info-circle"></i>&nbsp Xem chi tiết</a>
                                <span><a href="/backend/order-process.html" class="btn btn-info btn-xs" onclick="Edit($(this))"><i class="fa fa-edit"></i>&nbsp Xử lý đơn hàng</a></span>
                                <span><a href="/backend/order-renew.html" class="btn btn-dark btn-xs" onclick="Edit($(this))"><i class="fa fa-edit"></i>&nbsp Gia hạn</a></span>
                                <span><a href="/backend/order-trackchange.html" class="btn btn-warning btn-xs" onclick="Edit($(this))"><i class="fa fa-magic"></i>&nbsp Xem lịch sử Gia hạn</a></span>
                                <span><a href="#" class="btn btn-danger btn-xs" onclick="Disable($(this))"><i class="fa fa-remove"></i>&nbsp Disable</a></span></td>
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

