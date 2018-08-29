using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for adGenerate
/// </summary>
public class adGenerate
{
   public static savinaEntities db = new savinaEntities();
    public adGenerate()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static String getSubCate1List(int mainCateID)
    {
        string html = "";
        try
        {
            var query = (from m in db.tb_CategorySub1
                         where m.MainCateID == mainCateID
                         select new
                         {
                             m.SubCate1ID,
                             m.SubCate1Name
                         });

            html += "<select id=\"sltSubCate1\" class=\"form-control\">";
            html += "<option value=\"-1\">Lựa chọn Sub Category 1</ option >";
            foreach (var item in query)
            {
                html += "<option value=\"" + item.SubCate1ID + "\">" + item.SubCate1Name + "</ option >";
            }
            html += "</select>";
        }

        catch (Exception)
        {
            html = "error";
        }
        return html;
    }

    public static String getSubCate1Filter(int mainCateIDfilter)
    {
        string html = "";
        try
        {
            var querySub1filter = (from m in db.tb_CategorySub1
                         where m.MainCateID == mainCateIDfilter
                                   select new
                         {
                             m.SubCate1ID,
                             m.SubCate1Name
                         });

            html += "<select id=\"data_SubCate1_filter\" class=\"form-control\">";
            html += "<option value=\"-1\">Filter Sub Cate 1</ option >";
            foreach (var item in querySub1filter)
            {
                html += "<option value=\"" + item.SubCate1ID + "\">" + item.SubCate1Name + "</ option >";
            }
            html += "</select>";
        }

        catch (Exception)
        {
            html = "error";
        }
        return html;
    }

    public static String getSubCate1FilterAction(int mainCateIDfilterAction)
    {
        string html = "";
        try
        {
            var querySub1filteraction = (from m in db.tb_CategorySub1
                                   where m.MainCateID == mainCateIDfilterAction
                                   select new
                                   {
                                       m.SubCate1ID,
                                       m.Sort,
                                       m.SubCate1Name
                                   }
                                   ).OrderBy(p => p.Sort).ToList();

            html += "<select id=\"data_SubCate1_filter\" name=\"data_SubCate1_filter\" onchange=\"DDLSubCate1_Selected()\" class=\"form-control\">";
            html += "<option value=\"-1\">Filter Sub Cate 1</ option >";
            foreach (var item in querySub1filteraction)
            {
                html += "<option value=\"" + item.SubCate1ID + "\">" + item.SubCate1Name + "</ option >";
            }
            html += "</select>";
        }

        catch (Exception)
        {
            html = "error";
        }
        return html;
    }

    public static String getSubCate2FilterList(int mainCateIDfilterS, int subCate1IDfilterS)
    {
        string html = "";
        var queryfiltersub2 = (from mf in db.tb_CategoryMain
                     join s1f in db.tb_CategorySub1 on mf.MainCateID equals s1f.MainCateID
                     join s2f in db.tb_CategorySub2 on s1f.SubCate1ID equals s2f.SubCate1ID
                     where s1f.MainCateID == mainCateIDfilterS
                     where s2f.SubCate1ID == subCate1IDfilterS
                     select new
                     {
                         mf.MainCateName,
                         s1f.MainCateID,
                         s1f.SubCate1Name,
                         s2f.SubCate1ID,
                         s2f.SubCate2ID,
                         s2f.SubCate2Name,
                         s2f.SubCate2Desc,
                         s1f.IsDisplay,
                         s1f.CreateDate,
                         s2f.Sort
                     }
                     ).OrderBy(p => p.Sort).ToList();

        html += "<table id = \"datatable\" class=\"table table-striped table-bordered\">";
        html += "<thead>";
        html += "<tr>";
        html += "<th>Sort</th>";
        html += "<th>Tên Sub-2</th>";
        html += "<th>Tên Sub-2 English</th>";
        html += "<th>Mô tả nhanh</th>";
        html += "<th>Mô tả by English</th>";
        html += "<th>Thuộc Sub-1</th>";
        html += "<th>Thuộc MainCategory</th>";
        html += "<th>Tình trạng</th>";
        html += "<th>Ngày tạo</th>";
        html += "<th>Thao tác</th>";
        html += "<th>Người tạo</th>";
        html += "<th>Người sửa</th>";
        html += "</tr>";
        html += "</thead>";
        html += "<tbody>";

        foreach (var item in queryfiltersub2)
        {
            html += "<tr>";
            html += "<td class=\" \"><a href=\"#\" class=\"btn btn-info btn-xs fontCatNumber\" style=\"background-color:darkred;\" onclick=\"btnChangeSort(this,'" + item.SubCate2ID.ToString() + "')\">" + item.Sort.ToString() + "</a></td>";
            html += "<td>" + item.SubCate2Name + "</td>";
            html += "<td> </td>";
            html += "<td>" + item.SubCate2Desc + "</td>";
            html += "<td> </td>";
            html += "<td>" + item.SubCate1Name + "</td>";
            html += "<td>" + item.MainCateName + "</td>";
            if (item.IsDisplay == true)
            {
                html += "<td><a href=\"#\" class=\"btn btn-info btn-xs\" style=\"background-color: teal;\" onclick=\"btnChangeDisable(this,'" + item.SubCate1ID.ToString() + "','" + item.SubCate1Name.ToString() + "')\">Enable</a></td>";
            }
            else
            {
                html += "<td><a href=\"#\" class=\"btn btn-info btn-xs\" style=\"background-color: firebrick;\" onclick=\"btnChangeEnable(this,'" + item.SubCate1ID.ToString() + "','" + item.SubCate1Name.ToString() + "')\">Disable</a></td>";
            }
            html += "<td>" + item.CreateDate + "</td>";
            html += "<td><a href = \"#\" class=\"btn btn-info btn-xs purple\" onclick=\"Edit(this, '" + item.SubCate2ID.ToString() + "','" + item.SubCate2Name.ToString() + "','" + item.SubCate2Desc.ToString() + "','" + item.Sort.ToString() + "','" + item.MainCateID.ToString() + "','" + item.SubCate1ID.ToString() + "')\"><i class=\"fa fa-edit\"></i>&nbspEdit</a>";
            html += "<span><a href = \"#\" class=\"btn btn-danger btn-xs black\" onclick=\"Delete(this,'" + item.SubCate2ID.ToString() + "','" + item.SubCate2Name.ToString() + "')\"><i class=\"fa fa-edit\"></i>&nbspDelete</a></span></td>";
            html += "<td> </td>";
            html += "<td> </td>";
            html += "</tr>";
        }
        html += "</tbody>";
        html += "</table>";

        return html;
    }

    public static String getSubCate1FilterList(int mainCateIDfilterS)
    {
        string html = "";
        var query = (from m in db.tb_CategoryMain
                     join s1 in db.tb_CategorySub1 on m.MainCateID equals s1.MainCateID
                     where s1.MainCateID == mainCateIDfilterS
                     select new
                     {
                         s1.MainCateID,
                         s1.SubCate1ID,
                         s1.SubCate1Desc,
                         s1.SubCate1Name,
                         s1.IsDisplay,
                         s1.CreateDate,
                         s1.Sort,
                         m.MainCateName
                     }
                        ).OrderBy(p => p.Sort).ToList();

        html += "<table id = \"datatable\" class=\"table table-striped table-bordered\">";
        html += "<thead>";
        html += "<tr>";
        html += "<th>Sort</th>";
        html += "<th>Tên Sub-1</th>";
        html += "<th>Tên Sub-1 by English</th>";
        html += "<th>Mô tả </th>";
        html += "<th>Mô tả by English</th>";
        html += "<th>Thuộc MainCategory</th>";
        html += "<th>Tình trạng</th>";
        html += "<th>Ngày tạo</th>";
        html += "<th>Thao tác</th>";
        html += "<th>Người tạo</th>";
        html += "<th>Người sửa</th>";
        html += "</tr>";
        html += "</thead>";
        html += "<tbody>";

        foreach (var item in query)
        {
            html += "<tr>";
            html += "<td class=\" \"><a href=\"#\" class=\"btn btn-info btn-xs fontCatNumber\" style=\"background-color:darkred;\" onclick=\"btnChangeSort(this,'" + item.SubCate1ID.ToString() + "')\">" + item.Sort.ToString() + "</a></td>";
            html += "<td>" + item.SubCate1Name + "</td>";
            html += "<td> </td>";
            html += "<td>" + item.SubCate1Desc + "</td>";
            html += "<td> </td>";
            html += "<td>" + item.MainCateName + "</td>";
            if (item.IsDisplay == true)
            {
                html += "<td><a href=\"#\" class=\"btn btn-info btn-xs\" style=\"background-color: teal;\" onclick=\"btnChangeDisable(this,'" + item.SubCate1ID.ToString() + "','" + item.SubCate1Name.ToString() + "')\">Enable</a></td>";
            }
            else
            {
                html += "<td><a href=\"#\" class=\"btn btn-info btn-xs\" style=\"background-color: firebrick;\" onclick=\"btnChangeEnable(this,'" + item.SubCate1ID.ToString() + "','" + item.SubCate1Name.ToString() + "')\">Disable</a></td>";
            }
            html += "<td>" + item.CreateDate + "</td>";
            html += "<td><a href = \"#\" class=\"btn btn-info btn-xs purple\" onclick=\"Edit(this, '" + item.SubCate1ID.ToString() + "','" + item.SubCate1Name.ToString() + "','" + item.SubCate1Desc.ToString() + "','" + item.Sort.ToString() + "','" + item.MainCateID.ToString() + "','" + item.IsDisplay.ToString() + "')\"><i class=\"fa fa-edit\"></i>&nbspEdit</a>";
            html += "<span><a href = \"#\" class=\"btn btn-danger btn-xs black\" onclick=\"Delete(this,'" + item.SubCate1ID.ToString() + "','" + item.SubCate1Name.ToString() + "')\"><i class=\"fa fa-edit\"></i>&nbspDelete</a></span></td>";
            html += "<td> </td>";
            html += "<td> </td>";
            html += "</tr>";
        }
        html += "</tbody>";
        html += "</table>";

        return html;
    }

    public static String getSubCate2List()
    {
        string html = "";
        var querysub2 = (from m in db.tb_CategoryMain
                     join s1 in db.tb_CategorySub1 on m.MainCateID equals s1.MainCateID
                     join s2 in db.tb_CategorySub2 on s1.SubCate1ID equals s2.SubCate1ID
                     select new
                     {
                         m.MainCateName,
                         s1.MainCateID,
                         s1.SubCate1Name,
                         s2.SubCate1ID,
                         s2.SubCate2ID,
                         s2.SubCate2Name,
                         s2.SubCate2Desc,
                         s2.IsDisplay,
                         s2.CreateDate,
                         s2.Sort 
                     });

        html += "<table id = \"datatable\" class=\"table table-striped table-bordered\">";
        html += "<thead>";
        html += "<tr>";
        html += "<th>Sort</th>";
        html += "<th>Tên Sub-2</th>";
        html += "<th>Tên Sub-2 English</th>";
        html += "<th>Mô tả nhanh</th>";
        html += "<th>Mô tả by English</th>";
        html += "<th>Thuộc Sub-1</th>";
        html += "<th>Thuộc MainCategory</th>";
        html += "<th>Tình trạng</th>";
        html += "<th>Ngày tạo</th>";
        html += "<th>Thao tác</th>";
        html += "<th>Người tạo</th>";
        html += "<th>Người sửa</th>";
        html += "</tr>";
        html += "</thead>";
        html += "<tbody>";

        foreach (var item in querysub2)
        {
            html += "<tr>";
            html += "<td class=\" \"><a href=\"#\" class=\"btn btn-info btn-xs fontCatNumber\" style=\"background-color:darkred;\" onclick=\"btnChangeSort(this,'" + item.SubCate2ID.ToString() + "')\">" + item.Sort.ToString() + "</a></td>";
            html += "<td>" + item.SubCate2Name + "</td>";
            html += "<td> </td>";
            html += "<td>" + item.SubCate2Desc + "</td>";
            html += "<td> </td>";
            html += "<td>" + item.SubCate1Name + "</td>";
            html += "<td>" + item.MainCateName + "</td>";
            if (item.IsDisplay == true)
            {
                html += "<td><a href=\"#\" class=\"btn btn-info btn-xs\" style=\"background-color: teal;\" onclick=\"btnChangeDisable(this,'" + item.SubCate2ID.ToString() + "','" + item.SubCate2Name.ToString() + "')\">Enable</a></td>";
            }
            else
            {
                html += "<td><a href=\"#\" class=\"btn btn-info btn-xs\" style=\"background-color: firebrick;\" onclick=\"btnChangeEnable(this,'" + item.SubCate2ID.ToString() + "','" + item.SubCate2Name.ToString() + "')\">Disable</a></td>";
            }
            html += "<td>" + item.CreateDate + "</td>";
            html += "<td><a href = \"#\" class=\"btn btn-info btn-xs purple\" onclick=\"Edit(this, '" + item.SubCate2ID.ToString() + "','" + item.SubCate2Name.ToString() + "','" + item.SubCate2Desc.ToString() + "','" + item.Sort.ToString() + "','" + item.MainCateID.ToString() + "','" + item.SubCate1ID.ToString() + "')\"><i class=\"fa fa-edit\"></i>&nbspEdit</a>";
            html += "<span><a href = \"#\" class=\"btn btn-danger btn-xs black\" onclick=\"Delete(this,'" + item.SubCate2ID.ToString() + "','" + item.SubCate2Name.ToString() + "')\"><i class=\"fa fa-edit\"></i>&nbspDelete</a></span></td>";
            html += "<td> </td>";
            html += "<td> </td>";
            html += "</tr>";
        }
        html += "</tbody>";
        html += "</table>";

        return html;
    }

    public static String getSubCat1List()
    {
        string html = "";
        var query = (from m in db.tb_CategoryMain join
                     s1 in db.tb_CategorySub1 on m.MainCateID equals s1.MainCateID
                     select new {
                         s1.MainCateID,
                         s1.SubCate1ID,
                         s1.SubCate1Desc,
                         s1.SubCate1Name,
                         s1.IsDisplay,
                         s1.CreateDate,
                         s1.Sort,
                         m.MainCateName
                     }
                        ).OrderBy(p => p.Sort).ToList();

        html += "<table id = \"datatable\" class=\"table table-striped table-bordered\">";
        html += "<thead>";
        html += "<tr>";
        html += "<th>Sort</th>";
        html += "<th>Tên Sub-1</th>";
        html += "<th>Tên Sub-1 by English</th>";
        html += "<th>Mô tả </th>";
        html += "<th>Mô tả by English</th>";
        html += "<th>Thuộc MainCategory</th>";
        html += "<th>Tình trạng</th>";
        html += "<th>Ngày tạo</th>";
        html += "<th>Thao tác</th>";
        html += "<th>Người tạo</th>";
        html += "<th>Người sửa</th>";
        html += "</tr>";
        html += "</thead>";
        html += "<tbody>";

        foreach (var item in query)
        {
            html += "<tr>";
            html += "<td class=\" \"><a href=\"#\" class=\"btn btn-info btn-xs fontCatNumber\" style=\"background-color:darkred;\" onclick=\"btnChangeSort(this,'" + item.SubCate1ID.ToString() + "')\">" + item.Sort.ToString() + "</a></td>";
            html += "<td>"+item.SubCate1Name+"</td>";
            html += "<td> </td>";
            html += "<td>" + item.SubCate1Desc + "</td>";
            html += "<td> </td>";
            html += "<td>" + item.MainCateName + "</td>";
            if (item.IsDisplay == true)
            {
                html += "<td><a href=\"#\" class=\"btn btn-info btn-xs\" style=\"background-color: teal;\" onclick=\"btnChangeDisable(this,'" + item.SubCate1ID.ToString() + "','" + item.SubCate1Name.ToString() + "')\">Enable</a></td>";
            }
            else
            {
                html += "<td><a href=\"#\" class=\"btn btn-info btn-xs\" style=\"background-color: firebrick;\" onclick=\"btnChangeEnable(this,'" + item.SubCate1ID.ToString() + "','" + item.SubCate1Name.ToString() + "')\">Disable</a></td>";
            }
            html += "<td>"+item.CreateDate+"</td>";
            html += "<td><a href = \"#\" class=\"btn btn-info btn-xs purple\" onclick=\"Edit(this, '" + item.SubCate1ID.ToString() + "','" + item.SubCate1Name.ToString() + "','" + item.SubCate1Desc.ToString() + "','" + item.Sort.ToString() + "','"+item.MainCateID.ToString() + "','" + item.IsDisplay.ToString() + "')\"><i class=\"fa fa-edit\"></i>&nbspEdit</a>";
            html += "<span><a href = \"#\" class=\"btn btn-danger btn-xs black\" onclick=\"Delete(this,'" + item.SubCate1ID.ToString() + "','" + item.SubCate1Name.ToString() + "')\"><i class=\"fa fa-edit\"></i>&nbspDelete</a></span></td>";
            html += "<td> </td>";
            html += "<td> </td>";
            html += "</tr>";
        }
        html += "</tbody>";
        html += "</table>";

        return html;
    }

    public static List<tb_CategoryMain> getMainCateList()
    {
        //Get main category list
        var query = (from mc in db.tb_CategoryMain
                     select new
                     {
                         mc.MainCateID,
                         mc.MainCateName,
                         mc.MainCateDesc,
                         mc.IsDeleted,
                         mc.IsDisplay,
                         mc.CreateDate,
                         mc.Sort,
                         mc.MainCateIcon,
                         mc.MainCateBanner
                     }
                    ).OrderBy(p => p.Sort).ToList();

        List<tb_CategoryMain> mainCateList = new List<tb_CategoryMain>();
        foreach (var item in query)
        {
            mainCateList.Add(new tb_CategoryMain()
            {
                MainCateID = item.MainCateID,
                MainCateName = item.MainCateName,
                MainCateDesc = item.MainCateDesc,
                IsDeleted = item.IsDeleted,
                IsDisplay = item.IsDisplay,
                CreateDate = item.CreateDate,
                Sort = item.Sort
            });
        }
        return mainCateList;
    }

    public static String generateHTMLMainCateSelect(List<tb_CategoryMain> tbMainCate)
    {
        string html = "";
        html += "<select id=\"sltMainCate\" onchange=\"mainCateOnChange(this)\" class=\"form-control\">";
        html += "<option value=\"-1\">Lựa chọn Main Category</ option >";
        foreach (var item in tbMainCate)
        {
            html += "<option value=\""+ item.MainCateID +"\">"+ item.MainCateName +"</ option >";                         
        }
        html += "</select>";
        return html;
    }

    public static String generateHTMLMainCateSelectForSub1(List<tb_CategoryMain> tbMainCate)
    {
        string html = "";
        html += "<select id=\"sltMainCate\" class=\"form-control\">";
        //html += "<select id=\"sltMainCate\" class=\"form-control\">";
        html += "<option value=\"-1\">Lựa chọn Main Category new</ option >";
        foreach (var item in tbMainCate)
        {
            html += "<option value=\"" + item.MainCateID + "\">" + item.MainCateName + "</ option >";
        }
        html += "</select>";
        return html;
    }

    public static String generateHTMLMainCate(List<tb_CategoryMain> tbMainCate)
    {
        string html = "";

        html += "<table class=\"table table-striped jambo_table bulk_action\">";
        html += "<thead>";
        html += "<tr class=\"headings\">";
        html += "<th>";
        html += "<input type = \"checkbox\" id=\"check-all\" class=\"flat\">";
        html += "</th>";
        html += "<th class=\"column-title\">Sort</th>";
        html += "<th class=\"column-title\">Tên MainCate</th>";
        html += "<th class=\"column-title\">Tên MainCate by English</th>";
        html += "<th class=\"column-title\">Mô Tả nhanh</th>";
        html += "<th class=\"column-title\">Mô Tả by English</th>";
        html += "<th class=\"column-title\">Tình trạng</th>";
        html += "<th class=\"column-title\">Ngày tạo</th>";
        html += "<th class=\"column-title no-link last\"><span class=\"nobr\">Edit</span></th>";
        html += "<th class=\"column-title no-link last\"><span class=\"nobr\">Delete</span></th>";
        html += "<th class=\"column-title\">Người tạo</th>";
        html += "<th class=\"column-title\">Người sửa</th>";
        html += "<th class=\"bulk-actions\" colspan=\"9\">";
        html += "<a class=\"antoo\" style=\"color:#fff; font-weight:500;\">Bulk Actions( <span class=\"action-cnt\"> </span> ) <i class=\"fa fa-chevron-down\"></i></a>";
        html += "</th>";
        html += "</tr>";
        html += "</thead>";
        html += "<tbody>";

        foreach (var item in tbMainCate)
        {
            html += "<tr class=\"even pointer\">";
            html += "<td class=\"a-center\">";
            html += "<input type = \"checkbox\" class=\"flat\" name=\"table_records\">";
            html += "</td>";
            html += "<td class=\" \"><a href=\"#\" class=\"btn btn-info btn-xs fontCatNumber\" style=\"background-color:darkred;\" onclick=\"btnChangeSort(this,'" + item.MainCateID.ToString() + "')\">" + item.Sort.ToString() + "</a></td>";
            html += "<td class=\" \">"+item.MainCateName.ToString()+"</td>";
            html += "<td> </td>";
            html += "<td class=\" \">"+item.MainCateDesc.ToString()+"</td>";
            html += "<td> </td>";
            if (item.IsDisplay != null)
            {
                if(item.IsDisplay == true)
                {
                    html += "<td><a href=\"#\" class=\"btn btn-info btn-xs\" style=\"background-color: teal;\" onclick=\"btnChangeDisable(this,'" + item.MainCateID.ToString() + "','" + item.MainCateName.ToString() + "')\">Enable</a></td>";
                }
                else
                {
                    html += "<td><a href=\"#\" class=\"btn btn-info btn-xs\" style=\"background-color: firebrick;\" onclick=\"btnChangeEnable(this,'" + item.MainCateID.ToString() + "','" + item.MainCateName.ToString() + "')\">Disable</a></td>";
                }
            }
 
            html += "<td class=\" \">"+item.CreateDate.ToString()+"</td>";
            html += "<td class=\" last\"><a href = \"#\" class=\"btn btn-info btn-xs\" onclick=\"Edit(this, '" + item.MainCateID.ToString() + "','" + item.MainCateName.ToString() + "','"+item.MainCateDesc.ToString()+"','"+item.Sort.ToString()+"')\"><i class=\"fa fa-edit\"></i> Edit</a></td>";
            html += "<td class=\" last\"><a href = \"#\" class=\"btn btn-danger btn-xs\" onclick=\"Delete(this,'"+item.MainCateID.ToString()+"','"+item.MainCateName.ToString()+"')\"><i class=\"fa fa-trash-o\"></i> Delete</a>";
            html += "</td>";
            html += "<td> </td>";
            html += "<td> </td>";
            html += "</tr>";
        }

        html += "</tbody>";
        html += "</table>";

        return html;
    }

}