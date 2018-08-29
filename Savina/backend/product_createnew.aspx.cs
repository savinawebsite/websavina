using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


public partial class backend_product_createnew : System.Web.UI.Page
{
    private savinaEntities db = new savinaEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadMainCate();
            LoadProductAccompany();
            LoadProductAccessory();
        }
    }

    private void LoadProductAccompany()
    {
        string proAccompany = "";
        string html = "";

        var productList = (from pl in db.tb_Product
                           select new
                           {
                               pl.ProductID,
                               pl.ProductCode,
                               pl.ProductName
                           }
             ).OrderByDescending(p => p.ProductID).ToList();
        int kk = 0;
        proAccompany += "<select id=\"ipProductAccompanySelection\" name=\"ipProductAccompanySelection\" class=\"form-control selectpicker\" size=\"13\" multiple=\"multiple\" data-live-search=\"true\">"; 
        foreach (var item in productList)
        {
            kk++;
            html += "<option value=\"" + item.ProductID + "\">" + item.ProductName + "</option>";
        }
        proAccompany += html;
        proAccompany += "</select>";
        this.ProAccompamyList.InnerHtml = proAccompany;
    }

    private void LoadProductAccessory()
    {
        string proAccessory = "";
        string html = "";

        var productList = (from pl in db.tb_Product
                           select new
                           {
                               pl.ProductID,
                               pl.ProductCode,
                               pl.ProductName
                           }
             ).OrderByDescending(p => p.ProductID).ToList();

        int kk = 0;
        proAccessory += "<select id=\"ipProductAccessorySelection\" name=\"ipProductAccessorySelection\" class=\"form-control selectpicker\" size=\"13\" multiple=\"multiple\" data-live-search=\"true\">";
        foreach (var item in productList)
        {
            kk++;
            html += "<option value=\"" + item.ProductID + "\">" + item.ProductName + "</option>";
        }
        proAccessory += html;
        proAccessory += "</select>"; 
        this.ProAccessoryList.InnerHtml = proAccessory;
    }

    private void LoadMainCate()
    {
        var tb_MainCate = this.db.tb_CategoryMain.OrderBy(p => p.Sort).ToList();
        this.data_MainCate.DataSource = tb_MainCate;
        this.data_MainCate.DataTextField = "MainCateName";
        this.data_MainCate.DataValueField = "MainCateID";
        this.data_MainCate.DataBind();
        ListItem listMainCate = new ListItem("Chọn main category ", "");
        this.data_MainCate.Items.Insert(0, listMainCate);
    }

    private void LoadSubCate1()
    {
        var IDMainCateSelected = data_MainCate.SelectedValue;
        int IDMainCateSelectedInt = 0;
        IDMainCateSelectedInt = int.Parse(IDMainCateSelected);
        var tb_SubCate1 = this.db.tb_CategorySub1.Where(p => p.MainCateID == IDMainCateSelectedInt).ToList();
        this.data_SubCate1.DataSource = tb_SubCate1;
        this.data_SubCate1.DataTextField = "SubCate1Name";
        this.data_SubCate1.DataValueField = "SubCate1ID";
        this.data_SubCate1.DataBind();
        ListItem listSubCate1 = new ListItem("Chọn Sub category 1 ", "");
        this.data_SubCate1.Items.Insert(0, listSubCate1);
    }

    private void LoadSubCate2()
    {
        var IDSubCate1Selected = data_SubCate1.SelectedValue;
        int IDSubCate1SelectedInt = 0;
        IDSubCate1SelectedInt = int.Parse(IDSubCate1Selected);
        var tb_SubCate2 = this.db.tb_CategorySub2.Where(p => p.SubCate1ID == IDSubCate1SelectedInt).ToList();
        this.data_SubCate2.DataSource = tb_SubCate2;
        this.data_SubCate2.DataTextField = "SubCate2Name";
        this.data_SubCate2.DataValueField = "SubCate2ID";
        this.data_SubCate2.DataBind();
        ListItem listSubCate2 = new ListItem("Chọn Sub category 2 ", "");
        this.data_SubCate2.Items.Insert(0, listSubCate2);
    }

    protected void DDLMainCate_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadSubCate1();
    }

    protected void DDLSubCate1_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadSubCate2();
    }


    protected void btnCreate_click(object sender, EventArgs e)
    {
        string productCode = Request.Form["ctl00$ContentPlaceHolder1$productCode"];
        string getproductAvailability = Request.Form["ctl00$ContentPlaceHolder1$productAvailability"];
        if (getproductAvailability == "ProductStatus1")
        {
            getproductAvailability = "1";
        }
        if (getproductAvailability == "ProductStatus2")
        {
            getproductAvailability = "2";
        }
        if (getproductAvailability == "ProductStatus3")
        {
            getproductAvailability = "3";
        }
        var IDMainCateSelected = this.data_MainCate.SelectedValue;
        var IDSubCate1Selected = this.data_SubCate1.SelectedValue;
        var IDSubCate2Selected = this.data_SubCate2.SelectedValue;

        string productName = Request.Form["ctl00$ContentPlaceHolder1$productName"];
        string priceByBlockStr = this.priceByBlock.Value;
        double priceByBlock = 0;
        if (priceByBlockStr == "" || priceByBlockStr == null)
        {
            priceByBlock = 0;
        }
        else
        {
            priceByBlock = double.Parse(priceByBlockStr);
        }
        //double priceByBlock = double.Parse(Request.Form["ctl00$ContentPlaceHolder1$priceByBlock"]);

        string priceByDayStr = this.priceByDay.Value;
        double priceByDay = 0;
        if (priceByDayStr == "" || priceByDayStr == null)
        {
            priceByDay = 0;
        }
        else
        {
            priceByDay = double.Parse(priceByDayStr); ;
        }
        //double priceByDay = double.Parse(Request.Form["ctl00$ContentPlaceHolder1$priceByDay"]);
        string productDescription = Request.Form["ctl00$ContentPlaceHolder1$productDescription"];
        string productStatusStr = Request.Form["ctl00$ContentPlaceHolder1$productStatus"];
        int productStatus = 0;
        if (productStatusStr == "" || productStatusStr == null)
        {
            productStatus = 0;
        }
        else
        {
            productStatus = int.Parse(productStatusStr);
        }
        byte productAvailability = byte.Parse(getproductAvailability);
        string productValueStr = this.productValue.Value;
        double productValue = 0;
        if (productValueStr == "" || productValueStr == null)
        {
            productValue = 0;
        }
        else
        {
            productValue = double.Parse(productValueStr);
        }
        //double productValue = double.Parse(Request.Form["ctl00$ContentPlaceHolder1$productValue"]);
        string productFullDesc = this.content_PrFullDesc.Value; // Request.Form["ctl00$ContentPlaceHolder1$content_PrFullDesc"];
        string productFullSpec = this.content_PrSpec.Value; // Request.Form["ctl00$ContentPlaceHolder1$content_PrSpec"];
        string productFullInstruction = this.content_PrInstruction.Value; // Request.Form["ctl00$ContentPlaceHolder1$content_PrInstruction"];

        int productMainCate = 0;
        if (IDMainCateSelected == "" || IDMainCateSelected == null)
        {
            productMainCate = 0;
        }
        else
        {
            productMainCate = int.Parse(IDMainCateSelected); ;
        }

        int productSubCate1 = 0;
        if (IDSubCate1Selected == "" || IDSubCate1Selected == null)
        {
            productSubCate1 = 0;
        }
        else
        {
            productSubCate1 = int.Parse(IDSubCate1Selected);
        }
        int productSubCate2 = 0;
        if (IDSubCate2Selected == "" || IDSubCate2Selected == null)
        {
            productSubCate2 = 0;
        }
        else
        {
            productSubCate2 = int.Parse(IDSubCate2Selected);
        }
        string productAvatar = Path.GetFileName(productAvatarFile.FileName);
        string path = Server.MapPath("~/image_product/");
        string youtubeLink = Request.Form["ctl00$ContentPlaceHolder1$productYoutube"];
        try
        {
            tb_Product info = new tb_Product();


            productAvatarFile.SaveAs(path + productAvatar);
            info.ProductAvatar = "../image_product/" + productAvatar;
            info.ProductCode = productCode;
            info.ProductName = productName;
            info.PricePerBlock = priceByBlock;
            info.PricePerDay = priceByDay;
            info.ShortDescription = productDescription;
            info.StatusPercentage = productStatus;
            info.StatusAvailability = productAvailability;
            info.ProductValue = productValue;
            info.ProductMainCate = productMainCate;
            info.ProductSubCate1 = productSubCate1;
            info.ProductSubCate2 = productSubCate2;
            info.FullDescription = productFullDesc;
            info.ProductSpecification = productFullSpec;
            info.ProductInstruction = productFullInstruction;
            info.YoutubeLink = youtubeLink;
            info.CreateDate = DateTime.Now;
            db.tb_Product.Add(info);
            db.SaveChanges();

            string productIDStr = info.ProductID.ToString();
            int productIDInTime = int.Parse(productIDStr);

            // add product accompany
            string IDProAccompanySelected = Request["ipProductAccompanySelection"];
            if (IDProAccompanySelected == null || IDProAccompanySelected == "")
            {

            }
            else
            {
                string[] IDProAccompanySelectedMultiple = IDProAccompanySelected.Split(',');
                for (int i = 0; i < IDProAccompanySelectedMultiple.Length; i++)
                {
                    tb_ProductAccompany tb_productAccompany = new tb_ProductAccompany();
                    tb_productAccompany.ProductID = productIDInTime;
                    int IDProAccompanySelectedMultipleID = int.Parse(IDProAccompanySelectedMultiple[i]);
                    var productAccompanyDb = (from pl in db.tb_Product
                                                where pl.ProductID == IDProAccompanySelectedMultipleID
                                                select new
                                                {
                                                    pl.ProductID,
                                                    pl.ProductCode,
                                                    pl.ProductName,
                                                    pl.ProductAvatar
                                                }
                                            ).OrderByDescending(p => p.ProductID).FirstOrDefault();
                    tb_productAccompany.ProductCode = productAccompanyDb.ProductCode;
                    tb_productAccompany.ProductName = productAccompanyDb.ProductName;
                    tb_productAccompany.productAccAvatar = productAccompanyDb.ProductAvatar;
                    try
                    {
                        this.db.tb_ProductAccompany.Add(tb_productAccompany);
                        this.db.SaveChanges();
                    }
                    catch (Exception)
                    {
                        Response.Write("<script>alert('Khởi tạo không thành công, vui lòng thử lại !')</script>");
                    }
                }
            }

            // add product Accessory
            string IDProAccessorySelected = Request["ipProductAccessorySelection"];
            if (IDProAccessorySelected == null || IDProAccessorySelected == "")
            {

            }
            else
            {
                string[] IDProAccessorySelectedMultiple = IDProAccessorySelected.Split(',');
                for (int i = 0; i < IDProAccessorySelectedMultiple.Length; i++)
                {
                    tb_ProductAccessorySelection tb_productAccessory = new tb_ProductAccessorySelection();
                    tb_productAccessory.ProductID = productIDInTime;
                    int IDProAccessorySelectedMultipleID = int.Parse(IDProAccessorySelectedMultiple[i]);
                    var productAccessoryDb = (from pl in db.tb_Product
                                                where pl.ProductID == IDProAccessorySelectedMultipleID
                                                select new
                                                {
                                                    pl.ProductID,
                                                    pl.ProductCode,
                                                    pl.ProductName,
                                                    pl.ProductAvatar,
                                                    pl.PricePerBlock,
                                                    pl.PricePerDay,
                                                    pl.ProductValue
                                                }
                                            ).OrderByDescending(p => p.ProductID).FirstOrDefault();
                    tb_productAccessory.ProductCode = productAccessoryDb.ProductCode;
                    tb_productAccessory.ProductName = productAccessoryDb.ProductName;
                    tb_productAccessory.PricePerBlock = productAccessoryDb.PricePerBlock;
                    tb_productAccessory.PricePerDay = productAccessoryDb.PricePerDay;
                    tb_productAccessory.ProductValue = productAccessoryDb.ProductValue;
                    try
                    {
                        this.db.tb_ProductAccessorySelection.Add(tb_productAccessory);
                        this.db.SaveChanges();
                    }

                    catch (Exception)
                    {
                        Response.Write("<script>alert('Khởi tạo không thành công, vui lòng thử lại !')</script>");
                    }
                }
            }

            //add product gallery
            tb_ProductGallery tb_productGallery = new tb_ProductGallery();
            tb_productGallery.ProductID = productIDInTime;
            string pathGallery = Server.MapPath("~/image_product/");
            if (productGalleryFile.HasFiles)
            {
                foreach (HttpPostedFile uploadedGAllery in productGalleryFile.PostedFiles)
                {
                    try
                    {
                        uploadedGAllery.SaveAs(System.IO.Path.Combine(pathGallery, uploadedGAllery.FileName));
                        tb_productGallery.ImagePath = "../image_product/" + uploadedGAllery.FileName;
                        this.db.tb_ProductGallery.Add(tb_productGallery);
                        this.db.SaveChanges();
                    }
                    catch (Exception)
                    {
                        Response.Write("<script>alert('Khởi tạo không thành công, vui lòng thử lại !')</script>");
                    }
                }
            }
        }

        catch (Exception)
        {
            Response.Write("<script>alert('Khởi tạo không thành công, vui lòng thử lại !')</script>");
        }
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "RefreshPage()", true);      
    }
   
    
    //-----------------------------------     
}

    //--------------------
