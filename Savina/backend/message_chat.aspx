<%@ Page Title="" Language="C#" MasterPageFile="~/backend/adTemplate.master" AutoEventWireup="true" CodeFile="message_chat.aspx.cs" Inherits="backend_message_chat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

    <div class="right_col" role="main">
            <div class="">
              <div class="page-title">
                <div class="title_left">
                  <h3>LIVE CHAT</h3>
                </div>
                </div>
            </div>

            <div class="clearfix"></div>
            <div class="row">   
                <div class="col-md-12 col-sm-12 col-xs-12">   <!-- Create new category -->
                    <div class="x_panel">
                        <iframe src="https://app.purechat.com/contacts" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" style="border: 0px; height:600px; width: 100%"></iframe>
                    </div>
                </div>
            </div>
    </div>

    <script>
        $('iframe').each(function () {
            function injectCSS() {
                $iframe.contents().find('head').append(
                    $('<link/>', { rel: 'stylesheet', href: '../backend/css/iframe.css', type: 'text/css' })
                );
            }

            var $iframe = $(this);
            $iframe.on('load', injectCSS);
            injectCSS();
        });
     </script>
</asp:Content>

