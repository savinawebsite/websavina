<%@ Page Title="" Language="C#" MasterPageFile="~/FrontSite.Master" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <script src="../js/accounting.js"></script>
<style>
    .collapse.in {
        margin-top: 17px;
    }

    table th {
        text-align:center;
    }

    table td {
        text-align:center;
    }

    .cost-alignright {
        text-align:right !important;
    }
        input[type=number]::-webkit-inner-spin-button, 
        input[type=number]::-webkit-outer-spin-button {  
            opacity: 1;
        }
        .billing-details {
            width:90%
        }

</style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <!-- BREADCRUMB -->
	<div id="breadcrumb">
		<div class="container">
			<ul class="breadcrumb">
				<li><a href="#">Home</a></li>
				<li class="active">Checkout</li>
			</ul>
		</div>
	</div>
	<!-- /BREADCRUMB -->

	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<form id="checkout-form" class="clearfix">
					<div class="col-md-6">
						<div class="billing-details">							
							<div class="section-title">
								<h3 class="title">NHẬP THÔNG TIN NHƯ KHÁCH VÃNG LAI</h3>
							</div>
							<div class="form-group">
								<input class="input cartInfoForm" type="text" name="first-name" placeholder="Vui lòng nhập họ">
							</div>
							<div class="form-group">
								<input class="input cartInfoForm" type="text" name="last-name" placeholder="Vui lòng nhập tên">
							</div>
							<div class="form-group">
								<input class="input cartInfoForm" type="email" name="email" placeholder="Vui lòng nhập Email">
							</div>
							<div class="form-group">
								<input class="input cartInfoForm" type="tel" name="tel" placeholder="Vui lòng nhập số điện thoại liện hệ">
							</div>
							<div class="form-group">
								<p>Bạn đã có tài khoản rồi? Vui lòng click <a id="callLoginBtn" class="btn btn-white-orange txt-orange right">Log in</a></p>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="payments-methods">
							<div class="section-title">
								<h4 class="title">PHƯƠNG THỨC THANH TOÁN</h4>
							</div>
							<div class="input-checkbox">
								<input type="radio" name="payments" id="payments-1" checked>
								<label for="payments-1">Chuyển khoản ngân hàng</label>
								<div class="caption">
									<p>Vui lòng chuyển tiền thanh toán vào tài khoản dưới đây, ghi rõ mã đơn hàng.<p>
									<ul style="margin-left:30px;">
										<li>- Chu tài khoản:   Đăng Lê Nam</li>
										<li>- Số tài khoản:  123456789 </li>
										<li>- Ngân hàng:    ACB chi nhánh quận 2.</li>
									</ul>	
								</div>
							</div>
							<div class="input-checkbox" style="margin-top:10px">
								<input type="radio" name="payments" id="payments-2">
								<label for="payments-2">Thanh toán khi nhận hàng</label>
								<div class="caption">
									<p>Nhân viên chúng tôi sẽ nhận đủ số tiền khi giao hàng tại nhà, vui lòng kiểm tra sản phẩm kỹ trước giao tiền và ký biên nhận.
										<p>
								</div>
							</div>
							<div class="input-checkbox" style="margin-top:10px">
								<input type="radio" name="payments" id="payments-3">
								<label for="payments-3">Thanh toán bằng hệ thống khác</label>
								<div class="caption">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
										<p>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-12" style="margin-bottom:20px;">
						<div class="order-summary clearfix">
							<div class="section-title">
								<h3 class="title">ĐƠN HÀNG SỐ &nbsp &nbsp</h3><p class="spanOrderCode">#2018001</p>
							</div>
							<table class="shopping-cart-table table">
								<thead>
									<tr style="border-bottom-color: #FFF">
										<th>TÊN SẢN PHẨM</th>
										<th></th>
										<th class="text-center">THỜI GIAN <br> NHẬN</th>
										<th class="text-center">THỜI GIAN <br>TRẢ</th>	
                                        <th class="text-center">THỜI GIAN <br>THUÊ</th>										
										<th class="text-center">SỐ LƯỢNG</th>
                                        <th class="text-center">SẢN PHẨM <br /> ĐI KÈM</th>
                                        <th class="text-center">PHỤ KIỆN <br /> CHỌN THÊM</th>
										<th class="text-center">TỔNG CỘNG</th>
										<th class="text-right"></th>
									</tr>
								</thead>
								<tbody>
									<tr style="border-bottom:none">
										<td class="thumb"><img src="./img/thumb-product01.jpg" alt=""></td>
										<td class="details">
											<a href="#">Máy khoan Bosche</a>
											<ul>
												<li><span>Thông tin sản phẩm</span></li>
												<li><span>Phụ kiện đi kèm</span></li>
											</ul>
										</td>
										<td class="pickupTime text-center">25/2/2018 10:30 am</td>
										<td class="dropbackTime text-center">27/2/2018 10:30 am</td>
                                        <td class="dropbackTime text-center">2 ngày 3 giờ</td>									
										<td class="qty text-center"><input class="input" type="number" value="1"></td>
                                        <td class="price text-center"><strong>Có</strong></td>
                                        <td class="price text-center"><strong>Có</strong></td>
										<td class="total text-center" id="checkout-total-cost"><strong class="primary-color"> </strong></td>
										<td class="text-right"><button class="main-btn icon-btn"><i class="fa fa-close"></i></button></td>
									</tr>
								</tbody>
							</table>	
                            <div class="accordion" id="accordion" aria-multiselectable="true">  <%-- click to view detail section--%>
                              <div class="panel">
                                <a class="panel-heading" id="headingCollapse" data-toggle="collapse" data-parent="#accordion" href="#collapseDetailOrder" aria-expanded="false" aria-controls="collapseDetailOrder">
                                  <h4 class="panel-title" style="display:inline">Click xem chi tiết đơn hàng &nbsp</h4><span><i class="fa fa-angle-double-down"></i></span>
                                </a>
                                    <div id="collapseDetailOrder" aria-labelledby="headingCollapse" class="panel-collapse collapse in form-horizontal form-label-left" >
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <form class="form-horizontal form-label-left">
                                                <div class="form-group">
                                                  <label class="control-label col-md-3 col-sm-3 col-xs-12" style="padding-right: 10px;">Loại đơn hàng</label>
                                                    <div class="col-md-7 col-sm-7 col-xs-12">
                                                        <input type="text" class="form-control" disabled="disabled" value="Thuê theo ngày">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                  <label class="control-label col-md-3 col-sm-3 col-xs-12" style="padding-right: 10px;">Dịch vụ đi kèm</label>
                                                    <div class="col-md-7 col-sm-7 col-xs-12">
                                                        <input type="text" class="form-control" disabled="disabled" value="Tự lắp đặt">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                  <label class="control-label col-md-3 col-sm-3 col-xs-12" style="padding-right: 10px;">Vận chuyển</label>
                                                    <div class="col-md-7 col-sm-7 col-xs-12">
                                                        <input type="text" class="form-control" disabled="disabled" value="Giao tận nhà">
                                                        <input type="text" class="form-control" disabled="disabled" value="431 Nguyễn Kiệm, phường 9, Phú Nhuận">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                  <label class="control-label col-md-3 col-sm-3 col-xs-12" style="padding-right: 10px;">Khách gửi lại</label>
                                                    <div class="col-md-7 col-sm-7 col-xs-12">
                                                        <input type="text" class="form-control" disabled="disabled" value="Giấy tờ">
                                                        <input type="text" class="form-control" disabled="disabled" value="CMND | bằng lái">
                                                    </div>
                                                </div>
                                            </form>		
                                        </div>	
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <lable>Sản phẩm đi kèm miễn phí</lable>
                                            <table class="table table-striped table-bordered">
                                                  <tbody>
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
                                                </tbody>
                                            </table>
                                            <hr />
                                            <lable>Linh kiện/sản phẩm chọn thêm</lable>
                                            <table class="table table-striped table-bordered">
                                                  <tbody>
                                                        <tr>
                                                            <th>Mã sản phẩm</th>
                                                            <th>Tên sản phẩm</th>
                                                            <th>số lượng</th>
                                                        </tr>
                                                      <tr>
                                                          <td>HS01003</td>
                                                          <td>Thước đo điện tử</td>
                                                          <td><input type="number" value="1" class="input" style="width:60px">
                                                                <span><a href="#" class="btn btn-danger btn-xs" style="margin-bottom:1px; margin-left: 3px;"><i class="fa fa-remove"></i></a></span>
                                                          </td>
                                                      </tr>
                                                  <tr>
                                                      <td>HS01009</td>
                                                      <td>găng tay lao động</td>
                                                      <td><input type="number" value="1" class="input" style="width:60px">
                                                        <span><a href="#" class="btn btn-danger btn-xs" style="margin-bottom:1px; margin-left: 3px;"><i class="fa fa-remove"></i></a></span>
                                                    </td>
                                                  </tr>
                                                </tbody>
                                            </table>
                                        </div>		
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="x_content">                          
                                              <table id="datatable" class="table table-striped table-bordered dataTable no-footer">
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
                                                  <tr role="row">
                                                    <td class=" ">1</td>
                                                    <td class=" ">Thời gian thuê sản phẩm</td>
                                                    <td class=" ">1</td>
                                                    <td id="tblCost-temp-time" class="cost-alignright "> </td>
                                                    <td id="tblCost-value-time" class="cost-alignright "> </td>
                                                  </tr>
                                                  <tr role="row">
                                                      <td class=" ">2</td>
                                                      <td class=" ">Phụ kiện đi kèm: Thước đo điện tử</td>
                                                      <td class=" ">1</td>
                                                      <td id="tblCost-temp-accessory" class="cost-alignright "> </td>
                                                      <td id="tblCost-value-accessory" class="cost-alignright "> </td>
                                                    </tr>
                                                  <tr role="row">
                                                      <td class=" ">3</td>
                                                      <td class=" ">Dịch vụ đi kèm: Hướng dẫn sử dụng</td>
                                                      <td class=" ">1</td>
                                                      <td id="tblCost-temp-service" class="cost-alignright "> </td>
                                                      <td id="tblCost-value-service" class="cost-alignright "> </td>
                                                  </tr>
                                                  <tr role="row">
                                                      <td class=" ">4</td>
                                                      <td class=" ">Vận chuyển: Giao tận nhà </td>
                                                      <td class=" ">1</td>
                                                    <td id="tblCost-temp-delivery" class="cost-alignright "> </td>
                                                    <td id="tblCost-value-delivery" class="cost-alignright "> </td>
                                                  </tr>
                                                  <tr role="row">
                                                      <td class=" ">5</td>
                                                      <td class=" ">Khách gửi lại: CMND, bằng lái </td>
                                                      <td class=" ">1</td>
                                                    <td id="tblCost-temp-document" class="cost-alignright "> </td>
                                                    <td id="tblCost-value-document" class="cost-alignright "> </td>
                                                  </tr>
                                                  <tr>
                                                    <td colspan="3" style="text-align:right;"><strong>TỔNG CỘNG</strong></td>
                                                    <td id="tblCost-temp-total" class="cost-alignright"><strong> </strong></td>
                                                    <td id="tblCost-value-total" class="cost-alignright"><strong> </strong></td>
                                                  </tr>
                                                </tbody>
                                              </table>              
                                            </div>
                                        </div>
                                    </div>
                                </div
                            </div>  <%-- /click to view detail section--%>
						</div>

                        
					</div>
                    <div class="pull-right" style="margin-top:10px;">
						<button class="primary-btn">GỬI ĐƠN HÀNG</button>
					</div>
				</form>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->
     <script type="text/javascript">
         $('#callRegisterBtn').click(function () {
             $('#login-modal').modal();
            $('.content-tab-login').css('display', 'none')
            $('.content-tab-register-social').css('display', 'block')
            $('.content-tab-register').css('display', 'none')
            $('.content-tab-forgotten-password').css('display', 'none')
        });

        $('#callLoginBtn').click(function () {
            $('#login-modal').modal();
            $('.content-tab-login').css('display', 'block')
            $('.content-tab-register-social').css('display', 'none')
            $('.content-tab-register').css('display', 'none')
            $('.content-tab-forgotten-password').css('display', 'none')
        });
   
        $(function () {
            document.getElementById("checkout-total-cost").innerHTML = accounting.formatNumber(510000) + " đ";
            //Hien thi gia bang chi tiet Checkout
            document.getElementById("tblCost-temp-time").innerHTML = accounting.formatNumber(230000) + " đ";
            document.getElementById("tblCost-value-time").innerHTML = accounting.formatNumber(1900000) + " đ";
            document.getElementById("tblCost-temp-accessory").innerHTML = accounting.formatNumber(15000) + " đ";
            document.getElementById("tblCost-value-accessory").innerHTML = accounting.formatNumber(190000) + " đ";
            document.getElementById("tblCost-temp-service").innerHTML = accounting.formatNumber(55000) + " đ";
            document.getElementById("tblCost-value-service").innerHTML = accounting.formatNumber(0) + " đ";
            document.getElementById("tblCost-temp-delivery").innerHTML = accounting.formatNumber(75000) + " đ";
            document.getElementById("tblCost-value-delivery").innerHTML = accounting.formatNumber(0) + " đ";
            document.getElementById("tblCost-temp-document").innerHTML = accounting.formatNumber(0) + " đ";
            document.getElementById("tblCost-value-document").innerHTML = accounting.formatNumber(0 + " đ");
            document.getElementById("tblCost-temp-total").innerHTML = accounting.formatNumber(510000) + " đ";
            document.getElementById("tblCost-value-total").innerHTML = accounting.formatNumber(2510000) + " đ";

        });
        
    </script>

    <script type="text/javascript">
	    accounting.formatMoney(5318008);
    </script>
</asp:Content>

