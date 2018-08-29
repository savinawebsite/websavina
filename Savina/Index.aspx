<%@ Page Title="" Language="C#" MasterPageFile="~/FrontSite.Master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">

    <style>
        .category-nav.show-on-click .category-list {
            opacity: 1;
            visibility: visible;
            transform: translate(0px, 0px);
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

	<!-- HOME -->
	<div id="home" style="background: #E9E9E9;">
		<!-- container -->
		<div class="container">
			<!-- home wrap -->
			<div class="home-wrap">
				    <!-- Main Banner Slider - home slick-->
                     <div id="home_mainBannerSlide" runat="server"> 

                    </div>
				    <!-- /Main Banner Slider - home slick -->

				<!-- 3 banner GROUP 1 -->
				<div id="home_3banner_group1" runat="server">
				</div>
					<!-- /3 banner  GROUP 1 -->
			</div>
			<!-- /home wrap -->
			
		</div>
		<!-- /container -->
	</div>
	<!-- /HOME -->

	<!-- 3 banner GROUP 2  -->
	<div id="home_3banner_group2" runat="server" class ="section" style="background: #E9E9E9;">

	</div>
	<!-- 3 banner GROUP 2  -->

	<!-- all product show in body -->
	<div class="container">		
		<div class="col-md-12 col-sm-12 col-xs-12"	>
			<!--slide ALl product on left -->
			<div class="col-md-10 col-sm-12 col-xs-10 size-homeProductSlide">

				<div class="section SanPhamMoi">    <!-- section SAN PHAM MOI -->								
					<div class="col-md-12 section-title">  <!--Start title + category panel  -->
						<div class="col-md-3 col-sm-3 col-xs-12">
							<div class="dvHomeBGTitle">
								<h2 class="titleHome">SẢN PHẨM MỚI NHẤT</h2>
							</div>
						</div>
						<div class="col-md-9 col-sm-9 col-xs-9 slidepanel_category">
								<div>
									<span class="control control_prev"><i class="fa fa-chevron-left quickSlideArrow Left"></i></span>
									<span class="control control_next"><i class="fa fa-chevron-right quickSlideArrow Right"></i></span>
								</div>	
                                <div id="dbPrGroupSlideCate1" runat="server">
                                    <!--Load slide main cate from code behind -->
                                </div>	
						</div>
					</div>  <!--End title + category panel  -->
						
					<div class="col-md-12 col-xs-12 ">
						<div>
							<div class="product-slick-dots-1 custom-dots"></div>
						</div>
                        <div id="dbPrGroupRow1" runat="server">
                                <!-- Load Product Single group 1 from code behind -->	
						</div>	
					</div>
				</div> 	 <!-- end End secsion San Pham Moi -->	

				<div class="section SPNhieuNguoiTim">    <!-- section NHIEU NGUOI TIM -->							
					<div class="col-md-12 section-title">  <!--Start title + category panel  -->
						<div class="col-md-3 col-sm-3 col-xs-12">
							<div class="dvHomeBGTitle SPTimNhieu">
								<h2 class="titleHome">NHIỀU NGƯỜI TÌM NHẤT</h2>
							</div>
						</div>
						<div class="col-md-9 col-sm-9 col-xs-9 slidepanel_category">
								<div>
									<span class="control control_prev"><i class="fa fa-chevron-left quickSlideArrow Left"></i></span>
									<span class="control control_next"><i class="fa fa-chevron-right quickSlideArrow Right"></i></span>
								</div>
							    <div id="dbPrGroupSlideCate2" runat="server">
                                    <!--Load slide main cate from code behind -->
                                </div>				
						</div>
					</div>  <!--End title + category panel  -->

					<div class="col-md-12 col-xs-12 ">
						<div>
							<div class="product-slick-dots-2 custom-dots"></div>
						</div>
                        <div id="dbPrGroupRow2" runat="server">
                                <!-- Load Product Single group 2 from code behind -->	
						</div>	
					</div>
				</div> 	 <!-- end End secsion Nhieu Nguoi Tim -->	

				<div class="section SPDocLa">    <!-- section SP DOC, LA -->							
					<div class="col-md-12 section-title">  <!--Start title + category panel  -->
						<div class="col-md-3 col-sm-3 col-xs-12">
							<div class="dvHomeBGTitle SPDocLa">
								<h2 class="titleHome">SẢN PHẨM ĐỘC, LẠ</h2>
							</div>
						</div>
						<div class="col-md-9 col-sm-9 col-xs-9 slidepanel_category">
							<div>
								<span class="control control_prev"><i class="fa fa-chevron-left quickSlideArrow Left"></i></span>
								<span class="control control_next"><i class="fa fa-chevron-right quickSlideArrow Right"></i></span>
							</div>
							<div id="dbPrGroupSlideCate3" runat="server">
                                <!--Load slide main cate from code behind -->
                            </div>				
						</div>
					</div>  <!--End title + category panel  -->

					<div class="col-md-12 col-xs-12 ">
							<div>
								<div class="product-slick-dots-3 custom-dots"></div>
							</div>  
							<div id="dbPrGroupRow3" runat="server">
                                <!-- Load Product Single group 3 from code behind -->	
						    </div>	
						</div>
				</div> 	  <!-- end End secsion SP DOC, LA -->	


				<div class="section SPReNhat">    <!-- section SP GIA THUE RE NHAT -->							
					<div class="col-md-12 section-title">  <!--Start title + category panel  -->
						<div class="col-md-3 col-sm-3 col-xs-12">
							<div class="dvHomeBGTitle SPReNhat">
								<h2 class="titleHome">CÓ GIÁ THUÊ RẺ NHẤT</h2>
							</div>
						</div>
						<div class="col-md-9 col-sm-9 col-xs-9 slidepanel_category">
								<div>
									<span class="control control_prev"><i class="fa fa-chevron-left quickSlideArrow Left"></i></span>
									<span class="control control_next"><i class="fa fa-chevron-right quickSlideArrow Right"></i></span>
								</div>
							<div id="dbPrGroupSlideCate4" runat="server">
                                <!--Load slide main cate from code behind -->
                            </div>				
						</div>
					</div>  <!--End title + category panel  -->

					<div class="col-md-12 col-xs-12 ">
							<div>
								<div class="product-slick-dots-4 custom-dots"></div>
							</div>
							<div id="dbPrGroupRow4" runat="server">
                                <!-- Load Product Single group 4 from code behind -->	
						    </div>	
						</div>
				</div> 	  <!-- end End secsion SP GIA THUE RE NHAT -->

				<div class="section SPGanBan">    <!-- section SP GAN BAN-->								
					<div class="col-md-12 section-title">  <!--Start title + category panel  -->
						<div class="col-md-3 col-sm-3 col-xs-12">
							<div class="dvHomeBGTitle SPGanBan">
								<h2 class="titleHome">SẢN PHẨM GẦN BẠN</h2>
							</div>
						</div>
						<div class="col-md-9 col-sm-9 col-xs-9 slidepanel_category">
								<div>
									<span class="control control_prev"><i class="fa fa-chevron-left quickSlideArrow Left"></i></span>
									<span class="control control_next"><i class="fa fa-chevron-right quickSlideArrow Right"></i></span>
								</div>
								<div id="dbPrGroupSlideCate5" runat="server">
                                    <!--Load slide main cate from code behind -->
                                </div>					
						</div>
					</div>  <!--End title + category panel  -->

					<div class="col-md-12 col-xs-12 ">
							<div>
								<div class="product-slick-dots-5 custom-dots"></div>
							</div>
							<div id="dbPrGroupRow5" runat="server">
                                <!-- Load Product Single group 5 from code behind -->	
						    </div>	
					</div>
				</div> 	  <!-- end End secsion SP GAN BAN -->
						

			</div>
		<!--/end slide ALl product on left -->	

		<!-- 5 banner GROUP 3 - Advertisement panel on right -->
			<div id="home_5banner_group3" runat="server" class="col-md-2 col-sm-2 col-xs-2">
					<!-- load 5 banner from code behind -->
			</div>
		<!-- /5 banner GROUP 3 - Advertisement panel on right -->

		</div>	 <!-- /end all product show in body -->
	</div> <!-- container -->
	

	<!-- 3 banner GROUP 4 -->
	<div class="section section-grey" style="background: #E9E9E9;">
		<!-- container -->
		<div class="container" style="background: #fff;">
			<!-- row -->
			<div class="row" id="home_3banner_group4" runat="server">
                <!-- load 4 banner from code behind -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /3 banner GROUP 4  -->


	<!-- section RAO VAT, CHO TANG -->
	<div class="section" style="background: #E9E9E9;">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row" style="background: #fff;">
				<!-- section title -->
				<div class="col-md-12 section-title">
					<div class="col-md-3 col-sm-3 col-xs-12">
						<div class="dvHomeBGTitle SPRaoVat">
							<h2 class="titleHome-adv">RAO VẶT MIỄN PHÍ</h2>
						</div>
					</div>
					<div class="col-md-9 col-sm-9 col-xs-9 slidepanel_category">
							<div>
								<span class="control control_prev"><i class="fa fa-chevron-left quickSlideArrow Left"></i></span>
								<span class="control control_next"><i class="fa fa-chevron-right quickSlideArrow Right"></i></span>
							</div>
							<div id="dbPrGroupSlideCate6" runat="server">
                                <!--Load slide main cate from code behind -->
                            </div>				
					</div>
				</div>
				<!-- section title -->

				<div class="col-md-12 col-xs-12 ">
						<div>
							<div class="product-slick-dots-6 custom-dots"></div>
						</div>
						<div id="dbPrGroupRow6" runat="server">
                            <!-- Load Product Single group 6 from code behind -->	
						</div>	
				</div>
			</div>
			<!-- /row -->

			<!-- row -->
			<div class="row" style="background: #fff;">
				<!-- section title -->
				<div class="col-md-12 section-title">
					<div class="col-md-3 col-sm-3 col-xs-12">
						<div class="dvHomeBGTitle SPChoTang">
							<h2 class="titleHome-adv">SẢN PHẨM CHO TẶNG</h2>
						</div>
					</div>
					<div class="col-md-9 col-sm-9 col-xs-9 slidepanel_category">
							<div>
								<span class="control control_prev"><i class="fa fa-chevron-left quickSlideArrow Left"></i></span>
								<span class="control control_next"><i class="fa fa-chevron-right quickSlideArrow Right"></i></span>
							</div>
							<div id="dbPrGroupSlideCate7" runat="server">
                                <!--Load slide main cate from code behind -->
                            </div>				
					</div>
				</div>
				<!-- section title -->

				<div class="col-md-12 col-xs-12 ">
						<div>
							<div class="product-slick-dots-7 custom-dots"></div>
						</div>
						<div id="dbPrGroupRow7" runat="server">
                            <!-- Load Product Single group 7 from code behind -->	
						</div>	
				</div>
			</div>
			<!-- /row -->          
		</div>
		<!-- /container -->
       
	</div>
	<!-- /section -->
    <script  type="text/javascript">
        $('#btnLoginForm').click(function () {
                     $('#login-modal').modal();
                  $('.updateprofile').hide();
                  $('.CustInfoUpdate').hide();
                  $('.passconfirm').hide();
                  $('.forgotPwd1').hide();
                  $('.email').show();
                  $('.email').val('');
                  $('.pass').val('');
                  $('.firstname').val('');
                  $('.lastname').val('');
                  $('.passconfirm').val('');
                  $('.pass').attr("placeholder", "Password");
                  $('.pass').show();
                  $('.forgotPwd').show();
                  $('#btnLogin').attr('value', 'Sign In');                              
              });
    </script>

</asp:Content>

