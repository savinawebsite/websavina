using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

public partial class backend_category_main : System.Web.UI.Page
{
    private savinaEntities db = new savinaEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        loadMainCate();
    }

    private void loadMainCate()
    {
        String mainCateListHTML = "";
        List<tb_CategoryMain> mainCateList = adGenerate.getMainCateList();
        if (mainCateList.Count() != 0)
        {
            mainCateListHTML = adGenerate.generateHTMLMainCate(mainCateList);
        }
        this.dvMainCateList.InnerHtml = mainCateListHTML;
    }


}