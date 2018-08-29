using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backend_adTemplate : System.Web.UI.MasterPage
{
    private savinaEntities db = new savinaEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        //{
        //    string strValueUserAd = Session["userAd"].ToString();
        //    if (strValueUserAd == null)
        //    {
        //        Response.Redirect("../backend/login.aspx");
        //    }
        //    else
        //    {
        //        this.userAdWelcome.InnerHtml = "Welcome " + strValueUserAd;
        //        loadAdAvatar();
        //    }
        //}
        if (Session["AdLogged"] == null)
        {
            Response.Redirect("../backend/login.aspx");
        }
        else
        {
            string nameAccLoggedIn = Session["userAd"].ToString();
            this.userAdWelcome.InnerHtml = "Welcome " + nameAccLoggedIn;
            loadAdAvatar();
        }
    }

    private void loadAdAvatar()
    {
        string html = "";
        string strUserAdIdtemp = Session["idadmin"].ToString();
        var strUserAdId = long.Parse(strUserAdIdtemp);
        var avatarAd = db.tb_LocalAccount.Where(p => p.LocalAccountID == strUserAdId).FirstOrDefault();
        html += "<img src=\""+avatarAd.Avatar+"\" alt=\"\">";
           this.userAdAvatar.InnerHtml = html;
    }
}
