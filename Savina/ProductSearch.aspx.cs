using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductSearch : System.Web.UI.Page
{
    private savinaEntities db = new savinaEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        getProductList();
    }


    private void getProductList()
    {
        string proListHtml = "";
        string html1 = "";

        //fetch all products via database
        var productList = (from s in db.tb_Product
                           select new
                           {
                               s.ProductID,
                               s.PricePerBlock,
                               s.PricePerDay,
                               s.ProductName,
                               s.ProductDistrict,
                               s.ProductAvatar
                           }
                           ).OrderBy(p => p.ProductID).ToList();

        proListHtml += "<div class=\"row\">";
        int kk = 0;
        foreach (var item in productList)
        {
            kk++;
 
            html1 += "<div class=\"col-md-4 col-sm-6 col-xs-6 rowMobile\">";
            html1 += "<div class=\"product product-single product-ext1\">";
            html1 += "<div class=\"product-thumb\">";
            html1 += "<button class=\"quickInfoHover quick-view\">Giá thuê theo giờ: "+ float.Parse(item.PricePerBlock.ToString()).ToString("#,###") + " đ<br> Gia thue theo ngay: "+ float.Parse(item.PricePerDay.ToString()).ToString("#,###") + " đ<br> Khu vực: "+item.ProductDistrict+"</button>";
            html1 += "<img src=\""+item.ProductAvatar+"\" alt=\"\">";
            html1 += "</div>";
            html1 += "<div class=\"product-body\">";
            html1 += "<h2 class=\"product-name\"><a href=\"../productdetail?productID=" + kk + "\">" + item.ProductName+"</a></h2>";
            html1 += "<h3 class=\"product-price\">" + float.Parse(item.PricePerBlock.ToString()).ToString("#,###") + "</h3>";
            html1 += "<span class=\"price-per\">&nbsp/block &nbsp</span>";
            html1 += "<span class=\"product-price\"> - &nbsp </span>";
            html1 += "<h3 class=\"product-price\">" + float.Parse(item.PricePerDay.ToString()).ToString("#,###") + "</h3>";
            html1 += "<span class=\"price-per\">&nbsp/ ngày &nbsp</span>";
            html1 += "<h4 class=\"product-location\">"+item.ProductDistrict+"</h4>";
            html1 += "<div class=\"product-btns\">";
            html1 += "<button class=\"main-btn icon-btn\"><i class=\"fa fa-heart\"></i></button>";
            html1 += "<a class=\"primary-btn add-to-cart\" href=\"../productdetail?productID=" + item.ProductID + "\"><i class=\"fa fa-shopping-cart\"></i> XEM CHI TIẾT</a>";
            html1 += "</div>";
			html1 += "</div>";
			html1 += "</div>";
			html1 += "</div>";

        }
        proListHtml += html1;
        proListHtml += "<hr />";
        proListHtml += "</div>";


        this.dvLoadProductList.InnerHtml = proListHtml;
    }

    //--------
}