using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backend_getlinkimage : System.Web.UI.Page
{
    private savinaEntities db = new savinaEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            loadlinkimg();
        }
    }

    private void loadlinkimg()
    {
        string html = "";
        var link = db.tb_GetLinkImage.OrderByDescending(p => p.imgID).ToList();
        html += "<table class='table table-striped table-bordered' id=' id='sort-table'>";
        html += "<thead>";
        html += "<tr>";
        html += "<th>NO</th>";
        html += "<th>Hình đại diện</th>";
        html += "<th>Link</th>";

        html += "</tr>";
        html += "</thead>";
        html += "<tbody>";
        for (int i = 0; i < link.Count; i++)
        {
            html += "<tr class='acticle' id='" + link[i].imgID + "'>";
            html += "<td class='auto-style2'>" + (i + 1).ToString() + "</td>";
            html += "<td><img src='" + link[i].imgPath + "' style='width:50px;height:50px;' /></td>";
            html += "<td>" + link[i].imgPath + "</td>";

            html += "</tr>";
        }
        html += "</tbody>";
        html += "</table>";

        this.loadLink.InnerHtml = html;
    }
    protected void InsertImage(object sender, EventArgs e)
    {
        //Bẫy lỗi kích thước 
        int iFileSize = f_Upload.PostedFile.ContentLength;
        if (iFileSize > 30000000)  // 3MB approx (actually less though)
        {
            return;
        }

        //Bẫy lỗi kiểu file
        string filename = Path.GetFileName(f_Upload.FileName);
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
                tb_GetLinkImage img = new tb_GetLinkImage();
                string fileName = filename;
                f_Upload.SaveAs(path + fileName);
                img.imgPath = "http://savinaweb.siyosa.net/image_banner/" + fileName;
                img.imgUpload = DateTime.Now;
                db.tb_GetLinkImage.Add(img);
                db.SaveChanges();
                Response.Write("<script>alert('Upload Complete !')</script>");
                loadlinkimg();
            }
            catch (Exception)
            {
                Response.Write("<script>alert('False !')</script>");
            }
        }
    }
    public static string LoaiBoDauTiengViet(string noiDung)
    {
        Regex regex = new Regex("\\p{IsCombiningDiacriticalMarks}+");
        string temp = noiDung.Normalize(NormalizationForm.FormD).Trim();

        string kq = regex.Replace(temp, String.Empty)
                    .Replace('\u0111', 'd')
                    .Replace('\u0110', 'D')
                    .Replace(",", "")
                    .Replace(".", "")
                    .Replace("!", "")
                    .Replace("(", "")
                    .Replace(")", "")
                    .Replace(";", "")
                    .Replace(" ", "")
                    .Replace(":", "")
                    .Replace("/", "");
        while (kq.Contains("--"))
            kq = kq.Replace("--", "");
        while (kq.Contains("  "))
            kq = kq.Replace("  ", "");
        return kq.ToLower(); ;
    }
}