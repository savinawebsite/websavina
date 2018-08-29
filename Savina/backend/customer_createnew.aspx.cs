using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backend_customer_createnew : System.Web.UI.Page
{
    private savinaEntities db = new savinaEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            getCustomerList();
            getCustomerGoupDropdown();         
        }
    }

    private void getCustomerGoupDropdown()
    {
        string listHtml = "";
        string html = "";
        var cusGroupList = (from cgl in db.tb_GroupCustomer
                            select new
                            {
                                cgl.GroupCusID,
                                cgl.GroupCusCode,
                                cgl.GroupCusName
                            }
                            ).OrderByDescending(p => p.GroupCusID).ToList();
        listHtml += "<select class=\"form-control\" onchange=\"GetNameId\" name=\"ipcustomerGroupSelection\" id=\"ipcustomerGroupSelection\">";

        int k = 0;
        foreach (var item in cusGroupList)
        {
            k++;
            html += "<option value=\""+item.GroupCusID+"\">"+ item.GroupCusName +"</option>";
        }
        listHtml += html;
        listHtml += "</select>";
        this.dvDropdownGrCus.InnerHtml = listHtml;
    }

    private void getCustomerList()
    {
        string listHtml = "";
        string html = "";

        var customerList = (from sl in db.tb_Customer join
                            cg in db.tb_GroupCustomer on sl.CustomerGroup equals cg.GroupCusID
                            select new
                          {
                              sl.CustomerID,
                              sl.CustomerNo,
                              sl.FirstName,
                              sl.LastName,
                              sl.UserName,
                              sl.Birthday,
                              sl.Description,
                              sl.Phone,
                              sl.Email,
                              sl.Address,
                              sl.Avatar,
                              sl.Password,
                              sl.CustomerGroup,
                              sl.CreateDate,
                              cg.GroupCusName,
                              cg.GroupCusID
                          }
             ).OrderByDescending(p => p.CustomerID).ToList();

        listHtml += "<table id=\"datatable\" class=\"table table-striped table-bordered\">";
        listHtml += "<thead>";
        listHtml += "<tr>";
        listHtml += "<th>Mã khách hàng</th>";
        listHtml += "<th>Họ </th>";
        listHtml += "<th>Tên </th>";
        listHtml += "<th>Username </th>";
        listHtml += "<th>Thuộc nhóm </th>";
        listHtml += "<th>Email </th>";
        listHtml += "<th>Cell number </th>";
        listHtml += "<th>Địa chỉ </th>";
        listHtml += "<th> Mô tả nhanh</th>";
        listHtml += "<th>Ngày tạo </th>";
        listHtml += "<th>Avatar </th>";
        listHtml += "<th>Thao tác </th>";
        listHtml += "</tr>";
        listHtml += "</thead>";
        listHtml += "<tbody>";
        int k = 0;
        foreach (var item in customerList)
        {
            k++;
            html += "<tr>";
            html += "<td>" + item.CustomerNo + "</td>";
            html += "<td>" + item.LastName + "</td>";
            html += "<td>" + item.FirstName + "</td>";
            html += "<td>"+item.UserName+"</td>";
            html += "<td>"+item.GroupCusName+"</td>";
            html += "<td>" + item.Email + "</td>";
            html += "<td>" + item.Phone + "</td>";
            html += "<td>" + item.Address + "</td>";
            html += "<td>" + item.Description + "</td>";
            html += "<td>" + item.CreateDate + "</td>";
            html += "<td><img src=\"" + item.Avatar + "\" class=\"imgBannerInTable\"/></td>";
            //html += "<td><a href=\"#\" class=\"btn btn-info btn-xs\" onclick=\"Edit(this,'" + item.CustomerID.ToString() + "','" + item.CustomerNo.ToString() + "','" + item.LastName.ToString() + "','" + item.FirstName.ToString() + "','" + item.Email.ToString() + "','" + item.Phone.ToString() + "','" + item.Address.ToString() + "','" + item.UserName.ToString() + "','" + item.Password.ToString() + "','" + item.CustomerGroup.ToString() + "','" + item.Description.ToString() + "')\"><i class=\"fa fa-edit\"></i>&nbsp Edit</a>";        
            html += "<td><a href=\"#\" class=\"btn btn-danger btn-xs\" onclick=\"Delete(this,'" + item.CustomerID.ToString() + "','" + item.FirstName.ToString() + "','" + item.LastName.ToString() + "')\"><i class=\"fa fa-trash\"></i>&nbsp Delete</a></span>";
            html += "</td>";
            html += "</tr>";
        }

        listHtml += html;
        listHtml += "</tbody>";
        listHtml += "</table>";
        this.tblCustomerList.InnerHtml = listHtml;
    }

    private void clearform()
    {
        Request.Form["ctl00$ContentPlaceHolder1$ipcustomerCode"] = "";
        Request.Form["ctl00$ContentPlaceHolder1$ipcustomerLastname"] = "";
        Request.Form["ctl00$ContentPlaceHolder1$ipcustomerFirstname"] = "";
        Request.Form["ctl00$ContentPlaceHolder1$ipcustomerEmail"] = "";
        Request.Form["ctl00$ContentPlaceHolder1$ipcustomerUsername"] = "";
        Request.Form["ctl00$ContentPlaceHolder1$ipcustomerPassword"] = "";
        Request.Form["ctl00$ContentPlaceHolder1$ipcustomerPhoneNumber"] = "";
        Request.Form["ctl00$ContentPlaceHolder1$ipcustomerAddress"] = "";
        Request.Form["ctl00$ContentPlaceHolder1$ipcustomerDesc"] = "";
    }

    protected void btnCreateCustomer(object sender, EventArgs e)
    {
            try
            {
                tb_Customer info = new tb_Customer();
                 string customerGrouptemp = Request.Form["ipcustomerGroupSelection"];
                int customerGroup = 0;
                if (customerGrouptemp != null)
                {
                    customerGroup = int.Parse(customerGrouptemp);
                }
                 string customerCode = Request.Form["ctl00$ContentPlaceHolder1$ipcustomerCode"];
                string customerLastname = Request.Form["ctl00$ContentPlaceHolder1$ipcustomerLastname"];
                string customerFirstname = Request.Form["ctl00$ContentPlaceHolder1$ipcustomerFirstname"];
                string customerEmail = Request.Form["ctl00$ContentPlaceHolder1$ipcustomerEmail"];
                string customerUsername = Request.Form["ctl00$ContentPlaceHolder1$ipcustomerUsername"];
                string customerPass = Request.Form["ctl00$ContentPlaceHolder1$ipcustomerPassword"];
                string customerPhoneNumber = Request.Form["ctl00$ContentPlaceHolder1$ipcustomerPhoneNumber"];
                string customerAddress = Request.Form["ctl00$ContentPlaceHolder1$ipcustomerAddress"];
                string customerDesc = Request.Form["ctl00$ContentPlaceHolder1$ipcustomerDesc"];
            
                string customerAvatar = Path.GetFileName(ipcustomerAvatarFile.FileName);
                string path = Server.MapPath("~/image_customer/");

                ipcustomerAvatarFile.SaveAs(path + customerAvatar);
                info.Avatar = "../image_customer/" + customerAvatar;
                info.CustomerNo = customerCode;
                info.FirstName = customerFirstname;
                info.LastName = customerLastname;
                info.UserName = customerUsername;
                info.Password = customerPass;
                info.Phone = customerPhoneNumber;
                info.Address = customerAddress;
                info.Email = customerEmail;
                info.Description = customerDesc;
                info.CustomerGroup = customerGroup;
                info.CreateDate = DateTime.Now;
                db.tb_Customer.Add(info);
                db.SaveChanges();
                Response.Write("<script>alert('tạo khách hàng mới thành công !')</script>");
                getCustomerList();
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Khởi tạo không thành công, vui lòng thử lại !')</script>");
            }
        }

    protected void btnDeleteCustomer(object sender, EventArgs e)
    {
        try
        {
            int CusID = 0;
            string cID = Request.Form["ctl00$ContentPlaceHolder1$CusID"];
            if (cID != null) 
            {
                CusID = int.Parse(cID);
                tb_Customer t = (tb_Customer)db.tb_Customer.Where(b => b.CustomerID == CusID).First();
                db.tb_Customer.Remove(t);
                db.SaveChanges();
                Response.Write("<script>alert('Xoa khách hàng thành công !')</script>");
                getCustomerList();
            }
        }
        catch (Exception)
        {
            Response.Write("<script>alert('Xóa không thành công, vui lòng thử lại !')</script>");
        }
    }

    protected void btnEditCustomer(object sender, EventArgs e)
    {
        try
        {
            string customerCode = Request.Form["ctl00$ContentPlaceHolder1$ipcustomerCode"];
            string customerLastname = Request.Form["ctl00$ContentPlaceHolder1$ipcustomerLastname"];
            string customerFirstname = Request.Form["ctl00$ContentPlaceHolder1$ipcustomerFirstname"];
            string customerEmail = Request.Form["ctl00$ContentPlaceHolder1$ipcustomerEmail"];
            string customerUsername = Request.Form["ctl00$ContentPlaceHolder1$ipcustomerUsername"];
            string customerPass = Request.Form["ctl00$ContentPlaceHolder1$ipcustomerPassword"];
            string customerPhoneNumber = Request.Form["ctl00$ContentPlaceHolder1$ipcustomerPhoneNumber"];
            string customerAddress = Request.Form["ctl00$ContentPlaceHolder1$ipcustomerAddress"];
            string customerDesc = Request.Form["ctl00$ContentPlaceHolder1$ipcustomerDesc"];
            string customerGrouptemp = Request.Form["ipcustomerGroupSelection"];
            int customerGroup = 0;
            if (customerGrouptemp != null)
            {
                customerGroup = int.Parse(customerGrouptemp);
            }

            string customerAvatar = Path.GetFileName(ipcustomerAvatarFile.FileName);
            string path = Server.MapPath("~/image_customer/");

            int CusID = 0;
            string cID = Request.Form["ctl00$ContentPlaceHolder1$CusID"];
            if (cID != null)
            {
                CusID = int.Parse(cID);
            }

            //update to Database
            var update = db.tb_Customer.Where(t => t.CustomerID == CusID).FirstOrDefault();
            ipcustomerAvatarFile.SaveAs(path + customerAvatar);
            update.Avatar = "../image_customer/" + customerAvatar;
            update.CustomerNo = customerCode;
            update.LastName = customerLastname;
            update.FirstName = customerFirstname;
            update.Email = customerEmail;
            update.UserName = customerUsername;
            update.Password = customerPass;
            update.Phone = customerPhoneNumber;
            update.Address = customerAddress;
            update.Description = customerDesc;
            update.CustomerGroup = customerGroup;
            update.CreateDate = DateTime.Now;
            db.SaveChanges();
            clearform();
            Response.Write("<script>alert('Thay đổi thông tin khách hàng thành công !')</script>");           
            getCustomerList();
                     
        }
        catch (Exception)
        {
            Response.Write("<script>alert('Thay đổi thông tin không thành công, vui lòng thử lại !')</script>");
        }
    }


    //-------------------
}