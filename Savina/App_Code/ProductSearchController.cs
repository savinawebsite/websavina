using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Core.Objects;
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Text;
using System.Web.Http;
namespace Savina
{
    [Route("api/ProductSearch")]
    public class ProductSearchController : ApiController
    {
        [HttpPost]
        [ActionName("SearchBy")]
        public dynamic SearchBy(ProductSearchModel obj)
        {
            savinaEntities db = new savinaEntities();
            try
            {
                string status = "";
                if (obj.Status != null)
                {
                    obj.Status.ForEach(x =>
                    {
                        status += x.ToString() + ",";
                    });
                    status = status + "-2";
                }

                db.Database.Connection.Open();

                var cmd = db.Database.Connection.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure; ;
                cmd.CommandText = "sp_ProductSearchBy";

                var param = cmd.CreateParameter();
                param.Direction = ParameterDirection.Input;
                param.DbType = DbType.String;
                param.ParameterName = "@city";
                param.Value = obj.ProvinceId;

                cmd.Parameters.Add(param);

                cmd.Parameters.Add(new SqlParameter
                {
                    ParameterName = "@dictrict",
                    Value = obj.DistrictId
                });

                cmd.Parameters.Add(new SqlParameter
                {
                    ParameterName = "@ward",
                    Value = obj.WardId
                });

                cmd.Parameters.Add(new SqlParameter
                {
                    ParameterName = "@mainCate",
                    Value = obj.Catalogy1Id
                });

                cmd.Parameters.Add(new SqlParameter
                {
                    ParameterName = "@subCate1",
                    Value = obj.Catalogy2Id
                });

                cmd.Parameters.Add(new SqlParameter
                {
                    ParameterName = "@subCate2",
                    Value = obj.Catalogy3Id
                });

                cmd.Parameters.Add(new SqlParameter
                {
                    ParameterName = "@subCate3",
                    Value = ""
                });

                cmd.Parameters.Add(new SqlParameter
                {
                    ParameterName = "@maxCost",
                    Value = obj.MaxCost
                });

                cmd.Parameters.Add(new SqlParameter
                {
                    ParameterName = "@minCost",
                    Value = obj.MinCost
                });

                cmd.Parameters.Add(new SqlParameter
                {
                    ParameterName = "@status",
                    Value = status
                });

                cmd.Parameters.Add(new SqlParameter
                {
                    ParameterName = "@displayMode",
                    Value = obj.DisplayMode
                });

                cmd.Parameters.Add(new SqlParameter
                {
                    ParameterName = "@page",
                    Value = obj.Page
                });

                cmd.Parameters.Add(new SqlParameter
                {
                    ParameterName = "@itemsPerPage",
                    Value = obj.ItemsPerPage
                });

                cmd.Parameters.Add(new SqlParameter
                {
                    ParameterName = "@nRow",
                    DbType = DbType.Int32,
                    Direction = ParameterDirection.Output
                });

                string html1 = "";
                string proListHtml = "<div class=\"row\">";

                using (var reader = cmd.ExecuteReader())
                {
                    var products = ((IObjectContextAdapter)db)
                         .ObjectContext
                         .Translate<sp_ProductSearchBy_Result>(reader).ToList();

                    int kk = 0;
                    foreach (var item in products.ToList())
                    {
                        kk++;

                        html1 += "<div class=\"col-md-4 col-sm-6 col-xs-6 rowMobile\">";
                        html1 += "<div class=\"product product-single product-ext1\">";
                        html1 += "<div class=\"product-thumb\">";
                        html1 += "<button class=\"quickInfoHover quick-view\">Giá thuê theo giờ: " + float.Parse(item.PricePerBlock.ToString()).ToString("#,###") + " đ<br> Gia thue theo ngay: " + float.Parse(item.PricePerDay.ToString()).ToString("#,###") + " đ<br> Khu vực: " + item.ProductDistrict + "</button>";
                        html1 += "<img src=\"" + item.ProductAvatar + "\" alt=\"\">";
                        html1 += "</div>";
                        html1 += "<div class=\"product-body\">";
                        html1 += "<h2 class=\"product-name\"><a href=\"../productdetail?productID=" + kk + "\">" + item.ProductName + "</a></h2>";
                        html1 += "<h3 class=\"product-price\">" + float.Parse(item.PricePerBlock.ToString()).ToString("#,###") + "</h3>";
                        html1 += "<span class=\"price-per\">&nbsp/block &nbsp</span>";
                        html1 += "<span class=\"product-price\"> - &nbsp </span>";
                        html1 += "<h3 class=\"product-price\">" + float.Parse(item.PricePerDay.ToString()).ToString("#,###") + "</h3>";
                        html1 += "<span class=\"price-per\">&nbsp/ ngày &nbsp</span>";
                        html1 += "<h4 class=\"product-location\">" + item.ProductDistrict + "</h4>";
                        html1 += "<div class=\"product-btns\">";
                        html1 += "<button class=\"main-btn icon-btn\"><i class=\"fa fa-heart\"></i></button>";
                        html1 += "<a class=\"primary-btn add-to-cart\" href=\"../productdetail?productID=" + item.ProductID + "\"><i class=\"fa fa-shopping-cart\"></i> XEM CHI TIẾT</a>";
                        html1 += "</div>";
                        html1 += "</div>";
                        html1 += "</div>";
                        html1 += "</div>";
                    }

                    proListHtml += html1;
                    proListHtml += "<hr />";
                    proListHtml += "</div>";
                }

                int totalRow = Convert.ToInt32(cmd.Parameters["@nRow"].Value);
                StringBuilder paging = new StringBuilder();
                if (obj.Page == 1 && totalRow > 0)
                {
                    float page = (float)totalRow / (float)obj.ItemsPerPage;
                    if (page - Convert.ToInt32(page) > 0)
                    {
                        page++;
                    }

                    paging.Append("<li><span class='text-uppercase'>Trang:</span></li>");
                    for (int i = 1; i <= Convert.ToInt32(page); i++)
                    {
                        if (i == 1)
                        {
                            paging.AppendFormat("<li class='active' id='page_{0}' onclick='btnPaging_Click({1})'>{2}</li>", i, i, i);
                        }
                        else
                        {
                            paging.AppendFormat("<li id='page_{0}' onclick='btnPaging_Click({1})'>{2}</li>", i, i, i);
                        }
                    }
                }

                db.Database.Connection.Close();
                return new
                {
                    products = proListHtml,
                    paging = paging.ToString()
                };
            }
            catch (Exception ex)
            {
                db.Database.Connection.Close();
                return new
                {
                    err = ex.Message,
                    products = "",
                    paging = ""
                };
            }
        }

        [HttpGet]
        [ActionName("GetDataForLoadPage")]
        public dynamic GetDataForLoadPage()
        {
            try
            {
                savinaEntities db = new savinaEntities();
                var provinces = db.tb_Province.Select(x => new
                {
                    x.Id,
                    x.Name,
                }).ToList();

                var catelogies = db.tb_CategoryMain.Select(x => new
                {
                    x.MainCateID,
                    x.MainCateName,
                }).ToList();

                return new
                {
                    provinces,
                    catelogies
                };

            }
            catch (Exception ex)
            {
                return new
                {
                    provinces = "",
                    catelogies = ""
                };
            }
        }

        [HttpGet]
        [ActionName("GetDistrictByProvinceId")]
        public dynamic GetDistrictByProvinceId(int id)
        {
            try
            {
                savinaEntities db = new savinaEntities();
                return db.tb_District.Where(x => x.ProvinceId == id).Select(x => new
                {
                    x.Id,
                    x.Name
                }).ToList();
            }
            catch (Exception ex)
            {
                return "";
            }
        }

        [HttpGet]
        [ActionName("GetWardByDistrictId")]
        public dynamic GetWardByDistrictId(int id)
        {
            try
            {
                savinaEntities db = new savinaEntities();
                return db.tb_Ward.Where(x => x.DistrictID == id).Select(x => new
                {
                    x.Id,
                    x.Name
                }).ToList();
            }
            catch (Exception ex)
            {
                return "";
            }
        }

        [HttpGet]
        [ActionName("GetCategorySub1ByMainId")]
        public dynamic GetCategorySub1ByMainId(int id)
        {
            try
            {
                savinaEntities db = new savinaEntities();
                return db.tb_CategorySub1.Where(x => x.MainCateID == id).ToList();
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        [HttpGet]
        [ActionName("GetCategorySub2BySub1Id")]
        public dynamic GetCategorySub2BySub1Id(int id)
        {
            try
            {
                savinaEntities db = new savinaEntities();
                return db.tb_CategorySub2.Where(x => x.SubCate1ID == id).ToList();
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }

    public class ProductSearchModel
    {
        public string ProvinceId { get; set; }
        public string DistrictId { get; set; }
        public string WardId { get; set; }
        public string Catalogy1Id { get; set; }
        public string Catalogy2Id { get; set; }
        public string Catalogy3Id { get; set; }
        public List<string> Status { get; set; }
        public decimal MinCost { get; set; }
        public decimal MaxCost { get; set; }
        public string DisplayMode { get; set; }
        public int Page { get; set; }
        public int ItemsPerPage { get; set; }
    }
}

