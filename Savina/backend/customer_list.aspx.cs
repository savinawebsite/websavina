using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backend_customer_list : System.Web.UI.Page
{
    private savinaEntities db = new savinaEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            getCustomerList();
        }
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
            html += "<td>" + item.UserName + "</td>";
            html += "<td>" + item.GroupCusName + "</td>";
            html += "<td>" + item.Email + "</td>";
            html += "<td>" + item.Phone + "</td>";
            html += "<td>" + item.Address + "</td>";
            html += "<td>" + item.Description + "</td>";
            html += "<td>" + item.CreateDate + "</td>";
            html += "<td><img src=\"" + item.Avatar+ "\" class=\"imgBannerInTable\"/></td>";
            //html += "<td><a href=\"#\" class=\"btn btn-info btn-xs\" onclick=\"Edit(this,'" + item.CustomerID.ToString() + "','" + item.CustomerNo.ToString() + "','" + item.LastName.ToString() + "','" + item.FirstName.ToString() + "','" + item.Email.ToString() + "','" + item.Phone.ToString() + "','" + item.Address.ToString() + "','" + item.UserName.ToString() + "','" + item.Password.ToString() + "','" + item.CustomerGroup + "','" + item.Description.ToString() + "')\"><i class=\"fa fa-edit\"></i>&nbsp Edit</a>";
            html += "<td><a href=\"#\" class=\"btn btn-danger btn-xs\" onclick=\"Delete(this,'" + item.CustomerID.ToString() + "','" + item.FirstName.ToString() + "','" + item.LastName.ToString() + "')\"><i class=\"fa fa-trash\"></i>&nbsp Delete</a></td>";
            html += "</td>";
            html += "</tr>";
        }

        listHtml += html;
        listHtml += "</tbody>";
        listHtml += "</table>";
        this.tblCustomerList.InnerHtml = listHtml;
    }
    //----------------------
}