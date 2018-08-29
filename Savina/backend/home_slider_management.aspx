<%@ Page Title="" Language="C#" MasterPageFile="~/backend/adTemplate.master" AutoEventWireup="true" CodeFile="home_slider_management.aspx.cs" Inherits="backend_home_slider_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        input[type=number]::-webkit-inner-spin-button, 
        input[type=number]::-webkit-outer-spin-button {  
        opacity: 1;
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

    <input type="text" id="sliderID" runat="server"/>

    <script type="text/javascript">
        function Delete(elmnt, sliderID) {
            var temp = sliderID;
            document.getElementById("ContentPlaceHolder1_sliderID").value = temp;
            $('#sliderID').val(sliderID);
            $(".modal-body").html("Bạn chắc chắn muốn xóa slide này không ?");
            $("#confirmDelete-dialog").modal();
        }

    </script>

      <!-- page content -->
    <div class="right_col" role="main">
        <div class="">
            <div class="page-title">
            <div class="title_left">
                <h3>QUẢN LÝ MAIN SLIDER TRANG HOMEPAGE</h3>
            </div>
            </div>
        </div>
        <div class="clearfix"></div>
        
            <div class="row"> 
                <div class="col-md-12 col-sm-12 col-xs-12">   <!-- Main Banner -->
                      <div class="x_panel">
                        <div class="x_title">
                          <h2>Quản lý Main Slider </h2>
                          <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                          </ul>
                          <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <br />
                                <div id="demo-form2" class="form-horizontal form-label-left">   
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="landing-page">Trang đích
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="ipSliderLanding" runat="server" class="form-control col-md-7 col-xs-12"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="header-row1">Header dòng 1 
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="ipSliderHeader1" runat="server" class="form-control col-md-7 col-xs-12"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="header-row2">Header dòng 2 
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="ipSliderHeader2" runat="server" class="form-control col-md-7 col-xs-12"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sort-arrange">Sort thứ tự
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="number" id="ipSliderSort" runat="server" name="sort-arrange" class="form-control col-md-7 col-xs-12"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sort-arrange">Chọn image
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <asp:FileUpload ID="ipSliderFile" CssClass="btn-group btn btn-info btn-xs" runat="server" />
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                      <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                              <button class="btn btn-info" type="reset">Reset</button>
                                              <asp:Button ID="Button15" runat="server" CssClass="btn btn-primary"  OnClick="btnMain_banner" Text="UPLOAD" />
                                            </div>
                                      </div>   
                                </div>
                            </div>
                      </div>
                    </div> <!-- /Main banner -->
                          
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Các slider đang có </h2>
                             </div>
                             <div class="x_content">
                                <br />
                                <table class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Vị trí hiển thị</th>
                                        <th>trang đích</th>
                                        <th>Ngày upload</th>
                                        <th>Header dòng 1</th>
                                        <th>Header dòng 2</th>
                                        <th>Image sẽ hiễn thị</th>
                                        <th>Thao tác</th>                              
                                    </tr>
                                    </thead>       
                                    <tbody id="tblMainSlider" runat="server">                         
                                                                             
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>                          
            </div>       
        </div>
    </form>
</asp:Content>

