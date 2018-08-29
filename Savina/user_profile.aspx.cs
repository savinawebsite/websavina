using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_profile : System.Web.UI.Page
{
    private savinaEntities db = new savinaEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        string customerIDtemp = Session["cusID"].ToString();
        int customerID = int.Parse(customerIDtemp);
        if (customerIDtemp != null)
        {
            getCustomerProfile(customerID);
        }
    }

    private void getCustomerProfile(int customerID)
    {
        var cusInfo = db.tb_Customer.Where(p => p.CustomerID == customerID).FirstOrDefault();
        this.customerCode.Value = cusInfo.CustomerNo;
        this.cusLastname.Value = cusInfo.LastName;
        this.customerFirstname.Value = cusInfo.FirstName;
        this.customerEmail.Value = cusInfo.Email;
        this.customerPhoneNumber.Value = cusInfo.Phone;
        this.customerAddress.Value = cusInfo.Address;        
        this.customerDescription.Value = cusInfo.Description;
        this.customerJoinTime.InnerHtml = cusInfo.CreateDate.ToString();
        this.customerAddressFull.InnerHtml = cusInfo.Address;
        this.customerFullNameH3.InnerHtml = cusInfo.LastName + " " + cusInfo.FirstName;

        string cusAvatar = "";
        cusAvatar = "<img src=\"" + cusInfo.Avatar.ToString() + "\" alt=\"Avatar\" title=\"Change the avatar\" class=\"img-responsive avatar-view\"/>";
        this.customerAvatar.InnerHtml = cusAvatar;

        var cusGroup = (from sl in db.tb_Customer
                        join cg in db.tb_GroupCustomer on sl.CustomerGroup equals cg.GroupCusID
                        select new
                        {
                            sl.CustomerGroup,
                            cg.GroupCusName
                        });

        this.customerGroup.Value = cusInfo.CustomerGroup.ToString();

    }
}