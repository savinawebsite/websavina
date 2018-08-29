using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{
    private savinaEntities db = new savinaEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        getMainBannerSlide();
        getBannerGroup1();
        getBannerGroup2();
        getBannerGroup3();
        getBannerGroup4();
        loadProductGroup1();
        loadProductGroupSlideCate1();
        loadProductGroup2();
        loadProductGroupSlideCate2();
        loadProductGroup3();
        loadProductGroupSlideCate3(); 
        loadProductGroup4();
        loadProductGroupSlideCate4();
        loadProductGroup5();
        loadProductGroupSlideCate5();
        loadProductGroup6();
        loadProductGroupSlideCate6();
        loadProductGroup7();
        loadProductGroupSlideCate7();
    }

    private void getMainBannerSlide()
    {
        var banner = (from s in db.tb_HomeMainBanner
                       select new
                       {
                           s.HomeMainBannerID,
                           s.BannerPath,
                           s.SortArr,
                           s.BannerHeader1,
                           s.BannerHeader2,
                           s.BannerLandingpage
                       }
                       ).OrderBy(p => p.SortArr).ToList();

        string bannerHtml = "";
        string html = "";
        int kk = 0;

        bannerHtml += "<div id=\"home-slick\" class=\"mainbanner-height\">";
        foreach (var item in banner)
        {
            kk++;
            html += "<div class=\"banner banner-1\">";
            html += "<a href=\"" + item.BannerLandingpage + "\">";
            html += "<img src=\"" + item.BannerPath + "\" alt=\"\">";
            html += " <div class=\"banner-caption\">";
            html += "<h1 class=\"primary-color\">"+item.BannerHeader1+"<br><span class=\"white-color font-weak\">"+item.BannerHeader2+"</span></h1>";
            html += "<a href=\"\"><button class=\"primary-btn\">Xem trang</button></a>";
            html += "</div>";
            html += "</a>";
            html += "</div>";
        }
        bannerHtml += html;
        bannerHtml += "</div>";
        this.home_mainBannerSlide.InnerHtml = bannerHtml;
    }

    private void getBannerGroup1()
    {
        var banner1 = db.tb_HomeBanner.Where(p => p.HomeBannerID == 1).FirstOrDefault();
        var banner2 = db.tb_HomeBanner.Where(p => p.HomeBannerID == 2).FirstOrDefault();
        var banner3 = db.tb_HomeBanner.Where(p => p.HomeBannerID == 3).FirstOrDefault();

        string bannerHtml = "";

        bannerHtml += "<div class=\"col-md-4 dvBannerGr1\" style=\"float:left\">";
        bannerHtml += "<a href= \""+banner1.BannerLandingpage+"\">";
        bannerHtml += "<img src=\""+banner1.BannerPath+"\" alt=\"\">";
        bannerHtml += "</a>";
        bannerHtml += "</div>";
        bannerHtml += "<div class=\"col-md-4 dvBannerGr1\">";
        bannerHtml += "<a href= \"" + banner2.BannerLandingpage + "\">";
        bannerHtml += "<img src=\"" + banner2.BannerPath + "\" alt=\"\">";
        bannerHtml += "</a>";
        bannerHtml += "</div>";
        bannerHtml += "<div class=\"col-md-4 dvBannerGr1\" style=\"float:right;\">";
        bannerHtml += "<a href= \"" + banner3.BannerLandingpage + "\">";
        bannerHtml += "<img src=\"" + banner3.BannerPath + "\" alt=\"\">";
        bannerHtml += "</a>";
        bannerHtml += "</div>";

        this.home_3banner_group1.InnerHtml = bannerHtml;
    }

    private void getBannerGroup2()
    {
        var banner1 = db.tb_HomeBanner.Where(p => p.HomeBannerID == 4).FirstOrDefault();
        var banner2 = db.tb_HomeBanner.Where(p => p.HomeBannerID == 5).FirstOrDefault();
        var banner3 = db.tb_HomeBanner.Where(p => p.HomeBannerID == 6).FirstOrDefault();

        string bannerHtml = "";

        bannerHtml += "<div class=\"container\">";
        bannerHtml += "<div class=\"row\">";
        bannerHtml += "<div class=\"col-md-4 col-sm-6 dvBannerGr2\">";
        bannerHtml += "<a href= \"" + banner1.BannerLandingpage + "\">";
        bannerHtml += "<img src=\"" + banner1.BannerPath + "\" alt=\"\">";
        bannerHtml += "</a>";
        bannerHtml += "</div>";
        bannerHtml += "<div class=\"col-md-4 col-sm-6 dvBannerGr2\">";
        bannerHtml += "<a href= \"" + banner2.BannerLandingpage + "\">";
        bannerHtml += "<img src=\"" + banner2.BannerPath + "\" alt=\"\">";
        bannerHtml += "</a>";
        bannerHtml += "</div>";
        bannerHtml += "<div class=\"col-md-4 col-sm-6 dvBannerGr2\" style=\"float:right;\">";
        bannerHtml += "<a href= \"" + banner3.BannerLandingpage + "\">";
        bannerHtml += "<img src=\"" + banner3.BannerPath + "\" alt=\"\">";
        bannerHtml += "</a>";
        bannerHtml += "</div>";
        bannerHtml += "</div>";  //div row
        bannerHtml += "</div>";  //dix container

        this.home_3banner_group2.InnerHtml = bannerHtml;
    }

    private void getBannerGroup3()
    {
        var banner1 = db.tb_HomeBanner.Where(p => p.HomeBannerID == 7).FirstOrDefault();
        var banner2 = db.tb_HomeBanner.Where(p => p.HomeBannerID == 8).FirstOrDefault();
        var banner3 = db.tb_HomeBanner.Where(p => p.HomeBannerID == 9).FirstOrDefault();
        var banner4 = db.tb_HomeBanner.Where(p => p.HomeBannerID == 10).FirstOrDefault();
        var banner5 = db.tb_HomeBanner.Where(p => p.HomeBannerID == 11).FirstOrDefault();

        string bannerHtml = "";

        bannerHtml += "<div class=\"banner dvBannerGr3\">";
        bannerHtml += "<a href= \"" + banner1.BannerLandingpage + "\">";
        bannerHtml += "<img src=\"" + banner1.BannerPath + "\" alt=\"\">";
        bannerHtml += "</a>";
        bannerHtml += "</div>";
        bannerHtml += "<div class=\"banner dvBannerGr3\">";
        bannerHtml += "<a href= \"" + banner2.BannerLandingpage + "\">";
        bannerHtml += "<img src=\"" + banner2.BannerPath + "\" alt=\"\">";
        bannerHtml += "</a>";
        bannerHtml += "</div>";
        bannerHtml += "<div class=\"banner dvBannerGr3\">";
        bannerHtml += "<a href= \"" + banner3.BannerLandingpage + "\">";
        bannerHtml += "<img src=\"" + banner3.BannerPath + "\" alt=\"\">";
        bannerHtml += "</a>";
        bannerHtml += "</div>";
        bannerHtml += "<div class=\"banner dvBannerGr3\">";
        bannerHtml += "<a href= \"" + banner4.BannerLandingpage + "\">";
        bannerHtml += "<img src=\"" + banner4.BannerPath + "\" alt=\"\">";
        bannerHtml += "</a>";
        bannerHtml += "</div>";
        bannerHtml += "<div class=\"banner dvBannerGr3\">";
        bannerHtml += "<a href= \"" + banner5.BannerLandingpage + "\">";
        bannerHtml += "<img src=\"" + banner5.BannerPath + "\" alt=\"\">";
        bannerHtml += "</a>";
        bannerHtml += "</div>";

        this.home_5banner_group3.InnerHtml = bannerHtml;
    }

    private void getBannerGroup4()
    {
        var banner1 = db.tb_HomeBanner.Where(p => p.HomeBannerID == 12).FirstOrDefault();
        var banner2 = db.tb_HomeBanner.Where(p => p.HomeBannerID == 13).FirstOrDefault();
        var banner3 = db.tb_HomeBanner.Where(p => p.HomeBannerID == 14).FirstOrDefault();

        string bannerHtml = "";

        bannerHtml += "<div class=\"col-md-8 dvBannerGr4\">";
        bannerHtml += "<a class=\"banner banner-1 banner-bottom-1\"href= \"" + banner1.BannerLandingpage + "\">";
        bannerHtml += "<img src=\"" + banner1.BannerPath + "\" alt=\"\" style=\"width: 98%;\">";
        bannerHtml += "</a>";
        bannerHtml += "</div>";
        bannerHtml += "<div class=\"col-md-4 col-sm-6 dvBannerGr4\">";
        bannerHtml += "<a class=\"banner banner-1 banner-bottom-1\" href=\"" + banner2.BannerLandingpage + "\">";
        bannerHtml += "<img src=\"" + banner2.BannerPath + "\" alt=\"\" style=\"width: 98%;\">";
        bannerHtml += "</a>";
        bannerHtml += "</div>";
        bannerHtml += "<div class=\"col-md-4 col-sm-6 dvBannerGr4\">";
        bannerHtml += "<a class=\"banner banner-1 banner-bottom-1\" href=\"" + banner3.BannerLandingpage + "\">";
        bannerHtml += "<img src=\"" + banner3.BannerPath + "\" alt=\"\" style=\"width: 98%;\">";
        bannerHtml += "</a>";
        bannerHtml += "</div>";

        this.home_3banner_group4.InnerHtml = bannerHtml;
    }

    private void loadProductGroup1()
    {
        string html1 = "";
        string proListHtml1 = "";
        var productListGroup1 = (from s in db.tb_Product
                                 where s.ListBy1 == "active"
                                 select new
                                 {
                                     s.ProductID,
                                     s.PricePerBlock,
                                     s.PricePerDay,
                                     s.ProductName,
                                     s.ProductDistrict,
                                     s.ProductAvatar
                                 }
                               ).OrderByDescending(p => p.ProductID).ToList();

        int kk = 0;
        proListHtml1 += "<div id=\"product-slick-1\" class=\"product-slick\">";
        foreach (var item in productListGroup1)
        {
            kk++;
            html1 += "<div class=\"product product-single\">";
            html1 += "<div class=\"product-thumb\">";
            html1 += "<button class=\"quickInfoHover quick-view\">Giá thuê theo giờ: " + float.Parse(item.PricePerBlock.ToString()).ToString("#,###") + " đ<br> Gia thue theo ngay: " + float.Parse(item.PricePerDay.ToString()).ToString("#,###") + " đ<br> Khu vực: " + item.ProductDistrict + "</button>";
            html1 += "<img src=\"" + item.ProductAvatar + "\" alt=\"\">";
            html1 += "</div>";
            html1 += "<div class=\"product-body\">";
            html1 += "<h2 class=\"product-name\"><a href=\"../productdetail?productID=" + kk + "\">" + item.ProductName + "</a></h2>";
            html1 += "<h3 class=\"product-price\">" + float.Parse(item.PricePerBlock.ToString()).ToString("#,###") + "</h3>";
            html1 += "<span class=\"price-per\">&nbsp/block &nbsp</span>";
            html1 += "<span class=\"product-price\"> - &nbsp </span>";
            html1 += "<h3 class=\"product-price\">" + float.Parse(item.PricePerDay.ToString()).ToString("#,###") + "</h3>";
            html1 += "<span class=\"price-per\">&nbsp/ ngày &nbsp</span>";
            html1 += "<h4 class=\"product-location\">" + item.ProductDistrict + "</h4>";
            html1 += "<div class=\"product-btns\">";
            html1 += "<button class=\"main-btn icon-btn\"><i class=\"fa fa-heart\"></i></button>";
            html1 += "<a class=\"primary-btn add-to-cart\" href=\"../productdetail?productID=" + item.ProductID + "\"><i class=\"fa fa-shopping-cart\"></i> XEM CHI TIẾT</a>";
            html1 += "</div>";
            html1 += "</div>";
            html1 += "</div>";
        }
        proListHtml1 += html1;
        proListHtml1 += "</div>";
        this.dbPrGroupRow1.InnerHtml = proListHtml1;
    }

    private void loadProductGroup2()
    {
        string html2 = "";
        string proListhtml2 = "";
        var productListGroup2 = (from s in db.tb_Product
                                 where s.ListBy2 == "active"
                                 select new
                                 {
                                     s.ProductID,
                                     s.PricePerBlock,
                                     s.PricePerDay,
                                     s.ProductName,
                                     s.ProductDistrict,
                                     s.ProductAvatar
                                 }
                               ).OrderByDescending(p => p.ProductID).ToList();

        int kk = 0;
        proListhtml2 += "<div id=\"product-slick-2\" class=\"product-slick\">";
        foreach (var item in productListGroup2)
        {
            kk++;
            html2 += "<div class=\"product product-single\">";
            html2 += "<div class=\"product-thumb\">";
            html2 += "<button class=\"quickInfoHover quick-view\">Giá thuê theo giờ: " + float.Parse(item.PricePerBlock.ToString()).ToString("#,###") + " đ<br> Gia thue theo ngay: " + float.Parse(item.PricePerDay.ToString()).ToString("#,###") + " đ<br> Khu vực: " + item.ProductDistrict + "</button>";
            html2 += "<img src=\"" + item.ProductAvatar + "\" alt=\"\">";
            html2 += "</div>";
            html2 += "<div class=\"product-body\">";
            html2 += "<h2 class=\"product-name\"><a href=\"../productdetail?productID=" + kk + "\">" + item.ProductName + "</a></h2>";
            html2 += "<h3 class=\"product-price\">" + float.Parse(item.PricePerBlock.ToString()).ToString("#,###") + "</h3>";
            html2 += "<span class=\"price-per\">&nbsp/block &nbsp</span>";
            html2 += "<span class=\"product-price\"> - &nbsp </span>";
            html2 += "<h3 class=\"product-price\">" + float.Parse(item.PricePerDay.ToString()).ToString("#,###") + "</h3>";
            html2 += "<span class=\"price-per\">&nbsp/ ngày &nbsp</span>";
            html2 += "<h4 class=\"product-location\">" + item.ProductDistrict + "</h4>";
            html2 += "<div class=\"product-btns\">";
            html2 += "<button class=\"main-btn icon-btn\"><i class=\"fa fa-heart\"></i></button>";
            html2 += "<a class=\"primary-btn add-to-cart\" href=\"../productdetail?productID=" + item.ProductID + "\"><i class=\"fa fa-shopping-cart\"></i> XEM CHI TIẾT</a>";
            html2 += "</div>";
            html2 += "</div>";
            html2 += "</div>";
        }
        proListhtml2 += html2;
        proListhtml2 += "</div>";
        this.dbPrGroupRow2.InnerHtml = proListhtml2;
    }

    private void loadProductGroup3()
    {
        string html3 = "";
        string proListhtml3 = "";
        var productListGroup3 = (from s in db.tb_Product
                                 where s.ListBy3 == "active"
                                 select new
                                 {
                                     s.ProductID,
                                     s.PricePerBlock,
                                     s.PricePerDay,
                                     s.ProductName,
                                     s.ProductDistrict,
                                     s.ProductAvatar
                                 }
                               ).OrderByDescending(p => p.ProductID).ToList();

        int kk = 0;
        proListhtml3 += "<div id=\"product-slick-3\" class=\"product-slick\">";
        foreach (var item in productListGroup3)
        {
            kk++;
            html3 += "<div class=\"product product-single\">";
            html3 += "<div class=\"product-thumb\">";
            html3 += "<button class=\"quickInfoHover quick-view\">Giá thuê theo giờ: " + float.Parse(item.PricePerBlock.ToString()).ToString("#,###") + " đ<br> Gia thue theo ngay: " + float.Parse(item.PricePerDay.ToString()).ToString("#,###") + " đ<br> Khu vực: " + item.ProductDistrict + "</button>";
            html3 += "<img src=\"" + item.ProductAvatar + "\" alt=\"\">";
            html3 += "</div>";
            html3 += "<div class=\"product-body\">";
            html3 += "<h2 class=\"product-name\"><a href=\"../productdetail?productID=" + kk + "\">" + item.ProductName + "</a></h2>";
            html3 += "<h3 class=\"product-price\">" + float.Parse(item.PricePerBlock.ToString()).ToString("#,###") + "</h3>";
            html3 += "<span class=\"price-per\">&nbsp/block &nbsp</span>";
            html3 += "<span class=\"product-price\"> - &nbsp </span>";
            html3 += "<h3 class=\"product-price\">" + float.Parse(item.PricePerDay.ToString()).ToString("#,###") + "</h3>";
            html3 += "<span class=\"price-per\">&nbsp/ ngày &nbsp</span>";
            html3 += "<h4 class=\"product-location\">" + item.ProductDistrict + "</h4>";
            html3 += "<div class=\"product-btns\">";
            html3 += "<button class=\"main-btn icon-btn\"><i class=\"fa fa-heart\"></i></button>";
            html3 += "<a class=\"primary-btn add-to-cart\" href=\"../productdetail?productID=" + item.ProductID + "\"><i class=\"fa fa-shopping-cart\"></i> XEM CHI TIẾT</a>";
            html3 += "</div>";
            html3 += "</div>";
            html3 += "</div>";
        }
        proListhtml3 += html3;
        proListhtml3 += "</div>";
        this.dbPrGroupRow3.InnerHtml = proListhtml3;
    }

    private void loadProductGroup4()
    {
        string html4 = "";
        string proListhtml4 = "";
        var productListGroup4 = (from s in db.tb_Product
                                 where s.ListBy4 == "active"
                                 select new
                                 {
                                     s.ProductID,
                                     s.PricePerBlock,
                                     s.PricePerDay,
                                     s.ProductName,
                                     s.ProductDistrict,
                                     s.ProductAvatar
                                 }
                               ).OrderByDescending(p => p.ProductID).ToList();

        int kk = 0;
        proListhtml4 += "<div id=\"product-slick-4\" class=\"product-slick\">";
        foreach (var item in productListGroup4)
        {
            kk++;
            html4 += "<div class=\"product product-single\">";
            html4 += "<div class=\"product-thumb\">";
            html4 += "<button class=\"quickInfoHover quick-view\">Giá thuê theo giờ: " + float.Parse(item.PricePerBlock.ToString()).ToString("#,###") + " đ<br> Gia thue theo ngay: " + float.Parse(item.PricePerDay.ToString()).ToString("#,###") + " đ<br> Khu vực: " + item.ProductDistrict + "</button>";
            html4 += "<img src=\"" + item.ProductAvatar + "\" alt=\"\">";
            html4 += "</div>";
            html4 += "<div class=\"product-body\">";
            html4 += "<h2 class=\"product-name\"><a href=\"../productdetail?productID=" + kk + "\">" + item.ProductName + "</a></h2>";
            html4 += "<h3 class=\"product-price\">" + float.Parse(item.PricePerBlock.ToString()).ToString("#,###") + "</h3>";
            html4 += "<span class=\"price-per\">&nbsp/block &nbsp</span>";
            html4 += "<span class=\"product-price\"> - &nbsp </span>";
            html4 += "<h3 class=\"product-price\">" + float.Parse(item.PricePerDay.ToString()).ToString("#,###") + "</h3>";
            html4 += "<span class=\"price-per\">&nbsp/ ngày &nbsp</span>";
            html4 += "<h4 class=\"product-location\">" + item.ProductDistrict + "</h4>";
            html4 += "<div class=\"product-btns\">";
            html4 += "<button class=\"main-btn icon-btn\"><i class=\"fa fa-heart\"></i></button>";
            html4 += "<a class=\"primary-btn add-to-cart\" href=\"../productdetail?productID=" + item.ProductID + "\"><i class=\"fa fa-shopping-cart\"></i> XEM CHI TIẾT</a>";
            html4 += "</div>";
            html4 += "</div>";
            html4 += "</div>";
        }
        proListhtml4 += html4;
        proListhtml4 += "</div>";
        this.dbPrGroupRow4.InnerHtml = proListhtml4;
    }

    private void loadProductGroup5()
    {
        string html5 = "";
        string proListhtml5 = "";
        var productListGroup5 = (from s in db.tb_Product
                                 where s.ListBy5 == "active"
                                 select new
                                 {
                                     s.ProductID,
                                     s.PricePerBlock,
                                     s.PricePerDay,
                                     s.ProductName,
                                     s.ProductDistrict,
                                     s.ProductAvatar
                                 }
                               ).OrderByDescending(p => p.ProductID).ToList();

        int kk = 0;
        proListhtml5 += "<div id=\"product-slick-5\" class=\"product-slick\">";
        foreach (var item in productListGroup5)
        {
            kk++;
            html5 += "<div class=\"product product-single\">";
            html5 += "<div class=\"product-thumb\">";
            html5 += "<button class=\"quickInfoHover quick-view\">Giá thuê theo giờ: " + float.Parse(item.PricePerBlock.ToString()).ToString("#,###") + " đ<br> Gia thue theo ngay: " + float.Parse(item.PricePerDay.ToString()).ToString("#,###") + " đ<br> Khu vực: " + item.ProductDistrict + "</button>";
            html5 += "<img src=\"" + item.ProductAvatar + "\" alt=\"\">";
            html5 += "</div>";
            html5 += "<div class=\"product-body\">";
            html5 += "<h2 class=\"product-name\"><a href=\"../productdetail?productID=" + kk + "\">" + item.ProductName + "</a></h2>";
            html5 += "<h3 class=\"product-price\">" + float.Parse(item.PricePerBlock.ToString()).ToString("#,###") + "</h3>";
            html5 += "<span class=\"price-per\">&nbsp/block &nbsp</span>";
            html5 += "<span class=\"product-price\"> - &nbsp </span>";
            html5 += "<h3 class=\"product-price\">" + float.Parse(item.PricePerDay.ToString()).ToString("#,###") + "</h3>";
            html5 += "<span class=\"price-per\">&nbsp/ ngày &nbsp</span>";
            html5 += "<h4 class=\"product-location\">" + item.ProductDistrict + "</h4>";
            html5 += "<div class=\"product-btns\">";
            html5 += "<button class=\"main-btn icon-btn\"><i class=\"fa fa-heart\"></i></button>";
            html5 += "<a class=\"primary-btn add-to-cart\" href=\"../productdetail?productID=" + item.ProductID + "\"><i class=\"fa fa-shopping-cart\"></i> XEM CHI TIẾT</a>";
            html5 += "</div>";
            html5 += "</div>";
            html5 += "</div>";
        }
        proListhtml5 += html5;
        proListhtml5 += "</div>";
        this.dbPrGroupRow5.InnerHtml = proListhtml5;
    }

    private void loadProductGroup6()
    {
        string html6 = "";
        string proListhtml6 = "";
        var productListGroup6 = (from s in db.tb_Product
                                 where s.ListBy6 == "active"
                                 select new
                                 {
                                     s.ProductID,
                                     s.PricePerBlock,
                                     s.PricePerDay,
                                     s.ProductName,
                                     s.ProductDistrict,
                                     s.ProductAvatar
                                 }
                               ).OrderByDescending(p => p.ProductID).ToList();

        int kk = 0;
        proListhtml6 += "<div id=\"product-slick-6\" class=\"product-slick\">";
        foreach (var item in productListGroup6)
        {
            kk++;
            html6 += "<div class=\"product product-single\">";
            html6 += "<div class=\"product-thumb\">";
            html6 += "<button class=\"quickInfoHover quick-view\">Giá thuê theo giờ: " + float.Parse(item.PricePerBlock.ToString()).ToString("#,###") + " đ<br> Gia thue theo ngay: " + float.Parse(item.PricePerDay.ToString()).ToString("#,###") + " đ<br> Khu vực: " + item.ProductDistrict + "</button>";
            html6 += "<img src=\"" + item.ProductAvatar + "\" alt=\"\">";
            html6 += "</div>";
            html6 += "<div class=\"product-body\">";
            html6 += "<h2 class=\"product-name\"><a href=\"../productdetail?productID=" + kk + "\">" + item.ProductName + "</a></h2>";
            html6 += "<h3 class=\"product-price\">" + float.Parse(item.PricePerBlock.ToString()).ToString("#,###") + "</h3>";
            html6 += "<span class=\"price-per\">&nbsp/block &nbsp</span>";
            html6 += "<span class=\"product-price\"> - &nbsp </span>";
            html6 += "<h3 class=\"product-price\">" + float.Parse(item.PricePerDay.ToString()).ToString("#,###") + "</h3>";
            html6 += "<span class=\"price-per\">&nbsp/ ngày &nbsp</span>";
            html6 += "<h4 class=\"product-location\">" + item.ProductDistrict + "</h4>";
            html6 += "<div class=\"product-btns\">";
            html6 += "<button class=\"main-btn icon-btn\"><i class=\"fa fa-heart\"></i></button>";
            html6 += "<a class=\"primary-btn add-to-cart\" href=\"../productdetail?productID=" + item.ProductID + "\"><i class=\"fa fa-shopping-cart\"></i> XEM CHI TIẾT</a>";
            html6 += "</div>";
            html6 += "</div>";
            html6 += "</div>";
        }
        proListhtml6 += html6;
        proListhtml6 += "</div>";
        this.dbPrGroupRow6.InnerHtml = proListhtml6;
    }

    private void loadProductGroup7()
    {
        string html7 = "";
        string proListhtml7 = "";
        var productListGroup7 = (from s in db.tb_Product
                                 where s.ListBy7 == "active"
                                 select new
                                 {
                                     s.ProductID,
                                     s.PricePerBlock,
                                     s.PricePerDay,
                                     s.ProductName,
                                     s.ProductDistrict,
                                     s.ProductAvatar
                                 }
                               ).OrderByDescending(p => p.ProductID).ToList();

        int kk = 0;
        proListhtml7 += "<div id=\"product-slick-7\" class=\"product-slick\">";
        foreach (var item in productListGroup7)
        {
            kk++;
            html7 += "<div class=\"product product-single\">";
            html7 += "<div class=\"product-thumb\">";
            html7 += "<button class=\"quickInfoHover quick-view\">Giá thuê theo giờ: " + float.Parse(item.PricePerBlock.ToString()).ToString("#,###") + " đ<br> Gia thue theo ngay: " + float.Parse(item.PricePerDay.ToString()).ToString("#,###") + " đ<br> Khu vực: " + item.ProductDistrict + "</button>";
            html7 += "<img src=\"" + item.ProductAvatar + "\" alt=\"\">";
            html7 += "</div>";
            html7 += "<div class=\"product-body\">";
            html7 += "<h2 class=\"product-name\"><a href=\"../productdetail?productID=" + kk + "\">" + item.ProductName + "</a></h2>";
            html7 += "<h3 class=\"product-price\">" + float.Parse(item.PricePerBlock.ToString()).ToString("#,###") + "</h3>";
            html7 += "<span class=\"price-per\">&nbsp/block &nbsp</span>";
            html7 += "<span class=\"product-price\"> - &nbsp </span>";
            html7 += "<h3 class=\"product-price\">" + float.Parse(item.PricePerDay.ToString()).ToString("#,###") + "</h3>";
            html7 += "<span class=\"price-per\">&nbsp/ ngày &nbsp</span>";
            html7 += "<h4 class=\"product-location\">" + item.ProductDistrict + "</h4>";
            html7 += "<div class=\"product-btns\">";
            html7 += "<button class=\"main-btn icon-btn\"><i class=\"fa fa-heart\"></i></button>";
            html7 += "<a class=\"primary-btn add-to-cart\" href=\"../productdetail?productID=" + item.ProductID + "\"><i class=\"fa fa-shopping-cart\"></i> XEM CHI TIẾT</a>";
            html7 += "</div>";
            html7 += "</div>";
            html7 += "</div>";
        }
        proListhtml7 += html7;
        proListhtml7 += "</div>";
        this.dbPrGroupRow7.InnerHtml = proListhtml7;
    }

    private void loadProductGroupSlideCate1()
    {
        string html1 = "";
        string proListHtml1 = "";
        var productListGroup1 = db.tb_CategoryMain.OrderBy(p => p.Sort).ToList();

        int kk = 0;
        proListHtml1 += "<div class=\"panel_category_content slide_content\" data-current-page=\"1\">";
        proListHtml1 += "<div class=\"panel_category_item\">";
        proListHtml1 += "<div class=\"item_content active\">";
        proListHtml1 += "<span class=\"item_icon\"><i class=\"fa fa-hospital-o slideSizeFontAwesome\"></i></span>";
        proListHtml1 += "<span class=\"item_text\">Tất cả</span>";
        proListHtml1 += "</div>";
        proListHtml1 += "</div>";
        foreach (var item in productListGroup1)
        {
            kk++;
            html1 += "<div class=\"panel_category_item\">";
            html1 += "<div class=\"item_content\">";
            html1 += "<span class=\"item_icon\"><i class=\""+item.MainCateIcon+"\"></i></span>";
            html1 += "<span class=\"item_text\">"+item.MainCateName+"</span>";
            html1 += "</div>";
            html1 += "</div>";
        }
        proListHtml1 += html1;
        proListHtml1 += "</div>";
        this.dbPrGroupSlideCate1.InnerHtml = proListHtml1;
    }

    private void loadProductGroupSlideCate2()
    {
        string html1 = "";
        string proListHtml1 = "";
        var productListGroup1 = db.tb_CategoryMain.OrderBy(p => p.Sort).ToList();

        int kk = 0;
        proListHtml1 += "<div class=\"panel_category_content slide_content\" data-current-page=\"1\">";
        proListHtml1 += "<div class=\"panel_category_item\">";
        proListHtml1 += "<div class=\"item_content active\" style=\"color:crimson;border-bottom-color:crimson\">";
        proListHtml1 += "<span class=\"item_icon\"><i class=\"fa fa-hospital-o slideSizeFontAwesome\"></i></span>";
        proListHtml1 += "<span class=\"item_text\">Tất cả</span>";
        proListHtml1 += "</div>";
        proListHtml1 += "</div>";
        foreach (var item in productListGroup1)
        {
            kk++;
            html1 += "<div class=\"panel_category_item\">";
            html1 += "<div class=\"item_content\">";
            html1 += "<span class=\"item_icon\"><i class=\"" + item.MainCateIcon + "\"></i></span>";
            html1 += "<span class=\"item_text\">" + item.MainCateName + "</span>";
            html1 += "</div>";
            html1 += "</div>";
        }
        proListHtml1 += html1;
        proListHtml1 += "</div>";
        this.dbPrGroupSlideCate2.InnerHtml = proListHtml1;
    }

    private void loadProductGroupSlideCate3()
    {
        string html1 = "";
        string proListHtml1 = "";
        var productListGroup1 = db.tb_CategoryMain.OrderBy(p => p.Sort).ToList();

        int kk = 0;
        proListHtml1 += "<div class=\"panel_category_content slide_content\" data-current-page=\"1\">";
        proListHtml1 += "<div class=\"panel_category_item\">";
        proListHtml1 += "<div class=\"item_content active\" style=\"color:rgb(20, 33, 220);border-bottom-color:rgb(20, 33, 220)\">";
        proListHtml1 += "<span class=\"item_icon\"><i class=\"fa fa-hospital-o slideSizeFontAwesome\"></i></span>";
        proListHtml1 += "<span class=\"item_text\">Tất cả</span>";
        proListHtml1 += "</div>";
        proListHtml1 += "</div>";
        foreach (var item in productListGroup1)
        {
            kk++;
            html1 += "<div class=\"panel_category_item\">";
            html1 += "<div class=\"item_content\">";
            html1 += "<span class=\"item_icon\"><i class=\"" + item.MainCateIcon + "\"></i></span>";
            html1 += "<span class=\"item_text\">" + item.MainCateName + "</span>";
            html1 += "</div>";
            html1 += "</div>";
        }
        proListHtml1 += html1;
        proListHtml1 += "</div>";
        this.dbPrGroupSlideCate3.InnerHtml = proListHtml1;
    }

    private void loadProductGroupSlideCate4()
    {
        string html1 = "";
        string proListHtml1 = "";
        var productListGroup1 = db.tb_CategoryMain.OrderBy(p => p.Sort).ToList();

        int kk = 0;
        proListHtml1 += "<div class=\"panel_category_content slide_content\" data-current-page=\"1\">";
        proListHtml1 += "<div class=\"panel_category_item\">";
        proListHtml1 += "<div class=\"item_content active\" style=\"color:rgb(10, 221, 56);border-bottom-color:rgb(10, 221, 56)\">";
        proListHtml1 += "<span class=\"item_icon\"><i class=\"fa fa-hospital-o slideSizeFontAwesome\"></i></span>";
        proListHtml1 += "<span class=\"item_text\">Tất cả</span>";
        proListHtml1 += "</div>";
        proListHtml1 += "</div>";
        foreach (var item in productListGroup1)
        {
            kk++;
            html1 += "<div class=\"panel_category_item\">";
            html1 += "<div class=\"item_content\">";
            html1 += "<span class=\"item_icon\"><i class=\"" + item.MainCateIcon + "\"></i></span>";
            html1 += "<span class=\"item_text\">" + item.MainCateName + "</span>";
            html1 += "</div>";
            html1 += "</div>";
        }
        proListHtml1 += html1;
        proListHtml1 += "</div>";
        this.dbPrGroupSlideCate4.InnerHtml = proListHtml1;
    }

    private void loadProductGroupSlideCate5()
    {
        string html1 = "";
        string proListHtml1 = "";
        var productListGroup1 = db.tb_CategoryMain.OrderBy(p => p.Sort).ToList();

        int kk = 0;
        proListHtml1 += "<div class=\"panel_category_content slide_content\" data-current-page=\"1\">";
        proListHtml1 += "<div class=\"panel_category_item\">";
        proListHtml1 += "<div class=\"item_content active\" style=\"color:rgb(221, 10, 158);border-bottom-color:rgb(221, 10, 158)\">";
        proListHtml1 += "<span class=\"item_icon\"><i class=\"fa fa-hospital-o slideSizeFontAwesome\"></i></span>";
        proListHtml1 += "<span class=\"item_text\">Tất cả</span>";
        proListHtml1 += "</div>";
        proListHtml1 += "</div>";
        foreach (var item in productListGroup1)
        {
            kk++;
            html1 += "<div class=\"panel_category_item\">";
            html1 += "<div class=\"item_content\">";
            html1 += "<span class=\"item_icon\"><i class=\"" + item.MainCateIcon + "\"></i></span>";
            html1 += "<span class=\"item_text\">" + item.MainCateName + "</span>";
            html1 += "</div>";
            html1 += "</div>";
        }
        proListHtml1 += html1;
        proListHtml1 += "</div>";
        this.dbPrGroupSlideCate5.InnerHtml = proListHtml1;
    }

    private void loadProductGroupSlideCate6()
    {
        string html1 = "";
        string proListHtml1 = "";
        var productListGroup1 = db.tb_CategoryMain.OrderBy(p => p.Sort).ToList();

        int kk = 0;
        proListHtml1 += "<div class=\"panel_category_content slide_content\" data-current-page=\"1\">";
        proListHtml1 += "<div class=\"panel_category_item\">";
        proListHtml1 += "<div class=\"item_content active\" style=\"color:brown;border-bottom-color:brown\">";
        proListHtml1 += "<span class=\"item_icon\"><i class=\"fa fa-hospital-o slideSizeFontAwesome\"></i></span>";
        proListHtml1 += "<span class=\"item_text\">Tất cả</span>";
        proListHtml1 += "</div>";
        proListHtml1 += "</div>";
        foreach (var item in productListGroup1)
        {
            kk++;
            html1 += "<div class=\"panel_category_item\">";
            html1 += "<div class=\"item_content\">";
            html1 += "<span class=\"item_icon\"><i class=\"" + item.MainCateIcon + "\"></i></span>";
            html1 += "<span class=\"item_text\">" + item.MainCateName + "</span>";
            html1 += "</div>";
            html1 += "</div>";
        }
        proListHtml1 += html1;
        proListHtml1 += "</div>";
        this.dbPrGroupSlideCate6.InnerHtml = proListHtml1;
    }

    private void loadProductGroupSlideCate7()
    {
        string html1 = "";
        string proListHtml1 = "";
        var productListGroup1 = db.tb_CategoryMain.OrderBy(p => p.Sort).ToList();

        int kk = 0;
        proListHtml1 += "<div class=\"panel_category_content slide_content\" data-current-page=\"1\">";
        proListHtml1 += "<div class=\"panel_category_item\">";
        proListHtml1 += "<div class=\"item_content active\" style=\"color:blueviolet;border-bottom-color:blueviolet\">";
        proListHtml1 += "<span class=\"item_icon\"><i class=\"fa fa-hospital-o slideSizeFontAwesome\"></i></span>";
        proListHtml1 += "<span class=\"item_text\">Tất cả</span>";
        proListHtml1 += "</div>";
        proListHtml1 += "</div>";
        foreach (var item in productListGroup1)
        {
            kk++;
            html1 += "<div class=\"panel_category_item\">";
            html1 += "<div class=\"item_content\">";
            html1 += "<span class=\"item_icon\"><i class=\"" + item.MainCateIcon + "\"></i></span>";
            html1 += "<span class=\"item_text\">" + item.MainCateName + "</span>";
            html1 += "</div>";
            html1 += "</div>";
        }
        proListHtml1 += html1;
        proListHtml1 += "</div>";
        this.dbPrGroupSlideCate7.InnerHtml = proListHtml1;
    }



    //--------------------------------
}