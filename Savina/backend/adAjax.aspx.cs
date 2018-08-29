using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

public partial class backend_adAjax : System.Web.UI.Page
{
    savinaEntities db = new savinaEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string action = Request.QueryString["action"].ToString();
            switch (action)
            {
                #region CREATE SUBCATE2
                case "createSubCate2":
               {
                String html = "";
                try
                {
                    String subCate2Name = Request.QueryString["subCate2Name"].ToString();
                    String subCate2Desc = Request.QueryString["subCate2Desc"].ToString();
                    int subCate2Sort = 0;
                    if (Request.QueryString["subCate2Sort"].ToString() != null)
                    {
                                subCate2Sort = int.Parse(Request.QueryString["subCate2Sort"].ToString());
                    }
                    int mainCateID = 0;
                    if (Request.QueryString["mainCateID"].ToString() != null)
                    {
                                mainCateID = int.Parse(Request.QueryString["mainCateID"].ToString());
                    }
                    int subCate1ID = 0;
                    if (Request.QueryString["subCate1ID"].ToString() != null)
                    {
                        subCate1ID = int.Parse(Request.QueryString["subCate1ID"].ToString());
                    }

                            //Insert to Database
                     tb_CategorySub2 subCat2 = new tb_CategorySub2();
                    subCat2.SubCate1ID = subCate1ID;
                    subCat2.SubCate2Name = subCate2Name;
                    subCat2.SubCate2Desc = subCate2Desc;
                    subCat2.Sort = subCate2Sort;
                    subCat2.CreateDate = DateTime.Now;
                    subCat2.IsDeleted = false;
                    subCat2.IsDisplay = true;
                    db.tb_CategorySub2.Add(subCat2);
                    db.SaveChanges();

                    html = adGenerate.getSubCate2List();

                }
                catch (Exception)
                {
                    html = "error";
                }
                Response.Write(html);
            }
            break;
                #endregion

                #region EDIT SUBCATE2
                case "editSubCate2":
                    {
                        String html = "";
                        try
                        {
                            String subCate2Name = Request.QueryString["subCate2Name"].ToString();
                            String subCate2Desc = Request.QueryString["subCate2Desc"].ToString();
                            int subCate2Sort = 0;
                            if (Request.QueryString["subCate2Sort"].ToString() != null)
                            {
                                subCate2Sort = int.Parse(Request.QueryString["subCate2Sort"].ToString());
                            }
                            int mainCateID = 0;
                            if (Request.QueryString["mainCateID"].ToString() != null)
                            {
                                mainCateID = int.Parse(Request.QueryString["mainCateID"].ToString());
                            }
                            int subCate1ID = 0;
                            if (Request.QueryString["subCate1ID"].ToString() != null)
                            {
                                subCate1ID = int.Parse(Request.QueryString["subCate1ID"].ToString());
                            }
                            int subCate2ID = 0;
                            if (Request.QueryString["subCate2ID"].ToString() != null)
                            {
                                subCate2ID = int.Parse(Request.QueryString["subCate2ID"].ToString());
                            }

                            //update to Database
                            var update = db.tb_CategorySub2.Where(t => t.SubCate2ID == subCate2ID).FirstOrDefault();
                            update.SubCate2Name = subCate2Name;
                            update.SubCate2Desc = subCate2Desc;
                            update.Sort = subCate2Sort;
                            update.SubCate1ID = subCate1ID;
                            db.SaveChanges();

                            html = adGenerate.getSubCate2List();
                        }
                        catch (Exception)
                        {
                            html = "error";
                        }
                        Response.Write(html);
                    }
                    break;
                #endregion

                #region DELETE SUBCATE2
                case "deleteSubCate2":
                    {
                        String subCate2HTML = "";
                        try
                        {
                            int subCate2ID = 0;
                            if (Request.QueryString["subCate2ID"].ToString() != null)
                            {
                                subCate2ID = int.Parse(Request.QueryString["subCate2ID"].ToString());
                                tb_CategorySub2 t = (tb_CategorySub2)db.tb_CategorySub2.Where(b => b.SubCate2ID == subCate2ID).First();
                                db.tb_CategorySub2.Remove(t);
                                db.SaveChanges();
                            }

                            subCate2HTML = adGenerate.getSubCate2List();
                        }
                        catch (Exception)
                        {
                            subCate2HTML = "error";
                        }
                        Response.Write(subCate2HTML);
                    }
                    break;
                #endregion

                #region EDIT SUBCATE1
                case "editSubCate1":
                    {
                        String html = "";
                        try
                        {
                            String subCat1Name = Request.QueryString["subCat1Name"].ToString();
                            String subCat1Desc = Request.QueryString["subCat1Desc"].ToString();
                            String subCat1StatusString = Request.QueryString["subCat1Status"].ToString();
                            byte subCat1Sort = 0;
                            if (Request.QueryString["subCat1Sort"].ToString() != null)
                            {
                                subCat1Sort = byte.Parse(Request.QueryString["subCat1Sort"].ToString());
                            }
                            int mainCatID = 0;
                            if (Request.QueryString["mainCatID"].ToString() != null)
                            {
                                mainCatID = int.Parse(Request.QueryString["mainCatID"].ToString());
                            }
                            int subCate1ID = 0;
                            if (Request.QueryString["subCate1ID"].ToString() != null)
                            {
                                subCate1ID = int.Parse(Request.QueryString["subCate1ID"].ToString());
                            }

                            //update to Database
                            var update = db.tb_CategorySub1.Where(t => t.SubCate1ID == subCate1ID).FirstOrDefault();
                            update.SubCate1Name = subCat1Name;
                            update.SubCate1Desc = subCat1Desc;
                            update.Sort = subCat1Sort;
                            update.MainCateID = mainCatID;
                            if (subCat1StatusString == "1")
                            {
                                update.IsDisplay = true;
                            }
                            if (subCat1StatusString == "0")
                            {
                                update.IsDisplay = false;
                            }
                            db.SaveChanges();

                            html = adGenerate.getSubCat1List();
                        }
                        catch (Exception)
                        {
                            html = "error";
                        }
                        Response.Write(html);
                    }
                    break;
                #endregion

                #region CREATE SUBCATE1
                case "createSubCate1":
                    {
                        String html = "";
                        try
                        {
                            String subCat1Name = Request.QueryString["subCat1Name"].ToString();
                            String subCat1Desc = Request.QueryString["subCat1Desc"].ToString();
                            String subCat1StatusString = Request.QueryString["subCat1Status"].ToString();
                            byte subCat1Sort = 0;
                            if (Request.QueryString["subCat1Sort"].ToString() != null)
                            {
                                subCat1Sort = byte.Parse(Request.QueryString["subCat1Sort"].ToString());
                            }
                            int mainCatID = 0;
                            if (Request.QueryString["mainCatID"].ToString() != null)
                            {
                                mainCatID = int.Parse(Request.QueryString["mainCatID"].ToString());
                            }

                            //Insert to Database
                            tb_CategorySub1 subCat1 = new tb_CategorySub1();
                            subCat1.MainCateID = mainCatID;
                            subCat1.SubCate1Name = subCat1Name;
                            subCat1.SubCate1Desc = subCat1Desc;
                            subCat1.Sort = subCat1Sort;
                            subCat1.CreateDate = DateTime.Now;
                            subCat1.IsDeleted = false;
                            if (subCat1StatusString == "1")
                            {
                                subCat1.IsDisplay = true;
                            }
                            if (subCat1StatusString == "0")
                            {
                                subCat1.IsDisplay = false;
                            }
                            //subCat1.IsDisplay = subCat1Status;
                            db.tb_CategorySub1.Add(subCat1);
                            db.SaveChanges();

                            html = adGenerate.getSubCat1List() ;

                        }catch(Exception)
                        {
                            html = "error";  
                        }
                        Response.Write(html);
                    }
                    break;
                #endregion

                #region DELETE SUBCATE1
                case "deleteSubCate1":
                    {
                        String subCate1HTML = "";
                        try
                        {
                            int subCate1ID = 0;
                            if (Request.QueryString["subCate1ID"].ToString() != null)
                            {
                                subCate1ID = int.Parse(Request.QueryString["subCate1ID"].ToString());
                                tb_CategorySub1 t = (tb_CategorySub1)db.tb_CategorySub1.Where(b => b.SubCate1ID == subCate1ID).First();
                                db.tb_CategorySub1.Remove(t);
                                db.SaveChanges();
                            }

                            subCate1HTML = adGenerate.getSubCat1List();
                        }
                        catch (Exception)
                        {
                            subCate1HTML = "error";
                        }
                        Response.Write(subCate1HTML);
                    }
                    break;
                #endregion

                #region FETCH SUBCATE1
                case "fetchSubCate1":
                    {
                        String subCate1ListHTML = "";
                        try
                        {
                            int mainCateID = 0;
                            if (Request.QueryString["mainCateID"].ToString() != null)
                            {
                                mainCateID = int.Parse(Request.QueryString["mainCateID"].ToString());
                                subCate1ListHTML = adGenerate.getSubCate1List(mainCateID);
                            }
                        }
                        catch (Exception)
                        {
                            subCate1ListHTML = "error";
                        }
                        Response.Write(subCate1ListHTML);
                    }
                    break;
                #endregion

                #region FETCH MAINCATE
                case "fetchMainCate":
                    {
                        String mainCateListHTML = "";
                        try
                        {
                            //Reload list maincate
                            List<tb_CategoryMain> mainCateList = adGenerate.getMainCateList();
                            if (mainCateList.Count() != 0)
                            {
                                mainCateListHTML = adGenerate.generateHTMLMainCateSelect(mainCateList);
                                //mainCateListHTML = adGenerate.generateHTMLMainCateSelectForSub1(mainCateList);
                                
                            }
                        }catch(Exception)
                        {
                            mainCateListHTML = "error";
                        }
                        Response.Write(mainCateListHTML);
                    }
                    break;
                #endregion

                //#region FETCH MAINCATE BANNER TABLE
                //case "fetchMainCateBannerTb":
                //    {
                //        String mainCateBannerListHTML = "";
                //        try
                //        {
                //            mainCateBannerListHTML = adGenerate.generateMainCateBannerTb();
                //        }
                //        catch (Exception)
                //        {
                //            mainCateBannerListHTML = "error";
                //        }
                //        Response.Write(mainCateBannerListHTML);
                //    }
                //    break;
                //#endregion

                #region DELETE MAINCATE
                case "deleteMainCate":
                    {
                        String mainCateListHTML = "";
                        try
                        {
                            int cateID = 0;
                            if(Request.QueryString["cateID"].ToString() != null)
                            {
                                cateID = int.Parse(Request.QueryString["cateID"].ToString());
                                tb_CategoryMain t = (tb_CategoryMain)db.tb_CategoryMain.Where(b => b.MainCateID == cateID).First();
                                db.tb_CategoryMain.Remove(t);
                                db.SaveChanges();
                            }
                      
                            List<tb_CategoryMain> mainCateList = adGenerate.getMainCateList();
                            if (mainCateList.Count() != 0)
                            {
                                mainCateListHTML = adGenerate.generateHTMLMainCate(mainCateList);
                            }
                        }
                        catch (Exception)
                        {
                            mainCateListHTML = "error";
                        }
                        Response.Write(mainCateListHTML);
                    }
                    break;
                #endregion

                #region EDIT MAINCATE
                case "editMainCate":
                    {
                        String mainCateListHTML = "";
                        try
                        {
                            string cateName = Request.QueryString["cateName"].ToString();
                            string desc = Request.QueryString["desc"].ToString();
                            int cateSort = 0;
                            if (Request.QueryString["cateSort"].ToString() != null)
                            {
                                cateSort = int.Parse(Request.QueryString["cateSort"].ToString());
                            }
                            int cateID = 0;
                            if (Request.QueryString["cateID"].ToString() != null)
                            {
                                cateID = int.Parse(Request.QueryString["cateID"].ToString());
                            }

                            //update to Database
                            var update = db.tb_CategoryMain.Where(t => t.MainCateID == cateID).FirstOrDefault();
                            update.MainCateName = cateName;
                            update.MainCateDesc = desc;
                            update.Sort = cateSort;
                            db.SaveChanges();

                            //Reload list maincate
                            List<tb_CategoryMain> mainCateList = adGenerate.getMainCateList();
                            if (mainCateList.Count() != 0)
                            {
                                mainCateListHTML = adGenerate.generateHTMLMainCate(mainCateList);
                            }
                        }
                        catch (Exception)
                        {
                            mainCateListHTML = "error";
                        }
                        Response.Write(mainCateListHTML);
                    }
                    break;
                #endregion

                #region CREATE MAINCATE
                case "createMainCate":
                    {
                        String mainCateListHTML = "";
                        try
                        {
                            string cateName = Request.QueryString["cateName"].ToString();
                            string desc = Request.QueryString["desc"].ToString();
                            int cateSort = 0;
                                if (Request.QueryString["cateSort"].ToString() != null)
                                {
                                    cateSort = int.Parse(Request.QueryString["cateSort"].ToString());
                                }

                            var httpPostedFile = HttpContext.Current.Request.Files["bannerFile"];
                            if (httpPostedFile != null)
                            {
                                var fileSavePath = System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/image_banner"), httpPostedFile.FileName);
                                httpPostedFile.SaveAs(fileSavePath);
                            }
                                //Insert to Database
                                tb_CategoryMain tbMainCate = new tb_CategoryMain();
                            var bannerName = httpPostedFile;
                            tbMainCate.MainCateName = cateName;
                            tbMainCate.MainCateDesc = desc;
                            tbMainCate.Sort = cateSort;
                            tbMainCate.CreateDate = DateTime.Now;
                            tbMainCate.IsDisplay = true;
                            tbMainCate.IsDeleted = false;
                            tbMainCate.Sort = cateSort;
                            tbMainCate.MainCateBanner = "../image_banner/" + bannerName;
                            db.tb_CategoryMain.Add(tbMainCate);
                            db.SaveChanges();

                            //Reload list maincate
                            List<tb_CategoryMain> mainCateList = adGenerate.getMainCateList();
                            if (mainCateList.Count() != 0)
                            {
                                mainCateListHTML = adGenerate.generateHTMLMainCate(mainCateList);
                            }
                        }catch(Exception)
                        {
                            mainCateListHTML = "error";
                        }
                        Response.Write(mainCateListHTML);
                    }
                    break;
                #endregion

                #region CREATE CUSTOMER GROUP
                case "createGroupCustomer":
                    {
                        String groupCustomerListHTML = "";
                        try
                        {
                            string groupCode = Request.QueryString["groupCode"].ToString();
                            string groupName = Request.QueryString["groupName"].ToString();
                            string groupDesc = Request.QueryString["groupDesc"].ToString();
                            string groupValue = Request.QueryString["groupValue"].ToString();
                            double groupValueConverted = Convert.ToDouble(groupValue.ToString());

                            //Insert to Database
                            tb_GroupCustomer tbGroupCus = new tb_GroupCustomer();
                            tbGroupCus.GroupCusCode = groupCode;
                            tbGroupCus.GroupCusName = groupName;
                            tbGroupCus.GroupCusDesc = groupDesc;
                            tbGroupCus.GroupCusValue = groupValueConverted;
                            tbGroupCus.IsDisplay = true;
                            tbGroupCus.IsDeleted = false;
                            tbGroupCus.GroupCusCreate = DateTime.Now;
                            
                            db.tb_GroupCustomer.Add(tbGroupCus);
                            db.SaveChanges();

                            //Reload list maincate
                            List<tb_CategoryMain> mainCateList = adGenerate.getMainCateList();
                            if (mainCateList.Count() != 0)
                            {
                                groupCustomerListHTML = adGenerate.generateHTMLMainCate(mainCateList);
                            }
                        }
                        catch (Exception)
                        {
                            groupCustomerListHTML = "error";
                        }
                        Response.Write(groupCustomerListHTML);
                    }
                    break;
                #endregion

                #region EDIT CUSTOMER GROUP
                case "editGroupCustomer":
                    {
                        String groupCustomerListHTML = "";
                        try
                        {
                            string groupCode = Request.QueryString["groupCode"].ToString();
                            string groupName = Request.QueryString["groupName"].ToString();
                            string groupDesc = Request.QueryString["groupDesc"].ToString();
                            string groupValue = Request.QueryString["groupValue"].ToString();
                            double groupValueConverted = Convert.ToDouble(groupValue.ToString());

                            int groupCusID = 0;
                            if (Request.QueryString["groupCusID"].ToString() != null)
                            {
                                groupCusID = int.Parse(Request.QueryString["groupCusID"].ToString());
                            }

                            //update to Database
                            var update = db.tb_GroupCustomer.Where(t => t.GroupCusID == groupCusID).FirstOrDefault();
                            update.GroupCusCode = groupCode;
                            update.GroupCusName = groupName;
                            update.GroupCusDesc = groupDesc;
                            update.GroupCusValue = groupValueConverted;
                            update.GroupCusCreate = DateTime.Now;
                            db.SaveChanges();

                            //Reload list maincate
                            List<tb_CategoryMain> mainCateList = adGenerate.getMainCateList();
                            if (mainCateList.Count() != 0)
                            {
                                groupCustomerListHTML = adGenerate.generateHTMLMainCate(mainCateList);
                            }
                        }
                        catch (Exception)
                        {
                            groupCustomerListHTML = "error";
                        }
                        Response.Write(groupCustomerListHTML);
                    }
                    break;
                #endregion

                #region DELETE CUSTOMER GROUP
                case "deleteGroupCustomer":
                    {
                        String groupCustomerListHTML = "";
                        try
                        {
                            int groupCusID = 0;
                            if (Request.QueryString["groupCusID"].ToString() != null)
                            {
                                groupCusID = int.Parse(Request.QueryString["groupCusID"].ToString());
                                tb_GroupCustomer t = (tb_GroupCustomer)db.tb_GroupCustomer.Where(b => b.GroupCusID == groupCusID).First();
                                db.tb_GroupCustomer.Remove(t);
                                db.SaveChanges();
                            }

                            List<tb_CategoryMain> mainCateList = adGenerate.getMainCateList();
                            if (mainCateList.Count() != 0)
                            {
                                groupCustomerListHTML = adGenerate.generateHTMLMainCate(mainCateList);
                            }
                        }
                        catch (Exception)
                        {
                            groupCustomerListHTML = "error";
                        }
                        Response.Write(groupCustomerListHTML);
                    }
                    break;
                #endregion

                #region DELETE CUSTOMER
                case "deleteCustomer":
                    {
                        String groupCustomerListHTML = "";
                        try
                        {
                            int CusID = 0;
                            if (Request.QueryString["CusID"].ToString() != null)
                            {
                                CusID = int.Parse(Request.QueryString["CusID"].ToString());
                                tb_Customer t = (tb_Customer)db.tb_Customer.Where(b => b.CustomerID == CusID).First();
                                db.tb_Customer.Remove(t);
                                db.SaveChanges();
                            }
                            List<tb_CategoryMain> mainCateList = adGenerate.getMainCateList();
                            if (mainCateList.Count() != 0)
                            {
                                groupCustomerListHTML = adGenerate.generateHTMLMainCate(mainCateList);
                            }
                        }
                        catch (Exception)
                        {
                            groupCustomerListHTML = "error";
                        }
                        Response.Write(groupCustomerListHTML);
                    }
                    break;
                #endregion

                #region EDIT CUSTOMER
                case "editCustomer":
                    {
                        String groupCustomerListHTML = "";
                        try
                        {
                            string customerCode = Request.QueryString["groupCode"].ToString();
                            string customerLastname = Request.QueryString["ipcustomerLastname"].ToString();
                            string customerFirstname = Request.QueryString["ipcustomerFirstname"].ToString();
                            string customerEmail = Request.QueryString["ipcustomerEmail"].ToString();
                            string customerUsername = Request.QueryString["ipcustomerUsername"].ToString();
                            string customerPass = Request.QueryString["ipcustomerPassword"].ToString();
                            string customerPhoneNumber = Request.QueryString["ipcustomerPhoneNumber"].ToString();
                            string customerAddress = Request.QueryString["ipcustomerAddress"].ToString();
                            string customerDesc = Request.QueryString["ipcustomerDesc"].ToString();
                           
                            int CusID = 0;
                            if (Request.QueryString["CusID"].ToString() != null)
                            {
                                CusID = int.Parse(Request.QueryString["CusID"].ToString());
                            }

                            //update to Database
                            var update = db.tb_Customer.Where(t => t.CustomerID == CusID).FirstOrDefault();
                            update.CustomerNo = customerCode;
                            update.LastName = customerLastname;
                            update.FirstName = customerFirstname;
                            update.Email = customerEmail;
                            update.UserName = customerUsername;
                            update.Password = customerPass;
                            update.Phone = customerPhoneNumber;
                            update.Address = customerAddress;
                            update.Description = customerDesc;
                            update.CreateDate = DateTime.Now;
                            db.SaveChanges();

                            //Reload list maincate
                            List<tb_CategoryMain> mainCateList = adGenerate.getMainCateList();
                            if (mainCateList.Count() != 0)
                            {
                                groupCustomerListHTML = adGenerate.generateHTMLMainCate(mainCateList);
                            }
                        }
                        catch (Exception)
                        {
                            groupCustomerListHTML = "error";
                        }
                        Response.Write(groupCustomerListHTML);
                    }
                    break;
                #endregion

                #region DELETE PRODUCT
                case "deleteProduct":
                    {
                        String productListHTML = "";
                        try
                        {
                            int ProductID = 0;
                            if (Request.QueryString["productDeleteID"].ToString() != null)
                            {
                                ProductID = int.Parse(Request.QueryString["productDeleteID"].ToString());
                                tb_Product prd = (tb_Product)db.tb_Product.Where(b => b.ProductID == ProductID).First();
                                db.tb_Product.Remove(prd);
                                var prdGallery = db.tb_ProductGallery.Where(g => g.ProductID == ProductID).ToList();
                                int galleryCount = prdGallery.Count;
                                if (galleryCount == 0)
                                {

                                }
                                else 
                                {
                                    for (int i = 0; i < galleryCount; i++)
                                    {
                                        db.tb_ProductGallery.Remove(prdGallery[i]);
                                    }
                                }                                    
                                var prdAccessory = db.tb_ProductAccessorySelection.Where(a => a.ProductID == ProductID).ToList();
                                int AccessoryCount = prdAccessory.Count;
                                if (AccessoryCount == 0)
                                {

                                }
                                else
                                {
                                    for (int ii = 0; ii < AccessoryCount; ii++)
                                    {
                                        db.tb_ProductAccessorySelection.Remove(prdAccessory[ii]);
                                    }
                                }                                   
                                var prdAccompany = db.tb_ProductAccompany.Where(ac => ac.ProductID == ProductID).ToList();
                                int AccompanyCount = prdAccompany.Count;
                                if (AccompanyCount == 0)
                                {

                                }
                                else
                                {
                                    for (int iii = 0; iii < AccompanyCount; iii++)
                                    {
                                        db.tb_ProductAccompany.Remove(prdAccompany[iii]);
                                    }
                                }                                                            
                                db.SaveChanges();
                            }
                        }
                        catch (Exception)
                        {
                            productListHTML = "error";
                        }
                        Response.Write(productListHTML);
                    }
                    break;
                #endregion

                #region SET PRODUCT TO GROUP 1
                case "setProductGroup1":
                    {
                        String prGroupHTML1 = "";
                        try
                        {
                            int ProductID1 = 0;
                            if (Request.QueryString["productGroup1ID"].ToString() != null)
                            {
                                ProductID1 = int.Parse(Request.QueryString["productGroup1ID"].ToString());
                            }
                            //update to Database
                            var update = db.tb_Product.Where(t => t.ProductID == ProductID1).FirstOrDefault();
                            update.ListBy1 = "active";
                            db.SaveChanges();

                        }
                        catch (Exception)
                        {
                            prGroupHTML1 = "error1";
                        }
                        Response.Write(prGroupHTML1);
                    }
                    break;
                #endregion

                #region REMOVE PRODUCT TO GROUP 1
                case "removeProductGroup1":
                    {
                        String prGroupHTML1 = "";
                        try
                        {
                            int ProductID1 = 0;
                            if (Request.QueryString["productGroup1ID"].ToString() != null)
                            {
                                ProductID1 = int.Parse(Request.QueryString["productGroup1ID"].ToString());
                            }
                            //update to Database
                            var update = db.tb_Product.Where(t => t.ProductID == ProductID1).FirstOrDefault();
                            update.ListBy1 = "NULL";
                            db.SaveChanges();

                        }
                        catch (Exception)
                        {
                            prGroupHTML1 = "error1";
                        }
                        Response.Write(prGroupHTML1);
                    }
                    break;
                #endregion

                #region SET PRODUCT TO GROUP 2
                case "setProductGroup2":
                    {
                        String prGroupHTML2 = "";
                        try
                        {
                            int ProductID2 = 0;
                            if (Request.QueryString["productGroup2ID"].ToString() != null)
                            {
                                ProductID2 = int.Parse(Request.QueryString["productGroup2ID"].ToString());
                            }
                            //update to Database
                            var update = db.tb_Product.Where(t => t.ProductID == ProductID2).FirstOrDefault();
                            update.ListBy2 = "active";
                            db.SaveChanges();
                        }
                        catch (Exception)
                        {
                            prGroupHTML2 = "error2";
                        }
                        Response.Write(prGroupHTML2);
                    }
                    break;
                #endregion

                #region SET PRODUCT TO GROUP 3
                case "setProductGroup3":
                    {
                        String prGroupHTML3 = "";
                        try
                        {
                            int ProductID3 = 0;
                            if (Request.QueryString["productGroup3ID"].ToString() != null)
                            {
                                ProductID3 = int.Parse(Request.QueryString["productGroup3ID"].ToString());
                            }
                            //update to Database
                            var update = db.tb_Product.Where(t => t.ProductID == ProductID3).FirstOrDefault();
                            update.ListBy3 = "active";
                            db.SaveChanges();
                        }
                        catch (Exception)
                        {
                            prGroupHTML3 = "error3";
                        }
                        Response.Write(prGroupHTML3);
                    }
                    break;
                #endregion

                #region SET PRODUCT TO GROUP 4
                case "setProductGroup4":
                    {
                        String prGroupHTML4 = "";
                        try
                        {
                            int ProductID4 = 0;
                            if (Request.QueryString["productGroup4ID"].ToString() != null)
                            {
                                ProductID4 = int.Parse(Request.QueryString["productGroup4ID"].ToString());
                            }
                            //update to Database
                            var update = db.tb_Product.Where(t => t.ProductID == ProductID4).FirstOrDefault();
                            update.ListBy4 = "active";
                            db.SaveChanges();
                        }
                        catch (Exception)
                        {
                            prGroupHTML4 = "error4";
                        }
                        Response.Write(prGroupHTML4);
                    }
                    break;
                #endregion

                #region SET PRODUCT TO GROUP 5
                case "setProductGroup5":
                    {
                        String prGroupHTML5 = "";
                        try
                        {
                            int ProductID5 = 0;
                            if (Request.QueryString["productGroup5ID"].ToString() != null)
                            {
                                ProductID5 = int.Parse(Request.QueryString["productGroup5ID"].ToString());
                            }
                            //update to Database
                            var update = db.tb_Product.Where(t => t.ProductID == ProductID5).FirstOrDefault();
                            update.ListBy5 = "active";
                            db.SaveChanges();
                        }
                        catch (Exception)
                        {
                            prGroupHTML5 = "error5";
                        }
                        Response.Write(prGroupHTML5);
                    }
                    break;
                #endregion

                #region SET PRODUCT TO GROUP 6
                case "setProductGroup6":
                    {
                        String prGroupHTML6 = "";
                        try
                        {
                            int ProductID6 = 0;
                            if (Request.QueryString["productGroup6ID"].ToString() != null)
                            {
                                ProductID6 = int.Parse(Request.QueryString["productGroup6ID"].ToString());
                            }
                            //update to Database
                            var update = db.tb_Product.Where(t => t.ProductID == ProductID6).FirstOrDefault();
                            update.ListBy6 = "active";
                            db.SaveChanges();
                        }
                        catch (Exception)
                        {
                            prGroupHTML6 = "error6";
                        }
                        Response.Write(prGroupHTML6);
                    }
                    break;
                #endregion

                #region SET PRODUCT TO GROUP 7
                case "setProductGroup7":
                    {
                        String prGroupHTML7 = "";
                        try
                        {
                            int ProductID7 = 0;
                            if (Request.QueryString["productGroup7ID"].ToString() != null)
                            {
                                ProductID7 = int.Parse(Request.QueryString["productGroup7ID"].ToString());
                            }
                            //update to Database
                            var update = db.tb_Product.Where(t => t.ProductID == ProductID7).FirstOrDefault();
                            update.ListBy7 = "active";
                            db.SaveChanges();
                        }
                        catch (Exception)
                        {
                            prGroupHTML7 = "error7";
                        }
                        Response.Write(prGroupHTML7);
                    }
                    break;
                #endregion

                #region EDIT MAINCATE SORT
                case "editMainCateSort":
                    {
                        String maincateSortIDHTML = "";
                        try
                        {
                            int maincateID = 0;
                            if (Request.QueryString["mainCateSortID"].ToString() != null)
                            {
                                maincateID = int.Parse(Request.QueryString["mainCateSortID"].ToString());
                            }
                            int newcateSort = 0;
                            if (Request.QueryString["newSort"].ToString() != null)
                            {
                                newcateSort = int.Parse(Request.QueryString["newSort"].ToString());
                            }

                            //update to Database
                            var update = db.tb_CategoryMain.Where(t => t.MainCateID == maincateID).FirstOrDefault();
                            update.Sort = newcateSort;
                            db.SaveChanges();
                        }
                        catch (Exception)
                        {
                            maincateSortIDHTML = "errorSort";
                        }
                        Response.Write(maincateSortIDHTML);
                    }
                    break;
                #endregion

                #region EDIT SUBCATE 1 SORT
                case "editSubCate1Sort":
                    {
                        String subcate1SortIDHTML = "";
                        try
                        {
                            int subcate1ID = 0;
                            if (Request.QueryString["subcate1EditSortID"].ToString() != null)
                            {
                                subcate1ID = int.Parse(Request.QueryString["subcate1EditSortID"].ToString());
                            }
                            byte newcateSort = 0;
                            if (Request.QueryString["newSort"].ToString() != null)
                            {
                                newcateSort = byte.Parse(Request.QueryString["newSort"].ToString());
                            }

                            //update to Database
                            var update = db.tb_CategorySub1.Where(t => t.SubCate1ID == subcate1ID).FirstOrDefault();
                            update.Sort = newcateSort;
                            db.SaveChanges();
                        }
                        catch (Exception)
                        {
                            subcate1SortIDHTML = "errorSort";
                        }
                        Response.Write(subcate1SortIDHTML);
                    }
                    break;
                #endregion

                #region EDIT SUBCATE 2 SORT
                case "editSubCate2Sort":
                    {
                        String subcate2SortIDHTML = "";
                        try
                        {
                            int subcate2ID = 0;
                            if (Request.QueryString["subcate2EditSortID"].ToString() != null)
                            {
                                subcate2ID = int.Parse(Request.QueryString["subcate2EditSortID"].ToString());
                            }
                            int newcateSort = 0;
                            if (Request.QueryString["newSort"].ToString() != null)
                            {
                                newcateSort = int.Parse(Request.QueryString["newSort"].ToString());
                            }

                            //update to Database
                            var update = db.tb_CategorySub2.Where(t => t.SubCate2ID == subcate2ID).FirstOrDefault();
                            update.Sort = newcateSort;
                            db.SaveChanges();
                        }
                        catch (Exception)
                        {
                            subcate2SortIDHTML = "errorSort";
                        }
                        Response.Write(subcate2SortIDHTML);
                    }
                    break;
                #endregion

                #region SET DISABLE MAINCATE
                case "setDisableMainCate":
                    {
                        String maincateDisableIDHTML = "";
                        try
                        {
                            int maincateDisableID = 0;
                            if (Request.QueryString["maincateDisableID"].ToString() != null)
                            {
                                maincateDisableID = int.Parse(Request.QueryString["maincateDisableID"].ToString());
                            }
                            //update to Database
                            var update = db.tb_CategoryMain.Where(t => t.MainCateID == maincateDisableID).FirstOrDefault();
                            update.IsDisplay = false;
                            db.SaveChanges();
                        }
                        catch (Exception)
                        {
                            maincateDisableIDHTML = "errorDisable";
                        }
                        Response.Write(maincateDisableIDHTML);
                    }
                    break;
                #endregion

                #region SET ENABLE MAINCATE
                case "setEnableMainCate":
                    {
                        String maincateEnableIDHTML = "";
                        try
                        {
                            int maincateEnableID = 0;
                            if (Request.QueryString["maincateEnableID"].ToString() != null)
                            {
                                maincateEnableID = int.Parse(Request.QueryString["maincateEnableID"].ToString());
                            }
                            //update to Database
                            var update = db.tb_CategoryMain.Where(t => t.MainCateID == maincateEnableID).FirstOrDefault();
                            update.IsDisplay = true;
                            db.SaveChanges();
                        }
                        catch (Exception)
                        {
                            maincateEnableIDHTML = "errorEnable";
                        }
                        Response.Write(maincateEnableIDHTML);
                    }
                    break;
                #endregion

                #region SET DISABLE SUBCATE 1
                case "setDisableSubCate1":
                    {
                        String subcate1DisableIDHTML = "";
                        try
                        {
                            int subcate1DisableID = 0;
                            if (Request.QueryString["subcate1DisableID"].ToString() != null)
                            {
                                subcate1DisableID = int.Parse(Request.QueryString["subcate1DisableID"].ToString());
                            }
                            //update to Database
                            var update = db.tb_CategorySub1.Where(t => t.SubCate1ID == subcate1DisableID).FirstOrDefault();
                            update.IsDisplay = false;
                            db.SaveChanges();
                        }
                        catch (Exception)
                        {
                            subcate1DisableIDHTML = "errorDisable";
                        }
                        Response.Write(subcate1DisableIDHTML);
                    }
                    break;
                #endregion

                #region SET ENABLE SUBCATE 1
                case "setEnableSubCate1":
                    {
                        String subcate1EnableIDHTML = "";
                        try
                        {
                            int subcate1EnableID = 0;
                            if (Request.QueryString["subcate1EnableID"].ToString() != null)
                            {
                                subcate1EnableID = int.Parse(Request.QueryString["subcate1EnableID"].ToString());
                            }
                            //update to Database
                            var update = db.tb_CategorySub1.Where(t => t.SubCate1ID == subcate1EnableID).FirstOrDefault();
                            update.IsDisplay = true;
                            db.SaveChanges();
                        }
                        catch (Exception)
                        {
                            subcate1EnableIDHTML = "errorEnable";
                        }
                        Response.Write(subcate1EnableIDHTML);
                    }
                    break;
                #endregion

                #region SET DISABLE SUBCATE 2
                case "setDisableSubCate2":
                    {
                        String subcate2DisableIDHTML = "";
                        try
                        {
                            int subcate2DisableID = 0;
                            if (Request.QueryString["subcate2DisableID"].ToString() != null)
                            {
                                subcate2DisableID = int.Parse(Request.QueryString["subcate2DisableID"].ToString());
                            }
                            //update to Database
                            var update = db.tb_CategorySub2.Where(t => t.SubCate2ID == subcate2DisableID).FirstOrDefault();
                            update.IsDisplay = false;
                            db.SaveChanges();
                        }
                        catch (Exception)
                        {
                            subcate2DisableIDHTML = "errorDisable2";
                        }
                        Response.Write(subcate2DisableIDHTML);
                    }
                    break;
                #endregion

                #region SET ENABLE SUBCATE 2
                case "setEnableSubCate2":
                    {
                        String subcate2EnableIDHTML = "";
                        try
                        {
                            int subcate2EnableID = 0;
                            if (Request.QueryString["subcate2EnableID"].ToString() != null)
                            {
                                subcate2EnableID = int.Parse(Request.QueryString["subcate2EnableID"].ToString());
                            }
                            //update to Database
                            var update = db.tb_CategorySub2.Where(t => t.SubCate2ID == subcate2EnableID).FirstOrDefault();
                            update.IsDisplay = true;
                            db.SaveChanges();
                        }
                        catch (Exception)
                        {
                            subcate2EnableIDHTML = "errorEnable2";
                        }
                        Response.Write(subcate2EnableIDHTML);
                    }
                    break;
                #endregion

                #region FETCH SUBCATE1 FROM FILTER
                case "fetchSubCate1Filter":
                    {
                        String subCate1FilterHTML = "";
                        try
                        {
                            int mainCateIDfilter = 0;
                            if (Request.QueryString["mainCateIDfilter"].ToString() != null)
                            {
                                mainCateIDfilter = int.Parse(Request.QueryString["mainCateIDfilter"].ToString());
                                subCate1FilterHTML = adGenerate.getSubCate1Filter(mainCateIDfilter);
                            }
                        }
                        catch (Exception)
                        {
                            subCate1FilterHTML = "error";
                        }
                        Response.Write(subCate1FilterHTML);
                    }
                    break;
                #endregion

                #region FETCH SUBCATE1 FROM FILTER ACTION
                case "fetchSubCate1FilterAction":
                    {
                        String subCate1FilterHTML = "";
                        try
                        {
                            int mainCateIDfilterAction = 0;
                            if (Request.QueryString["valMainCateSelected"].ToString() != null)
                            {
                                mainCateIDfilterAction = int.Parse(Request.QueryString["valMainCateSelected"].ToString());
                                subCate1FilterHTML = adGenerate.getSubCate1FilterAction(mainCateIDfilterAction);
                            }
                        }
                        catch (Exception)
                        {
                            subCate1FilterHTML = "error";
                        }
                        Response.Write(subCate1FilterHTML);
                    }
                    break;
                #endregion

                #region FILTER SUB CATE 1
                case "filterSubCate1":
                    {
                        String subCate2FilterHTML = "";
                        try
                        {
                            int mainCateIDfilterS = 0;
                            if (Request.QueryString["valMainCateSelected"].ToString() != null)

                            {
                                mainCateIDfilterS = int.Parse(Request.QueryString["valMainCateSelected"].ToString());
                                subCate2FilterHTML = adGenerate.getSubCate1FilterList(mainCateIDfilterS);
                            }
                        }
                        catch (Exception)
                        {
                            subCate2FilterHTML = "error";
                        }
                        Response.Write(subCate2FilterHTML);
                    }
                    break;
                #endregion

                #region FILTER SUB CATE 2
                case "filterSubCate2":
                    {
                        String subCate2FilterHTML = "";
                        try
                        {
                            int mainCateIDfilterS = 0;
                            int subCate1IDfilterS = 0;
                            if (Request.QueryString["valMainCateSelected"].ToString() != null && Request.QueryString["valSubCate1Selected"].ToString() != null)
                            
                            {
                                mainCateIDfilterS = int.Parse(Request.QueryString["valMainCateSelected"].ToString());
                                subCate1IDfilterS = int.Parse(Request.QueryString["valSubCate1Selected"].ToString());
                                subCate2FilterHTML = adGenerate.getSubCate2FilterList(mainCateIDfilterS, subCate1IDfilterS);
                            }
                        }
                        catch (Exception)
                        {
                            subCate2FilterHTML = "error";
                        }
                        Response.Write(subCate2FilterHTML);
                    }
                    break;
                    #endregion

                    

            }
        }
    } 
    private void SubCate_getData()
    {
        string html = "";
        string id_mCate = Request.QueryString["MainCateID"].ToString();
        if (id_mCate.ToString() != "")
        {
            int id_mCateInt = int.Parse(id_mCate);
            var tb_subCate1 = this.db.tb_CategorySub1.Where(t => t.MainCateID == id_mCateInt).ToList();
            html += "<select class='form-control'><option value='' selected='selected'>Chọn Sub Category 1</option>";
            if (tb_subCate1.Count > 0)
            {
                for (int i = 0; i < tb_subCate1.Count; i++)
                {
                    html += "<option value='" + tb_subCate1[i].SubCate1ID.ToString() + "'>" + tb_subCate1[i].SubCate1Name.ToString() + "</option>";
                }
            }
            html += "</select>";
        }
        Response.Write(html);
    }
    //--------------------------
}