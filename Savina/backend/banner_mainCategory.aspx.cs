using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backend_banner_mainCategory : System.Web.UI.Page
{
    private savinaEntities db = new savinaEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //getBannerMainCat();
        }
    }

    //private void getBannerMainCat()
    //{
    //    string mainCatHtml = "";
    //    string html = "";
    //    var bannerList = (from sl in db.tb_CategoryMain
    //                      select new
    //                      {
    //                          sl.MainCateID,
    //                          sl.MainCateName,
    //                          sl.MainCateBanner,
    //                          sl.CreateDate
    //                      }
    //         ).OrderBy(p => p.MainCateID).ToList();
    //    int kk = 0;
    //    foreach (var item in bannerList)
    //    {
    //        kk++;
    //        html += "<tr>";
    //        html += "<td>" + kk + "</td>";
    //        html += "<td>" + item.MainCateName + "</td>";
    //        html += "<td>" + item.CreateDate + "</td>";
    //        if (item.MainCateBanner == null)
    //        {
    //            html += "<td>Không có banner</td>";
    //        }
    //        else
    //        {
    //            html += " <td><img src=\"" + item.MainCateBanner + "\" class=\"imgBannerInTable\"/></td>";
    //        }
    //        html += "<asp:FileUpload ID=\"selectFileBanner"+item.MainCateID+"\" CssClass=\"btn-group btn btn-info btn-xs\" runat=\"server\"/>";          
    //        html += "<td><asp:Button ID=\"btnBanner" + item.MainCateID+ "\" runat=\"server\" Class=\"btn btn-primary\" OnClick=\"btnBannerUpload\" Text=\"UPLOAD\"/></td>";
    //        html += "</tr>";
    //    }
    //    mainCatHtml += html;
    //    this.tblBannerMainCat.InnerHtml = mainCatHtml;
    //}

    //protected void btnBannerUpload4(object sender, EventArgs e)
    //{
    //    //Bẫy lỗi kiểu file
    //    string filename = Path.GetFileName(selectFileBanner4.FileName);
    //    // var sliderLanding = $('#ipSliderLanding').val();
    //    var Extension = filename.Substring(filename.LastIndexOf('.') + 1).ToLower();
    //    if (Extension != "gif" && Extension != "png" && Extension != "jpg")
    //    {
    //        return;
    //    }

    //    if (filename != null && filename.Length > 0)
    //    {
    //        string path = Server.MapPath("~/image_banner/");
    //        try
    //        {
    //            tb_CategoryMain banner = new tb_CategoryMain();
    //            string fileName = filename;
    //            selectFileBanner4.SaveAs(path + fileName);
    //            banner.MainCateBanner = "../image_banner/" + fileName;
    //            db.tb_CategoryMain.Add(banner);
    //            db.SaveChanges();
    //            Response.Write("<script>alert('Upload Complete !')</script>");
    //        }
    //        catch (Exception)
    //        {
    //            Response.Write("<script>alert('False !')</script>");
    //        }
    //    }
    //}

    //----------------
}