<%@ Page Title="" Language="C#" MasterPageFile="~/FrontSite.master" AutoEventWireup="true" CodeFile="contact_us.aspx.cs" Inherits="contact_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script type="text/javascript">
    function btnContactSubmit() {
        var contactFirstName = $('#idContactFirstName').val();
        var contactLastName = $('#idContactLastName').val();
        var contactPhone = $('#idContactPhone').val();
        var contactEmail = $('#idContactEmail').val();
        var contactTitle = $('#idContactTitle').val();
        var contactContent = $('#idContactContent').val();
        if (contactFirstName == "") {
                $(".modal-body").html("Vui lòng nhập tên");
                $("#alerdialog").modal();
                return false;
            }
        if (contactLastName == "") {
                $(".modal-body").html("Vui lòng nhập họ");
                $("#alerdialog").modal();
                return false;
            }
        if (contactPhone == "") {
                $(".modal-body").html("Vui lòng nhập số điện thoại");
                $("#alerdialog").modal();
                return false;
            }
        if (contactTitle == "") {
                $(".modal-body").html("Vui lòng nhập Tiêu đề");
                $("#alerdialog").modal();
                return false;
        }
        if (contactEmail == "") {
            $(".modal-body").html("Vui lòng nhập Email");
            $("#alerdialog").modal();
            return false;
        }
        if (contactContent == "") {
            $(".modal-body").html("Vui lòng nhập Nội dung");
            $("#alerdialog").modal();
            return false;
        }

            var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (!filter.test(contactEmail)) {
                $(".modal-body").html("Please enter a valid email address to contact");
                $("#alerdialog").modal();
                return false;
            }

            intRegex = /[0-9 -()+]+$/;
            if (contactPhone != "" && ((contactPhone.length < 6) || (!intRegex.test(contactPhone)))) {

                $(".modal-body").html("Please enter a valid phone number.");
                $("#alerdialog").modal();
                return false;
            }
            var xmlhttp;
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            }
            else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    if (xmlhttp.responseText != "") {
                        $(".modal-body").html("Thông tin của quý khách đã được gửi thành công, nhân viên chúng tôi sẽ liên lạc xác nhận trong thời gian ngắn. ");
                        $("#alerdialog").modal();
                        $("#idContactFirstName").val("");
                        $('#idContactLastName').val("");
                        $('#idContactPhone').val("");
                        $('#idContactEmail').val("");
                        $('#idContactTitle').val("");
                        $('#idContactContent').val("");
                    }
                }
            }
            xmlhttp.open("GET", "Ajax.aspx?action=ContactInsert&contactFirstName=" + contactFirstName + "&contactLastName=" + contactLastName + "&contactPhone=" + contactPhone + "&contactEmail=" + contactEmail + "&contactTitle=" + contactTitle + "&contactContent=" + contactContent + "", true);
            xmlhttp.send();
    }
</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <section class="slug parallax-slug-2" data-stellar-background-ratio="0">
    	<div class="overlay">
            <div class="container">
            	<div class="row">
                    <div class="col-lg-12">
                        <h1 class="anim fadeInDown">GIỮ LIÊN HỆ VỚI SAVINA</h1>
                        <p class="anim fadeInDown" data-wow-delay=".32s">Chúng tôi mong muốn hỗ trợ cho quý khách các dịch vụ cho thuê tốt nhất</p>
                    </div><!-- .col-lg-12 -->
                </div><!-- .row -->
            </div>
        </div><!-- .overlay -->
    </section><!-- .slug -->
    
    
   	<section class="content-section">
        <div class="container">
        	<div class="row">
       			<div class="col-lg-12 anim fadeInDown" data-wow-delay="0.25s">
                    <p>
                        Mục tiêu và mối quan tâm chính của chúng tôi là đảm bảo các giao dịch với khách hàng an toàn và hài lòng. Quý khách có bất kỳ thắc mắc, câu hỏi hoặc quan tâm xin vui lòng chia sẽ với chúng tôi.
                    </p>
                </div><!-- .col-lg-12 -->
            </div><!-- .row -->
            <div class="row">
            	<div class="col-lg-12 mapimg fadeInDown animated" data-wow-delay="0.45s">
            		<!-- <div id="gmap" class="gmap"></div>                    -->
					<img src="../img/savina-map-contact.png" style="width:100%"/>
					<div class="shadow-lg"></div>
                </div><!-- .col-lg-12 -->
            </div><!-- .row -->
    	</div>
    </section><!-- .content-section -->
    
    <section class="content-section form contact style-2">
    	<div class="container">
        	<div class="row">
            
                <form target="#" name="contact">
                    <div class="col-md-8 anim fadeInLeft">
                        <!-- row 1 - First, Last name -->
                        <span class="input-group tight">
                            <i class="fa fa-user"></i>
                            <input type="text" id="idContactLastName" class="lg" placeholder="Nhập vào họ" />
                        </span>
                        
                        <span class="input-group tight second">
                            <i class="fa fa-user"></i>
                            <input type="text" id="idContactFirstName" class="lg" placeholder="Nhập vào tên" />
                        </span>
                        <!-- /row 1 - First, Last name -->

                        <!-- row 2 - Phone, email -->
                        <span class="input-group tight">
                            <i class="fa fa-phone"></i>
                            <input type="number" id="idContactPhone" class="lg" placeholder="Số điện thoại" />
                        </span>
                        
                        <span class="input-group tight second">
                            <i class="fa fa-envelope"></i>
                            <input type="email" id="idContactEmail" class="lg" placeholder="Nhập địa chỉ Email" />
                        </span>
                        <!-- /row 2 - Phone, email -->
                        
                        <span class="input-group">
                            <i class="fa fa-book"></i>
                            <input type="text" id="idContactTitle" class="lg" placeholder="Tiêu đề liên hệ" />
                        </span><!-- .input-group -->
                        
                        <span class="input-group">
                            <textarea id="idContactContent" class="lg" placeholder="Nội dung liên hệ"></textarea>
                        </span><!-- .input-group -->                                                                                           
                    </div><!-- .col-lg-8 -->
                    
                    <div class="col-md-4">
                    	<ul class="info-list">                      
                        	<li class="anim fadeInRight" data-wow-delay="0.15s">
                            	<i class="fa fa-map-marker"></i>
                                <span>
                                	<p>
                                    	Số 19, đường 46,<br />
                                    	Phường Thảo Điền, Quận 2,<br />
                                   		TP Hồ Chí Minh, Việt Nam
                                    </p>
                                </span>
                            </li>
                            
                            <li class="anim fadeInRight" data-wow-delay="0.25s">
                            	<i class="fa fa-phone"></i>
                                <span>
                                    <p>
                                    	Phone: 083 38 38 38 <br />
                                    	Hotline: 0909 090909<br />
                                   		Email :  hotro@savina.com
                                    </p>
                                </span>
                            </li>
                            
                        </ul><!-- .info-list -->
                    </div><!-- .col-lg-4 -->

                    <div>
                        <%--<asp:Button ID="btnContactSend" runat="server" CssClass="btn btn-primary" OnClick="btnContactSubmit" Text="GỬI LH" />--%>
                        <%--<asp:Button ID="Button16" runat="server" CssClass="btn btn-primary"  OnClick="btnMain_banner" Text="UPLOAD" />--%>
                        <input id="btnContactSend"  type="button" onclick="btnContactSubmit()" class="btn btn-primary" value="SEND" />
                    </div>
                </form>
                
            </div><!-- .row -->
    	</div><!-- .container -->
    	
        <span id="message_sent"><i class="fa-check fa"></i></span><!-- jQuery display of giant checkmark -->	
        
    </section><!-- .content-section .form -->

</asp:Content>

