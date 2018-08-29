<%@ Page Title="" Language="C#" MasterPageFile="~/backend/adTemplate.master" AutoEventWireup="true" CodeFile="order_renew.aspx.cs" Inherits="backend_order_renew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
              <div class="page-title">
                <div class="title_left">
                  <h3>GIA HẠN ĐƠN HÀNG SỐ: <STRONG>#2018002</STRONG></h3>
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
  
              <div class="row">   
                <div class="col-md-12 col-sm-12 col-xs-12">   <!-- Create new category -->
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
                          </div>

                          <div class="col-md-6 col-sm-6 col-xs-12">         
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">Khách hàng</label>
                                  <div class="col-md-8 col-sm-8 col-xs-12">                                 
                                      <input type="text" id="orderCustomerCode" value="KH2018012" disabled="disabled" class="form-control">       
                                      <input type="text" id="orderCustomerName" value="Nguyễn Văn Minh" disabled="disabled" class="form-control">                                  
                                  </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">Thời gian nhận gốc</label>
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                  <input type="text" id="orderPickupTime" value="22/3/2018 10:00" disabled="disabled" class="form-control">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">Thời gian trả gốc</label>
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
                          <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:30px;">   
                              <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">Cập nhật thời gian trả mới</label>
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                  <input type="text" id="orderReturnTimeUpdate" value="24/3/2018 16:00" class="form-control" style="width:70%">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">Tổng thời gian Thuê mới</label>
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                  <input type="text" id="orderTotalTime" value="2 ngày 6 giờ 0 phút " disabled="disabled" class="form-control" style="width:70%">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">Mô tả nhanh</label>
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                    <textarea class="resizable_textarea form-control"  style="width:70%" placeholder="độ dài trường nhập liệu tự động mở rộng..."></textarea>
                                  </div>
                              </div>
                          </div>
                                                                           
                        </form>
                        <div class="ln_solid"></div>
                          <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <a href="/backend/order-list.html"><button class="btn btn-info" type="button"><i class="fa fa-arrow-left"></i>&nbsp Trở về</button></a>
                              <button type="orderRenew" class="btn btn-success"><i class="fa fa-cloud-upload"></i>&nbspTiến hành gia hạn</button>
                            </div>
                          </div>
                      </div>
                  </div>
                </div> <!-- /Create new category -->
            </div>
          </div>
        <!-- /page content -->
</asp:Content>

