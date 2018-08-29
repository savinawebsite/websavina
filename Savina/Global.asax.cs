using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Savina
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Session_Start(Object sender, EventArgs e)
        {
            Session["sub1Maincatefilter"] = "No";
            Session["Logged"] = "No";
            Session["AdLogged"] = "No";
            Session["userAd"] = "";
            Session["idaccAd"] = 0;
            Session["cusEmail"] = "";
            Session["cusName"] = "";
            Session["cusID"] = 0;
            Session["cusCode"] = "";
            // create session for product detail
            Session["sPrPrice"] = "";
            Session["sPrPickTime"] = "";
            Session["sPrdReturnTime"] = "";
            Session["sPrQty"] = "";
            Session["sPrDelivery"] = "";
            Session["sPrAccompany"] = "";
            Session["sPrAccessory"] = "";
            Session["sPrService"] = "";
            Session["sPrDocument"] = "";
            Session[""] = "";
        }
    }
}