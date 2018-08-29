using System;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;



namespace Savina
{
    public partial class FrontSite : System.Web.UI.MasterPage
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
            //if (!Page.IsPostBack)
            //{
            //if (Session["cusEmail"].Equals(""))
            if (Session["Logged"] == null)
            {
                this.dvCusInfoShow.Style.Add("display", "none");
                this.dvCusLogin.Style.Add("display", "block");
            }
            else
            {
                string nameCusLoggedIn = Session["cusName"].ToString();
                this.dvCusInfoShow.Style.Add("display", "block");
                this.dvCusLogin.Style.Add("display", "none");
                this.cusNameLogIn.InnerHtml = "Welcome: " + nameCusLoggedIn;
            }
            //}
        }

        protected virtual void OnPreInit(EventArgs e)
        {
            if (Session["cusEmail"].Equals(""))
            {
                this.dvCusInfoShow.Style.Add("display", "none");
                this.dvCusLogin.Style.Add("display", "block");
            }
            else
            {
                string nameCusLoggedIn = Session["cusName"].ToString();
                this.dvCusInfoShow.Style.Add("display", "block");
                this.dvCusLogin.Style.Add("display", "none");
                this.cusNameLogIn.InnerHtml = "Welcome: ";
            }
        }

        protected void btnLoginUser(object sender, EventArgs e)
        {
            string emailCus = ipCustomerEmail.Value;
            string passwordCus = ipCustomerPassword.Value;

            if (passwordCus == "" && emailCus == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalLoginForm();", true);
                this.formerrors.Style.Add("display", "block");
                this.loginNotification.InnerHtml = "Vui lòng nhập Email và password";
            }
            else if (passwordCus == "" && emailCus != "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalLoginForm();", true);
                this.formerrors.Style.Add("display", "block");
                this.loginNotification.InnerHtml = "Vui lòng nhập password!";
            }
            else if (emailCus == "" && passwordCus != "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalLoginForm();", true);
                this.formerrors.Style.Add("display", "block");
                this.loginNotification.InnerHtml = "Vui lòng nhập email!";
            }
            else if (passwordCus != "" && emailCus != "")
            {
                var checklogin = Db.tb_Customer.Where(p => p.Email == emailCus && p.Password == passwordCus).FirstOrDefault();
                if (checklogin != null)
                {
                    Session["Logged"] = "yes";
                    Session["cusEmail"] = ipCustomerEmail.Value;
                    Session["cusName"] = checklogin.FirstName;
                    Session["cusID"] = checklogin.CustomerID;
                    Session["cusCode"] = checklogin.CustomerNo;
                    Response.Redirect("/ProductSearch.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalLoginForm();", true);
                    this.formerrors.Style.Add("display", "block");
                    this.loginNotification.InnerHtml = "Email hoặc Password không đúng, vui lòng thử lại!";

                }
            }
        }

        protected void btnLogOutUser(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("/index.aspx");
        }


        //--------------------
    }
}