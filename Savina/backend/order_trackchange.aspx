<%@ Page Title="" Language="C#" MasterPageFile="~/backend/adTemplate.master" AutoEventWireup="true" CodeFile="order_trackchange.aspx.cs" Inherits="backend_order_trackchange" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- page content -->
        <div class="right_col" role="main">
            <div class="">
              <div class="page-title">
                <div class="title_left">
                  <h3>LỊCH SỬ GIA HẠN ĐƠN HÀNG SỐ :  <STRONG>#2018001</STRONG></h3>
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
  
               
                <div class="col-md-12 col-sm-12 col-xs-12">   <!-- Section Detail of Order-->
                  <div class="x_panel">
                    <div class="x_content">
                        <br />
                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                          <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">Mã đơn hàng</label>
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                  <input type="text" id="orderCode" disabled="disabled" value="#2018001" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">Tên sản phẩm</label>
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                  <input type="text" id="productName" disabled="disabled" Value="Máy khoan Bosche full box" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Số lượng</label>
                              <div class="col-md-8 col-sm-8 col-xs-12">
                                <input type="text" id="orderQuantity" disabled="disabled" value="1" class="form-control">
                              </div>
                            </div>                            
                          </div>
                          <div class="col-md-6 col-sm-6 col-xs-12">
                              <div class="form-group">
                                  <label class="control-label col-md-4 col-sm-4 col-xs-12">Thời gian nhận gốc</label>
                                  <div class="col-md-8 col-sm-8 col-xs-12">
                                    <input type="text" id="orderPickupTime" value="22/3/2018 10:00" disabled="disabled" class="form-control">
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="control-label col-md-4 col-sm-4 col-xs-12">Thời gian trả gốc </label>
                                  <div class="col-md-8 col-sm-8 col-xs-12">
                                    <input type="text" id="orderReturnTime" value="24/3/2018 16:00" disabled="disabled" class="form-control">
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="control-label col-md-4 col-sm-4 col-xs-12">Tổng thời gian Thuê gốc</label>
                                  <div class="col-md-8 col-sm-8 col-xs-12">
                                    <input type="text" id="orderTotalTime" value="2 ngày 6 giờ 0 phút " disabled="disabled" class="form-control">
                                  </div>
                                </div>                          
                          </div>                        
                        </form>
                      </div>
                  </div>
                </div> <!-- /Section Detail of Order -->

                <div class="col-md-12 col-sm-12 col-xs-12"> <!-- Table  -->
                  <div class="x_panel"> 
                      <div class="x_content">                          
                          <table id="datatable" class="table table-striped table-bordered">
                            <thead>
                              <tr>
                                <th class="column-title">Lần gia hạn </th>
                                <th class="column-title">Ngày gia hạn</th>
                                <th class="column-title">Nhân viên gia hạn </th> 
                                <th class="column-title">Thời gian trả gia hạn </th>
                                <th class="column-title">Thời gian thuê gia hạn </th>
                                <th class="column-title">Tiền thuê bổ sung</th>
                                <th class="column-title">Tổng tiền thuê thay đổi</th>
                              </tr>
                            </thead>    
                            <tbody>
                              <tr>
                                <td class=" ">1</td>
                                <td class=" ">24/3/2018 09:30</td>
                                <td class=" ">SAV003 - Đỗ Mỹ Linh</td>
                                <td class=" ">25/3/2018 16:00</td>
                                <td class=" ">1 ngày</td>
                                <td>100.000</td>
                                <td>610.000</td>
                              </tr>
                              <tr>
                                  <td class=" ">2</td>
                                  <td class=" ">25/3/2018 13:50</td>
                                  <td class=" ">SAV002 - Đăng Lê Nam</td>
                                  <td class=" ">27/3/2018 09:00</td>
                                  <td class=" ">1 ngày 18 tiếng</td>
                                  <td>100.000</td>
                                  <td>610.000</td>
                                </tr>
                            </tbody>
                          </table>              
                      </div>
                    </div>
                </div>  <!-- /Table -->              
            
          </div>
          </div>
        <!-- /page content -->
</asp:Content>

