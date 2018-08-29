<%@ Page Title="" Language="C#" MasterPageFile="~/FrontSite.Master" AutoEventWireup="true" CodeFile="user_profile.aspx.cs" Inherits="user_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<form id="userprofile-form" class="clearfix">						
					<div class="section-title">
						<h3 class="title">USER PROFILE</h3>
					</div>

                    <div class="x_content">
                        <div class="col-md-3 col-sm-3 col-xs-12 profile_left">
                            <div class="profile_img">
                                <div id="crop-avatar">
                                    <!-- Current avatar -->
                                    <div id="customerAvatar" runat="server">

                                    </div>
                                    <%--<img class="img-responsive avatar-view" src="img/picture.jpg" alt="Avatar" title="Change the avatar">--%>
                                </div>
                            </div>
                              <h3 id="customerFullNameH3" runat="server">QUỐC CHẤN</h3>
                              <ul class="list-unstyled user_data">
                                    <li><i class="fa fa-map-marker user-profile-icon"></i>&nbsp <p id="customerAddressFull" runat="server" style="display: inline;"></p>
                                    </li>
                                    <li>
                                      <i class="fa fa-briefcase user-profile-icon"></i>&nbsp Software Developer
                                    </li>
                                    <li>
                                      <i class="fa fa-calendar user-profile-icon"></i>&nbsp Tham gia:&nbsp <p ID="customerJoinTime" runat="server"></p>
                                    </li>
                              </ul>

                              <a class="btn btn-success" style="margin-top:10px"><i class="fa fa-edit m-right-xs"></i> &nbsp Edit Profile</a>
                              <br>

                        </div>   
                        
                        <div class="col-md-9 col-sm-9 col-xs-12">
                            <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                  <li role="presentation" class="active"><a href="#tab_content_userInfo" id="userInfo-tab" role="tab" data-toggle="tab" aria-expanded="true">Thông tin chung</a>
                                  </li>
                                  <li role="presentation" class=""><a href="#tab_content_history" role="tab" id="orderHistory-tab" data-toggle="tab" aria-expanded="false">Lịch sử giao dịch</a>
                                  </li>
                                  <li role="presentation" class=""><a href="#tab_content_wishlist" role="tab" id="wishlist-tab" data-toggle="tab" aria-expanded="false">Danh sách Wishlist</a>
                                  </li>
                                </ul>
                                 <div id="myTabContent" class="tab-content">
                              <div role="tabpanel" class="tab-pane fade active in" id="tab_content_userInfo" aria-labelledby="home-tab"> <!-- content Thong Tin Chung --> 
                                 <div class="x_content form-horizontal form-label-left">
                                    <br />                         
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Mã khách hàng</label>
                                            <div class="col-md- col-sm-7 col-xs-12 userprofile-inputform">
                                                <input type="text" id="customerCode" runat="server" disabled="disabled" class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Họ khách hàng</label>
                                            <div class="col-md- col-sm-7 col-xs-12 userprofile-inputform">
                                                <input type="text" id="cusLastname" runat="server" name="last-name" disabled="disabled" class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Tên khách hàng</label>
                                            <div class="col-md- col-sm-7 col-xs-12 userprofile-inputform">
                                                <input type="text" id="customerFirstname" runat="server" name="first-name" disabled="disabled" class="form-control"/>
                                            </div>
                                        </div>                                                       
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Email</label>
                                            <div class="col-md- col-sm-7 col-xs-12 userprofile-inputform">
                                                <input type="email" id="customerEmail" runat="server" name="email" disabled="disabled" class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Số điện thoại</label>
                                            <div class="col-md- col-sm-7 col-xs-12 userprofile-inputform">
                                                <input type="number" id="customerPhoneNumber" runat="server" name="phone-number" disabled="disabled" class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Địa chỉ</label>
                                            <div class="col-md- col-sm-7 col-xs-12 userprofile-inputform">
                                                <input type="text" id="customerAddress" runat="server" name="address" disabled="disabled" class="form-control">
                                            </div>
                                        </div>                          
                                    </div>

                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Thuộc nhóm khách hàng</label>
                                                <div class="col-md- col-sm-7 col-xs-12 userprofile-inputform">
                                                    <input type="text" id="customerGroup" runat="server" name="userGroup" disabled="disabled" class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Mô tả nhanh</label>
                                                <div class="col-md- col-sm-7 col-xs-12 userprofile-inputform">
                                                    <textarea class="resizable_textarea form-control" disabled="disabled" id="customerDescription" runat="server" ></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Hình đại diện</label>
                                                <div class="btn-group" style="margin-left: 17px;">
                                                    <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
                                                </div>
                                            </div>
                                        </div>                          
                                   </div>
                              </div>  <!-- /content Thong Tin Chung -->
                          
                                <div role="tabpanel" class="tab-pane fade" id="tab_content_history" aria-labelledby="profile-tab">  <!-- content Lich Su Giao Dich -->                           
                                        <table class="data table table-striped no-margin">
                                          <thead>
                                            <tr>
                                              <th>Mã đơn hàng</th>
                                              <th>Tên sản phẩm</th>
                                              <th>Ngày đặt hàng</th>
                                              <th>Thời gian thuê</th>
                                              <th>Thời gian trả</th>
                                              <th>Thanh toán</th>
                                            </tr>
                                          </thead>
                                          <tbody>
                                            <tr>
                                              <td>#2018001</td>
                                              <td>Máy khoan bosch cầm tay</td>
                                              <td>15/03/2018 10:00 am</td>
                                              <td>18/03/2018 16:00 apm</td>
                                              <td>20/03/2018 14:00 apm</td>
                                              <td>255.000 d</td>
                                            </tr>
                                            <tr>
                                              <td>#2018006</td>
                                              <td>Dàn karaoke agrirang</td>
                                              <td>15/03/2018 10:00 am</td>
                                              <td>18/03/2018 16:00 apm</td>
                                              <td>20/03/2018 14:00 apm</td>
                                              <td>1.200.000 d</td>
                                            </tr>
                                          </tbody>
                                        </table>                           
                                </div>    <!-- /content Lich Su Giao Dich -->             
                          
                               <div role="tabpanel" class="tab-pane fade" id="tab_content_wishlist" aria-labelledby="profile-tab"> <!-- content Wishlist -->
                                    <p> wishlist here</p>
                              </div><!-- /content Wishlist -->
                        </div>
                           </div>
                        </div>                                                               
                    </div> <!-- /x_content -->
                </form>
            </div>  <!-- /row -->
        </div> <!-- /container -->
</asp:Content>

