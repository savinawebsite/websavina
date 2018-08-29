<%@ Page Title="" Language="C#" MasterPageFile="~/backend/adTemplate.master" AutoEventWireup="true" CodeFile="customer_createnew.aspx.cs" Inherits="backend_customer_createnew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" href="../backend/css/bootstrap-select.css"/>
    <script src="../backend/js/bootstrap-select.js"></script>
   

    <style>
        .btnEditCss {
            display:none;
            float: left;
}
        }
        .btnCreateCss {
            display: block;
            float: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form id="form1" runat="server">
    <!-- Create modal popup DELETE-->
    <div class="modal fade" id="confirmDelete-dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">           
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" style="text-align:center;">SAVINA</h4>
                </div>            
                <div class="modal-body">
                </div>               
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="btnDeleteCancel" data-dismiss="modal">Hủy</button>
                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger btn-ok" OnClick="btnDeleteCustomer" Text="Đồng ý" />
                    <%--<a class="btn btn-danger btn-ok" id="btnDeleteConfirm">Đồng ý</a>  --%>                                     
                </div>
            </div>
        </div>
    </div>
    <!-- /Create modal popup DELETE -->

    <!-- Create modal popup EDIT-->
    <div class="modal fade" id="confirmEdit-dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">           
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" style="text-align:center;">SAVINA</h4>
                </div>            
                <div class="modal-body">
                </div>               
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="btnEditCancel" data-dismiss="modal">Hủy</button>
                   <%-- <a class="btn btn-danger btn-ok" id="btnEditConfirm">Đồng ý</a>--%>
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger btn-ok" OnClick="btnEditCustomer" Text="Thay đổi" />
                </div>
            </div>
        </div>
    </div>
    <!-- /Create modal popup EDIT -->

    <input type="text" id="CusID" runat="server"/>
    <input type="hidden" id="actionType" />

    <script type="text/javascript">
        

        $('#btnDeleteCancel').click(function () {
            ResetView();
        });

        $('#btnEditCancel').click(function () {
            ResetView();
        });
;
        function ResetView() {
            $('#ContentPlaceHolder1_CusID').val('');
            $('#ContentPlaceHolder1_ipcustomerCode').val('');
            $('#ContentPlaceHolder1_ipcustomerLastname').val('');
            $('#ContentPlaceHolder1_ipcustomerFirstname').val('');
            $('#ContentPlaceHolder1_ipcustomerEmail').val('');
            $('#ContentPlaceHolder1_ipcustomerUsername').val('');
            $('#ContentPlaceHolder1_ipcustomerPassword').val('');
            $('#ContentPlaceHolder1_ipcustomerPhoneNumber').val('');
            $('#ContentPlaceHolder1_ipcustomerAddress').val('');
            $('#ContentPlaceHolder1_ipcustomerDesc').val('');
        }

        function btnClear_click() {
            ResetView();
            $(".btnEditCss").css("display", "none");
            $(".btnCreateCss").css("display", "block");
        }

        function btnEdit_click(customerLastname, customerFirstname) {
            var cuslastname = document.getElementById("ContentPlaceHolder1_ipcustomerLastname").value;
            var cusfisrname = document.getElementById("ContentPlaceHolder1_ipcustomerFirstname").value;
            $(".modal-body").html("Bạn chắc chắn muốn sửa khách hàng\"" + cuslastname + " " + cusfisrname + "\"?");
            $("#confirmEdit-dialog").modal();
        }

        function Delete(elmnt, CusID, customerLastname, customerFirstname) {
            var temp = CusID;
            document.getElementById("ContentPlaceHolder1_CusID").value = temp;
            $('#CusID').val(CusID);
            $(".modal-body").html("Bạn chắc chắn muốn xóa\"" + customerLastname + " " + customerFirstname + "\"?");
            $("#confirmDelete-dialog").modal();
        }

        function Edit(elmnt, CusID, customerCode, customerLastname, customerFirstname, customerEmail, customerPhoneNumber, customerAddress, customerUsername, customerPass, customerGroup, customerDesc) {
            var temp1 = CusID;
            document.getElementById("ContentPlaceHolder1_CusID").value = temp1;
            $('#ContentPlaceHolder1_ipcustomerCode').val(customerCode);
            $('#ContentPlaceHolder1_ipcustomerLastname').val(customerLastname);
            $('#ContentPlaceHolder1_ipcustomerFirstname').val(customerFirstname);
            $('#ContentPlaceHolder1_ipcustomerEmail').val(customerEmail);
            $('#ContentPlaceHolder1_ipcustomerPhoneNumber').val(customerPhoneNumber);
            $('#ContentPlaceHolder1_ipcustomerAddress').val(customerAddress);
            $('#ContentPlaceHolder1_ipcustomerUsername').val(customerUsername);
            $('#ContentPlaceHolder1_ipcustomerPassword').val(customerPass); 
            $('#ipcustomerGroupSelection').val(customerGroup); 
            $('#ContentPlaceHolder1_ipcustomerDesc').val(customerDesc);
            $(".btnEditCss").css("display", "block");
            $(".btnCreateCss").css("display", "none");
        }

    </script>

<!-- page content -->
        <div class="right_col" role="main">
            <div class="">
              <div class="page-title">
                <div class="title_left">
                  <h3>TẠO KHÁCH HÀNG MỚI</h3>
                </div>
              </div>
  
              <div class="clearfix"></div>
  
              <div class="row">   
                <div class="col-md-12 col-sm-12 col-xs-12">   <!-- Create new category -->
                  <div class="x_panel">
                    <div class="x_content">
                        <br />
                        <div class="form-horizontal form-label-left"/>
                          <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">Mã khách hàng</label>
                              <div class="col-md-8 col-sm-8 col-xs-12">
                                <input type="text" id="ipcustomerCode" runat="server" class="form-control col-md-7 col-xs-12"/>
                              </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">Họ khách hàng</label>
                              <div class="col-md-8 col-sm-8 col-xs-12">
                                <input type="text" id="ipcustomerLastname" runat="server" name="last-name" class="form-control col-md-7 col-xs-12"/>
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Tên khách hàng</label>
                              <div class="col-md-8 col-sm-8 col-xs-12">
                                <input type="text" id="ipcustomerFirstname" runat="server" name="first-name" class="form-control col-md-7 col-xs-12"/>
                              </div>
                            </div>                                                       
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Email</label>
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                <input type="email" id="ipcustomerEmail" runat="server" name="email" class="form-control"/>
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Số điện thoại</label>
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                <input type="number" id="ipcustomerPhoneNumber" runat="server" name="phone-number" class="form-control"/>
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Địa chỉ</label>
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                <input type="text" id="ipcustomerAddress" runat="server" name="address" class="form-control"/>
                              </div>
                            </div>                          
                          </div>

                          <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Tên đang nhập</label>
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                <input type="text" id="ipcustomerUsername" runat="server" name="username" class="form-control"/>
                              </div>
                            </div> 
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Password</label>
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                <input type="text" id="ipcustomerPassword" runat="server" name="username" class="form-control"/>
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Thuộc nhóm khách hàng</label>
                              <div class="col-md-8 col-sm-8 col-xs-12" id="dvDropdownGrCus" runat="server">
                                <%--<select class="form-control" id="ipcustomerGroupSelection">
                                  <option>Lựa chọn nhóm khách hàng</option>
                                  <option>Khách hàng thông thường</option>
                                  <option>Khách hàng thân thiết</option>
                                  <option>Khách hàng đặc biệt</option>
                                </select>--%>
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Mô tả nhanh</label>
                              <div class="col-md-8 col-sm-8 col-xs-12">
                                  <textarea class="resizable_textarea form-control" id="ipcustomerDesc" runat="server" placeholder="độ dài trường nhập liệu tự động mở rộng..."></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Chọn hình đại diện</label>
                              <div class="btn-group">
                                <asp:FileUpload ID="ipcustomerAvatarFile" CssClass="btn-group btn btn-info btn-xs" runat="server" />
                              </div>
                            </div>
                          </div>
                          
                        
                        <div class="ln_solid"></div>
                          <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <button class="btn btn-info" type="reset" onclick="btnClear_click()">Reset</button>
                                <asp:Button ID="btnCreate" runat="server" CssClass="btn btn-primary btnCreateCss" OnClick="btnCreateCustomer" Text="Tạo khách hàng" />
                                <button type="button" class="btn btn-warning btnEditCss" onclick="btnEdit_click()">Sửa thông tin</button>
                                
                            </div>
                          </div>
                        </div> <!-- /x_content -->
                    </div> <!-- /x_panel -->
                </div> <!-- /Create new category -->
            

                    <div class="col-md-12 col-sm-12 col-xs-12">  <!-- data list -->
                        <div class="x_panel">
                            <div class="x_content" id="tblCustomerList" runat="server">
                          <!-- data table fetched from code behind here -->   
                            </div> <!-- /x_content -->
                        </div> <!-- /x_panel -->
                    </div>    <!-- /data list -->
            
                </div> <!-- /row -->
            </div> 
          </div>
        </form>
        <!-- /page content -->
</asp:Content>

