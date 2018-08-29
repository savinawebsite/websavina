<%@ Page Title="" Language="C#" MasterPageFile="~/backend/adTemplate.master" AutoEventWireup="true" CodeFile="customer_group.aspx.cs" Inherits="backend_customer_group" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="btnCancel" data-dismiss="modal">Hủy</button>
                    <a class="btn btn-danger btn-ok" id="btnConfirm">Đồng ý</a>
                </div>
            </div>
        </div>
    </div>
    <!-- /Create modal popup -->

    <input type="hidden" id="groupCusID" />
    <input type="hidden" id="actionType" />

    <script type="text/javascript">
        $('#btnCancel').click(function () {
            ResetView();
        });

        $('#btnConfirm').click(function () {
            var actionType = $('#actionType').val();
            if (actionType == 'delete') {
                var groupCusID = $('#groupCusID').val();
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
                            //$('#ContentPlaceHolder1_dvGroupCustomerList').html(xmlhttp.responseText);
                        }
                    }
                }
                xmlhttp.open("GET", "../backend/adAjax.aspx?action=deleteGroupCustomer&groupCusID=" + groupCusID + "", true);
                xmlhttp.send();
            }
            if (actionType == 'edit') {
                var groupCusID = $('#groupCusID').val();
                var groupCode = $('#ipGroupCode').val();
                var groupName = $('#ipGroupName').val();
                var groupDesc = $('#ipGroupDesc').val();
                var groupValue = $('#ipGroupValue').val();

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
                            //$('#ContentPlaceHolder1_dvGroupCustomerList').html(xmlhttp.responseText);
                        }
                    }
                }
                xmlhttp.open("GET", "../backend/adAjax.aspx?action=editGroupCustomer&groupCusID=" + groupCusID + "&groupCode=" + groupCode + "&groupName=" + groupName + "&groupDesc=" + groupDesc + "&groupValue=" + groupValue + "", true);
                xmlhttp.send();
            }
            $('#confirm-dialog').modal('hide');
        });

        function ResetView() {
            $('#ipGroupCode').val('');
            $('#ipGroupName').val('');
            $('#ipGroupDesc').val('');
            $('#ipGroupValue').val('');
            $('#actionType').val('');
        }

        function Delete(elmnt, groupCusID, groupName) {
            $(".modal-body").html("Bạn chắc chắn muốn xóa mục \"" + groupName + "\"?");
            $("#confirm-dialog").modal();
            $('#groupCusID').val(groupCusID);
            $('#actionType').val('delete');
        }

        function EditConfirm(groupName) {
            $(".modal-body").html("Bạn chắc chắn muốn sửa nhóm \"" + groupName + "\"không ?");
            $("#confirm-dialog").modal();
        }

        function Edit(elmnt, groupCusID, groupCode, groupName, groupDesc, groupValue) {
            $('#ipGroupCode').val(groupCode);
            $('#ipGroupName').val(groupName);
            $('#ipGroupDesc').val(groupDesc);
            $('#ipGroupValue').val(groupValue);
            $('#groupCusID').val(groupCusID);
            $('#actionType').val('edit');
            $('#btnCreate').html('Sửa');
        }

        $(function()   {  
            $('#btnCreate').click(function() {
                var groupCode = $('#ipGroupCode').val();
                var groupName = $('#ipGroupName').val();
                var groupDesc = $('#ipGroupDesc').val();
                var groupValue = $('#ipGroupValue').val();
                if (groupCode != '' && groupName != '' && groupDesc != '' && groupValue != 0) {
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
                                    //$('#ContentPlaceHolder1_dvGroupCustomerList').html(xmlhttp.responseText);
                                }
                            }
                        }
                        xmlhttp.open("GET", "../backend/adAjax.aspx?action=createGroupCustomer&groupCode=" + groupCode + "&groupName=" + groupName + "&groupDesc=" + groupDesc + "&groupValue=" + groupValue + "", true);
                        xmlhttp.send();
                    }
                    if (action == "Sửa") {
                        //EditConfirm(groupName)
                        $(".modal-body").html("Bạn chắc chắn muốn sửa nhóm \"" + groupName + "\"không ?");
                        $("#confirm-dialog").modal();
                    }
                } else {
                    $(".modal-body").html("Vui lòng điền đầy đủ các thông tin");
                    $("#alertDialog").modal();
                    return false;
                }              
            })
        });
           
    </script>

<!-- page content -->
        <div class="right_col" role="main">
            <div class="">
              <div class="page-title">
                <div class="title_left">
                  <h3>QUẢN LÝ NHÓM KHÁCH HÀNG</h3>
                </div>
              </div>
  
              <div class="clearfix"></div>
  
              <div class="row">   
                <div class="col-md-12 col-sm-12 col-xs-12">   <!-- Create new category -->
                  <div class="x_panel">
                    <div class="x_title">
                      <h2>Tạo nhóm khách hàng mới</h2>
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
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Mã nhóm khách hàng <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="text" id="ipGroupCode" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Tên nhóm khách hàng <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="text" id="ipGroupName" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Mô tả về nhóm <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="text" id="ipGroupDesc" name="last-name" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Giá trị cần <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="text" id="ipGroupValue" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>
                          <div class="ln_solid"></div>
                          <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                              <button class="btn btn-primary" type="reset">Reset</button>
                              <button id="btnCreate" class="btn btn-success">Tạo</button>
                            </div>
                          </div>
    
                        </form>
                      </div>
                  </div>
                </div> <!-- /Create new category -->

                <div class="col-md-12 col-sm-12 col-xs-12"> <!-- Data Table  -->
                    <div class="x_panel">
                      <div class="x_title">
                        <h2>DANH SÁCH NHÓM KHÁCH HÀNG ĐANG CÓ</h2>
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
                          <div id="dvGroupCustomerList" runat="server">
                            <!-- inner html from code behind -->
                        <%--<table  class="table table-striped table-bordered">
                          <thead>
                            <tr>
                              <th>Mã nhóm</th>
                              <th>Tên nhóm</th>
                              <th>Mô tả về nhóm</th>
                               <th>Giá trị cần</th>
                              <th>Tình trạng</th>
                              <th>Ngày tạo</th>
                              <th>Thao tác</th>
                            </tr>
                          </thead>     
                          <tbody>                         
                            <tr>
                              <td>CUSGR001</td>
                              <td>Khách bình thường</td>
                              <td>Là nhóm khách hàng mới được tạo, chưa được phúc lợi gì cả</td>
                              <td>0</td>
                               <td>Enable</td>
                              <td>23/02/2018 15:25:50</td>
                              <td><a href="#" class="btn btn-info btn-xs" onclick="Edit($(this))"><i class="fa fa-edit"></i>&nbspEdit</a>
                                <span><a href="#" class="btn btn-danger btn-xs" onclick="Edit($(this))"><i class="fa fa-edit"></i>&nbspDelete</a></span></td>
                            </tr>                                                 
                          </tbody>
                        </table>--%>
                          </div>
                      </div> <!-- /x_content -->
                    </div>   <!-- /x_panel -->
                  </div>  <!-- /data Table -->
              </div> <!-- /Row -->
            </div>
          </div>
        <!-- /page content -->
</asp:Content>

