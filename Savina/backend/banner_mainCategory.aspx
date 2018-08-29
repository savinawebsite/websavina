<%@ Page Title="" Language="C#" MasterPageFile="~/backend/adTemplate.master" AutoEventWireup="true" CodeFile="banner_mainCategory.aspx.cs" Inherits="backend_banner_mainCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<script type="text/javascript"> 
    $( document ).ready(function() {
        fetchMainCateTb();
    });

    function fetchMainCateTb() {
        var xmlhttp;
        if (window.XMLHttpRequest) {
            xmlhttp = new XMLHttpRequest();
        }
        else {
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                if (xmlhttp.responseText != "error") {
                    $('#tblBannerMainCat').html(xmlhttp.responseText);
                }
            }
        }
        xmlhttp.open("GET", "../backend/adAjax.aspx?action=fetchMainCateBannerTb", true);
        xmlhttp.send();
    }
</script>



<form id="form1" runat="server">
      <!-- page content -->
    <div class="right_col" role="main">
        <div class="">
            <div class="page-title">
            <div class="title_left">
                <h3>QUẢN LÝ CÁC BANNER TỪNG MAIN CATEGORY</h3>
            </div>
            </div>
        </div>
        <div class="clearfix"></div>
        
        <!-- Data table -->
        <div class="row">                          
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                            <div class="x_title">
                              <h2>CÁC MAIN CATEGORY ĐANG CÓ </h2>
                              <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                              </ul>
                              <div class="clearfix"></div>
                            </div>
                             <div class="x_content">
                                <br />
                                <table class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Tên Main Category</th>
                                            <th>Ngày upload</th>
                                            <th>Image sẽ hiển thị</th>
                                            <th>Chọn banner từ máy</th>
                                            <th>Upload banner</th>                             
                                        </tr>
                                    </thead>       
                                    <tbody id="tblBannerMainCat">                         
                                                <!-- load data dynamic from code behind-->                                 
                                    </tbody>
                                </table>
                            </div>
                        </div>
                </div>                          
            </div>       
        <!-- /Data table -->
    </div>
</form>
</asp:Content>

