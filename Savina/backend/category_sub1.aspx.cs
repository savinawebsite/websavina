using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class backend_category_sub1 : System.Web.UI.Page
{
    private savinaEntities db = new savinaEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        loadSubCat1();
        LoadMainCateFilter();
    }

    private void loadSubCat1()
    {
        string html = "";
        html = adGenerate.getSubCat1List();
        this.dvSubCate1List.InnerHtml = html;
    }

    private void LoadMainCateFilter()
    {
        string listHtml = "";
        string html = "";
        var queryfilter = db.tb_CategoryMain.OrderBy(p => p.Sort).ToList();
        int k = 0;
        listHtml += "<select class=\"form-control\" onchange=\"DDLMainCate_Selected()\" name=\"data_MainCate_filter\" id=\"data_MainCate_filter\">";
        listHtml += "<option value=\"-1\"> Filter Main Category</option>";
        foreach (var item in queryfilter)
        {
            k++;
            html += "<option value=\"" + item.MainCateID + "\">" + item.MainCateName + "</option>";
        }
        listHtml += html;
        listHtml += "</select>";
        this.data_MainCate.InnerHtml = listHtml;
    }

}