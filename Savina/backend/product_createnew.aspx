<%@ Page Title="" Language="C#" MasterPageFile="~/backend/adTemplate.master" AutoEventWireup="true" CodeFile="product_createnew.aspx.cs" Inherits="backend_product_createnew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  

  <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>  
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>--%>

    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>--%>
 <%-- <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>--%>
     <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>--%>
   <%-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-3-typeahead/4.0.2/bootstrap3-typeahead.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>  --%>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" />        
    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css"/>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
    <script src="../backend/js/jquery.selectlistactions.js"></script>    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
    <%--<link href="../backend/css/selectlistactions.css" rel="stylesheet" type="text/css" />--%>
 
    <style>
        select.bs-select-hidden, select.selectpicker {
            display:block !important;
        }
    </style>

    <script type="text/javascript">
        tinymce.init({
            //selector: "textarea",
            mode: "specific_textareas", 
                editor_selector: "content_Preditor",
                //editor_selector: "content_PrSpec",

            fontsize_formats: "8px 9px 10px 11px 12px 13px 14px 15px 16px 17px 18px 19px 20px 21px 22px 23px 24px 26px 27px 28px 29px 30px 31px 32px 33px 34px 35px 36px",
            theme: "modern",
            plugins: 'image code',
            plugins: [
                "advlist autolink lists link image charmap print preview hr anchor pagebreak",
                "searchreplace wordcount visualblocks visualchars code fullscreen",
                "insertdatetime media nonbreaking save table contextmenu directionality",
                "emoticons template paste textcolor colorpicker textpattern imagetools"
            ],
            font_formats: "Roboto-Regular=Roboto-Regular;" +
           "Roboto-Medium=Roboto-Medium;" +
           "Roboto-Bold=Roboto-Bold;" +
           "Roboto-Regular=Roboto-Regular;" +
           "Wingdings=wingdings,zapf dingbats",
            toolbar1: "insertfile undo redo | styleselect formatselect fontselect fontsizeselect | bold italic | alignleft aligncenter alignright alignjustify",
            toolbar2: "bullist numlist outdent indent | link image | print preview media | forecolor backcolor emoticons",
            image_advtab: true,
            templates: [
                { title: 'Test template 1', content: 'Test 1' },
                { title: 'Test template 2', content: 'Test 2' }
            ],
            image_title: true,
            // enable automatic uploads of images represented by blob or data URIs
            automatic_uploads: true,
            file_picker_types: 'image',
            file_picker_callback: function (cb, value, meta) {
                var input = document.createElement('input');
                input.setAttribute('type', 'file');
                input.setAttribute('accept', 'image/*');

                input.onchange = function () {
                    var file = this.files[0];

                    var reader = new FileReader();
                    reader.onload = function () {
                        var id = 'blobid' + (new Date()).getTime();
                        var blobCache = tinymce.activeEditor.editorUpload.blobCache;
                        var base64 = reader.result.split(',')[1];
                        var blobInfo = blobCache.create(id, file, base64);
                        blobCache.add(blobInfo);

                        cb(blobInfo.blobUri(), { title: file.name });
                    };
                    reader.readAsDataURL(file);
                };

                input.click();
            }

        });

        function SubCate_getData($id_mCate) {
            var xmlhttp;
            if (window.XMLHttpRequest) {
                xmlhttp = new XMLHttpRequest();
            }
            else {
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
                    {
                    if (xmlhttp.responseText != "") {
                        $(".dv_subCate1Select").html(xmlhttp.responseText);
                        $('.subarea').change(function (e) {
                            var id_subarea = $('.subarea').val();
                            $('.ip_subarea').val(id_subarea);
                        });
                    }
            }
        }
            xmlhttp.open("GET", "../backend/adAjax.aspx?action=SubCate_getData&id_mCate=" + $id_mCate, true);
        xmlhttp.send();
        }        

    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Create modal popup -->
    <div class="modal fade" id="confirm-dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">           
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" style="text-align:center;">SAVINA</h4>
                </div>            
                <div class="modal-body">
                    <p>thông tin modal body</p>
                </div>
            </div>
        </div>
    </div>
    <!-- /Create modal popup -->

<!-- page content -->
    <div class="right_col" role="main">
        <form id="form2" class="form-horizontal form-label-left" runat="server">
        <div class="">
              <div class="page-title">
                <div class="title_left">
                  <h3>TẠO SẢN PHẨM MỚI</h3>
                </div>
                <div class="title_right">
                  <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                    <div class="input-group">
                      <input type="text" class="form-control" placeholder="Search for..."/>
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
                    <div class="x_panel">  <!-- add thông tin chung -->
                    <div class="x_content">
                        <br />
                        <%--<form id="demo-form2" class="form-horizontal form-label-left" novalidate="novalidate"/>--%>
                          <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label col-md-4 col-sm-4 col-xs-12">Mã sản phẩm</label>
                                  <div class="col-md-8 col-sm-8 col-xs-12">
                                    <input type="text" id="productCode" runat="server" name="product-code" required="required" class="form-control col-md-7 col-xs-12"/>
                                  </div>                                  
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-4 col-sm-4 col-xs-12">Tên sản phẩm</label>
                                  <div class="col-md-8 col-sm-8 col-xs-12">
                                    <input type="text" id="productName" runat="server" name="product-name" required="required" class="form-control col-md-7 col-xs-12"/>
                                  </div>                            
                                </div>
                                <div class="form-group">
                                  <label class="control-label col-md-4 col-sm-4 col-xs-12">Giá thuê theo block</label>
                                  <div class="col-md-8 col-sm-8 col-xs-12">
                                    <input type="text" id="priceByBlock" runat="server" name="priceByBlock" required="required" class="form-control col-md-7 col-xs-12 numberFormat"/>
                                  </div>
                                </div>
                                 <div class="form-group">
                                  <label class="control-label col-md-4 col-sm-4 col-xs-12">Giá thuê theo ngày</label>
                                  <div class="col-md-8 col-sm-8 col-xs-12">
                                    <input type="text" id="priceByDay" runat="server" name="priceByDay" required="required" class="form-control col-md-7 col-xs-12 numberFormat"/>
                                  </div>
                                </div>
                                <div class="form-group">
                                      <label class="control-label col-md-4 col-sm-4 col-xs-12">Thuộc Main Category</label>
                                      <div class="col-md-8 col-sm-8 col-xs-12">
                                            <asp:DropDownList ID="data_MainCate" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDLMainCate_SelectedIndexChanged" Cssclass="form-control"></asp:DropDownList>
                                      </div>
                                </div>   
                                <div class="form-group">
                                      <label class="control-label col-md-4 col-sm-4 col-xs-12">Thuộc Sub Category 1</label>
                                      <div class="col-md-8 col-sm-8 col-xs-12">
                                        <asp:DropDownList ID="data_SubCate1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDLSubCate1_SelectedIndexChanged" Cssclass="form-control"></asp:DropDownList>
                                      </div>
                                </div>
                                <div class="form-group">
                                      <label class="control-label col-md-4 col-sm-4 col-xs-12">Thuộc Sub Category 2</label>
                                      <div class="col-md-8 col-sm-8 col-xs-12">
                                            <asp:DropDownList ID="data_SubCate2" runat="server" Cssclass="form-control"></asp:DropDownList>
                                      </div>
                                </div>                                                        
                            </div>

                          <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">Mô tả nhanh</label>
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                  <textarea class="resizable_textarea form-control" id="productDescription" runat="server" placeholder="độ dài trường nhập liệu tự động mở rộng..."></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">Còn mới %</label>
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                  <input type="number"  min="1" max="100" maxlength="3" onchange="numberlimiter(this);" id="productStatus" runat="server" name="last-name" required="required" class="form-control col-md-7 col-xs-12"/>
                                </div>
                              </div>
                              <div class="form-group">
                                      <label class="control-label col-md-4 col-sm-4 col-xs-12">Tình trạng </label>
                                      <div class="col-md-8 col-sm-8 col-xs-12">
                                            <select class="form-control" id="productAvailability" runat="server">
												<option value="ProductStatus1" selected="selected">Đang có sẵn</option>
												<option value="ProductStatus2">Đã cho thuê </option>
												<option value="ProductStatus3">Ngưng kinh doanh </option>
											</select>
                                      </div>
                                </div>  
                            <div class="form-group">
                                  <label class="control-label col-md-4 col-sm-4 col-xs-12">Giá trị sản phẩm</label>
                                  <div class="col-md-8 col-sm-8 col-xs-12">
                                    <input type="text" id="productValue" runat="server" name="productValue" required="required" class="form-control col-md-7 col-xs-12 numberFormat"/>
                                  </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Chọn hình đại diện</label>
                              <div class="btn-group">
                                    <%--<input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />--%>
                                  <asp:FileUpload ID="productAvatarFile" CssClass="btn-group btn btn-info btn-xs" runat="server" />
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Add hình vào gallery</label>
                              <div class="btn-group">
                                    <%--<input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />--%>
                                   <asp:FileUpload ID="productGalleryFile" CssClass="btn-group btn btn-info btn-xs" AllowMultiple="true" runat="server" />
                              </div>
                            </div>
                          </div>     
                    </div>
                   </div>  <!-- add thông tin chung -->
                  
                    <div class="x_panel">  <!-- add sản phẩm đính kèm và cho linh kiện -->
                        <div class="x_title">
                            <h2>Thêm sản phẩm đi kèm và linh kiện chọn thêm </h2>
                            <ul class="nav navbar-right panel_toolbox">
                                  <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div class="col-md-12 col-sm-12 col-xs-12">                                    
                                    <div class="col-md-6 col-sm-6 col-xs-12"> <!-- Sản phẩm đính kèm -->
				                        <label class="control-label">Chọn sản phẩm đính kèm</label>
                                        <div id="ProAccompamyList" runat="server">
                                            <!-- Load data from backend-->
                                        </div>
                                        <%--<select id="ipProductAccompanySelection" name="ipProductAccompanySelection" class="form-control selectpicker" size="13" multiple="multiple" data-live-search="true" >
                                            <div id="ProAccompamyList" runat="server"></div>
				                        </select>--%>

			                        </div>    <!-- /Sản phẩm đính kèm --> 
                                    <div class="col-md-6 col-sm-6 col-xs-12">  <!-- Linh  kiện chọn thêm -->
				                        <label class="control-label">Chọn linh kiện chọn thêm</label>
                                        <div id="ProAccessoryList" runat="server">
                                            <!-- Load data from backend-->
                                        </div>
                                        <%--<select id="ipProductAccessorySelection" name="ipProductAccessorySelection" class="form-control selectpicker" size="13" multiple="multiple" data-live-search="true" >
                                           <p id="ProAccessoryList" runat="server"></p>
				                        </select>--%>
			                        </div>       <!-- /Linh  kiện chọn thêm -->                                                                                                     
                              </div> 
                        </div>
                    </div> <!-- /add sản phẩm đính kèm và cho linh kiện -->

                    <div class="x_panel">  <!-- Add các mô tả -->
                        <div class="x_title">
                            <h2>Thêm nội dung mô ta, hướng dẫn sử dụng </h2>
                            <ul class="nav navbar-right panel_toolbox">
                                  <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                        <br />                
                              <div class="form-group">
                                  <label class="control-label">Mô tả sản phẩm chi tiết</label>
                                    <textarea tabindex="2" cols="50" rows="5" class="field textarea small content_Preditor" name="content_PrFullDesc" id="content_PrFullDesc" runat="server" style="width: 720px"></textarea>
                              </div>
                              <div class="form-group">
                                  <label class="control-label">Thông số kỹ thuật</label>
                                    <textarea tabindex="3" cols="50" rows="5" class="field textarea small content_Preditor" name="content_PrSpec" id="content_PrSpec" runat="server" style="width: 720px"></textarea>
                              </div>
                              <div class="form-group">
                                  <label class="control-label">Hướng dẫn sử dụng</label>                                 
                                  <textarea tabindex="3" cols="50" rows="5" class="field textarea small content_Preditor" name="content_PrInstruction" id="content_PrInstruction" runat="server" style="width: 500px"></textarea>
                                  <div class="col-md-6 col-sm-6 col-xs-12" style="margin-top:15px;">
                                      <label class="control-label col-md-4 col-sm-4 col-xs-12">Add link video youtube</label>
                                      <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input type="text" id="productYoutube" runat="server" name="product-youtube" required="required" class="form-control col-md-7 col-xs-12"/>
                                      </div>
                                  </div>
                              </div>
                            </div>
                    </div>  <!-- /Add các mô tả -->

                    <div class="x_panel">  <!-- Add cách tinh giá -->
                            <div class="x_title">
                                <h2>Định nghĩa cách tính giá theo thời gian tự động </h2>
                                <ul class="nav navbar-right panel_toolbox">
                                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <br />                              
                              <div class="col-md-3 col-sm-6 col-xs-12">  <!-- Cách tính giá theo block -->
                                  <div class="form-group">
                                    <label class="control-label col-md-5 col-sm-5 col-xs-12" for="first-name">Số giờ cho 1 block <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select class="form-control selectpicker" id="listPricePerHour" onchange ="tbPricePerHourValue() ">
                                            <option>1 giờ</option>
                                            <option>2 giờ</option>
                                            <option>3 giờ</option>
                                            <option>4 giờ</option>
                                            <option>5 giờ</option>
                                            <option>6 giờ</option>
                                            <option>12 giờ</option>
                                        </select>
                                    </div>
                                  </div>
                                  <div class="form-group set-price-per-hour">
                                      <table class="table table-striped table-bordered">
                                          <tr class="block-1">
                                              <td>block 1</td>
                                              <td><input type="text" id="priceblock1"/></td>
                                          </tr>
                                          <tr class="block-2">
                                              <td>block 2</td>
                                              <td><input type="text" id="priceblock2"/></td>
                                          </tr>
                                          <tr class="block-3">
                                              <td>block 3</td>
                                              <td><input type="text" id="priceblock3"/></td>
                                          </tr>
                                          <tr class="block-4">
                                              <td>block 4</td>
                                              <td><input type="text" id="priceblock4"/></td>
                                          </tr>
                                          <tr class="block-5">
                                              <td>block 5</td>
                                              <td><input type="text" id="priceblock5"/></td>
                                          </tr>
                                          <tr class="block-6">
                                              <td>block 6</td>
                                              <td><input type="text" id="priceblock6"/></td>
                                          </tr>
                                          <tr class="block-7">
                                              <td>block 7</td>
                                              <td><input type="text" id="priceblock7"/></td>
                                          </tr>
                                          <tr class="block-8">
                                              <td>block 8</td>
                                              <td><input type="text" id="priceblock8"/></td>
                                          </tr>
                                          <tr class="block-9">
                                              <td>block 9</td>
                                              <td><input type="text" id="priceblock9"/></td>
                                          </tr>
                                          <tr class="block-10">
                                              <td>block 10</td>
                                              <td><input type="text" id="priceblock10"/></td>
                                          </tr>
                                          <tr class="block-11">
                                              <td>block 11</td>
                                              <td><input type="text" id="priceblock11"/></td>
                                          </tr>
                                          <tr class="block-12">
                                              <td>block 12</td>
                                              <td><input type="text" id="priceblock12"/></td>
                                          </tr>
                                          <tr class="block-13">
                                              <td>block 13</td>
                                              <td><input type="text" id="priceblock13"/></td>
                                          </tr>
                                          <tr class="block-14">
                                              <td>block 14</td>
                                              <td><input type="text" id="priceblock14"/></td>
                                          </tr>
                                          <tr class="block-15">
                                              <td>block 15</td>
                                              <td><input type="text" id="priceblock15"/></td>
                                          </tr>
                                          <tr class="block-16">
                                              <td>block 16</td>
                                              <td><input type="text" id="priceblock16"/></td>
                                          </tr>
                                          <tr class="block-17">
                                              <td>block 17</td>
                                              <td><input type="text" id="priceblock17"/></td>
                                          </tr>
                                          <tr class="block-18">
                                              <td>block 18</td>
                                              <td><input type="text" id="priceblock18"/></td>
                                          </tr>
                                          <tr class="block-19">
                                              <td>block 19</td>
                                              <td><input type="text" id="priceblock19"/></td>
                                          </tr>
                                          <tr class="block-20">
                                              <td>block 20</td>
                                              <td><input type="text" id="priceblock20"/></td>
                                          </tr>
                                          <tr class="block-21">
                                              <td>block 21</td>
                                              <td><input type="text" id="priceblock21"/></td>
                                          </tr>
                                          <tr class="block-22">
                                              <td>block 22</td>
                                              <td><input type="text" id="priceblock22"/></td>
                                          </tr>
                                          <tr class="block-23">
                                              <td>block 23</td>
                                              <td><input type="text" id="priceblock23"/></td>
                                          </tr>
                                          <tr class="block-24">
                                              <td>block 24</td>
                                              <td><input type="text" id="priceblock24"/></td>
                                          </tr>
                                      </table>
                                  </div>
                              </div>

                              <div class="col-md-3 col-sm-6 col-xs-12">  <%--Define price per day--%>
                                   <div class="form-group">
                                    <label class="control-label col-md-5 col-sm-5 col-xs-12" for="first-name">Số Ngày cho 1 block <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select class="form-control selectpicker" id="listPricePerDay" onchange ="tbPricePerDayValue() ">
                                            <option>1 ngày</option>
                                            <option>2 ngày</option>
                                            <option>3 ngày</option>
                                            <option>4 ngày</option>
                                            <option>5 ngày</option>
                                            <option>6 ngày</option>
                                            <option>8 ngày</option>
                                            <option>10 ngày</option>
                                            <option>15 ngày</option>
                                        </select>
                                    </div>
                                  </div>
                                  <div class="form-group set-price-per-day">
                                      <table class="table table-striped table-bordered">
                                          <tr class="block-1">
                                              <td>block 1</td>
                                              <td><input type="text" id="priceDayBlock1"/></td>
                                          </tr>
                                          <tr class="block-2">
                                              <td>block 2</td>
                                              <td><input type="text" id="priceDayBlock2"/></td>
                                          </tr>
                                          <tr class="block-3">
                                              <td>block 3</td>
                                              <td><input type="text" id="priceDayBlock3"/></td>
                                          </tr>
                                          <tr class="block-4">
                                              <td>block 4</td>
                                              <td><input type="text" id="priceDayBlock4"/></td>
                                          </tr>
                                          <tr class="block-5">
                                              <td>block 5</td>
                                              <td><input type="text" id="priceDayBlock5"/></td>
                                          </tr>
                                          <tr class="block-6">
                                              <td>block 6</td>
                                              <td><input type="text" id="priceDayBlock6"/></td>
                                          </tr>
                                          <tr class="block-7">
                                              <td>block 7</td>
                                              <td><input type="text" id="priceDayBlock7"/></td>
                                          </tr>
                                          <tr class="block-8">
                                              <td>block 8</td>
                                              <td><input type="text" id="priceDayBlock8"/></td>
                                          </tr>
                                          <tr class="block-9">
                                              <td>block 9</td>
                                              <td><input type="text" id="priceDayBlock9"/></td>
                                          </tr>
                                          <tr class="block-10">
                                              <td>block 10</td>
                                              <td><input type="text" id="priceDayBlock10"/></td>
                                          </tr>
                                          <tr class="block-11">
                                              <td>block 11</td>
                                              <td><input type="text" id="priceDayBlock11"/></td>
                                          </tr>
                                          <tr class="block-12">
                                              <td>block 12</td>
                                              <td><input type="text" id="priceDayBlock12"/></td>
                                          </tr>
                                          <tr class="block-13">
                                              <td>block 13</td>
                                              <td><input type="text" id="priceDayBlock13"/></td>
                                          </tr>
                                          <tr class="block-14">
                                              <td>block 14</td>
                                              <td><input type="text" id="priceDayBlock14"/></td>
                                          </tr>
                                          <tr class="block-15">
                                              <td>block 15</td>
                                              <td><input type="text" id="priceDayBlock15"/></td>
                                          </tr>
                                          <tr class="block-16">
                                              <td>block 16</td>
                                              <td><input type="text" id="priceDayBlock16"/></td>
                                          </tr>
                                          <tr class="block-17">
                                              <td>block 17</td>
                                              <td><input type="text" id="priceDayBlock17"/></td>
                                          </tr>
                                          <tr class="block-18">
                                              <td>block 18</td>
                                              <td><input type="text" id="priceDayBlock18"/></td>
                                          </tr>
                                          <tr class="block-19">
                                              <td>block 19</td>
                                              <td><input type="text" id="priceDayBlock19"/></td>
                                          </tr>
                                          <tr class="block-20">
                                              <td>block 20</td>
                                              <td><input type="text" id="priceDayBlock20"/></td>
                                          </tr>
                                          <tr class="block-21">
                                              <td>block 21</td>
                                              <td><input type="text" id="priceDayBlock21"/></td>
                                          </tr>
                                          <tr class="block-22">
                                              <td>block 22</td>
                                              <td><input type="text" id="priceDayBlock22"/></td>
                                          </tr>
                                          <tr class="block-23">
                                              <td>block 23</td>
                                              <td><input type="text" id="priceDayBlock23"/></td>
                                          </tr>
                                          <tr class="block-24">
                                              <td>block 24</td>
                                              <td><input type="text" id="priceDayBlock24"/></td>
                                          </tr>
                                          <tr class="block-25">
                                              <td>block 25</td>
                                              <td><input type="text" id="priceDayBlock25"/></td>
                                          </tr>
                                          <tr class="block-26">
                                              <td>block 26</td>
                                              <td><input type="text" id="priceDayBlock26"/></td>
                                          </tr>
                                          <tr class="block-27">
                                              <td>block 27</td>
                                              <td><input type="text" id="priceDayBlock27"/></td>
                                          </tr>
                                          <tr class="block-28">
                                              <td>block 28</td>
                                              <td><input type="text" id="priceDayBlock28"/></td>
                                          </tr>
                                          <tr class="block-29">
                                              <td>block 29</td>
                                              <td><input type="text" id="priceDayBlock29"/></td>
                                          </tr>
                                          <tr class="block-30">
                                              <td>block 30</td>
                                              <td><input type="text" id="priceDayBlock30"/></td>
                                          </tr>
                                      </table>
                                  </div>
                              </div>

                              <div class="col-md-4 col-sm-6 col-xs-12">  <%--Define price per quantity--%>
                                 <div class="form-group set-price-per-day">  
                                      <table id="myTable" class="table table-striped table-bordered">
	                                        <tr>
                                              <th>Số lượng từ</th>
                                              <th>Số lượng đến</th>
                                              <th>Giá tiền </th>
                                          </tr>
                                          <tr>
                                            <td><input type="text" id="priceQuantityRow1"/></td>
                                            <td><input type="text" id="priceQuantityRow2"/></td>
                                            <td><input type="text" id="priceQuantityRow3"/></td>
                                          </tr>
                                        </table>
                                        <br/>
                                        <button onclick="myFunction()">Try it</button>                                       
                                 </div>
                                </div>
                            </div>
                    </div>  <!-- Add cách tinh giá -->

                        <div class="ln_solid"></div>

                          <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                              <button class="btn btn-primary" type="button">Hủy</button>
                              <button class="btn btn-primary" type="reset">Reset</button>                        
                              <%--<button type="submit" runat="server" onserverclick="btnCreate_click" class="btn btn-success">Tạo</button>--%>
                                
                                <input type="button" id="btnSave" onclick="javascript: return CheckedInformation();" class="btn btn-success" value="SAVE & CONTINUE" />
                                 <input type="button" id="btnSave_Display" runat="server" onserverclick="btnCreate_click" class="btnSave_Display" style="display: none" />
                            </div>
                          </div>
                </div> <!-- /Create new category -->
            </div>
        </div>
        </form>
    </div>
    <!-- /page content -->
            <script>
                function myFunction() {
                    var table = document.getElementById("myTable");
                    var row = table.insertRow(1);
                    var cell1 = row.insertCell(0);
                    var cell2 = row.insertCell(0);
                    var cell3 = row.insertCell(1);  
                }
            </script>
            <script>
                function tbPricePerHourValue()
                {
                    var x = document.getElementById("listPricePerHour").value;
                    console.log(x);
                    if (x == "12 giờ") {
                        $('.set-price-per-hour .block-24').css('display', 'none')
                        $('.set-price-per-hour .block-23').css('display', 'none')
                        $('.set-price-per-hour .block-22').css('display', 'none')
                        $('.set-price-per-hour .block-21').css('display', 'none')
                        $('.set-price-per-hour .block-20').css('display', 'none')
                        $('.set-price-per-hour .block-19').css('display', 'none')
                        $('.set-price-per-hour .block-18').css('display', 'none')
                        $('.set-price-per-hour .block-17').css('display', 'none')
                        $('.set-price-per-hour .block-16').css('display', 'none')
                        $('.set-price-per-hour .block-15').css('display', 'none')
                        $('.set-price-per-hour .block-14').css('display', 'none')
                        $('.set-price-per-hour .block-13').css('display', 'none')
                        $('.set-price-per-hour .block-12').css('display', 'none')
                        $('.set-price-per-hour .block-11').css('display', 'none')
                        $('.set-price-per-hour .block-10').css('display', 'none')
                        $('.set-price-per-hour .block-9').css('display', 'none')
                        $('.set-price-per-hour .block-8').css('display', 'none')
                        $('.set-price-per-hour .block-7').css('display', 'none')
                        $('.set-price-per-hour .block-6').css('display', 'none')
                        $('.set-price-per-hour .block-5').css('display', 'none')
                        $('.set-price-per-hour .block-4').css('display', 'none')
                        $('.set-price-per-hour .block-3').css('display', 'none')
                        $('.set-price-per-hour .block-2').css('display', 'block')
                        $('.set-price-per-hour .block-1').css('display', 'block')
                    }
                    if (x == "6 giờ")
                    {
                        $('.set-price-per-hour .block-24').css('display', 'none')
                        $('.set-price-per-hour .block-23').css('display', 'none')
                        $('.set-price-per-hour .block-22').css('display', 'none')
                        $('.set-price-per-hour .block-21').css('display', 'none')
                        $('.set-price-per-hour .block-20').css('display', 'none')
                        $('.set-price-per-hour .block-19').css('display', 'none')
                        $('.set-price-per-hour .block-18').css('display', 'none')
                        $('.set-price-per-hour .block-17').css('display', 'none')
                        $('.set-price-per-hour .block-16').css('display', 'none')
                        $('.set-price-per-hour .block-15').css('display', 'none')
                        $('.set-price-per-hour .block-14').css('display', 'none')
                        $('.set-price-per-hour .block-13').css('display', 'none')
                        $('.set-price-per-hour .block-12').css('display', 'none')
                        $('.set-price-per-hour .block-11').css('display', 'none')
                        $('.set-price-per-hour .block-10').css('display', 'none')
                        $('.set-price-per-hour .block-9').css('display', 'none')
                        $('.set-price-per-hour .block-8').css('display', 'none')
                        $('.set-price-per-hour .block-7').css('display', 'none')
                        $('.set-price-per-hour .block-6').css('display', 'none')
                        $('.set-price-per-hour .block-5').css('display', 'none')
                        $('.set-price-per-hour .block-4').css('display', 'block')
                        $('.set-price-per-hour .block-3').css('display', 'block')
                        $('.set-price-per-hour .block-2').css('display', 'block')
                        $('.set-price-per-hour .block-1').css('display', 'block')
                    }
                    if (x == "5 giờ")
                    {
                        $('.set-price-per-hour .block-24').css('display', 'none')
                        $('.set-price-per-hour .block-23').css('display', 'none')
                        $('.set-price-per-hour .block-22').css('display', 'none')
                        $('.set-price-per-hour .block-21').css('display', 'none')
                        $('.set-price-per-hour .block-20').css('display', 'none')
                        $('.set-price-per-hour .block-19').css('display', 'none')
                        $('.set-price-per-hour .block-18').css('display', 'none')
                        $('.set-price-per-hour .block-17').css('display', 'none')
                        $('.set-price-per-hour .block-16').css('display', 'none')
                        $('.set-price-per-hour .block-15').css('display', 'none')
                        $('.set-price-per-hour .block-14').css('display', 'none')
                        $('.set-price-per-hour .block-13').css('display', 'none')
                        $('.set-price-per-hour .block-12').css('display', 'none')
                        $('.set-price-per-hour .block-11').css('display', 'none')
                        $('.set-price-per-hour .block-10').css('display', 'none')
                        $('.set-price-per-hour .block-9').css('display', 'none')
                        $('.set-price-per-hour .block-8').css('display', 'none')
                        $('.set-price-per-hour .block-7').css('display', 'none')
                        $('.set-price-per-hour .block-6').css('display', 'none')
                        $('.set-price-per-hour .block-5').css('display', 'block')
                        $('.set-price-per-hour .block-4').css('display', 'block')
                        $('.set-price-per-hour .block-3').css('display', 'block')
                        $('.set-price-per-hour .block-2').css('display', 'block')
                        $('.set-price-per-hour .block-1').css('display', 'block')
                    }
                    if (x == "4 giờ")
                    {
                        $('.set-price-per-hour .block-24').css('display', 'none')
                        $('.set-price-per-hour .block-23').css('display', 'none')
                        $('.set-price-per-hour .block-22').css('display', 'none')
                        $('.set-price-per-hour .block-21').css('display', 'none')
                        $('.set-price-per-hour .block-20').css('display', 'none')
                        $('.set-price-per-hour .block-19').css('display', 'none')
                        $('.set-price-per-hour .block-18').css('display', 'none')
                        $('.set-price-per-hour .block-17').css('display', 'none')
                        $('.set-price-per-hour .block-16').css('display', 'none')
                        $('.set-price-per-hour .block-15').css('display', 'none')
                        $('.set-price-per-hour .block-14').css('display', 'none')
                        $('.set-price-per-hour .block-13').css('display', 'none')
                        $('.set-price-per-hour .block-12').css('display', 'none')
                        $('.set-price-per-hour .block-11').css('display', 'none')
                        $('.set-price-per-hour .block-10').css('display', 'none')
                        $('.set-price-per-hour .block-9').css('display', 'none')
                        $('.set-price-per-hour .block-8').css('display', 'none')
                        $('.set-price-per-hour .block-7').css('display', 'none')
                        $('.set-price-per-hour .block-6').css('display', 'block')
                        $('.set-price-per-hour .block-5').css('display', 'block')
                        $('.set-price-per-hour .block-4').css('display', 'block')
                        $('.set-price-per-hour .block-3').css('display', 'block')
                        $('.set-price-per-hour .block-2').css('display', 'block')
                        $('.set-price-per-hour .block-1').css('display', 'block')
                    }
                    if (x == "3 giờ")
                    {
                        $('.set-price-per-hour .block-24').css('display', 'none')
                        $('.set-price-per-hour .block-23').css('display', 'none')
                        $('.set-price-per-hour .block-22').css('display', 'none')
                        $('.set-price-per-hour .block-21').css('display', 'none')
                        $('.set-price-per-hour .block-20').css('display', 'none')
                        $('.set-price-per-hour .block-19').css('display', 'none')
                        $('.set-price-per-hour .block-18').css('display', 'none')
                        $('.set-price-per-hour .block-17').css('display', 'none')
                        $('.set-price-per-hour .block-16').css('display', 'none')
                        $('.set-price-per-hour .block-15').css('display', 'none')
                        $('.set-price-per-hour .block-14').css('display', 'none')
                        $('.set-price-per-hour .block-13').css('display', 'none')
                        $('.set-price-per-hour .block-12').css('display', 'none')
                        $('.set-price-per-hour .block-11').css('display', 'none')
                        $('.set-price-per-hour .block-10').css('display', 'none')
                        $('.set-price-per-hour .block-9').css('display', 'none')
                        $('.set-price-per-hour .block-8').css('display', 'block')
                        $('.set-price-per-hour .block-7').css('display', 'block')
                        $('.set-price-per-hour .block-6').css('display', 'block')
                        $('.set-price-per-hour .block-5').css('display', 'block')
                        $('.set-price-per-hour .block-4').css('display', 'block')
                        $('.set-price-per-hour .block-3').css('display', 'block')
                        $('.set-price-per-hour .block-2').css('display', 'block')
                        $('.set-price-per-hour .block-1').css('display', 'block')
                    }
                    if (x == "2 giờ")
                    {
                        $('.set-price-per-hour .block-24').css('display', 'none')
                        $('.set-price-per-hour .block-23').css('display', 'none')
                        $('.set-price-per-hour .block-22').css('display', 'none')
                        $('.set-price-per-hour .block-21').css('display', 'none')
                        $('.set-price-per-hour .block-20').css('display', 'none')
                        $('.set-price-per-hour .block-19').css('display', 'none')
                        $('.set-price-per-hour .block-18').css('display', 'none')
                        $('.set-price-per-hour .block-17').css('display', 'none')
                        $('.set-price-per-hour .block-16').css('display', 'none')
                        $('.set-price-per-hour .block-15').css('display', 'none')
                        $('.set-price-per-hour .block-14').css('display', 'none')
                        $('.set-price-per-hour .block-13').css('display', 'none')
                        $('.set-price-per-hour .block-12').css('display', 'block')
                        $('.set-price-per-hour .block-11').css('display', 'block')
                        $('.set-price-per-hour .block-10').css('display', 'block')
                        $('.set-price-per-hour .block-9').css('display', 'block')
                        $('.set-price-per-hour .block-8').css('display', 'block')
                        $('.set-price-per-hour .block-7').css('display', 'block')
                        $('.set-price-per-hour .block-6').css('display', 'block')
                        $('.set-price-per-hour .block-5').css('display', 'block')
                        $('.set-price-per-hour .block-4').css('display', 'block')
                        $('.set-price-per-hour .block-3').css('display', 'block')
                        $('.set-price-per-hour .block-2').css('display', 'block')
                        $('.set-price-per-hour .block-1').css('display', 'block')
                    }
                    if (x == "1 giờ")
                    {
                        $('.set-price-per-hour .block-24').css('display', 'block')
                        $('.set-price-per-hour .block-23').css('display', 'block')
                        $('.set-price-per-hour .block-22').css('display', 'block')
                        $('.set-price-per-hour .block-21').css('display', 'block')
                        $('.set-price-per-hour .block-20').css('display', 'block')
                        $('.set-price-per-hour .block-19').css('display', 'block')
                        $('.set-price-per-hour .block-18').css('display', 'block')
                        $('.set-price-per-hour .block-17').css('display', 'block')
                        $('.set-price-per-hour .block-16').css('display', 'block')
                        $('.set-price-per-hour .block-15').css('display', 'block')
                        $('.set-price-per-hour .block-14').css('display', 'block')
                        $('.set-price-per-hour .block-13').css('display', 'block')
                        $('.set-price-per-hour .block-12').css('display', 'block')
                        $('.set-price-per-hour .block-11').css('display', 'block')
                        $('.set-price-per-hour .block-10').css('display', 'block')
                        $('.set-price-per-hour .block-9').css('display', 'block')
                        $('.set-price-per-hour .block-8').css('display', 'block')
                        $('.set-price-per-hour .block-7').css('display', 'block')
                        $('.set-price-per-hour .block-6').css('display', 'block')
                        $('.set-price-per-hour .block-5').css('display', 'block')
                        $('.set-price-per-hour .block-4').css('display', 'block')
                        $('.set-price-per-hour .block-3').css('display', 'block')
                        $('.set-price-per-hour .block-2').css('display', 'block')
                        $('.set-price-per-hour .block-1').css('display', 'block')
                    }
                }
            </script>
            <script>
                function tbPricePerDayValue()
                {
                    var y = document.getElementById("listPricePerDay").value;
                    console.log(y);
                    if (y == "1 ngày")
                    {
                        $('.set-price-per-day .block-30').css('display', 'block')
                        $('.set-price-per-day .block-29').css('display', 'block')
                        $('.set-price-per-day .block-28').css('display', 'block')
                        $('.set-price-per-day .block-27').css('display', 'block')
                        $('.set-price-per-day .block-26').css('display', 'block')
                        $('.set-price-per-day .block-25').css('display', 'block')
                        $('.set-price-per-day .block-24').css('display', 'block')
                        $('.set-price-per-day .block-23').css('display', 'block')
                        $('.set-price-per-day .block-22').css('display', 'block')
                        $('.set-price-per-day .block-21').css('display', 'block')
                        $('.set-price-per-day .block-20').css('display', 'block')
                        $('.set-price-per-day .block-19').css('display', 'block')
                        $('.set-price-per-day .block-18').css('display', 'block')
                        $('.set-price-per-day .block-17').css('display', 'block')
                        $('.set-price-per-day .block-16').css('display', 'block')
                        $('.set-price-per-day .block-15').css('display', 'block')
                        $('.set-price-per-day .block-14').css('display', 'block')
                        $('.set-price-per-day .block-13').css('display', 'block')
                        $('.set-price-per-day .block-12').css('display', 'block')
                        $('.set-price-per-day .block-11').css('display', 'block')
                        $('.set-price-per-day .block-10').css('display', 'block')
                        $('.set-price-per-day .block-9').css('display', 'block')
                        $('.set-price-per-day .block-8').css('display', 'block')
                        $('.set-price-per-day .block-7').css('display', 'block')
                        $('.set-price-per-day .block-6').css('display', 'block')
                        $('.set-price-per-day .block-5').css('display', 'block')
                        $('.set-price-per-day .block-4').css('display', 'block')
                        $('.set-price-per-day .block-3').css('display', 'block')
                        $('.set-price-per-day .block-2').css('display', 'block')
                        $('.set-price-per-day .block-1').css('display', 'block')
                    }
                    if (y == "2 ngày")
                    {
                        $('.set-price-per-day .block-30').css('display', 'none')
                        $('.set-price-per-day .block-29').css('display', 'none')
                        $('.set-price-per-day .block-28').css('display', 'none')
                        $('.set-price-per-day .block-27').css('display', 'none')
                        $('.set-price-per-day .block-26').css('display', 'none')
                        $('.set-price-per-day .block-25').css('display', 'none')
                        $('.set-price-per-day .block-24').css('display', 'none')
                        $('.set-price-per-day .block-23').css('display', 'none')
                        $('.set-price-per-day .block-22').css('display', 'none')
                        $('.set-price-per-day .block-21').css('display', 'none')
                        $('.set-price-per-day .block-20').css('display', 'none')
                        $('.set-price-per-day .block-19').css('display', 'none')
                        $('.set-price-per-day .block-18').css('display', 'none')
                        $('.set-price-per-day .block-17').css('display', 'none')
                        $('.set-price-per-day .block-16').css('display', 'none')
                        $('.set-price-per-day .block-15').css('display', 'block')
                        $('.set-price-per-day .block-14').css('display', 'block')
                        $('.set-price-per-day .block-13').css('display', 'block')
                        $('.set-price-per-day .block-12').css('display', 'block')
                        $('.set-price-per-day .block-11').css('display', 'block')
                        $('.set-price-per-day .block-10').css('display', 'block')
                        $('.set-price-per-day .block-9').css('display', 'block')
                        $('.set-price-per-day .block-8').css('display', 'block')
                        $('.set-price-per-day .block-7').css('display', 'block')
                        $('.set-price-per-day .block-6').css('display', 'block')
                        $('.set-price-per-day .block-5').css('display', 'block')
                        $('.set-price-per-day .block-4').css('display', 'block')
                        $('.set-price-per-day .block-3').css('display', 'block')
                        $('.set-price-per-day .block-2').css('display', 'block')
                        $('.set-price-per-day .block-1').css('display', 'block')
                    }
                    if (y == "3 ngày")
                    {
                        $('.set-price-per-day .block-30').css('display', 'none')
                        $('.set-price-per-day .block-29').css('display', 'none')
                        $('.set-price-per-day .block-28').css('display', 'none')
                        $('.set-price-per-day .block-27').css('display', 'none')
                        $('.set-price-per-day .block-26').css('display', 'none')
                        $('.set-price-per-day .block-25').css('display', 'none')
                        $('.set-price-per-day .block-24').css('display', 'none')
                        $('.set-price-per-day .block-23').css('display', 'none')
                        $('.set-price-per-day .block-22').css('display', 'none')
                        $('.set-price-per-day .block-21').css('display', 'none')
                        $('.set-price-per-day .block-20').css('display', 'none')
                        $('.set-price-per-day .block-19').css('display', 'none')
                        $('.set-price-per-day .block-18').css('display', 'none')
                        $('.set-price-per-day .block-17').css('display', 'none')
                        $('.set-price-per-day .block-16').css('display', 'none')
                        $('.set-price-per-day .block-15').css('display', 'none')
                        $('.set-price-per-day .block-14').css('display', 'none')
                        $('.set-price-per-day .block-13').css('display', 'none')
                        $('.set-price-per-day .block-12').css('display', 'none')
                        $('.set-price-per-day .block-11').css('display', 'none')
                        $('.set-price-per-day .block-10').css('display', 'block')
                        $('.set-price-per-day .block-9').css('display', 'block')
                        $('.set-price-per-day .block-8').css('display', 'block')
                        $('.set-price-per-day .block-7').css('display', 'block')
                        $('.set-price-per-day .block-6').css('display', 'block')
                        $('.set-price-per-day .block-5').css('display', 'block')
                        $('.set-price-per-day .block-4').css('display', 'block')
                        $('.set-price-per-day .block-3').css('display', 'block')
                        $('.set-price-per-day .block-2').css('display', 'block')
                        $('.set-price-per-day .block-1').css('display', 'block')
                    }
                    if (y == "4 ngày")
                    {
                        $('.set-price-per-day .block-30').css('display', 'none')
                        $('.set-price-per-day .block-29').css('display', 'none')
                        $('.set-price-per-day .block-28').css('display', 'none')
                        $('.set-price-per-day .block-27').css('display', 'none')
                        $('.set-price-per-day .block-26').css('display', 'none')
                        $('.set-price-per-day .block-25').css('display', 'none')
                        $('.set-price-per-day .block-24').css('display', 'none')
                        $('.set-price-per-day .block-23').css('display', 'none')
                        $('.set-price-per-day .block-22').css('display', 'none')
                        $('.set-price-per-day .block-21').css('display', 'none')
                        $('.set-price-per-day .block-20').css('display', 'none')
                        $('.set-price-per-day .block-19').css('display', 'none')
                        $('.set-price-per-day .block-18').css('display', 'none')
                        $('.set-price-per-day .block-17').css('display', 'none')
                        $('.set-price-per-day .block-16').css('display', 'none')
                        $('.set-price-per-day .block-15').css('display', 'none')
                        $('.set-price-per-day .block-14').css('display', 'none')
                        $('.set-price-per-day .block-13').css('display', 'none')
                        $('.set-price-per-day .block-12').css('display', 'none')
                        $('.set-price-per-day .block-11').css('display', 'none')
                        $('.set-price-per-day .block-10').css('display', 'none')
                        $('.set-price-per-day .block-9').css('display', 'none')
                        $('.set-price-per-day .block-8').css('display', 'block')
                        $('.set-price-per-day .block-7').css('display', 'block')
                        $('.set-price-per-day .block-6').css('display', 'block')
                        $('.set-price-per-day .block-5').css('display', 'block')
                        $('.set-price-per-day .block-4').css('display', 'block')
                        $('.set-price-per-day .block-3').css('display', 'block')
                        $('.set-price-per-day .block-2').css('display', 'block')
                        $('.set-price-per-day .block-1').css('display', 'block')
                    }
                    if (y == "5 ngày") {
                        $('.set-price-per-day .block-30').css('display', 'none')
                        $('.set-price-per-day .block-29').css('display', 'none')
                        $('.set-price-per-day .block-28').css('display', 'none')
                        $('.set-price-per-day .block-27').css('display', 'none')
                        $('.set-price-per-day .block-26').css('display', 'none')
                        $('.set-price-per-day .block-25').css('display', 'none')
                        $('.set-price-per-day .block-24').css('display', 'none')
                        $('.set-price-per-day .block-23').css('display', 'none')
                        $('.set-price-per-day .block-22').css('display', 'none')
                        $('.set-price-per-day .block-21').css('display', 'none')
                        $('.set-price-per-day .block-20').css('display', 'none')
                        $('.set-price-per-day .block-19').css('display', 'none')
                        $('.set-price-per-day .block-18').css('display', 'none')
                        $('.set-price-per-day .block-17').css('display', 'none')
                        $('.set-price-per-day .block-16').css('display', 'none')
                        $('.set-price-per-day .block-15').css('display', 'none')
                        $('.set-price-per-day .block-14').css('display', 'none')
                        $('.set-price-per-day .block-13').css('display', 'none')
                        $('.set-price-per-day .block-12').css('display', 'none')
                        $('.set-price-per-day .block-11').css('display', 'none')
                        $('.set-price-per-day .block-10').css('display', 'none')
                        $('.set-price-per-day .block-9').css('display', 'none')
                        $('.set-price-per-day .block-8').css('display', 'none')
                        $('.set-price-per-day .block-7').css('display', 'none')
                        $('.set-price-per-day .block-6').css('display', 'block')
                        $('.set-price-per-day .block-5').css('display', 'block')
                        $('.set-price-per-day .block-4').css('display', 'block')
                        $('.set-price-per-day .block-3').css('display', 'block')
                        $('.set-price-per-day .block-2').css('display', 'block')
                        $('.set-price-per-day .block-1').css('display', 'block')
                    }
                    if (y == "6 ngày") {
                        $('.set-price-per-day .block-30').css('display', 'none')
                        $('.set-price-per-day .block-29').css('display', 'none')
                        $('.set-price-per-day .block-28').css('display', 'none')
                        $('.set-price-per-day .block-27').css('display', 'none')
                        $('.set-price-per-day .block-26').css('display', 'none')
                        $('.set-price-per-day .block-25').css('display', 'none')
                        $('.set-price-per-day .block-24').css('display', 'none')
                        $('.set-price-per-day .block-23').css('display', 'none')
                        $('.set-price-per-day .block-22').css('display', 'none')
                        $('.set-price-per-day .block-21').css('display', 'none')
                        $('.set-price-per-day .block-20').css('display', 'none')
                        $('.set-price-per-day .block-19').css('display', 'none')
                        $('.set-price-per-day .block-18').css('display', 'none')
                        $('.set-price-per-day .block-17').css('display', 'none')
                        $('.set-price-per-day .block-16').css('display', 'none')
                        $('.set-price-per-day .block-15').css('display', 'none')
                        $('.set-price-per-day .block-14').css('display', 'none')
                        $('.set-price-per-day .block-13').css('display', 'none')
                        $('.set-price-per-day .block-12').css('display', 'none')
                        $('.set-price-per-day .block-11').css('display', 'none')
                        $('.set-price-per-day .block-10').css('display', 'none')
                        $('.set-price-per-day .block-9').css('display', 'none')
                        $('.set-price-per-day .block-8').css('display', 'none')
                        $('.set-price-per-day .block-7').css('display', 'none')
                        $('.set-price-per-day .block-6').css('display', 'none')
                        $('.set-price-per-day .block-5').css('display', 'block')
                        $('.set-price-per-day .block-4').css('display', 'block')
                        $('.set-price-per-day .block-3').css('display', 'block')
                        $('.set-price-per-day .block-2').css('display', 'block')
                        $('.set-price-per-day .block-1').css('display', 'block')
                    }
                    if (y == "8 ngày") {
                        $('.set-price-per-day .block-30').css('display', 'none')
                        $('.set-price-per-day .block-29').css('display', 'none')
                        $('.set-price-per-day .block-28').css('display', 'none')
                        $('.set-price-per-day .block-27').css('display', 'none')
                        $('.set-price-per-day .block-26').css('display', 'none')
                        $('.set-price-per-day .block-25').css('display', 'none')
                        $('.set-price-per-day .block-24').css('display', 'none')
                        $('.set-price-per-day .block-23').css('display', 'none')
                        $('.set-price-per-day .block-22').css('display', 'none')
                        $('.set-price-per-day .block-21').css('display', 'none')
                        $('.set-price-per-day .block-20').css('display', 'none')
                        $('.set-price-per-day .block-19').css('display', 'none')
                        $('.set-price-per-day .block-18').css('display', 'none')
                        $('.set-price-per-day .block-17').css('display', 'none')
                        $('.set-price-per-day .block-16').css('display', 'none')
                        $('.set-price-per-day .block-15').css('display', 'none')
                        $('.set-price-per-day .block-14').css('display', 'none')
                        $('.set-price-per-day .block-13').css('display', 'none')
                        $('.set-price-per-day .block-12').css('display', 'none')
                        $('.set-price-per-day .block-11').css('display', 'none')
                        $('.set-price-per-day .block-10').css('display', 'none')
                        $('.set-price-per-day .block-9').css('display', 'none')
                        $('.set-price-per-day .block-8').css('display', 'none')
                        $('.set-price-per-day .block-7').css('display', 'none')
                        $('.set-price-per-day .block-6').css('display', 'none')
                        $('.set-price-per-day .block-5').css('display', 'none')
                        $('.set-price-per-day .block-4').css('display', 'block')
                        $('.set-price-per-day .block-3').css('display', 'block')
                        $('.set-price-per-day .block-2').css('display', 'block')
                        $('.set-price-per-day .block-1').css('display', 'block')
                    }
                    if (y == "10 ngày") {
                        $('.set-price-per-day .block-30').css('display', 'none')
                        $('.set-price-per-day .block-29').css('display', 'none')
                        $('.set-price-per-day .block-28').css('display', 'none')
                        $('.set-price-per-day .block-27').css('display', 'none')
                        $('.set-price-per-day .block-26').css('display', 'none')
                        $('.set-price-per-day .block-25').css('display', 'none')
                        $('.set-price-per-day .block-24').css('display', 'none')
                        $('.set-price-per-day .block-23').css('display', 'none')
                        $('.set-price-per-day .block-22').css('display', 'none')
                        $('.set-price-per-day .block-21').css('display', 'none')
                        $('.set-price-per-day .block-20').css('display', 'none')
                        $('.set-price-per-day .block-19').css('display', 'none')
                        $('.set-price-per-day .block-18').css('display', 'none')
                        $('.set-price-per-day .block-17').css('display', 'none')
                        $('.set-price-per-day .block-16').css('display', 'none')
                        $('.set-price-per-day .block-15').css('display', 'none')
                        $('.set-price-per-day .block-14').css('display', 'none')
                        $('.set-price-per-day .block-13').css('display', 'none')
                        $('.set-price-per-day .block-12').css('display', 'none')
                        $('.set-price-per-day .block-11').css('display', 'none')
                        $('.set-price-per-day .block-10').css('display', 'none')
                        $('.set-price-per-day .block-9').css('display', 'none')
                        $('.set-price-per-day .block-8').css('display', 'none')
                        $('.set-price-per-day .block-7').css('display', 'none')
                        $('.set-price-per-day .block-6').css('display', 'none')
                        $('.set-price-per-day .block-5').css('display', 'none')
                        $('.set-price-per-day .block-4').css('display', 'none')
                        $('.set-price-per-day .block-3').css('display', 'block')
                        $('.set-price-per-day .block-2').css('display', 'block')
                        $('.set-price-per-day .block-1').css('display', 'block')
                    }
                    if (y == "15 ngày") {
                        $('.set-price-per-day .block-30').css('display', 'none')
                        $('.set-price-per-day .block-29').css('display', 'none')
                        $('.set-price-per-day .block-28').css('display', 'none')
                        $('.set-price-per-day .block-27').css('display', 'none')
                        $('.set-price-per-day .block-26').css('display', 'none')
                        $('.set-price-per-day .block-25').css('display', 'none')
                        $('.set-price-per-day .block-24').css('display', 'none')
                        $('.set-price-per-day .block-23').css('display', 'none')
                        $('.set-price-per-day .block-22').css('display', 'none')
                        $('.set-price-per-day .block-21').css('display', 'none')
                        $('.set-price-per-day .block-20').css('display', 'none')
                        $('.set-price-per-day .block-19').css('display', 'none')
                        $('.set-price-per-day .block-18').css('display', 'none')
                        $('.set-price-per-day .block-17').css('display', 'none')
                        $('.set-price-per-day .block-16').css('display', 'none')
                        $('.set-price-per-day .block-15').css('display', 'none')
                        $('.set-price-per-day .block-14').css('display', 'none')
                        $('.set-price-per-day .block-13').css('display', 'none')
                        $('.set-price-per-day .block-12').css('display', 'none')
                        $('.set-price-per-day .block-11').css('display', 'none')
                        $('.set-price-per-day .block-10').css('display', 'none')
                        $('.set-price-per-day .block-9').css('display', 'none')
                        $('.set-price-per-day .block-8').css('display', 'none')
                        $('.set-price-per-day .block-7').css('display', 'none')
                        $('.set-price-per-day .block-6').css('display', 'none')
                        $('.set-price-per-day .block-5').css('display', 'none')
                        $('.set-price-per-day .block-4').css('display', 'none')
                        $('.set-price-per-day .block-3').css('display', 'none')
                        $('.set-price-per-day .block-2').css('display', 'block')
                        $('.set-price-per-day .block-1').css('display', 'block')
                    }
                }
            </script>

            <script>
                    $('#btnAddProductAccompany').click(function (e) {
                        $('select').moveToList('#StaffList', '#PresenterList');
                        e.preventDefault();
                    });

                    $('#btnAddProductAccompanyRemove').click(function (e) {
                        $('select').removeSelected('#PresenterList');
                        e.preventDefault();
                    });

                    $('#btnAddProductAccompanyUp').click(function (e) {
                        $('select').moveUpDown('#PresenterList', true, false);
                        e.preventDefault();
                    });

                    $('#btnAddProductAccompanyDown').click(function (e) {
                        $('select').moveUpDown('#PresenterList', false, true);
                        e.preventDefault();
                    });

                    $('#btnAddAccessory').click(function (e) {
                        $('select').moveToList('#AccessoryList', '#AccessoryListSelected');
                        e.preventDefault();
                    });

                    $('#btnAddAccessoryRemove').click(function (e) {
                        $('select').removeSelected('#AccessoryListSelected');
                        e.preventDefault();
                    });

                    $('#btnAddAccessoryUp').click(function (e) {
                        $('select').moveUpDown('#AccessoryListSelected', true, false);
                        e.preventDefault();
                    });

                    $('#btnAddAccessoryDown').click(function (e) {
                        $('select').moveUpDown('#AccessoryListSelected', false, true);
                        e.preventDefault();
                    });
        </script>
    <script>
        // Initialize tooltip component
        $(function () {
          $('[data-toggle="tooltip"]').tooltip()
        })

        // Initialize popover component
        $(function () {
          $('[data-toggle="popover"]').popover()
        })

           
    //auto add comma to input number
        $('input.number').keyup(function (event) {

            // skip for arrow keys
            if (event.which >= 37 && event.which <= 40) {
                event.preventDefault();
            }

            $(this).val(function (index, value) {
                value = value.replace(/,/g, '');
                return numberWithCommas(value);
            });
        });

        $('input.numberFormat').keyup(function (event) {

            // skip for arrow keys
            if (event.which >= 37 && event.which <= 40) return;

            // format number
            $(this).val(function (index, value) {
                return value
                .replace(/\D/g, "")
                .replace(/\B(?=(\d{3})+(?!\d))/g, ",")
                ;
            });
        });
    </script>



 <script type="text/javascript">
    function openModal() {
        $('#myModal').modal('show');
    }
</script>     
    <script type="text/javascript">

        function numberlimiter(input) {
            if (input.value < 0) input.value = 0;
            if (input.value > 100) input.value = 100;
        }

        function CheckedInformation() {
            var productCodeStr = document.getElementById("ContentPlaceHolder1_productCode").value;
            if (productCodeStr == "" || productCodeStr == null) {
                $(".modal-body").html("Vui lòng nhập Product Code");
                $("#confirm-dialog").modal();
                return false;
            }
            var productNameSrt = document.getElementById("ContentPlaceHolder1_productName").value;
            if (productNameSrt == "" || productNameSrt == null) {
                $(".modal-body").html("Vui lòng nhập Product Name");
                $("#confirm-dialog").modal();
                return false;
            }
            var priceByBlockSrt = document.getElementById("ContentPlaceHolder1_priceByBlock").value;
            if (priceByBlockSrt == "" || priceByBlockSrt == null) {
                $(".modal-body").html("Vui lòng nhập Giá bán theo block");
                $("#confirm-dialog").modal();
                return false;
            }
            var priceByDaySrt = document.getElementById("ContentPlaceHolder1_priceByDay").value;
            if (priceByDaySrt == "" || priceByDaySrt == null) {
                $(".modal-body").html("Vui lòng nhập Giá bán theo Ngày");
                $("#confirm-dialog").modal();
                return false;
            }
            var prMainCat = document.getElementById("ContentPlaceHolder1_data_MainCate").value;
            if (prMainCat == "" || prMainCat == null) {
                $(".modal-body").html("Vui lòng chọn Main Category");
                $("#confirm-dialog").modal();
                return false;
            }
            var prSubCat1 = document.getElementById("ContentPlaceHolder1_data_SubCate1").value;
            if (prSubCat1 == "" || prSubCat1 == null) {
                $(".modal-body").html("Vui lòng chọn Sub Category 1");
                $("#confirm-dialog").modal();
                return false;
            }
            var prSubCat2 = document.getElementById("ContentPlaceHolder1_data_SubCate2").value;
            if (prSubCat2 == "" || prSubCat2 == null) {
                $(".modal-body").html("Vui lòng chọn Sub Category 2");
                $("#confirm-dialog").modal();
                return false;
            }
            var prStatus = document.getElementById("ContentPlaceHolder1_productStatus").value;
            if (prStatus == "" || prStatus == null) {
                $(".modal-body").html("Vui lòng nhập độ mới của sản phẩm");
                $("#confirm-dialog").modal();
                return false;
            }
            var prAvai = document.getElementById("ContentPlaceHolder1_productAvailability").value;
            if (prAvai == "" || prAvai == null) {
                $(".modal-body").html("Vui lòng chọn tình trạng sản phẩm");
                $("#confirm-dialog").modal();
                return false;
            }
            var prValue = document.getElementById("ContentPlaceHolder1_productValue").value;
            if (prValue == "" || prValue == null) {
                $(".modal-body").html("Vui lòng nhập giá trị gốc của sản phẩm");
                $("#confirm-dialog").modal();
                return false;
            }



            //auto click button run code behind
            $('.btnSave_Display').click();
            return true;


            function numberWithCommas(x) {
                var parts = x.toString().split(".");
                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                return parts.join(".");
            }

        }

</script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>

</asp:Content>

