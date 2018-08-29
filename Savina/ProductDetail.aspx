<%@ Page Title="" Language="C#" MasterPageFile="~/FrontSite.Master" AutoEventWireup="true" CodeFile="ProductDetail.aspx.cs" Inherits="ProductDetail" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">

    <script src="../js/accounting.js"></script>

    <style>
        .dvServiceDescription1, .dvServiceDescription2, .dvServiceDescription3 {display:none;}
        .dvDeliveryDescription1, .dvDeliveryDescription2, .dvDeliveryDescription3 {display:none;}
        .service_cost_1 { display: none; }
        .service_cost_2 { display: none; margin-top:35px }
        .service_cost_3 {display: none; margin-top:70px }
        .delivery_cost_1 { display: none; }
        .delivery_cost_2 { display: none; margin-top:35px }
        .delivery_cost_3 { display: none;margin-top:70px }
        .documentDeposit_1, .documentDeposit_2 {display: none;}
        .documentDeposit_3 {display: block;}
        input[type=number]::-webkit-inner-spin-button, 
        input[type=number]::-webkit-outer-spin-button {  
            opacity: 1;
        }

    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <!-- BREADCRUMB -->
	<div id="breadcrumb">
		<div class="container">
			<ul class="breadcrumb">
				<li><a href="#">Home</a></li>	
				<li><a href="#">Products</a></li>
				<li><a href="#">Category</a></li>
				<li class="active">Máy khoan bê tông Bosch</li>
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
				<!--  Product Details -->
				<div class="product product-details clearfix">

					<div class="col-md-6">  <!-- Start part on Left -->
                        <!-- Slider gallery -->
                        <div id="dvProductSlideList" runat="server">          
                        </div>
                         <!-- /Slider gallery -->
					    <!-- THÔNG TIN SẢN PHẨM ĐI KÈM NẾU CÓ -->	
					    <hr class="hrProductPackage"/>										
							<h3 style="font-size:18px; margin-top:20px;">DANH SÁCH SẢN PHẨM ĐI KÈM</h3>
                            <div id="dvProductAccompaniedList" runat="server">
							</div>
                     <!-- /THÔNG TIN SẢN PHẨM ĐI KÈM NẾU CÓ -->
							<hr class="hrProductPackage"/>										
					</div>  <!-- /End part on Left -->
					
                <form id="productcountform" onsubmit="return false;">
					<div class="col-md-6">  <!-- Start part on Right -->
						<div class="product-body">
							<h2 class="productDetail-name" id="productNameDb" runat="server">MÁY KHOAN BÊ TÔNG BOSCH</h2>
							<div>
								<%--<div class="col-md-4 col-xs-12" style="height:23px;padding-top: 8px;">
                                    <div class="product-rating">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star-o empty"></i>
									</div>
									<a href="#">3 Review(s)</a>
								</div>--%>
								<div class="col-md-12 col-xs-12 productStatus"  style="height:40px">
									<p style="display:inline;">Còn mới:</p>
									<div style="display:inline-block;width:50px" class="dvProductValue">
										<p style="display: inline;" id="productPercentage" runat="server"> </p><span>%</span>
									</div>
								</div>
							</div>
							<div class="dvBriefDescription">
								<%--<p>Mổ tả nhanh ngắn gọn về sản phẩm ổ đây: 
									<br> - Dùng điện 220v, an toàn điện.
									<br> - Thân máy màu xanh, xoay 2 chiều.
									<br> - Kèm thước đo khi khoan
								</p>--%>
                                <p id="BriefDescription" runat="server"></p>
							</div>
							<div style="padding:5px 0 5px;">
								<div class="dvRadioPrice">
									<input type="radio" id="GiaChoChueTheoBlock" onchange="javascript:callMeOnChange1()" onclick="calculateTotal()" name="rentalprice" value="1" />
								</div>					
								<h3 class="productDetail-lable" style="display:inline;">Giá cho thuê theo block:</h3>
								<p class="productDetail-price" style="display:inline;" id="price_block_p" runat="server"> </p>
								<i class="fa fa-exclamation-circle dvCommentShow" data-tooltip-opaque="false" data-visual-id="3" title="2 giờ đầu đầu 100.000 vnd, giờ tiếp theo 30.000 vnd"></i>				
							</div>
							<div style="padding:5px 0 5px;">
								<div class="dvRadioPrice">
									<input type="radio" id="GiaChoChueTheoNgay" onchange="javascript:callMeOnChange1()" onclick="calculateTotal()" name="rentalprice" value="2"/>
								</div>
								<h3 class="productDetail-lable" style="display:inline;">Giá cho thuê theo ngày:</h3>
								<p class="productDetail-price" style="display:inline;" id="price_day_p" runat="server"> </p>			
								<i class="fa fa-exclamation-circle dvCommentShow" data-tooltip-opaque="false" data-visual-id="3" title="Thuê càng lâu càng rẻ, ngày đầu 200.000 vnd ngày thứ 2 giảm 50%"></i>						
							</div>
							<div style="padding:5px 0 5px;">
								<h3 class="productDetail-lable" style="display:inline;">Tình trạng sản phẩm:</h3>
								<p style="display:inline; padding-left:10px;">Đang có / Mai có / Hết hàng</p>
							</div>
							<div style="padding:5px 0 5px;">
								<h3 class="productDetail-lable" style="display:inline;">Khu vực nhận hàng:</h3>
								<p style="display:inline; padding-left:10px;">Quận 2 - TP.Hồ Chí Minh</p>
							</div>
							<!-- session Book dat thue -->
							<h3 class="productDetail-lable" style="margin-top:5px;">Book đặt thuê:</h3>
							
							<!-- section Date time pickup -->
							<div class="dvBookTime">
                                <%--<button class="btn btn-danger btn-xs" onclick="getDatetimeinfo()">show time</button>--%>
								<div class="col-md-5 col-xs-12">
									<span class="pickuptime-title">Ngày giờ lấy:</span>
									<span class="returntime-title">Ngày giờ trả:</span>
										<input type="text" class="form-control ProcessOn pickuptime-form" id="orderTimePickup" placeholder="thời gian lấy" name="ProcessOn" style="font-size: 11px;"/>                                         
										<input type="text" class="form-control ProcessOn pickuptime-form" id="orderTimeReturn" placeholder="thời gian trả" name="ProcessOn" style="font-size: 11px;"/>
								</div>
								<div class="col-md-7 col-xs-12">
									<span>Số lượng:</span>
									<span style="padding-left:24px;">Giá thuê tạm tính:</span>
									<span style="padding-left:31px;">Giá trị sản phẩm:</span>
									<div class="qty-input">
										<input class="input" type="number" onclick="calculateTotal()" onchange="javascript:callMeOnChangeProductQty()" id="product_qty" value="1" style="height: 32px; width: 55px;"/>
									</div>
									<div class="dvPriceTamTinh dvPriceTamTinh-BookTime">
										<p style="display:inline" id="product_temp_p1">0</p><span>&nbsp đ</span>
									</div>
									<div class="dvProductValue dvProductValue-BookTime">
										<p style="display:inline" id="product_value_p1">0</p><span>&nbsp đ</span>
                                        <p style="display:none;" id="product_value_p" runat="server">0</p>
									</div>
								</div>
							</div>
							<!-- /section Date time pickup -->

							<hr class="hrProductPackage"/>

							<!-- section Accessories selection -->
							<div class="dvBookAccessory" id="dvProductAccessoryList" runat="server">
                            </div>															
							<!-- /section Accessories selection -->

							<hr class="hrProductPackage"/>

							<!-- section Services selection -->
							<div class="dvBookServices" id="dvBookServices" runat="server">                          
							</div>
							<!-- /section Services selection -->

							<hr class="hrProductPackage"/>

							<!-- section Delivery selection -->
                            <div class="dvBookDelivery" id="dvBookDelivery" runat="server">                          
							</div>							
							<!-- /section Delivery selection -->

								<hr class="hrProductPackage"/>	
																									
								<div class="dvBookDeposit">	
									<div class="col-sm-5 col-xs-12">
										<p style="display:inline;">- Khách gửi lại:</p>																		
										<div class="qty-input" style="padding-left: 14px;">
											<select class="form-control" id="DepositSelectDropdown" onchange="callMeOnChangeDeposit()" style="width: 118px;">
													<option value="documentDeposit" selected="selected">Giấy tờ</option>
													<option value="propertyDeposit">Tài sản </option>
													<option value="cashDeposit">Tiền cọc </option>
												</select>
										</div>
									</div>
									<div class="col-sm-7 col-xs-12">
										<!-- <div style="display:inline-block;" > -->
											<input class="dvGhiChuDeposit documentDeposit_1" type="text" placeholder="Vui lòng nhập số tiền bạn sẽ đặt cọc vào đây.." id="documentDeposit1"/>
                                            <input class="dvGhiChuDeposit documentDeposit_2" type="text" placeholder="Điện thoại, máy tính, xe máy, vật dụng.." id="documentDeposit2"/>
                                            <input class="dvGhiChuDeposit documentDeposit_3" type="text" placeholder="ID, bằng lái, giấy tờ nhà, hộ khẩu, KT3.." id="documentDeposit3"/>
										<!-- </div> -->
									</div>
								</div>

								<%--<hr style="color:#DADADA">	--%>

								<%--<div class="dvBookOtodes">	
									<div class="col-sm-9 col-xs-7 dvOtoDescription">	
										<p>- Tiền cọc bắt buộc đối với KH thuê xe Oto tự lái, chi tiết hiển thị ở đây:</p>
									</div>
									<div class="col-sm-3 col-xs-5">
										<div class="dvProductValue dvProductValue-OtoDes">
											<p>15.000.000 đ</p>
										</div>	
									</div>								
								</div>--%>

							<!-- //session Book dat thue -->
							<hr class="hrProductPackage"/>

							<div class="dvBookSTotalpayment">	
								<div class="productdetail-totalvalue">
									<div class="col-sm-6 col-xs-7">	
										<p style="display:inline;">TỔNG GIÁ TRỊ SẢN PHẨM:</p>
									</div>
									<div class="col-sm-6 col-xs-5">	
										<div class="dvProductValue dvProductValue-Total">
											<p id="total_product_value_p" style="font-size:18px;"> </p>
										</div>	
									</div>								
								</div>
								<div class="productdetail-totalpayment">
									<div class="col-sm-6 col-xs-7">
										<p style="display:inline;">TỔNG GIÁ TRỊ TẠM ỨNG:</p>
									</div>
									<div class="col-sm-6 col-xs-5">	
										<div class="dvPriceTamTinh dvPriceTamTinh-Total">
											<p id="total_product_deposit_p" style="font-size:18px;"> </p>
										</div>	
									</div>								
								</div>
							</div>		


							<div class="product-btns" style="margin-top: 30px;">
								<button class="primary-btn add-to-cart" style="height: 35px;font-size: 14px;"><i class="fa fa-shopping-cart"></i> THÊM VÀO GIỎ</button>
								<button class="primary-btn add-to-cart" style="height: 35px;font-size: 14px;"><i class="fa fa-credit-card"></i> ĐỒNG Ý THUÊ</button>
							</div>
						</div>
					</div>   <!-- /End part on Right -->
                </form>

					<div class="col-md-12">  <!-- /Product full description tab -->
                        <div class="fullDescription-tab-dynamic" role="tabpanel" data-example-id="togglable-tabs">
                                <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                  <li role="presentation" class="active"><a href="#tab_content_fullDescription" role="tab" id="fullDescription-tab"  data-toggle="tab" aria-expanded="true">MÔ TẢ SẢN PHẨM</a>
                                  </li>
                                  <li role="presentation" class=""><a href="#tab_content_specification" role="tab" id="specification-tab" data-toggle="tab" aria-expanded="false">THÔNG SỐ KỸ THUẬT</a>
                                  </li>
                                  <li role="presentation" class=""><a href="#tab_content_userguide" role="tab" id="userGuide-tab" data-toggle="tab" aria-expanded="false">HƯỚNG DẪN SỬ DỤNG</a>
                                  </li>
                                </ul>
                                 <div id="myTabContent" class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade active in" id="tab_content_fullDescription" aria-labelledby="home-tab" style="margin-top:20px"> <!-- Tab Mo Ta San Pham --> 
                                           <p id="productDescriptionDb" runat="server">
									        </p>
                                    </div>  <!-- /Tab Mo Ta San Pham -->
                          
                                    <div role="tabpanel" class="tab-pane fade" id="tab_content_specification" aria-labelledby="profile-tab" style="margin-top:20px">  <!-- Tab Thong So Ky Thuat -->                           
                                        <p id="productSpecificationDb" runat="server">
									    </p>                             
                                    </div>    <!-- /Tab Thong So Ky Thuat -->             
                          
                                    <div role="tabpanel" class="tab-pane fade" id="tab_content_userguide" aria-labelledby="profile-tab" style="margin-top:20px"> <!-- Tab Huong Dan Su Dung -->
                                        <h3 style="margin-bottom: 40px;font-size: 18px;">HƯỚNG DẪN SỬ DỤNG SẢN PHẨM GỒM VIDEO VÀ MÔ TẢ</h3>
									    <div class="col-md-7 col-sm-8 col-xs-12" id="productInstructionDb" runat="server">
										    <%--<p id="productInstructionDb" runat="server">
                                            </p>	--%>									    
									    </div>
									    <div class="col-md-4 col-sm-6 col-xs-12" id="productInstructionDbYoutube" runat="server">
										     <%--<iframe width="380" height="300" src="https://www.youtube.com/embed/tV1A51hLGZk" style="height:255px; width: 365px; margin-left:26px;"></iframe> --%>
									    </div>
                                    </div>     <!-- /Tab Huong Dan Su Dung -->
                                </div>
                           </div>

					</div> <!-- /Product full description tab -->

				</div>
				<!-- /Product Details -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->

	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- section title -->
				<div class="col-md-12">
					<div class="section-title">
						<h2 class="title">SẢN PHẨM LIÊN QUAN</h2>
					</div>
				</div>
				<!-- section title -->
				<div class="col-md-12 col-xs-12 ">
					<div>
						<div class="product-slick-dots-6 custom-dots"></div>
					</div>
					<div id="product-slick-6" class="product-slick"> <!--Start slide product San Pham moi-->
						<!-- Product Single -->							
							<div class="product product-single">
								<div class="product-thumb">
									<button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button>
									<img src="./img/product01.jpg" alt=""/>
								</div>
								<div class="product-body">
									<h2 class="product-name"><a href="#">Sản phẩm số 1</a></h2>
									<h3 class="product-price">35,000/month</h3>
									<h4 class="product-location">Khu vực cửa hàng cho thuê</h4>
									<div class="product-btns">
										<button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
										<button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
									</div>
								</div>
							</div>							
						<!-- /Product Single -->
		
						<!-- Product Single -->							
							<div class="product product-single">
								<div class="product-thumb">
									<div class="product-label">
										<span>New</span>
										<span class="sale">-20%</span>
									</div>
									<button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button>
									<img src="./img/product02.jpg" alt=""/>
								</div>
								<div class="product-body">
										<h2 class="product-name"><a href="#">Sản phẩm số 2</a></h2>
										<h3 class="product-price">14,000/month</h3>
										<h4 class="product-location">Khu vực cửa hàng cho thuê</h4>
										<div class="product-btns">
											<button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
											<button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
										</div>
									</div>
							</div>							
						<!-- /Product Single -->
		
						<!-- Product Single -->							
							<div class="product product-single">
								<div class="product-thumb">
									<div class="product-label">
										<span class="rent">Đã cho thuê</span>
									</div>
									<button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button>
									<img src="./img/product03.jpg" alt=""/>
								</div>
								<div class="product-body">
										<h2 class="product-name"><a href="#">Sản phẩm số 3</a></h2>
										<h3 class="product-price">20,000/month</h3>
										<h4 class="product-location">Khu vực cửa hàng cho thuê</h4>
										<div class="product-btns">
											<button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
											<button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
										</div>
									</div>
							</div>							
						<!-- /Product Single -->
		
						<!-- Product Single -->							
							<div class="product product-single">
								<div class="product-thumb">
									<div class="product-label">
										<span class="available">Đang có sẵn</span>
									</div>
									<button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button>
									<img src="./img/product04.jpg" alt=""/>
								</div>
								<div class="product-body">
									<h2 class="product-name"><a href="#">Sản phẩm số 4</a></h2>
									<h3 class="product-price">33,000/month</h3>
									<h4 class="product-location">Khu vực cửa hàng cho thuê</h4>
									<div class="product-btns">
										<button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
										<button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
									</div>
								</div>
							</div>							
							<!-- /Product Single -->

						<!-- Product Single -->							
							<div class="product product-single">
								<div class="product-thumb">
									<div class="product-label">
										<span class="available">Đang có sẵn</span>
									</div>
									<button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button>
									<img src="./img/product04.jpg" alt=""/>
								</div>
								<div class="product-body">
									<h2 class="product-name"><a href="#">Sản phẩm số 5</a></h2>
									<h3 class="product-price">33,000/month</h3>
									<h4 class="product-location">Khu vực cửa hàng cho thuê</h4>
									<div class="product-btns">
										<button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
										<button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
									</div>
								</div>
							</div>							
						<!-- /Product Single -->
					</div>	<!-- end slide product San pham moi -->
				</div>
				

			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->


     <script type="text/javascript">
         String.prototype.convertfloat = function () {
             return parseFloat(this.replace(/[^\d\.\-]/g, ""));
         }
         
         $(document).ready(function () {
             var dateToday = new Date();
             dateToday.setDate(dateToday.getDate());
             
             $('#orderTimePickup').datetimepicker({
                 //format: "dd MM yyyy - hh:ii P",
                 format: "d/m/yy - hh:ii p",
                 showMeridian: true,
                 autoclose: true,
                 startDate: dateToday,
                 pickerPosition: "bottom-left",
                 daysOfWeekDisabled: "0,6"
             });

             $('#orderTimeReturn').datetimepicker({
                 useCurrent: false, //Important! See issue #1075
                 format: "d/m/yy - hh:ii p",
                 showMeridian: true,
                 autoclose: true,
                 startDate: dateToday,
                 pickerPosition: "bottom-left",
                 daysOfWeekDisabled: "0,6"
             });

             $("#orderTimePickup").on("#orderTimePickup.change", function (e) {
		        $("#orderTimeReturn").data("DateTimePicker").minDate(e.date);
		    });
             $("#orderTimeReturn").on("#orderTimePickup.change", function (e) {
		        $("orderTimePickup").data("DateTimePicker").maxDate(e.date);
             });

             
             
		});
	</script>

    
    <script>  <!--function auto calculate total_value and Total_deposit-->
    
        function getDatetimeinfo() {
            var prPickupTime = $('#orderTimePickup').val();
            var prReturnTime = $('#orderTimeReturn').val();
            alert("Pickup time: " + prPickupTime + "Return time: " + prReturnTime);
        }

        var services_prices = new Array();
        services_prices["serviceVal1"] = document.getElementById("service_cost_1_p").innerHTML;
        services_prices["serviceVal2"] = document.getElementById("service_cost_2_p").innerHTML;
        services_prices["serviceVal3"] = document.getElementById("service_cost_3_p").innerHTML;

        var delivery_prices = new Array();
        delivery_prices["deliveryVal1"] = document.getElementById("delivery_cost_1_p").innerHTML;
        delivery_prices["deliveryVal2"] = document.getElementById("delivery_cost_2_p").innerHTML;
        delivery_prices["deliveryVal3"] = document.getElementById("delivery_cost_3_p").innerHTML;

        function getServicesPrice() {
            var ServicesPrice = 0;
            var ServicesPriceFloat = 0;
            var theForm = document.forms["productcountform"];
            var selectedService = theForm.elements["selectedService"];
            for (var i = 0; i < selectedService.length; i++) {
                if (selectedService[i].checked) {
                    ServicesPrice = services_prices[selectedService[i].value];
                    ServicesPriceFloat = ServicesPrice.convertfloat();
                    break;
                }
            }
            return ServicesPriceFloat;
        }

        function getDeliveryPrice() {
            var DeliveryPrice = 0;
            var DeliveryPriceFloat = 0;
            var theForm = document.forms["productcountform"];
            var selectedDelivery = theForm.elements["selectedDelivery"];
            for (var i = 0; i < selectedDelivery.length; i++) {
                if (selectedDelivery[i].checked) {
                    DeliveryPrice = delivery_prices[selectedDelivery[i].value];
                    DeliveryPriceFloat = DeliveryPrice.convertfloat();
                    break;
                }
            }
            return DeliveryPriceFloat;
        }
     
        function getAccessoryPrice() {
            var accessPrice1 = 0;
            var accessPrice2 = 0;
            var accessPrice3 = 0;
            var accessPriceTotal = 0;
            var theForm = document.forms["productcountform"];
            var accessCheckbox1 = theForm.elements["selectedAccessories1"];
            var accessCheckbox2 = theForm.elements["selectedAccessories2"];
            var accessCheckbox3 = theForm.elements["selectedAccessories3"];

            if (accessCheckbox1.checked == true) {
                accessPrice1 = document.getElementById('access_tempDisplay_p1').innerHTML;
                var accessPrice1Float = accessPrice1.convertfloat();
            } else {
                accessPrice1Float = 0;
            }
            if (accessCheckbox2.checked == true) {
                accessPrice2 = document.getElementById('access_tempDisplay_p2').innerHTML;
                var accessPrice2Float = accessPrice2.convertfloat();
            } else {
                accessPrice2Float = 0;
            }
            if (accessCheckbox3.checked == true) {
                accessPrice3 = document.getElementById('access_tempDisplay_p3').innerHTML;
                var accessPrice3Float = accessPrice3.convertfloat();
            } else {
                accessPrice3Float = 0;
            }
            accessPriceTotal = accessPrice1Float + accessPrice2Float + accessPrice3Float;

            return accessPriceTotal;
        }

        function getAccessoryValue() {
            var accessPrice1 = 0;
            var accessPrice2 = 0;
            var accessPrice3 = 0;
            var accessPriceTotal = 0;
            var theForm = document.forms["productcountform"];
            var accessCheckbox1 = theForm.elements["selectedAccessories1"];
            var accessCheckbox2 = theForm.elements["selectedAccessories2"];
            var accessCheckbox3 = theForm.elements["selectedAccessories3"];
            if (accessCheckbox1.checked == true) {
                accessPrice1 = document.getElementById('access_valueDisplay_p1').innerHTML;
                var accessPrice1Float = accessPrice1.convertfloat();
            } else {
                accessPrice1Float = 0;
            }
            if (accessCheckbox2.checked == true) {
                accessPrice2 = document.getElementById('access_valueDisplay_p2').innerHTML;
                var accessPrice2Float = accessPrice2.convertfloat();
            } else {
                accessPrice2Float = 0;
            }
            if (accessCheckbox3.checked == true) {
                accessPrice3 = document.getElementById('access_valueDisplay_p3').innerHTML;
                var accessPrice3Float = accessPrice3.convertfloat();
            } else {
                accessPrice3Float = 0;
            }
            accessPriceTotal = accessPrice1Float + accessPrice2Float + accessPrice3Float;
            return accessPriceTotal;
        }

        //function getProductTempPrices() {
        //    var PrTempPrices = 0;
        //    var theForm = document.forms["productcountform"];
        //    var radBtnBlock = theForm.elements["radBtnBlock"];
        //    var radBtnDay = theForm.elements["radBtnDay"];

        //    if (radBtnBlock.checked) {
        //        PrTempPrices = document.getElementById('product_temp_p1').innerHTML;
        //        //var PrTempPricesFloat = PrTempPrices.convertfloat();
        //    } else if (radBtnDay.checked) {
        //        PrTempPrices = document.getElementById('product_temp_p1').innerHTML;
        //    }             
        //    return PrTempPrices;
        //}

        function calculateTotal() {
            if (document.getElementById('GiaChoChueTheoBlock').checked) {
                var xxx = document.getElementById("MainContent_price_block_p").innerHTML;
                var zzz = document.getElementById("MainContent_product_value_p").innerHTML;
                document.getElementById("product_temp_p1").innerHTML = xxx;
                document.getElementById("product_value_p1").innerHTML = zzz;
            }
            else if (document.getElementById('GiaChoChueTheoNgay').checked) {
                var yyy = document.getElementById("MainContent_price_day_p").innerHTML;
                var zzz = document.getElementById("MainContent_product_value_p").innerHTML;
                document.getElementById("product_temp_p1").innerHTML = yyy
                document.getElementById("product_value_p1").innerHTML = zzz;
            }

            var prRentalPrice = document.getElementById("product_temp_p1").innerHTML;
            var prRentalPriceFloat = prRentalPrice.convertfloat();
            var prValuePrice = document.getElementById("product_value_p1").innerHTML;
            var prValuePriceFloat = prValuePrice.convertfloat();

            var totalProductDeposit = getServicesPrice() + getDeliveryPrice() + getAccessoryPrice() + prRentalPriceFloat;
            var totalProductValue = getAccessoryValue() + prValuePriceFloat;
            document.getElementById('total_product_deposit_p').innerHTML = accounting.formatNumber(totalProductDeposit) + " đ";
            document.getElementById('total_product_value_p').innerHTML = accounting.formatNumber(totalProductValue) + " đ";
        }
    </script>  <!--/function auto calculate total_value and Total_deposit-->


    <script>       
        //function callMeOnChange1() {
        //    if (document.getElementById('GiaChoChueTheoBlock').checked)
        //    {
        //        var xxx = document.getElementById("MainContent_price_block_p").innerHTML;
        //        var zzz = document.getElementById("MainContent_product_value_p").innerHTML;
        //        document.getElementById("product_temp_p1").innerHTML = xxx;
        //        document.getElementById("product_value_p1").innerHTML = zzz;
        //    }
        //    else if (document.getElementById('GiaChoChueTheoNgay').checked)
        //    {
        //        var yyy = document.getElementById("MainContent_price_day_p").innerHTML;
        //        var zzz = document.getElementById("MainContent_product_value_p").innerHTML;
        //        document.getElementById("product_temp_p1").innerHTML = yyy
        //        document.getElementById("product_value_p1").innerHTML = zzz;
        //    }
        //}

        //auto update gia tam tinh va gia tri SP section MAIN PRODUCT
        function callMeOnChangeProductQty() {            
            var x = document.getElementById("product_qty").value;
                if (document.getElementById('GiaChoChueTheoBlock').checked) {
                    var temp = document.getElementById("MainContent_price_block_p").innerHTML;
                }
                else if (document.getElementById('GiaChoChueTheoNgay').checked) {
                    var temp = document.getElementById("MainContent_price_day_p").innerHTML;
                }

            var prdTempFloat = temp.convertfloat();
            var prdVal = document.getElementById("MainContent_product_value_p").innerText;
            var prdValFloat = prdVal.convertfloat();
            var y = prdTempFloat * x;
            var z = prdValFloat * x;
            document.getElementById("product_temp_p1").innerHTML = accounting.formatNumber(y);
            document.getElementById("product_value_p1").innerHTML = accounting.formatNumber(z);
        }

        //auto update gia tam tinh va gia tri SP section CHON THEM PHU KIEN
        function callMeOnChangeAccessory() {
            var x1 = document.getElementById("access_qty_1").value;
            var temp1 = document.getElementById("access_temp_p1").innerHTML;
            var temp1Float = temp1.convertfloat();
            var value1 = document.getElementById("access_value_p1").innerHTML;
            var value1Float = value1.convertfloat();
            var y1 = temp1Float * x1;
            var z1 = value1Float * x1;
            document.getElementById("access_tempDisplay_p1").innerHTML = accounting.formatNumber(y1);
            document.getElementById("access_valueDisplay_p1").innerHTML = accounting.formatNumber(z1);

            var x2 = document.getElementById("access_qty_2").value;
            var temp2 = document.getElementById("access_temp_p2").innerHTML;
            var temp2Float = temp2.convertfloat();
            var value2 = document.getElementById("access_value_p2").innerHTML;
            var value2Float = value2.convertfloat();
            var y2 = temp2Float * x2;
            var z2 = value2Float * x2;
            document.getElementById("access_tempDisplay_p2").innerHTML = accounting.formatNumber(y2);
            document.getElementById("access_valueDisplay_p2").innerHTML = accounting.formatNumber(z2);

            var x3 = document.getElementById("access_qty_3").value;
            var temp3 = document.getElementById("access_temp_p3").innerHTML;
            var temp3Float = temp3.convertfloat();
            var value3 = document.getElementById("access_value_p3").innerHTML;
            var value3Float = value3.convertfloat();
            var y3 = temp3Float * x3;
            var z3 = value3Float * x3;
            document.getElementById("access_tempDisplay_p3").innerHTML = accounting.formatNumber(y3);
            document.getElementById("access_valueDisplay_p3").innerHTML = accounting.formatNumber(z3);

        }

        function callMeOnChangeService() {
            if (document.getElementById('ServiceSelect-1').checked) {                
                $('.dvBookServices .dvServiceDescription1').css('display', 'block')
                $('.dvBookServices .dvServiceDescription2').css('display', 'none')
                $('.dvBookServices .dvServiceDescription3').css('display', 'none')
                $('.dvBookServices .service_cost_1').css('display', 'block')
                $('.dvBookServices .service_cost_2').css('display', 'none')
                $('.dvBookServices .service_cost_3').css('display', 'none')
            }
            else if (document.getElementById('ServiceSelect-2').checked) {
                $('.dvBookServices .dvServiceDescription1').css('display', 'none')
                $('.dvBookServices .dvServiceDescription2').css('display', 'block')
                $('.dvBookServices .dvServiceDescription3').css('display', 'none')
                $('.dvBookServices .service_cost_1').css('display', 'none')
                $('.dvBookServices .service_cost_2').css('display', 'block')
                $('.dvBookServices .service_cost_3').css('display', 'none')
            }
            else if (document.getElementById('ServiceSelect-3').checked) {
                $('.dvBookServices .dvServiceDescription1').css('display', 'none')
                $('.dvBookServices .dvServiceDescription2').css('display', 'none')
                $('.dvBookServices .dvServiceDescription3').css('display', 'block')
                $('.dvBookServices .service_cost_1').css('display', 'none')
                $('.dvBookServices .service_cost_2').css('display', 'none')
                $('.dvBookServices .service_cost_3').css('display', 'block')
            }
        }

        function callMeOnChangeDelivery() {
            if (document.getElementById('DeliverySelect-1').checked) {
                $('.dvBookDelivery .dvDeliveryDescription1').css('display', 'block')
                $('.dvBookDelivery .dvDeliveryDescription2').css('display', 'none')
                $('.dvBookDelivery .dvDeliveryDescription3').css('display', 'none')
                $('.dvBookDelivery .delivery_cost_1').css('display', 'block')
                $('.dvBookDelivery .delivery_cost_2').css('display', 'none')
                $('.dvBookDelivery .delivery_cost_3').css('display', 'none')
            }
            else if (document.getElementById('DeliverySelect-2').checked) {
                $('.dvBookDelivery .dvDeliveryDescription1').css('display', 'none')
                $('.dvBookDelivery .dvDeliveryDescription2').css('display', 'block')
                $('.dvBookDelivery .dvDeliveryDescription3').css('display', 'none')
                $('.dvBookDelivery .delivery_cost_1').css('display', 'none')
                $('.dvBookDelivery .delivery_cost_2').css('display', 'block')
                $('.dvBookDelivery .delivery_cost_3').css('display', 'none')
            }
            else if (document.getElementById('DeliverySelect-3').checked) {
                $('.dvBookDelivery .dvDeliveryDescription1').css('display', 'none')
                $('.dvBookDelivery .dvDeliveryDescription2').css('display', 'none')
                $('.dvBookDelivery .dvDeliveryDescription3').css('display', 'block')
                $('.dvBookDelivery .delivery_cost_1').css('display', 'none')
                $('.dvBookDelivery .delivery_cost_2').css('display', 'none')
                $('.dvBookDelivery .delivery_cost_3').css('display', 'block')
            }
        }

        function callMeOnChangeDeposit() {
            var x = document.getElementById("DepositSelectDropdown").value;
            if (x == "cashDeposit") {
                $('.dvBookDeposit .documentDeposit_1').css('display', 'block');
                $('.dvBookDeposit .documentDeposit_2').css('display', 'none');
                $('.dvBookDeposit .documentDeposit_3').css('display', 'none');
            }
            if (x == "propertyDeposit") {
                $('.dvBookDeposit .documentDeposit_2').css('display', 'block');
                $('.dvBookDeposit .documentDeposit_1').css('display', 'none');
                $('.dvBookDeposit .documentDeposit_3').css('display', 'none');
            }
            if (x == "documentDeposit") {
                $('.dvBookDeposit .documentDeposit_3').css('display', 'block');
                $('.dvBookDeposit .documentDeposit_2').css('display', 'none');
                $('.dvBookDeposit .documentDeposit_1').css('display', 'none');
            }
        }
    </script>

    <script type="text/javascript">
	    accounting.formatMoney(5318008);
    </script>
   
</asp:Content>

