<%@ Page Title="" Language="C#" MasterPageFile="~/backend/adTemplate.master" AutoEventWireup="true" CodeFile="order_detail.aspx.cs" Inherits="backend_order_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- page content -->
        <div class="right_col" role="main">
            <div class="">
              <div class="page-title">
                <div class="title_left">
                  <h3>CHI TIẾT ĐƠN HÀNG SỐ :  <STRONG>#2018001</STRONG></h3>
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
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Loại đơn hàng</label>
                              <div class="col-md-8 col-sm-8 col-xs-12">
                                <input type="text" id="orderType" disabled="disabled" value="Thuê theo ngày" class="form-control">
                              </div>
                            </div>                            
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Khách hàng</label>
                                <div class="col-md-8 col-sm-8 col-xs-12">                                 
                                    <input type="text" id="orderCustomerCode" value="KH2018012" disabled="disabled" class="form-control">       
                                    <input type="text" id="orderCustomerName" value="Nguyễn Văn Minh" disabled="disabled" class="form-control">                                  
                                </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Thời gian nhận</label>
                              <div class="col-md-8 col-sm-8 col-xs-12">
                                <input type="text" id="orderPickupTime" value="22/3/2018 10:00" disabled="disabled" class="form-control">
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Thời gian trả</label>
                              <div class="col-md-8 col-sm-8 col-xs-12">
                                <input type="text" id="orderReturnTime" value="24/3/2018 16:00" disabled="disabled" class="form-control">
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Tổng thời gian Thuê</label>
                              <div class="col-md-8 col-sm-8 col-xs-12">
                                <input type="text" id="orderTotalTime" value="2 ngày 6 giờ 0 phút " disabled="disabled" class="form-control">
                              </div>
                            </div>

                          </div>

                          <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">Dịch vụ đi kèm</label>
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                  <input type="text" id="orderServices" value="Tự lắp đặt" disabled="disabled" class="form-control">
                                </div>
                              </div>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">Vận chuyển</label>
                                <div class="col-md-8 col-sm-8 col-xs-12">                                 
                                  <input type="text" id="orderDevlivery" value="Giao tận nhà" disabled="disabled" class="form-control">       
                                  <input type="text" id="orderDeliveryInfo" value="431 Nguyễn Kiệm, phường 9, Phú Nhuận" disabled="disabled" class="form-control">                                  
                               </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">Khách gửi lại</label>
                                <div class="col-md-8 col-sm-8 col-xs-12">                                 
                                  <input type="text" id="orderDocument" value="Giấy tờ" disabled="disabled" class="form-control">       
                                  <input type="text" id="orderDocumentInfo" value="CMND | Bằng lái" disabled="disabled" class="form-control">                                  
                                </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Chọn thêm phụ kiện</label>
                              <div class="col-md-8 col-sm-8 col-xs-12">
                                <table class="table table-striped table-bordered">
                                  <tr>
                                    <th>Mã sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>số lượng</th>
                                  </tr>
                                  <tr>
                                      <td>HS01003</td>
                                      <td>Thước đo điện tử</td>
                                      <td>1</td>
                                  </tr>
                                  <tr>
                                      <td>HS01009</td>
                                      <td>găng tay lao động</td>
                                      <td>2</td>
                                  </tr>
                                </table> 
                              </div>
                            </div>                           
                          </div>                        
                        </form>
                      </div>
                  </div>
                </div> <!-- /Section Detail of Order -->

                <div class="col-md-12 col-sm-12 col-xs-12"> <!-- Table  -->
                  <div class="x_panel">
                      <div class="x_title">
                        <h2>Bảng thống kê chi phí</h2>
                        <div class="clearfix"></div>
                      </div>   
                      <div class="x_content">                          
                          <table id="datatable" class="table table-striped table-bordered">
                            <thead>
                              <tr>
                                <th class="column-title">STT </th>
                                <th class="column-title">Mục thanh toán </th>
                                <th class="column-title">Số lượng</th>
                                <th class="column-title">Giá thuê tạm tính </th>
                                <th class="column-title">Giá trị sản phẩm </th>
                              </tr>
                            </thead>
    
                            <tbody>
                              <tr>
                                <td class=" ">1</td>
                                <td class=" ">Thời gian thuê sản phẩm</td>
                                <td class=" ">1</td>
                                <td class=" ">230.000</td>
                                <td class=" ">1.900.000</td>
                              </tr>
                              <tr>
                                  <td class=" ">2</td>
                                  <td class=" ">Phụ kiện đi kèm: Thước đo điện tử</td>
                                  <td class=" ">1</td>
                                  <td class=" ">15.000</td>
                                  <td class=" ">190.000</td>
                                </tr>
                              <tr>
                                <td class=" ">3</td>
                                <td class=" ">Phụ kiện đi kèm: Găng tay lao động</td>
                                <td class=" ">2</td>
                                <td class=" ">20.000</td>
                                <td class=" ">100.000</td>
                              </tr>
                              <tr>
                                  <td class=" ">4</td>
                                  <td class=" ">Dịch vụ đi kèm: Tự lắp đặt</td>
                                  <td class=" ">1</td>
                                <td class=" ">0.0</td>
                                <td class=" ">0.0</td>
                              </tr>
                              <tr>
                                  <td class=" ">5</td>
                                  <td class=" ">Vận chuyển: Giao tận nhà </td>
                                  <td class=" ">1</td>
                                <td class=" ">75.000</td>
                                <td class=" ">0.0</td>
                              </tr>
                              <tr>
                                  <td class=" ">6</td>
                                  <td class=" ">Khách gửi lại: CMND, bằng lái </td>
                                  <td class=" ">1</td>
                                <td class=" ">0.0</td>
                                <td class=" ">0.0</td>
                              </tr>
                              <tr>
                                <td colspan="3" style="text-align:right;"><strong>TỔNG CỘNG</strong></td>
                                <td><strong>510.000</strong></td>
                                <td><strong>2.510.000</strong></td>
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

