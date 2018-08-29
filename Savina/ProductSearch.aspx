<%@ Page Title="" Language="C#" MasterPageFile="~/FrontSite.Master" AutoEventWireup="true" CodeFile="ProductSearch.aspx.cs" Inherits="ProductSearch" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
	<!-- BREADCRUMB -->
	<div id="breadcrumb">
		<div class="container">
			<ul class="breadcrumb">
				<li><a href="#">Home</a></li>
				<li class="active">Products Search</li>
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
				<!-- ASIDE -->
				<div id="aside" class="col-md-3">
					<!-- aside widget -->
					<div class="aside">
						<h3 class="aside-title">ĐANG TÌM THEO:</h3>
						<ul class="filter-list">
							<li><span class="text-uppercase dvSearchByInfo">- Category:</span></li>
							<li><a href="#">Xe máy</a></li>
							<li><a href="#">Xe Ôto</a></li>
						</ul>

						<ul class="filter-list">
							<li><span class="text-uppercase dvSearchByInfo">- Khu vực:</span></li>
							<li><a href="#">TP.Hồ Chí Minh</a></li>
						</ul>

						<button class="primary-btn" style="font-size: 11px;">Xóa hết</button>
					</div>
					<!-- /aside widget -->

					<!-- aside widget -->
					<div class="aside">
						<h3 class="aside-title">LỌC THEO GIÁ</h3>
						<div id="price-slider"></div>
					</div>
					<!-- aside widget -->

					<!-- aside widget -->
					<div class="aside">
						<h3 class="aside-title">LỌC THEO KHU VỰC:</h3>
						<select class="input listFilterCategory">
								<option value="0">Chọn Tỉnh/Thành Phố</option>
								<option value="1">Hà Nội</option>
								<option value="2">Hồ Chí Minh</option>
								<option value="3">An Giang</option>
								<option value="4">Bà Rịa - Vũng Tàu </option>
								<option value="5">Bình Dương </option>
								<option value="6">Bình Phước</option>
								<option value="7">Bình Thuận </option>
								<option value="8">Cần Thơ </option>
							</select>
							<select class="input listFilterCategory">
								<option value="0">Chọn Quận/Huyện</option>
								<option value="1">Huyện Bình Chánh</option>
								<option value="2">Huyện Cần Giờ</option>
								<option value="3">Quận 1</option>
								<option value="4">Quận 2</option>
								<option value="5">Quận 3</option>
								<option value="6">Quận Bình Thạnh</option>
							</select>
							<select class="input listFilterCategory">
								<option value="0">Chọn Phường/Xã</option>
								<option value="1">Phường An Khánh</option>
								<option value="2">Phường An Phú</option>
								<option value="3">Phường Cát Lái</option>
								<option value="4">Phường Thảo Điền</option>
								<option value="5">Phường Thủ Thiêm</option>
							</select>
					</div>
					<!-- /aside widget -->

					<!-- aside widget -->
					<div class="aside">
						<h3 class="aside-title">LỌC THEO CATEGORY</h3>
							<select class="input listFilterCategory">
								<option value="0">Chọn Category chính</option>
								<option value="1">Công cụ, dụng cụ</option>
								<option value="2">Xe cộ</option>
								<option value="3">Máy ảnh, Máy quay</option>
								<option value="4">Mẹ và Bé </option>
								<option value="5">Công nghiệp, Xây dựng </option>
								<option value="6">Máy tính, Linh kiện </option>
								<option value="7">Thời trang, Phụ kiện </option>
								<option value="8">Nội thất, Ngoại thất </option>
							</select>
							<select class="input listFilterCategory">
								<option value="0">Chọn Sub-Category-1</option>
								<option value="1">Sửa xe</option>
								<option value="2">Sửa nhà</option>
								<option value="3">Làm vườn</option>
								<option value="4">Tự lái</option>
								<option value="5">Xe Oto bán</option>
								<option value="6">Có người lái</option>
								<option value="7">Xe máy bán</option>
							</select>
							<select class="input listFilterCategory">
								<option value="0">Chọn Sub-Category-2</option>
								<option value="1">Xe máy</option>
								<option value="2">Xe ôto</option>
								<option value="3">Sửa điện</option>
								<option value="4">Sửa nước </option>
								<option value="5">Trồng cây </option>
								<option value="6">Hồ bơi </option>
							</select>
					</div>
					<!-- /aside widget -->

					<!-- aside widget -->
					<div class="aside">
						<h3 class="aside-title">LỌC THEO TÌNH TRẠNG</h3>
						<div class="input-checkbox">
							<input type="checkbox" id="register">
							<label class="listFilterStatus" for="register">Sản phẩm mới</label>
						</div>
						<div class="input-checkbox">
							<input type="checkbox" id="register">
							<label class="listFilterStatus" for="register">Đang có sẵn</label>
						</div>
						<div class="input-checkbox">
							<input type="checkbox" id="register">
							<label class="listFilterStatus" for="register">Đang có khuyến mãi</label>
						</div>
						<div class="input-checkbox">
							<input type="checkbox" id="register">
							<label class="listFilterStatus" for="register">Đã cho thuê</label>
						</div>
					</div>
					<!-- /aside widget -->
				</div>
				<!-- /ASIDE -->

				<!-- MAIN -->
				<div id="main" class="col-md-9">
					<!-- store top filter -->
					<div class="store-filter clearfix">
						<div class="pull-left">
							<%--<div class="row-filter">
								<a href="#"><i class="fa fa-th-large" data-tooltip-opaque="false" data-visual-id="3" title="Hiển thị theo dạng lưới"></i></a> 
								<a href="#" class="active"><i class="fa fa-bars" data-tooltip-opaque="false" data-visual-id="3" title="Hiển thị theo dạng danh sách"></i></a>
							</div>--%>
							<div class="sort-filter">
								<span class="text-uppercase">Hiển thị theo:</span>
								<select class="input">
										<option value="0">Giá từ thấp tới cao</option>
										<option value="1">Giá từ cao tới thấp</option>
										<option value="2">Sản phẩm mới</option>
										<option value="3">Sản phẩm hot</option>
									</select>
								<a href="#" class="main-btn icon-btn"><i class="fa fa-arrow-down"></i></a>
							</div>
						</div>
						<div class="pull-right">
							<div class="page-filter">
								<span class="text-uppercase">Hiển thị số sản phẩm:</span>
								<select class="input">
										<option value="0">10</option>
										<option value="1">20</option>
										<option value="2">30</option>
									</select>
							</div>
							<ul class="store-pages">
								<li><span class="text-uppercase">Trang:</span></li>
								<li class="active">1</li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#"><i class="fa fa-caret-right"></i></a></li>
							</ul>
						</div>
					</div>
					<!-- /store top filter -->

					<!-- STORE -->
					<div id="store">
                        <div id="dvLoadProductList" runat="server">

                        </div>
						<!-- row -->
						<div class="row">

							<hr />
						</div>
						<!-- /row -->
					</div>
					<!-- /STORE -->

					<!-- store bottom filter -->
					<div class="store-filter clearfix">
						<div class="pull-left">
							<%--<div class="row-filter">
								<a href="#"><i class="fa fa-th-large"></i></a>
								<a href="#" class="active"><i class="fa fa-bars"></i></a>
							</div>--%>
							<div class="sort-filter">
									<span class="text-uppercase">Hiển thị theo:</span>
									<select class="input">
											<option value="0">Giá từ thấp tới cao</option>
											<option value="1">Giá từ cao tới thấp</option>
											<option value="2">Sản phẩm mới</option>
											<option value="3">Sản phẩm hot</option>
										</select>
								<a href="#" class="main-btn icon-btn"><i class="fa fa-arrow-down"></i></a>
							</div>
						</div>
						<div class="pull-right">
							<div class="page-filter">
								<span class="text-uppercase">HIỂN THỊ SỐ SẢN PHẨM:</span>
								<select class="input">
										<option value="0">10</option>
										<option value="1">20</option>
										<option value="2">30</option>
									</select>
							</div>
							<ul class="store-pages">
								<li><span class="text-uppercase">Trang:</span></li>
								<li class="active">1</li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#"><i class="fa fa-caret-right"></i></a></li>
							</ul>
						</div>
					</div>
					<!-- /store bottom filter -->
				</div>
				<!-- /MAIN -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->
</asp:Content>

