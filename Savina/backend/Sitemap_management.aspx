<%@ Page Title="" Language="C#" MasterPageFile="~/backend/adTemplate.master" AutoEventWireup="true" CodeFile="Sitemap_management.aspx.cs" Inherits="backend_Sitemap_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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

    </script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <!-- page content -->
    <div class="right_col" role="main">
        <div class="">
            <div class="page-title">
            <div class="title_left">
                <h3>QUẢN LÝ CÁC TRANG TIN TỨC SITEMAP</h3>
            </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">             
            <div class="col-md-6 col-sm-6 col-xs-12"> <!-- HỖ TRỢ KHÁCH HÀNG  -->
                <div class="x_panel">
                    <div class="x_title">
                        <h2>HỖ TRỢ KHÁCH HÀNG</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="expand-link"><i class="fa fa-chevron-down"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên trang</th>
                            <th>Ngày upload</th>
                            <th style="width:25%">Thao tác</th>                              
                        </tr>
                        </thead>
       
                        <tbody>                         
                        <tr>
                            <td>1</td>
                            <td>TRUNG TÂM TRỢ GIÚP</td>
                            <td id="group1_UploadTime1" runat="server">23/3/2018 10:00</td>
                            <td>
                                <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>&nbsp EDIT</a>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>AN TOÀN MUA BÁN</td>
                            <td id="group1_UploadTime2" runat="server">23/3/2018 10:00</td>
                            <td>                            
                                <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>&nbsp EDIT</a>
                            </td>
                        </tr>   
                        <tr>
                            <td>3</td>
                            <td>QUY ĐỊNH CẦN BIẾT</td>
                            <td id="group1_UploadTime3" runat="server">23/3/2018 10:00</td>
                            <td>
                                <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>&nbsp EDIT</a>
                            </td>
                        </tr>                                                   
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>  <!-- /HỖ TRỢ KHÁCH HÀNG -->

            <div class="col-md-6 col-sm-6 col-xs-12"> <!-- VỀ CHÚNG TÔI  -->
                <div class="x_panel">
                    <div class="x_title">
                        <h2>VỀ CHÚNG TÔI</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="expand-link"><i class="fa fa-chevron-down"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên trang</th>
                            <th>Ngày upload</th>
                            <th style="width:25%">Thao tác</th>                              
                        </tr>
                        </thead>
       
                        <tbody>                         
                        <tr>
                            <td>1</td>
                            <td>QUY CHẾ HOẠT ĐỘNG</td>
                            <td id="Td1" runat="server">23/3/2018 10:00</td>
                            <td>
                                <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>&nbsp EDIT</a>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>CHÍNH SÁCH BÁN HÀNG</td>
                            <td id="Td2" runat="server">23/3/2018 10:00</td>
                            <td>                            
                                <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>&nbsp EDIT</a>
                            </td>
                        </tr>   
                        <tr>
                            <td>3</td>
                            <td>HỆ THỐNG KIỂM ĐỊNH</td>
                            <td id="Td3" runat="server">23/3/2018 10:00</td>
                            <td>
                                <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>&nbsp EDIT</a>
                            </td>
                        </tr>                                                   
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>  <!-- /VỀ CHÚNG TÔI -->


            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="form-group">
                    <label class="control-label">Text Editor</label>
                    <textarea tabindex="2" cols="50" rows="5" class="field textarea small content_Preditor" name="content_PrFullDesc" id="content_PrFullDesc" style="width: 980px"></textarea>
                </div>
            </div>
        </div>
    </div>

    


    <!-- /page content -->
</asp:Content>

