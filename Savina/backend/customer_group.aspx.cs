using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backend_customer_group : System.Web.UI.Page
{
    private savinaEntities db = new savinaEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            loadGroupCustomer();
        }
        
    }

    private void loadGroupCustomer()
    {
        string GrCusHtml = "";
        string html = "";
        var GroupCusList = (from g in db.tb_GroupCustomer
                            select new
                            {
                                g.GroupCusCode,
                                g.GroupCusCreate,
                                g.GroupCusDesc,
                                g.GroupCusName,
                                g.GroupCusValue,
                                g.IsDisplay,
                                g.IsDeleted,
                                g.GroupCusID
                            }
                            ).OrderByDescending(p => p.GroupCusID).ToList();
        int kk = 0;
        GrCusHtml += "<table  class=\"table table-striped table-bordered\">";
        GrCusHtml += "<thead>";
        GrCusHtml += "<tr>";
        GrCusHtml += "<th>Mã nhóm</th>";
        GrCusHtml += "<th>Tên nhóm</th>";
        GrCusHtml += "<th>Mô tả về nhóm</th>";
        GrCusHtml += "<th>Giá trị cần</th>";
        GrCusHtml += "<th>Tình trạng</th>";
        GrCusHtml += "<th>Ngày tạo</th>";
        GrCusHtml += "<th>Thao tác</th>";
        GrCusHtml += "</tr>";
        GrCusHtml += "</thead>";
        foreach (var item in GroupCusList)
        {
            kk++;   
            html += "<tbody>";
            html += "<tr>";
            html += "<td>"+item.GroupCusCode+"</td>";
            html += "<td>"+item.GroupCusName+"</td>";
            html += "<td>"+item.GroupCusDesc+"</td>";
            html += "<td>"+item.GroupCusValue+"</td>";
            if (item.IsDisplay != null)
            {
                if (item.IsDisplay == true)
                {
                    html += "<td class=\" \">Enable</td>";
                }
                else
                {
                    html += "<td class=\" \">Disable</td>";
                }
            }
            html += "<td>"+item.GroupCusCreate+"</td>";
            html += "<td><a href=\"#\" class=\"btn btn-info btn-xs\" onclick=\"Edit(this, '" + item.GroupCusID.ToString() + "','" + item.GroupCusCode.ToString() + "','" + item.GroupCusName.ToString() + "','" + item.GroupCusDesc.ToString() + "','" + item.GroupCusValue.ToString() + "')\"></i>&nbsp Edit</a>";
            html += "<span><a href=\"#\" class=\"btn btn-danger btn-xs\" onclick=\"Delete(this,'" + item.GroupCusID.ToString() + "','" + item.GroupCusName.ToString() + "')\"></i>&nbsp Delete</a></span></td>";
            html += "</tr>";
            html += "</tbody>";
            
        }
        GrCusHtml += html;
        GrCusHtml += "</table>";
        this.dvGroupCustomerList.InnerHtml = GrCusHtml;
    }

    //-------------------------
}