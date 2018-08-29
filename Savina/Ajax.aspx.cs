using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;


public partial class Ajax : System.Web.UI.Page
{
    private savinaEntities db = new savinaEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string action = Request.QueryString["action"].ToString();
            switch (action)
            {
                #region getCategoryList 
                case "getCategoryList":
                    {
                        string html = Generate.getCategoryList();
                        Response.Write(html);
                    }
                    break;
                #endregion;

                #region LoginNow
                case "LoginNow":
                    {
                        string customerLoginHTML = "";
                        string cusEmail = Request.QueryString["cusEmail"].ToString();
                        string cusPass = Request.QueryString["cusPass"].ToString();
                        var customerInfo = db.tb_Customer.Where(t => t.Email == cusEmail).FirstOrDefault();
                        var tblEmail = customerInfo.Email;
                        var tblPass = customerInfo.Password;
                       // if (cusEmail.Equals(customerInfo.Email))
                       if (cusEmail == tblEmail)
                        {
                            //if (cusPass.Equals(customerInfo.Password))
                            if (cusPass == tblPass)
                            {
                                //long cusId = customerInfo.CustomerID;
                               // Session["cusID"] = cusId;
                                //login success
                                Session["cusName"] = customerInfo.FirstName ;
                                //Response.Write("1");
                                customerLoginHTML = "1";
                            }
                            else
                            {
                                //password wrong
                                //Response.Write("2");
                                customerLoginHTML = "2";
                            }
                        }
                        else
                        {
                            //email not existing
                            //Response.Write("3");
                            customerLoginHTML = "error";
                        }
                        Response.Write(customerLoginHTML);
                    }
                    break;
                #endregion

                #region Registernew
                case "Registernew":
                    {
                        String customerRegisterHTML = "";
                        try
                        {
                            string regFirstName = Request.QueryString["regFirstName"].ToString();
                            string regLastName = Request.QueryString["regLastName"].ToString();
                            string regEmail = Request.QueryString["regEmail"].ToString();
                            string regPassword = Request.QueryString["regPassword"].ToString();
                                //insert to database
                                tb_Customer thlCustomer = new tb_Customer();
                                thlCustomer.FirstName = regFirstName;
                                thlCustomer.LastName = regLastName;
                                thlCustomer.Email = regEmail;
                                thlCustomer.Password = regPassword;
                                thlCustomer.CustomerGroup = 3;
                                thlCustomer.CustomerNo = "cusfront2018";
                                thlCustomer.CreateDate = DateTime.Now;
                                db.tb_Customer.Add(thlCustomer);
                                db.SaveChanges();
                                Response.Write("<script>alert('tạo khách hàng mới thành công !')</script>");                               
                            }                                                  
                        catch (Exception)
                        {
                            customerRegisterHTML = "error";
                        }
                        Response.Write(customerRegisterHTML);
                    }                       
                    break;
                #endregion

                #region[Xu ly from contact]
                case "ContactInsert":
                    ContactInsert(); break;
                    #endregion

            }
        }
    }

    private void ContactInsert()
    {
        //string title = Request.QueryString["title"].ToString();
        string contactFirstName = Request.QueryString["contactFirstName"].ToString();
        string contactLastName = Request.QueryString["contactLastName"].ToString();
        string contactPhone = Request.QueryString["contactPhone"].ToString();
        string contactEmail = Request.QueryString["contactEmail"].ToString();
        string contactTitle = Request.QueryString["contactTitle"].ToString();
        string contactContent = Request.QueryString["contactContent"].ToString();
        tb_ContactMessage cMessage = new tb_ContactMessage();

        cMessage.FirstName = contactFirstName;
        cMessage.LastName = contactLastName;
        cMessage.PhoneNumber = contactPhone;
        cMessage.EmailAddress = contactEmail;
        cMessage.MessageTitle = contactTitle;
        cMessage.MessageContent = contactContent;
        cMessage.IsRead = "NULL";
        cMessage.CreateDate = DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd"));
        db.tb_ContactMessage.Add(cMessage);
        db.SaveChanges();
        Response.Write("true");
        string html = "";
        html += "<h3>Dear Savina,</h3> ";
        html += "<h4>Có một liên hệ được gửi từ khách hàng bên dưới thông qua trang CONTACT US:<h4>";
        html += "<p>-&nbsp; Tên khách hàng:&nbsp; " + contactFirstName + "</p>";
        html += "<p>-&nbsp; Họ khách hàng:&nbsp;" + contactLastName + "</p>";
        html += "<p>-&nbsp; Số điện thoại:&nbsp; " + contactPhone + "</p>";
        html += "<p>-&nbsp; Email: &nbsp;" + contactEmail + " </p>";
        html += "<p>-&nbsp; Tiêu đề liên hệ:&nbsp;" + contactTitle + "</p>";
        html += "<p>-&nbsp; Nội dung:&nbsp;" + contactContent + "</p>";

        System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();
        mailMessage.From = new MailAddress("terry@senseproperty.com", "Savina rental website");
        mailMessage.To.Add("tuan.lequoc@siyosa.net");
        mailMessage.Body = html;
        mailMessage.Subject = " Từ Savina website – Có liên hệ mới từ khách hàng";
        mailMessage.IsBodyHtml = true;
        mailMessage.Priority = System.Net.Mail.MailPriority.High;
        SmtpClient client = new SmtpClient();

        //Add the Creddentials- use your own email id and password
        client.UseDefaultCredentials = false;
        client.Host = "mail.senseproperty.com"; //Or Your SMTP Server Address  
        client.Port = 25;
        client.EnableSsl = false;
        client.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
        client.Credentials = new System.Net.NetworkCredential("terry@senseproperty.com", "spgEmail#123");
        try
        {
            //spg dang cho  ngung chuc nang sendmail nay
            client.Send(mailMessage);
        }
        catch (Exception)
        {
        }
    }
}