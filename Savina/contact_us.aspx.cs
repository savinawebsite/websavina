using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contact_us : System.Web.UI.Page
{
    private savinaEntities db = new savinaEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

        }
    }

    //protected void btnMain_banner(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        tb_ContactMessage cMessage = new tb_ContactMessage();
    //        string contactFirstName = Request.Form["ctl00$MainContent$idContactFirstName"];
    //        string contactLastName = Request.Form["ctl00$MainContent$idContactLastName"];
    //        string contactPhone = Request.Form["ctl00$MainContent$idContactPhone"];
    //        string contactEmail = Request.Form["ctl00$MainContent$idContactEmail"];
    //        string contactTitle = Request.Form["ctl00$MainContent$idContactTitle"];
    //        string contactContent = Request.Form["ctl00$MainContent$idContactContent"];
    //        if (contactFirstName == "")
    //        {
    //            Response.Write("<script>alert('Vui lòng nhập tên !')</script>");
    //        } else
    //        {
    //            cMessage.FirstName = contactFirstName;
    //        }
    //       if (contactLastName =="")
    //        {
    //            Response.Write("<script>alert('Vui lòng nhập Họ !')</script>");
    //        } else
    //        {
    //            cMessage.LastName = contactLastName;
    //        }
    //        if (contactPhone == "")
    //        {
    //            Response.Write("<script>alert('Vui lòng nhập số điện thoại !')</script>");
    //        } else
    //        {
    //            cMessage.PhoneNumber = contactPhone;
    //        }
    //        if (contactEmail == "")
    //        {
    //            Response.Write("<script>alert('Vui lòng nhập Email !')</script>");
    //        } else
    //        {
    //            cMessage.EmailAddress = contactEmail;
    //        }
    //        if (contactTitle == "")
    //        {
    //            Response.Write("<script>alert('Vui lòng nhập Tiêu đề !')</script>");
    //        } else
    //        {
    //            cMessage.MessageTitle = contactTitle;
    //        }
    //        if (contactContent == "")
    //        {
    //            Response.Write("<script>alert('Vui lòng nhập Nội dung !')</script>");
    //        } else
    //        {
    //            cMessage.MessageContent = contactContent;
    //        }
    //        cMessage.IsRead = "NULL";     
    //        cMessage.CreateDate = DateTime.Now;
    //        db.tb_ContactMessage.Add(cMessage);
    //        db.SaveChanges();
    //        Response.Write("<script>alert('Tin liên hệ đã gửi thành công !')</script>");
    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write("<script>alert('Tin liên hệ gửi không thành công, vui lòng thử lại !')</script>");
    //    }
    //}


    //----------------------------
    }