<%@ Page Title="" Language="C#" MasterPageFile="~/backend/adTemplate.master" AutoEventWireup="true" CodeFile="category_main.aspx.cs" Inherits="backend_category_main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>
        input[type=number]::-webkit-inner-spin-button, 
        input[type=number]::-webkit-outer-spin-button {  
        opacity: 1;

}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <!--modal popup for CREATE EDIT DELETE -->
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
                    <a class="btn btn-danger btn-ok" id="btnConfirm">Đồng ý</a>
                </div>
            </div>
        </div>
    </div>

    <!--modal popup for change SORT -->
    <div class="modal fade" id="sortConfirm-dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">            
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" style="text-align:center;">SAVINA</h4>
                </div>           
                <div class="modal-body row">
                    <div class="col-md-9 col-sm-9 col-xs-12"><p>Nhập vào số thứ tự hiển thị mong muốn thay đổi và click Đồng Ý</p></div>
                    <div class="col-md-3 col-sm-3 col-xs-12"><input type="number" id="ipEditSort" name="edit-sort-arrange" required="required" class="form-control"/></div>
                </div>              
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="btnSortCancel" data-dismiss="modal">Hủy</button>
                    <a class="btn btn-danger btn-ok" id="btnSortConfirm">Đồng ý</a>
                </div>
            </div>
        </div>
    </div>

        <!--modal popup for change ENABLE -->
    <div class="modal fade" id="EnableConfirm-dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">            
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" style="text-align:center;">SAVINA</h4>
                </div>           
                <div class="modal-body">

                </div>              
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="btnEnableCancel" data-dismiss="modal">Hủy</button>
                    <a class="btn btn-danger btn-ok" id="btnEnableConfirm">Đồng ý</a>
                </div>
            </div>
        </div>
    </div>

    <input type="hidden" id="cateID" />
    <input type="hidden" id="actionType" />
    <input type="hidden" id="maincateEditSortID" />
    <input type="hidden" id="maincateEnableID" />
    <input type="hidden" id="maincateDisableID" />
    <input type="hidden" id="actionEnableType" />
    
    
    <!-- Begin - Javascript insert category to database -->
        <script type="text/javascript"> 
            $('#btnCancel').click(function () {
                ResetView();
            });

            $('#btnSortConfirm').click(function () {
                var mainCateSortID = $('#maincateEditSortID').val();
                var newSort = $('#ipEditSort').val();
                var xmlhttp;
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                }
                else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        if (xmlhttp.responseText == "errorSort") {
                            window.location.reload();
                            $(".modal-body").html("Đã thay đổi thứ tự hiển thị thành công");
                            $("#reload-dialog").modal();
                            // return false;
                        }
                    }
                }
                xmlhttp.open("GET", "../backend/adAjax.aspx?action=editMainCateSort&mainCateSortID=" + mainCateSortID + "&newSort=" + newSort + "", true);
                xmlhttp.send();              
                $('#sortConfirm-dialog').modal('hide');
            });

            $('#btnEnableConfirm').click(function () {
                var actionEnableType = $('#actionEnableType').val();
                if (actionEnableType == 'editDisableMainCate') {
                    var maincateDisableID = $('#maincateDisableID').val();
                    var xmlhttp;
                    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                        xmlhttp = new XMLHttpRequest();
                    }
                    else {// code for IE6, IE5
                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                            if (xmlhttp.responseText != "errorDisable") {
                                window.location.reload();
                                $(".modal-body").html("Đã Disable mainacte thành công");
                                $("#reload-dialog").modal();
                            }
                        }
                    }
                    xmlhttp.open("GET", "../backend/adAjax.aspx?action=setDisableMainCate&maincateDisableID=" + maincateDisableID + "", true);
                    xmlhttp.send();
                }
                if (actionEnableType == 'editEnablelMainCate') {
                    var maincateEnableID = $('#maincateEnableID').val();
                    var xmlhttp;
                    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                        xmlhttp = new XMLHttpRequest();
                    }
                    else {// code for IE6, IE5
                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                            if (xmlhttp.responseText != "errorEnable") {
                                window.location.reload();
                                $(".modal-body").html("Đã Enable maincate thành công");
                                $("#reload-dialog").modal();
                            }
                        }
                    }
                    xmlhttp.open("GET", "../backend/adAjax.aspx?action=setEnableMainCate&maincateEnableID=" + maincateEnableID + "", true);
                    xmlhttp.send();
                }
                $('#EnableConfirm-dialog').modal('hide');
            });
       
            $('#btnConfirm').click(function () {
                var actionType = $('#actionType').val();
                if (actionType == 'delete') {
                    var cateID = $('#cateID').val();
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
                                //delete success
                                $('#ContentPlaceHolder1_dvMainCateList').html(xmlhttp.responseText);
                            }
                        }
                    }
                    xmlhttp.open("GET", "../backend/adAjax.aspx?action=deleteMainCate&cateID=" + cateID + "", true);
                    xmlhttp.send();
                }
                if (actionType == 'edit') {
                    var cateName = $('#ipCateName').val();
                    var desc = $('#ipDesc').val();
                    var cateSort = $('#ipSort').val();
                    var cateID = $('#cateID').val();
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
                                //edit success
                                ResetView()
                                $('#btnCreate').html('Tạo');
                                $('#ContentPlaceHolder1_dvMainCateList').html(xmlhttp.responseText);
                            }
                        }
                    }
                    xmlhttp.open("GET", "../backend/adAjax.aspx?action=editMainCate&cateID=" + cateID + "&cateName=" + cateName + "&desc=" + desc + "&cateSort=" + cateSort + "", true);
                    xmlhttp.send();
                }
                $('#confirm-dialog').modal('hide');
                });
            
      
            function Delete(elmnt, cateID, cateName) {
                $(".modal-body").html("Bạn chắc chắn muốn xóa mục \""+cateName+"\"?");
                $("#confirm-dialog").modal();
                $('#cateID').val(cateID);
                $('#actionType').val('delete');
            }

            function btnChangeSort(elmnt, maincateID) {
                $("#sortConfirm-dialog").modal();
                $('#maincateEditSortID').val(maincateID);
            }

            function btnChangeDisable(elmnt, maincateID, maincateName) {
                $(".modal-body").html("Bạn chắc chắn muốn DISABLE \"" + maincateName + "\" này chứ?");
                $("#EnableConfirm-dialog").modal();
                $('#maincateDisableID').val(maincateID);
                $('#actionEnableType').val('editDisableMainCate');
            }

            function btnChangeEnable(elmnt, maincateID, maincateName) {
                $(".modal-body").html("Bạn chắc chắn muốn ENABLE \"" + maincateName + "\" này chứ?");
                $("#EnableConfirm-dialog").modal();
                $('#maincateEnableID').val(maincateID);
                $('#actionEnableType').val('editEnablelMainCate');
            }

            function EditConfirm(cateName) {
                $(".modal-body").html("Bạn chắc chắn muốn sửa mục \"" + cateName + "\"?");
                $("#confirm-dialog").modal();
            }

            function Edit(elmnt, cateID, cateName, cateDesc, cateSort) {
                $('#ipCateName').val(cateName);
                $('#ipDesc').val(cateDesc);
                $('#ipSort').val(cateSort);
                $('#cateID').val(cateID);
                $('#actionType').val('edit');
                $('#btnCreate').html('Sửa');
            }

            function ResetView() {
                $('#ipCateName').val('');
                $('#ipDesc').val('');
                $('#ipSort').val('');
                $('#cateID').val('');
                $('#actionType').val('');
            }

            $(function()   {  
                $('#btnCreate').click(function () {
                    var cateName = $('#ipCateName').val();
                    var desc = $('#ipDesc').val();
                    var cateSort = $('#ipSort').val();
                    var bannerFile = $('#bannerUpload')[0].files[0].name;
                    if (cateName != '' && desc != '' && cateSort != 0 && bannerFile != '') {
                        var action = $('#btnCreate').text();
                        if (action == "Tạo") {
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
                                        //create success
                                        ResetView()
                                        $('#ContentPlaceHolder1_dvMainCateList').html(xmlhttp.responseText);
                                    }
                                }
                            }
                            xmlhttp.open("GET", "../backend/adAjax.aspx?action=createMainCate&cateName=" + cateName + "&bannerFile=" + bannerFile + "&desc=" + desc + "&cateSort=" + cateSort + "", true);
                            xmlhttp.send();
                        }
                        if (action == "Sửa") {
                            EditConfirm(cateName)
                        }

                    } else {
                        $(".modal-body").html("Vui lòng điền đầy đủ các thông tin");
                        $("#alertDialog").modal();
                        return false;
                    }
                })  
            });  
        </script>  
    <!-- End - Javascript insert category to database -->



    <!-- page content -->
   <div class="right_col" role="main">
            <div class="">
              <div class="page-title">
                <div class="title_left">
                  <h3>QUẢN LÝ MAIN CATEGORY</h3>
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
                  <div class="x_panel">
                    <div class="x_title">
                      <h2>Tạo 1 category mới</h2>
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
                        <form id="demo-form2" class="form-horizontal form-label-left">   
                                  <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Tên Main-Category <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                      <input type="text" id="ipCateName" required="required" class="form-control col-md-7 col-xs-12"/>
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Mô tả nhanh <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                      <input type="text" id="ipDesc" name="last-name" required="required" class="form-control col-md-7 col-xs-12"/>
                                    </div>
                                  </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sort-arrange">Sort thứ tự <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                      <input type="number" id="ipSort" name="sort-arrange" required="required" class="form-control col-md-7 col-xs-12"/>
                                    </div>
                                  </div>
                       
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="select-image">Chọn banner <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12" style="padding-top: 8px;">
                                        <div class="btn-group btn btn-info btn-xs" style="width:215px">
                                            <input type="file" onchange="readURL(this);" data-role="magic-overlay" id="bannerUpload" name="bannerUpload" data-target="#pictureBtn" data-edit="insertImage" accept="image/png, image/jpeg"/>
                                             
                                        </div> 
                                        <div style="margin-top:20px;">   
                                             <img id="mBannerTemp" src="#" alt="" />
                                        </div>                      
                                    </div>
                                </div>                       
                                  <div class="ln_solid"></div>
                                  <div class="form-group">
                                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                      <button class="btn btn-primary" type="button">Hủy</button>
                                      <button class="btn btn-primary" type="reset">Reset</button>
                                      <button id="btnCreate" type="button" class="btn btn-success">Tạo</button>
                                    </div>
                                  </div>   
                         </form> 
                      </div>
                  </div>
                </div> <!-- /Create new category -->

                <div class="col-md-12 col-sm-12 col-xs-12">
                     <!-- Table  -->
                  <div class="x_panel">
                      <div class="x_title">
                        <h2>Danh sách Category đang có</h2>
                        <ul class="nav navbar-right panel_toolbox">
                          <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                          </li>
                          <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                            <ul class="dropdown-menu" role="menu">
                              <li><a href="#">Settings 1</a>
                              </li>
                              <li><a href="#">Settings 2</a>
                              </li>
                            </ul>
                          </li>
                          <li><a class="close-link"><i class="fa fa-close"></i></a>
                          </li>
                        </ul>
                        <div class="clearfix"></div>
                      </div>
    
                      <div class="x_content">
                        <div class="table-responsive" id="dvMainCateList" runat="server">
                             <!-- inner html from code behind -->
                        </div>     
                                                     
                      </div>
                    </div>
                    <!-- /Table -->
                </div>           
              </div> 
            </div>
          </div>     
    <!-- /page content -->
        <script>
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#mBannerTemp')
                            .attr('src', e.target.result)
                            .width(150)
                            .height(100);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }

            
        </script>
</asp:Content>

