using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backend_home_slider_management : System.Web.UI.Page
{
    private savinaEntities db = new savinaEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            getBannerMainSlider();
        }
           
    }

    private void getBannerMainSlider()
    {
        string mainSliderHtml = "";
        string html = "";

        var bannerList = (from sl in db.tb_HomeMainBanner
                          select new
                          {
                              sl.HomeMainBannerID,
                              sl.BannerPath,
                              sl.BannerLandingpage,
                              sl.BannerUpload,
                              sl.BannerHeader1,
                              sl.BannerHeader2,
                              sl.SortArr
                          }
             ).OrderBy(p => p.HomeMainBannerID).ToList();

        int kk = 0;
        foreach (var item in bannerList)
        {
            kk++;
            html += "<tr>";
            html += "<td>" + kk + "</td>";
            html += "<td>" + item.SortArr + "</td>";
            html += "<td>" + item.BannerLandingpage + "</td>";
            html += "<td>" + item.BannerUpload + "</td>";
            html += "<td>"+item.BannerHeader1+" </td>";
            html += "<td>" + item.BannerHeader2 + " </td>";
            html += " <td><img src=\"" + item.BannerPath + "\" class=\"imgBannerInTable\"/></td>";
            //html += "<td><a href=\"#\" class=\"btn btn-info btn-xs\" onclick=\"Edit($(this))\"><i class=\"fa fa-edit\"></i>&nbsp Edit</a>";
            html += "<td><a href=\"#\" class=\"btn btn-danger btn-xs\" onclick=\"Delete(this,'"+item.HomeMainBannerID.ToString() + "')\"><i class=\"fa fa-trash\"></i>&nbsp Delete</a></td>";
            html += "</td>";
            html += "</tr>";
        }

        mainSliderHtml += html;
        this.tblMainSlider.InnerHtml = mainSliderHtml;
    }

    protected void btnMain_banner(object sender, EventArgs e)
    {
        //Bẫy lỗi kiểu file
        string filename = Path.GetFileName(ipSliderFile.FileName);
       // var sliderLanding = $('#ipSliderLanding').val();
        var Extension = filename.Substring(filename.LastIndexOf('.') + 1).ToLower();
        if (Extension != "gif" && Extension != "png" && Extension != "jpg")
        {
            return;
        }

        if (filename != null && filename.Length > 0)
        {
            string path = Server.MapPath("~/image_banner/");
            try
            {
                tb_HomeMainBanner img = new tb_HomeMainBanner();
                string fileName = filename;
                string mSliderLanding = Request.Form["ctl00$ContentPlaceHolder1$ipSliderLanding"];
                string mSliderHeader1 = Request.Form["ctl00$ContentPlaceHolder1$ipSliderHeader1"];
                string mSliderHeader2 = Request.Form["ctl00$ContentPlaceHolder1$ipSliderHeader2"];
                string mSliderSort = Request.Form["ctl00$ContentPlaceHolder1$ipSliderSort"];
                int slidesort=0;
                if (mSliderSort != null)
                {
                    slidesort = int.Parse(mSliderSort);
                }

                ipSliderFile.SaveAs(path + fileName);
                img.BannerPath = "../image_banner/" + fileName;
                img.BannerUpload = DateTime.Now;
                img.BannerLandingpage = mSliderLanding;
                img.BannerHeader1 = mSliderHeader1;
                img.BannerHeader2 = mSliderHeader2;
                img.SortArr = slidesort;
                db.tb_HomeMainBanner.Add(img);
                db.SaveChanges();
                Response.Write("<script>alert('Upload Complete !')</script>");
                getBannerMainSlider();
            }
            catch (Exception)
            {
                Response.Write("<script>alert('False !')</script>");
            }
        }
    }

    protected void btnDeleteCustomer(object sender, EventArgs e)
    {
        try
        {
            int sliderID = 0;
            string cID = Request.Form["ctl00$ContentPlaceHolder1$sliderID"];
            if (cID != null)
            {
                sliderID = int.Parse(cID);
                tb_HomeMainBanner t = (tb_HomeMainBanner)db.tb_HomeMainBanner.Where(b => b.HomeMainBannerID == sliderID).First();
                db.tb_HomeMainBanner.Remove(t);
                db.SaveChanges();
                Response.Write("<script>alert('Xoa slide hình thành công !')</script>");
                getBannerMainSlider(); 
            }
        }
        catch (Exception)
        {
            Response.Write("<script>alert('Xóa không thành công, vui lòng thử lại !')</script>");
        }
    }
}