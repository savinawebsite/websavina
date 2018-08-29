using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class backend_category_sub2 : System.Web.UI.Page
{
    private savinaEntities db = new savinaEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        loadSubCate2();
        //LoadMainCateSearch();
        LoadMainCateFilter();
    }

    private void loadSubCate2()
    {
        String html = "";
        html = adGenerate.getSubCate2List();
        this.dvSubCate2List.InnerHtml = html;
    }

    protected void DDLMainCate_SelectedIndexChanged(object sender, EventArgs e)
    {
        //LoadSubCate1();
    }

    //private void LoadMainCateSearch()
    //{
    //    var tb_MainCate = this.db.tb_CategoryMain.OrderBy(p => p.Sort).ToList();
    //    this.data_MainCate_filter.DataSource = tb_MainCate;
    //    this.data_MainCate_filter.DataTextField = "MainCateName";
    //    this.data_MainCate_filter.DataValueField = "MainCateID";
    //    this.data_MainCate_filter.DataBind();
    //    ListItem listMainCateFilter = new ListItem("Chọn main category ", "-1");
    //    this.data_MainCate_filter.Items.Insert(0, listMainCateFilter);
    //}

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

    //private void LoadSubCate1()
    //{
    //    var IDMainCateSelected = Request.Form["data_MainCate_filter"];
    //    //var IDMainCateSelected = Request["ctl00$ContentPlaceHolder1$data_MainCate_filter"];
    //    //var IDMainCateSelected = data_MainCate.SelectedValue;
    //    int IDMainCateSelectedInt = 0;
    //    IDMainCateSelectedInt = int.Parse(IDMainCateSelected);
    //    var tb_SubCate1 = this.db.tb_CategorySub1.Where(p => p.MainCateID == IDMainCateSelectedInt).ToList();
    //    this.data_SubCate1_filter.DataSource = tb_SubCate1;
    //    this.data_SubCate1_filter.DataTextField = "SubCate1Name";
    //    this.data_SubCate1_filter.DataValueField = "SubCate1ID";
    //    this.data_SubCate1_filter.DataBind();
    //    ListItem listSubCate1Filter = new ListItem("Chọn Sub category 1 ", "-1");
    //    this.data_SubCate1_filter.Items.Insert(0, listSubCate1Filter);
    //}


    //protected void btnFilterSubcate2_click(object sender, EventArgs e)
    //{
    //    var filterMaincateValue = Request.Form["data_MainCate_filter"];
    //    //var filterMaincateValue = Request["ctl00$ContentPlaceHolder1$data_MainCate_filter"];
    //    var filterSubcate1Value = Request.Form["data_SubCate1_filter"];
    //    int mainCateIDFilter = 0;
    //        mainCateIDFilter = int.Parse(filterMaincateValue);
    //    int subCate1IDFilter = 0;
    //        subCate1IDFilter = int.Parse(filterSubcate1Value);        
    //    if (mainCateIDFilter == -1 || subCate1IDFilter == -1)
    //    {
    //        loadSubCate2();
    //    }
    //    else
    //    {
    //        string html = "";
    //        var query = (from mf in db.tb_CategoryMain
    //                     join s1f in db.tb_CategorySub1 on mf.MainCateID equals s1f.MainCateID
    //                     join s2f in db.tb_CategorySub2 on s1f.SubCate1ID equals s2f.SubCate1ID
    //                     where s1f.MainCateID == mainCateIDFilter
    //                     where s2f.SubCate1ID == subCate1IDFilter
    //                     select new
    //                     {
    //                         mf.MainCateName,
    //                         s1f.MainCateID,
    //                         s1f.SubCate1Name,
    //                         s2f.SubCate1ID,
    //                         s2f.SubCate2ID,
    //                         s2f.SubCate2Name,
    //                         s2f.SubCate2Desc,
    //                         s1f.IsDisplay,
    //                         s1f.CreateDate,
    //                         s2f.Sort
    //                     }
    //                     ).OrderBy(p => p.Sort).ToList();

    //        html += "<table id = \"datatable\" class=\"table table-striped table-bordered\">";
    //        html += "<thead>";
    //        html += "<tr>";
    //        html += "<th>Sort</th>";
    //        html += "<th>Tên Sub-2</th>";
    //        html += "<th>Tên Sub-2 English</th>";
    //        html += "<th>Mô tả nhanh</th>";
    //        html += "<th>Mô tả by English</th>";
    //        html += "<th>Thuộc Sub-1</th>";
    //        html += "<th>Thuộc MainCategory</th>";
    //        html += "<th>Tình trạng</th>";
    //        html += "<th>Ngày tạo</th>";
    //        html += "<th>Thao tác</th>";
    //        html += "<th>Người tạo</th>";
    //        html += "<th>Người sửa</th>";
    //        html += "</tr>";
    //        html += "</thead>";
    //        html += "<tbody>";

    //        foreach (var item in query)
    //        {
    //            html += "<tr>";
    //            html += "<td><a href=\"#\" class=\"btn btn-danger btn-xs fontCatNumber\" style=\"background-color: darkred;\">" + item.Sort + "</a></td>";
    //            html += "<td>" + item.SubCate2Name + "</td>";
    //            html += "<td> </td>";
    //            html += "<td>" + item.SubCate2Desc + "</td>";
    //            html += "<td> </td>";
    //            html += "<td>" + item.SubCate1Name + "</td>";
    //            html += "<td>" + item.MainCateName + "</td>";
    //            if (item.IsDisplay == true)
    //            {
    //                html += "<td><a href=\"#\" class=\"btn btn-info btn-xs\" style=\"background-color: teal;\" onclick=\"btnEnableSubCate1(this,'" + item.SubCate1ID.ToString() + "','" + item.SubCate1Name.ToString() + "')\">Enable</a></td>";
    //            }
    //            else
    //            {
    //                html += "<td><a href=\"#\" class=\"btn btn-info btn-xs\" style=\"background-color: firebrick;\" onclick=\"btnDisableSubCate1(this,'" + item.SubCate1ID.ToString() + "','" + item.SubCate1Name.ToString() + "')\">Disable</a></td>";
    //            }
    //            html += "<td>" + item.CreateDate + "</td>";
    //            html += "<td><a href = \"#\" class=\"btn btn-info btn-xs purple\" onclick=\"Edit(this, '" + item.SubCate2ID.ToString() + "','" + item.SubCate2Name.ToString() + "','" + item.SubCate2Desc.ToString() + "','" + item.Sort.ToString() + "','" + item.MainCateID.ToString() + "','" + item.SubCate1ID.ToString() + "')\"><i class=\"fa fa-edit\"></i>&nbspEdit</a>";
    //            html += "<span><a href = \"#\" class=\"btn btn-danger btn-xs black\" onclick=\"Delete(this,'" + item.SubCate2ID.ToString() + "','" + item.SubCate2Name.ToString() + "')\"><i class=\"fa fa-edit\"></i>&nbspDelete</a></span></td>";
    //            html += "<td> </td>";
    //            html += "<td> </td>";
    //            html += "</tr>";
    //        }
    //        html += "</tbody>";
    //        html += "</table>";
    //        this.dvSubCate2List.InnerHtml = html;
    //    }
    //}



    }