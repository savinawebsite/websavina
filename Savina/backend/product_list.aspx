<%@ Page Title="" Language="C#" MasterPageFile="~/backend/adTemplate.master" AutoEventWireup="true" CodeFile="product_list.aspx.cs" Inherits="backend_product_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <!-- Create modal popup for DELETE -->
    <div class="modal fade" id="confirm-dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" style="text-align:center;">SAVINA</h4>
                </div>            
                <div class="modal-body">
                </div>                
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="btnCancel" data-dismiss="modal">Hủy</button>
                    <a class="btn btn-danger btn-ok" id="btnConfirmDelete">Đồng ý</a>
                </div>
            </div>
        </div>
    </div>
    <!-- /Create modal popup -->

    <!-- Create modal popup for Adding Product Group -->
    <div class="modal fade" id="PrGroup-dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" style="text-align:center;">SAVINA</h4>
                </div>            
                <div class="modal-body">
                </div>               
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="btnCancelPrGr" data-dismiss="modal">Hủy</button>
                    <a class="btn btn-danger btn-ok" id="btnConfirmPrGr">Đồng ý</a>
                </div>
            </div>
        </div>
    </div>
    <!-- /Create modal popup -->

    <input type="hidden" id="productDeleteID" />
    <input type="hidden" id="productGroup1ID" />
    <input type="hidden" id="productGroup2ID" />
    <input type="hidden" id="productGroup3ID" />
    <input type="hidden" id="productGroup4ID" />
    <input type="hidden" id="productGroup5ID" />
    <input type="hidden" id="productGroup6ID" />
    <input type="hidden" id="productGroup7ID" />
    <input type="hidden" id="actionGroupType" />

    <script type="text/javascript">

        $('#btnConfirmPrGr').click(function () {
            var actionGroupType = $('#actionGroupType').val();
            if (actionGroupType == 'setGroup1') {
                var ProductID1 = $('#productGroup1ID').val();
                var xmlhttp;
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                }
                else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        if (xmlhttp.responseText != "error1") {
                            window.location.reload();
                            $(".modal-body").html("sản phẩm đã them vao Group 1 thành công");
                            $("#reload-dialog").modal();
                        }
                    }
                }
                xmlhttp.open("GET", "../backend/adAjax.aspx?action=setProductGroup1&productGroup1ID=" + ProductID1 + "", true);
                xmlhttp.send();
            }
            if (actionGroupType == 'removeGroup1') {
                var ProductID1 = $('#productGroup1ID').val();
                var xmlhttp;
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                }
                else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        if (xmlhttp.responseText != "error1") {
                            window.location.reload();
                            $(".modal-body").html("sản phẩm đã remove ra khoi Group 1 thành công");
                            $("#reload-dialog").modal();
                        }
                    }
                }
                xmlhttp.open("GET", "../backend/adAjax.aspx?action=removeProductGroup1&productGroup1ID=" + ProductID1 + "", true);
                xmlhttp.send();
            }
            if (actionGroupType == 'setGroup2') {
                var ProductID2 = $('#productGroup2ID').val();
                var xmlhttp;
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                }
                else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        if (xmlhttp.responseText == "error2") {
                            window.location.reload();
                            $(".modal-body").html("sản phẩm đã them vao Group 2 thành công");
                            $("#reload-dialog").modal();
                           // return false;
                        }
                    }
                }
                xmlhttp.open("GET", "../backend/adAjax.aspx?action=setProductGroup2&productGroup2ID=" + ProductID2 + "", true);
                xmlhttp.send();
            }
            if (actionGroupType == 'setGroup3') {
                var ProductID3 = $('#productGroup3ID').val();
                var xmlhttp;
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                }
                else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        if (xmlhttp.responseText == "error3") {
                            window.location.reload();
                            $(".modal-body").html("sản phẩm đã them vao Group 3 thành công");
                            $("#reload-dialog").modal();
                            // return false;
                        }
                    }
                }
                xmlhttp.open("GET", "../backend/adAjax.aspx?action=setProductGroup3&productGroup3ID=" + ProductID3 + "", true);
                xmlhttp.send();
            }
            if (actionGroupType == 'setGroup4') {
                var ProductID4 = $('#productGroup4ID').val();
                var xmlhttp;
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                }
                else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        if (xmlhttp.responseText == "error4") {
                            window.location.reload();
                            $(".modal-body").html("sản phẩm đã them vao Group 4 thành công");
                            $("#reload-dialog").modal();
                            // return false;
                        }
                    }
                }
                xmlhttp.open("GET", "../backend/adAjax.aspx?action=setProductGroup4&productGroup4ID=" + ProductID4 + "", true);
                xmlhttp.send();
            }
            if (actionGroupType == 'setGroup5') {
                var ProductID5 = $('#productGroup5ID').val();
                var xmlhttp;
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                }
                else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        if (xmlhttp.responseText == "error5") {
                            window.location.reload();
                            $(".modal-body").html("sản phẩm đã them vao Group 5 thành công");
                            $("#reload-dialog").modal();
                            // return false;
                        }
                    }
                }
                xmlhttp.open("GET", "../backend/adAjax.aspx?action=setProductGroup5&productGroup5ID=" + ProductID5 + "", true);
                xmlhttp.send();
            }
            if (actionGroupType == 'setGroup6') {
                var ProductID6 = $('#productGroup6ID').val();
                var xmlhttp;
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                }
                else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        if (xmlhttp.responseText == "error6") {
                            window.location.reload();
                            $(".modal-body").html("sản phẩm đã them vao Group 6 thành công");
                            $("#reload-dialog").modal();
                            // return false;
                        }
                    }
                }
                xmlhttp.open("GET", "../backend/adAjax.aspx?action=setProductGroup6&productGroup6ID=" + ProductID6 + "", true);
                xmlhttp.send();
            }
            if (actionGroupType == 'setGroup7') {
                var ProductID7 = $('#productGroup7ID').val();
                var xmlhttp;
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                }
                else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        if (xmlhttp.responseText == "error7") {
                            window.location.reload();
                            $(".modal-body").html("sản phẩm đã them vao Group 7 thành công");
                            $("#reload-dialog").modal();
                            // return false;
                        }
                    }
                }
                xmlhttp.open("GET", "../backend/adAjax.aspx?action=setProductGroup7&productGroup7ID=" + ProductID7 + "", true);
                xmlhttp.send();
            }
            $('#PrGroup-dialog').modal('hide');
        });

        $('#btnConfirmDelete').click(function () {
            var ProductID = $('#productDeleteID').val();
                var xmlhttp;
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                }
                else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        if (xmlhttp.responseText != "error") {
                            $(".modal-body").html("sản phẩm \"" + ProductName + "\" đã xóa thành công");
                            $("#confirm-dialog").modal();
                            //document.location.reload();
                            //delete success
                            //$('#ContentPlaceHolder1_dvGroupCustomerList').html(xmlhttp.responseText);
                        }
                    }
                }
                xmlhttp.open("GET", "../backend/adAjax.aspx?action=deleteProduct&productDeleteID=" + ProductID + "", true);
                xmlhttp.send();           
            $('#confirm-dialog').modal('hide');
        });

        function Delete(elmnt, ProductID, ProductName) {
            $(".modal-body").html("Bạn chắc chắn muốn xóa sản phẩm \"" + ProductName + "\"?");
            $("#confirm-dialog").modal();
            $('#productDeleteID').val(ProductID);
        }

        function SelectGroup1(elmnt, ProductID, ProductName) {
            $(".modal-body").html("Bạn chắc chắn muốn them SP \"" + ProductName + "\"  vao Group 1 khong?");
            $("#PrGroup-dialog").modal();
            $('#productGroup1ID').val(ProductID); 
            $('#actionGroupType').val('setGroup1');
        }
        function RemoveGroup1(elmnt, ProductID, ProductName) {
            $(".modal-body").html("Bạn chắc chắn muốn remove SP \"" + ProductName + "\"  kho Group 1 khong?");
            $("#PrGroup-dialog").modal();
            $('#productGroup1ID').val(ProductID);
            $('#actionGroupType').val('removeGroup1');
        }
        function SelectGroup2(elmnt, ProductID, ProductName) {
            $(".modal-body").html("Bạn chắc chắn muốn them SP \"" + ProductName + "\"  vao Group 2 khong?");
            $("#PrGroup-dialog").modal();
            $('#productGroup2ID').val(ProductID);
            $('#actionGroupType').val('setGroup2');
        }
        function SelectGroup3(elmnt, ProductID, ProductName) {
            $(".modal-body").html("Bạn chắc chắn muốn them SP \"" + ProductName + "\"  vao Group 3 khong?");
            $("#PrGroup-dialog").modal();
            $('#productGroup3ID').val(ProductID);
            $('#actionGroupType').val('setGroup3');
        }
        function SelectGroup4(elmnt, ProductID, ProductName) {
            $(".modal-body").html("Bạn chắc chắn muốn them SP \"" + ProductName + "\"  vao Group 4 khong?");
            $("#PrGroup-dialog").modal();
            $('#productGroup4ID').val(ProductID);
            $('#actionGroupType').val('setGroup4');
        }
        function SelectGroup5(elmnt, ProductID, ProductName) {
            $(".modal-body").html("Bạn chắc chắn muốn them SP \"" + ProductName + "\"  vao Group 5 khong?");
            $("#PrGroup-dialog").modal();
            $('#productGroup5ID').val(ProductID);
            $('#actionGroupType').val('setGroup5');
        }
        function SelectGroup6(elmnt, ProductID, ProductName) {
            $(".modal-body").html("Bạn chắc chắn muốn them SP \"" + ProductName + "\"  vao Group 6 khong?");
            $("#PrGroup-dialog").modal();
            $('#productGroup6ID').val(ProductID);
            $('#actionGroupType').val('setGroup6');
        }
        function SelectGroup7(elmnt, ProductID, ProductName) {
            $(".modal-body").html("Bạn chắc chắn muốn them SP \"" + ProductName + "\"  vao Group 7 khong?");
            $("#PrGroup-dialog").modal();
            $('#productGroup7ID').val(ProductID);
            $('#actionGroupType').val('setGroup7');
        }
        

    </script>


<!-- page content -->
        <div class="right_col" role="main">
            <div class="">
              <div class="page-title">
                <div class="title_left">
                  <h3>DANH SÁCH SẢN PHẨM ĐANG CÓ</h3>
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

                <div class="col-md-12 col-sm-12 col-xs-12"> <!-- Table  -->
                    <div class="x_panel">
                      <div class="x_title">
                        <div class="col-md-6 col-sm-6 sol-xs-12">
                            <p style="margin-bottom: 2px;">Số 1: Sản phẩm sẽ hiển thị ở group SẢN PHẨM MỚI NHẤT  </p>
                            <p style="margin-bottom: 2px;">Số 2: Sản phẩm sẽ hiển thị ở group NHIỀU NGƯỜI TÌM NHẤT  </p>
                            <p style="margin-bottom: 2px;">Số 3: Sản phẩm sẽ hiển thị ở group SẢN PHẨM ĐỘC, LẠ </p>
                            <p style="margin-bottom: 2px;">Số 4: Sản phẩm sẽ hiển thị ở group CÓ GIÁ THUÊ RẺ NHẤT </p>
                        </div>
                        <div class="col-md-6 col-sm-6 sol-xs-12">
                            <p style="margin-bottom: 2px;">Số 5: Sản phẩm sẽ hiển thị ở group SẢN PHẨM GẦN BẠN </p>
                            <p style="margin-bottom: 2px;">Số 6: Sản phẩm sẽ hiển thị ở group RAO VẶT MIỄN PHÍ  </p>
                            <p style="margin-bottom: 2px;">Số 7: Sản phẩm sẽ hiển thị ở group SẢN PHẨM CHO TẶNG </p> 
                        </div>                      
                        <div class="clearfix"></div>
                      </div>
                      <div class="x_content">
                          <div id="tblProductList" runat="server"></div>
                        <%--<table id="datatable" class="table table-striped table-bordered">
                          <thead>
                            <tr>
                              <th>Mã sản phẩm</th>
                              <th>Tên sản phẩm</th>
                              <th>Thuộc Sub-3</th>
                              <th>Thuộc Sub-2</th>
                              <th>Thuộc Sub-1</th>
                              <th>Thuộc MainCategory</th>
                              <th>Thuê theo block</th>
                              <th>Thuê theo ngày</th>
                              <th>Ngày tạo</th>
                              <th>Hiển thị ở</th>
                              <th>Thao tác</th>
                            </tr>
                          </thead>
       
                          <tbody>                         
                            <tr>
                              <td>HS0001</td>
                              <td>Máy khoan bosch</td>
                              <td></td>
                              <td>Xe máy</td>
                              <td>Sửa xe</td>
                              <td>CÔng cụ, Dụng cụ</td>                              
                              <td>30,000</td>
                              <td>100,000</td>
                              <td>23/02/2018</td>
                              <td><a href="#" class="btn btn-primary btn-xs" onclick="Details($(this))">1</a>
                                <span><a href="#" class="btn btn-primary btn-xs" onclick="Edit($(this))">2</a></span>
                                <span><a href="#" class="btn btn-primary btn-xs" onclick="Disable($(this))">3</a></span></td>                         
                              <td><a href="#" class="btn btn-success btn-xs" onclick="Details($(this))"><i class="fa fa-info-circle"></i>&nbspDetails</a>
                                <span><a href="#" class="btn btn-info btn-xs" onclick="Edit($(this))"><i class="fa fa-edit"></i>&nbspEdit</a></span>
                                <span><a href="#" class="btn btn-danger btn-xs" onclick="Disable($(this))"><i class="fa fa-remove"></i>&nbspDisable</a></span></td>
                            </tr>
                            <tr>
                              <td>HS0013</td>
                              <td>Máy khoan bosch</td>
                              <td></td>
                              <td>Xe máy</td>
                              <td>Sửa xe</td>
                              <td>CÔng cụ, Dụng cụ</td>                              
                              <td>30,000</td>
                              <td>100,000</td>
                              <td>23/02/2018</td>
                              <td><a href="#" class="btn btn-primary btn-xs" onclick="Details($(this))">2</a>
                                <span><a href="#" class="btn btn-primary btn-xs" onclick="Edit($(this))">3</a></span>
                                <span><a href="#" class="btn btn-primary btn-xs" onclick="Disable($(this))">5</a></span></td>                         
                              <td><a href="#" class="btn btn-success btn-xs" onclick="Details($(this))"><i class="fa fa-info-circle"></i>&nbspDetails</a>
                                <span><a href="#" class="btn btn-info btn-xs" onclick="Edit($(this))"><i class="fa fa-edit"></i>&nbspEdit</a></span>
                                <span><a href="#" class="btn btn-danger btn-xs" onclick="Disable($(this))"><i class="fa fa-remove"></i>&nbspDisable</a></span></td>
                            </tr>
                            <tr>
                                <td>HS0002</td>
                                <td>Máy khoan bosch</td>
                                <td></td>
                                <td>Xe máy</td>
                                <td>Sửa xe</td>
                                <td>CÔng cụ, Dụng cụ</td>                              
                                <td>30,000</td>
                                <td>100,000</td>
                                <td>23/02/2018</td>
                                <td><a href="#" class="btn btn-primary btn-xs" onclick="Details($(this))">1</a>
                                  <span><a href="#" class="btn btn-primary btn-xs" onclick="Edit($(this))">3</a></span>
                                  <span><a href="#" class="btn btn-primary btn-xs" onclick="Disable($(this))">4</a></span></td>                         
                                <td><a href="#" class="btn btn-success btn-xs" onclick="Details($(this))"><i class="fa fa-info-circle"></i>&nbspDetails</a>
                                  <span><a href="#" class="btn btn-info btn-xs" onclick="Edit($(this))"><i class="fa fa-edit"></i>&nbspEdit</a></span>
                                  <span><a href="#" class="btn btn-danger btn-xs" onclick="Disable($(this))"><i class="fa fa-remove"></i>&nbspDisable</a></span></td>
                              </tr>                                              
                          </tbody>
                        </table>--%>
                      </div>
                    </div>
                  </div>  <!-- /Table -->
              </div> 
            </div>
         
        <!-- /page content -->
</asp:Content>

