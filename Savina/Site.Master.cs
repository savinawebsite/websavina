using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Savina
{
    public partial class SiteMaster : MasterPage
    {
        private savinaEntities Db = new savinaEntities();
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //this.cusNameLogIn.InnerHtml = "hello you";
            //if (!Page.IsPostBack)
            //{
            //    string valueCusLoggedIn = Session["cusName"].ToString();
            //    if (valueCusLoggedIn != null)
            //    {
            //        dvCusInfoShow.Style.Add("display", "block");
            //        this.dvCusLogin.Style.Add("display", "none");
            //        this.cusNameLogIn.innerHtml = "Welcome:" + valueCusLoggedIn;
            //    }
            //    else
            //    {
            //        this.dvCusInfoShow.Style.Add("display", "none");
            //        this.dvCusLogin.Style.Add("display", "block");
            //    }
            //}
        }

        public void btnRegister(object sender, EventArgs e)
        {
            // do something
        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }

        //protected void btnCustomerLogin(object sender, EventArgs e)
        //{
        //    //string username = ipCustomerEmail.Value;
        //    string username = Request.Form["ctl00$ContentPlaceHolder1$ipCustomerEmail"];
        //    string password = Request.Form["ctl00$ContentPlaceHolder1$ipCustomerPassword"];
        //    var checklogin = Db.tb_Customer.Where(p => p.UserName == username && p.Password == password).FirstOrDefault();
        //    if (checklogin != null)
        //    {
        //        Session["user"] = username;
        //        Session["idadmin"] = checklogin.CustomerID;
        //        Response.Redirect("index.aspx");
        //    }
        //    else
        //    {
        //       // bodymodal.InnerHtml = "Password không đúng, vui lòng thử lại!";
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        //    }
        //}

        


            
        //-----------------
    }

}