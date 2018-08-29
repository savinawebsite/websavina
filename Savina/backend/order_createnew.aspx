<%@ Page Title="" Language="C#" MasterPageFile="~/backend/adTemplate.master" AutoEventWireup="true" CodeFile="order_createnew.aspx.cs" Inherits="backend_order_createnew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- page content -->
        <div class="right_col" role="main">
            <div class="">
              <div class="page-title">
                <div class="title_left">
                  <h3>TẠO ĐƠN HÀNG MỚI</h3>
                </div>
                <div class="title_right">
                  <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                    <div class="input-group">
                      <input type="text" class="form-control" placeholder="Search for...">
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
                    <div class="x_content">
                        <br />
                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                          <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">Mã đơn hàng</label>
                              <div class="col-md-8 col-sm-8 col-xs-12">
                                <input type="text" id="first-name" required="required" class="form-control col-md-7 col-xs-12">
                              </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">Tên sản phẩm</label>
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                    <select class="form-control">
                                        <option>Chọn sản phẩm</option>
                                      </select>
                                </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Số lượng</label>
                              <div class="col-md-8 col-sm-8 col-xs-12">
                                <input type="text" id="last-name" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Thuộc Main Category</label>
                              <div class="col-md-8 col-sm-8 col-xs-12">
                                <select class="form-control">
                                  <option>Lựa chọn Main Category</option>
                                  <option>XE CỘ</option>
                                  <option>CÔNG CỤ, DỤNG CỤ</option>
                                  <option>MẸ VÀ BÉ</option>
                                  <option>CÔNG NGHIỆP XÂY DỰNG</option>
                                </select>
                              </div>
                            </div>                            
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Mô tả nhanh</label>
                              <div class="col-md-8 col-sm-8 col-xs-12">
                                  <textarea class="resizable_textarea form-control" placeholder="độ dài trường nhập liệu tự động mở rộng..."></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Thời gian thuê</label>
                              <fieldset>
                                  <div class="control-group">
                                    <div class="controls">
                                      <div class="input-prepend input-group">
                                        <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                        <input type="text" name="reservation-time" id="reservation-time" class="form-control" value="01/01/2016 - 01/25/2016" />
                                      </div>
                                    </div>
                                  </div>
                                </fieldset>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Thời gian trả</label>
                              <fieldset>
                                  <div class="control-group">
                                    <div class="controls">
                                      <div class="input-prepend input-group">
                                        <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                        <input type="text" name="reservation-time-2" id="reservation-time" class="form-control" value="01/01/2016 - 01/25/2016" />
                                      </div>
                                    </div>
                                  </div>
                                </fieldset>
                            </div>

                          </div>

                          <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">Còn mới %</label>
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                  <input type="text" id="last-name" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
                                </div>
                              </div>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">Chọn thành phố</label>
                              <div class="col-md-8 col-sm-8 col-xs-12">
                                <input type="text" id="first-name" required="required" class="form-control col-md-7 col-xs-12">
                              </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">Chọn quận/huyện</label>
                              <div class="col-md-8 col-sm-8 col-xs-12">
                                <input type="text" id="last-name" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Chọn phường/xã</label>
                              <div class="col-md-8 col-sm-8 col-xs-12">
                                <input type="text" id="last-name" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Chọn hình đại diện</label>
                              <div class="btn-group">
                                <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4 col-sm-4 col-xs-12">Add hình vào gallery</label>
                              <div class="btn-group">
                                <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
                              </div>
                            </div>
                          </div>
                          
                        </form>
                        <div class="ln_solid"></div>
                          <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                              <button class="btn btn-primary" type="button">Hủy</button>
                              <button class="btn btn-primary" type="reset">Reset</button>
                              <button type="submit" class="btn btn-success">Tạo</button>
                            </div>
                          </div>
                      </div>
                  </div>
                </div> <!-- /Create new category -->
            </div>
          </div>
        <!-- /page content -->
</asp:Content>

