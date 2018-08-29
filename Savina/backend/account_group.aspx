<%@ Page Title="" Language="C#" MasterPageFile="~/backend/adTemplate.master" AutoEventWireup="true" CodeFile="account_group.aspx.cs" Inherits="backend_account_group" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
              <div class="page-title">
                <div class="title_left">
                  <h3>QUẢN LÝ NHÓM QUYỀN TÀI KHOẢN</h3>
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
                    <div class="x_title">
                      <h2>TẠO TÀI NHÓM VÀ PHÂN QUYỀN TRUY CẬP</h2>
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
                        <br />
                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                         <div class="col-md-5 col-sm-5 col-xs-12"> <!--part on left-->
                          <div class="form-group">
                            <label class="control-label col-md-4 col-sm-4 col-xs-12" for="first-name">Mã nhóm tài khoản<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="text" id="accountGroupCode" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>
                           <div class="form-group">
                            <label class="control-label col-md-4 col-sm-4 col-xs-12" for="first-name">Tên nhóm tài khoản<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="text" id="accountGroupName" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>
                           <div class="form-group">
                            <label class="control-label col-md-4 col-sm-4 col-xs-12" for="first-name">Mô tả nhanh<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="text" id="accountGroupDescription" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>
                        </div>  <!--/part on left-->
                        <div class="col-md-7 col-sm-7 col-xs-12">   <!--part on right-->                        
                            <div class="portlet">
                                <div class="portlet-body">
                                    <div id="sample_2_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                        <div class="table-scrollable scrollerUser" style="overflow: scroll; max-height: 350px;">
                                            <table class="table table-striped table-bordered table-hover dataTable" id="sample_2" aria-describedby="sample_2_info">
                                                <thead>
                                                    <tr role="row">
                                                        <th>Xem</th>
                                                        <th>Edit</th>
                                                        <th>Full</th>
                                                        <th>Menu chính</th>
                                                        <th>Chức năng con</th>
                                                    </tr>
                                                </thead>
                                                <tbody role="alert" aria-live="polite" aria-relevant="all">
                                                    <tr>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td>Quản lý category</td>
                                                        <td>Category Main</td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td>Quản lý category</td>
                                                        <td>Category Sub 1</td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td>Quản lý category</td>
                                                        <td>Category Sub 2</td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td>Quản lý category</td>
                                                        <td>Category Sub 3</td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td>Quản lý sản phẩm</td>
                                                        <td>Tạo sản phẩm</td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td>Quản lý sản phẩm</td>
                                                        <td>Danh sách sản phẩm</td>
                                                    </tr>
                                                     <tr>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td>Quản lý đơn hàng</td>
                                                        <td>tạo đơn hàng</td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td>Quản lý đơn hàng</td>
                                                        <td>Danh sách đơn hàng</td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td>Quản lý khách hàng</td>
                                                        <td>Nhóm khách hàng</td>
                                                    </tr>
                                                     <tr>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td>Quản lý khách hàng</td>
                                                        <td>Danh sách khách hàng</td>
                                                    </tr>
                                                     <tr>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td>Quản lý khách hàng</td>
                                                        <td>Tạo khách hàng mới</td>
                                                    </tr>
                                                     <tr>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td>Quản lý các banner</td>
                                                        <td>Quản lý các banner</td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td>Quản lý các tin nhắn</td>
                                                        <td>Quản lý các tin nhắn</td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td>Quản lý hệ thống</td>
                                                        <td>Tạo nhóm tài khoản</td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td><input type="checkbox" class="flat"  style="position: absolute; opacity: 0;"></td>
                                                        <td>Quản lý hệ thống</td>
                                                        <td>Tạo tài khoản</td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                            <input type="hidden" class="TenDangNhap" name="TenDangNhap" value="">
                                            <input type="hidden" class="AllowEdit" name="AllowEdit" value="">
                                            <input type="hidden" class="AllowFull" name="AllowFull" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                     
                          
                          
                        </div> <!--/part on right-->

                          <div class="ln_solid"></div>
                          <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                              <button class="btn btn-primary" type="reset">Reset</button>
                              <button type="submit" class="btn btn-success">Khởi Tạo</button>
                            </div>
                          </div>
    
                        </form>
                      </div>
                  </div>
                </div> <!-- /Create new category -->

                <div class="col-md-12 col-sm-12 col-xs-12"> <!-- Table  -->
                    <div class="x_panel">
                      <div class="x_title">
                        <h2>DANH SÁCH NHÓM  QUYỀN ĐANG CÓ</h2>
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
                              <th>Mã nhóm quyền</th>
                              <th>Tên nhóm quyền</th>
                              <th>Mô tả nhanh</th>
                              <th>Tình trạng</th>
                              <th>Ngày tạo</th>
                              <th>Thao tác</th>
                            </tr>
                          </thead>
       
                          <tbody>                         
                            <tr>
                              <td>ACCGR001</td>
                              <td>Manager</td>
                              <td>Là nhóm quyền có toàn quyền xử lý các giao dịch và trang admin, trứ quản lý hệ thống</td>
                              <td>Enable</td>
                              <td>23/02/2018 15:25:50</td>
                              <td><a href="#" class="btn btn-info btn-xs" onclick="Edit($(this))"><i class="fa fa-edit"></i>&nbsp Thay đổi</a>
                                <span><a href="#" class="btn btn-danger btn-xs" onclick="Edit($(this))"><i class="fa fa-edit"></i>&nbsp Disable</a></span></td>
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

