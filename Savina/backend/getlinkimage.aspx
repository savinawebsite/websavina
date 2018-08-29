<%@ Page Title="" Language="C#" MasterPageFile="~/backend/adTemplate.master" AutoEventWireup="true" CodeFile="getlinkimage.aspx.cs" Inherits="backend_getlinkimage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="right_col" role="main">
            <div class="">
              <div class="page-title">
                <div class="title_left">
                  <h3>GET LINK IMAGE</h3>
                </div>
                </div>
            </div>

        <div class="clearfix"></div>
            <div class="row">   
                <form runat="server">
                     <div class="col-md-12 col-sm-12 col-xs-12">   <!-- Create new category -->
                    <div class="x_panel">
                            <div class="column-fixed hastable" style="margin-bottom:20px;">
                                <label class="desc" style="margin-bottom:10px;">
                                    Upload image
                                </label>
                                <div style="margin-bottom:10px;">
                                    <asp:FileUpload ID="f_Upload" CssClass="field text large" runat="server" />
                                </div>
                                <div>
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-xs"  OnClick="InsertImage" Text="Save" />                  
                                </div>
                            </div>
                            <div class="column-fixed hastable">
                                <div id="loadLink" runat="server"></div>
                            </div>
                            <div class="clearfix"></div>
                    </div>
                </div>
                </form>
            </div>
    </div>
</asp:Content>

