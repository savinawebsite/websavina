using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Generate
/// </summary>
public class Generate
{
    public static savinaEntities db = new savinaEntities();
    public Generate()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static String getCategoryList()
    {
        string result = "";
        
        var mainCateList = (from mc in db.tb_CategoryMain
                    where mc.IsDisplay == true && mc.IsDeleted == false
                    select new
                    {
                        mc.MainCateID,
                        mc.MainCateName,
                        mc.MainCateDesc,
                        mc.Sort,
                        mc.MainCateIcon
                    }).OrderBy(p => p.Sort);
        if(mainCateList.Count() > 0)
        {
            foreach(var mainCateItem in mainCateList)
            {
                var subCate1List = (from s1 in db.tb_CategorySub1
                                    where s1.IsDisplay == true && s1.IsDeleted == false && s1.MainCateID == mainCateItem.MainCateID
                                    select new
                                    {
                                        s1.SubCate1ID,
                                        s1.SubCate1Name,
                                        s1.SubCate1Desc,
                                        s1.Sort
                                    }).OrderBy(p => p.Sort);
                if(subCate1List.Count() > 0)
                {
                    result += "<li class=\"dropdown side-dropdown\">";
                    result += "<a class=\"dropdown-toggle\" data-toggle=\"dropdown\" aria-expanded=\"true\"><span><i class=\""+mainCateItem.MainCateIcon+" category-icon\"></i>"+mainCateItem.MainCateName+"</span> <i class=\"fa fa-angle-right\"></i></a>";
                    result += "<div class=\"custom-menu\">";
                    result += "<div class=\"row\">";
                    foreach (var subCate1Item in subCate1List)
                    {

                        result += "<div class=\"col-md-4\" style=\"height: 95px; margin-top:10px;\">";
                        result += "<ul class=\"list-links\">";
                        result += "<li>";
                        result += "<h3 class=\"list-links-title\">"+subCate1Item.SubCate1Name+"</h3>";
                        result += "</li>";
                        var subCate2List = (from s2 in db.tb_CategorySub2
                                            where s2.IsDisplay == true && s2.IsDeleted == false && s2.SubCate1ID == subCate1Item.SubCate1ID
                                            select new
                                            {
                                                s2.SubCate2ID,
                                                s2.SubCate2Name,
                                                s2.SubCate2Desc,
                                                s2.Sort
                                            }).OrderBy(p => p.Sort);
                        if (subCate2List.Count() > 0)
                        {
                            foreach (var subCate2Item in subCate2List)
                            {
                                result += "<li><a href = \"#\" >"+subCate2Item.SubCate2Name+"</a></li>";
                            }
                        }
                        result += "</ul>";
						result += "<hr class=\"hidden-md hidden-lg\">";
						result += "</div>";
                    }
                    result += "</div>";

                    result += "<div class=\"row hidden-sm hidden-xs\">";
                    result += "<div class=\"col-md-12\">";
                    result += "<hr>";
                    result += "<a class=\"banner banner-1\" href=\"#\">";
                    result += "<img src = \"./img/banner_congcu.jpg\" alt=\"\">";
                    result += "<div class=\"banner-caption text-center\">";
                    result += "<h2 class=\"white-color\">NEW COLLECTION</h2>";
                    result += "<h3 class=\"white-color font-weak\">HOT DEAL</h3>";
                    result += "</div>";
                    result += "</a>";
                    result += "</div>";
                    result += "</div>";

                    result += "</div>";
                    result += "</li>";
                }
                else
                {
                    result += "<li><a href=\"#\"><span><i class=\"" + mainCateItem.MainCateIcon + "  category-icon\"></i>" + mainCateItem.MainCateName+"</span></a></li>";
                }
            }

        }

        return result;
    }
}