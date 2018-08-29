using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backend_product_list : System.Web.UI.Page
{
    private savinaEntities db = new savinaEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            getProductList();
        }
    }

    private void getProductList()
    {
        string listHtml = "";
        string html = "";
        var tbProductList = (from prl in db.tb_Product
                             select new
                             {
                                 prl.ProductID,
                                 prl.ProductCode,
                                 prl.ProductName,
                                 prl.PricePerBlock,
                                 prl.PricePerDay,
                                 prl.ProductMainCate,
                                 prl.ProductSubCate1,
                                 prl.ProductSubCate2,
                                 prl.ProductSubCate3,
                                 prl.CreateDate,
                                 prl.ProductValue,
                                 prl.StatusPercentage,
                                 prl.StatusAvailability,
                                 prl.ProductAvatar,
                                 prl.ShortDescription,
                                 prl.ListBy1,
                                 prl.ListBy2,
                                 prl.ListBy3,
                                 prl.ListBy4,
                                 prl.ListBy5,
                                 prl.ListBy6,
                                 prl.ListBy7
                             }
                            ).OrderByDescending(p => p.ProductID).ToList();
        listHtml += "<table id=\"datatable\" class=\"table table-striped table-bordered\">";
        listHtml += "<thead>";
        listHtml += "<tr>";
        listHtml += "<th>STT</th>";
        listHtml += "<th>Mã sản phẩm</th>";
        listHtml += "<th>Tên sản phẩm </th>";
        listHtml += "<th>Thuộc Sub-2</th>";
        listHtml += "<th>Thuộc Sub-1</th>";
        listHtml += "<th>Thuộc MainCat</th>";
        listHtml += "<th>Thuê theo block</th>";
        listHtml += "<th>Thuê theo ngày </th>";
        listHtml += "<th>Ngày tạo</th>";
        listHtml += "<th>Hiển thị ở </th>";
        listHtml += "<th>Avatar </th>";
        listHtml += "<th>Thao tác </th>";
        listHtml += "<th>Người tạo </th>";
        listHtml += "<th>Người sửa </th>";
        listHtml += "</tr>";
        listHtml += "</thead>";
        listHtml += "<tbody>";
        int k = 0;
        foreach (var item in tbProductList)
        {
            k++;
            html += "<tr>";
            html += "<td>" + k + "</td>";
            html += "<td>" + item.ProductCode + "</td>";
            html += "<td>" + item.ProductName + "</td>";
            html += "<td>" + item.ProductSubCate2 + "</td>";
            html += "<td>" + item.ProductSubCate1 + "</td>";
            html += "<td>" + item.ProductMainCate + "</td>";
            html += "<td>" + item.PricePerBlock + "</td>";
            html += "<td>" + item.PricePerDay + "</td>";
            html += "<td>" + item.CreateDate + "</td>";
            if (item.ListBy1 == "active")
            {
                html += "<td><a href=\"#\" class=\"btn btn-info btn-xs fontCatNumber\" style=\"background-color: darkorange;\" onclick=\"RemoveGroup1(this,'" + item.ProductID.ToString() + "','" + item.ProductName.ToString() + "')\">1</a>";
            } else
            {
                html += "<td><a href=\"#\" class=\"btn btn-info btn-xs fontCatNumber\" style=\"background-color: dodgerblue;\" onclick=\"SelectGroup1(this,'" + item.ProductID.ToString() + "','" + item.ProductName.ToString() + "')\">1</a>";
            }
            if (item.ListBy2 == "active")
            {
                html += "<span><a href=\"#\" class=\"btn btn-info btn-xs fontCatNumber\" style=\"background-color: darkorange;\" onclick=\"SelectGroup2(this,'" + item.ProductID.ToString() + "','" + item.ProductName.ToString() + "')\">2</a></span>";
            } else
            {
                html += "<span><a href=\"#\" class=\"btn btn-info btn-xs fontCatNumber\" style=\"background-color: dodgerblue;\" onclick=\"SelectGroup2(this,'" + item.ProductID.ToString() + "','" + item.ProductName.ToString() + "')\">2</a></span>";
            }
            if (item.ListBy3 == "active")
            {
                html += "<span><a href=\"#\" class=\"btn btn-info btn-xs fontCatNumber\" style=\"background-color: darkorange;\" onclick=\"SelectGroup3(this,'" + item.ProductID.ToString() + "','" + item.ProductName.ToString() + "')\">3</a></span>";
            }
            else
            {
                html += "<span><a href=\"#\" class=\"btn btn-info btn-xs fontCatNumber\" style=\"background-color: dodgerblue;\" onclick=\"SelectGroup3(this,'" + item.ProductID.ToString() + "','" + item.ProductName.ToString() + "')\">3</a></span>";
            }
            if (item.ListBy4 == "active")
            {
                html += "<span><a href=\"#\" class=\"btn btn-info btn-xs fontCatNumber\" style=\"background-color: darkorange;\" onclick=\"SelectGroup4(this,'" + item.ProductID.ToString() + "','" + item.ProductName.ToString() + "')\">4</a></span>";
            }
            else
            {
                html += "<span><a href=\"#\" class=\"btn btn-info btn-xs fontCatNumber\" style=\"background-color: dodgerblue;\" onclick=\"SelectGroup4(this,'" + item.ProductID.ToString() + "','" + item.ProductName.ToString() + "')\">4</a></span>";
            }
            if (item.ListBy5 == "active")
            {
                html += "<span><a href=\"#\" class=\"btn btn-info btn-xs fontCatNumber\" style=\"background-color: darkorange;\" onclick=\"SelectGroup5(this,'" + item.ProductID.ToString() + "','" + item.ProductName.ToString() + "')\">5</a></span>";
            }
            else
            {
                html += "<span><a href=\"#\" class=\"btn btn-info btn-xs fontCatNumber\" style=\"background-color: dodgerblue;\" onclick=\"SelectGroup5(this,'" + item.ProductID.ToString() + "','" + item.ProductName.ToString() + "')\">5</a></span>";
            }
            if (item.ListBy6 == "active")
            {
                html += "<span><a href=\"#\" class=\"btn btn-info btn-xs fontCatNumber\" style=\"background-color: darkorange;\" onclick=\"SelectGroup6(this,'" + item.ProductID.ToString() + "','" + item.ProductName.ToString() + "')\">6</a></span>";
            }
            else
            {
                html += "<span><a href=\"#\" class=\"btn btn-info btn-xs fontCatNumber\" style=\"background-color: dodgerblue;\" onclick=\"SelectGroup6(this,'" + item.ProductID.ToString() + "','" + item.ProductName.ToString() + "')\">6</a></span>";
            }
            if (item.ListBy7 == "active")
            {
                html += "<span><a href=\"#\" class=\"btn btn-info btn-xs fontCatNumber\" style=\"background-color: darkorange;\" onclick=\"SelectGroup7(this,'" + item.ProductID.ToString() + "','" + item.ProductName.ToString() + "')\">7</a></span>";
            }
            else
            {
                html += "<span><a href=\"#\" class=\"btn btn-info btn-xs fontCatNumber\" style=\"background-color: dodgerblue;\" onclick=\"SelectGroup7(this,'" + item.ProductID.ToString() + "','" + item.ProductName.ToString() + "')\">7</a></span>";
            }
           
            html += "<td><img src=\"" + item.ProductAvatar + "\" class=\"imgBannerInTable\"/></td>";
            html += "<td><a href=\"#\" class=\"btn btn-primary btn-xs\"><i class=\"fa fa-info-circle\"></i>&nbsp Xem SP</a>";
            html += "<span><a href=\"#\" class=\"btn btn-info btn-xs\"><i class=\"fa fa-edit\"></i>&nbsp Sửa SP</a></span>";
            html += "<span><a href=\"#\" class=\"btn btn-danger btn-xs\" onclick=\"Delete(this,'" + item.ProductID.ToString() + "','" + item.ProductName.ToString() + "')\"></i>&nbsp Xóa SP</a></span></td>";
            html += "<td> </td>";
            html += "<td> </td>";
            html += "</tr>";
        }
        listHtml += html;
        listHtml += "</tbody>";
        listHtml += "</table>";
        this.tblProductList.InnerHtml = listHtml;
    }
}