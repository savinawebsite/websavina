﻿

//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;


public partial class savinaEntities : DbContext
{
    public savinaEntities()
        : base("name=savinaEntities")
    {

    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }


    public virtual DbSet<tb_About> tb_About { get; set; }

    public virtual DbSet<tb_Access> tb_Access { get; set; }

    public virtual DbSet<tb_CategoryMain> tb_CategoryMain { get; set; }

    public virtual DbSet<tb_CategorySub1> tb_CategorySub1 { get; set; }

    public virtual DbSet<tb_CategorySub2> tb_CategorySub2 { get; set; }

    public virtual DbSet<tb_CategorySub3> tb_CategorySub3 { get; set; }

    public virtual DbSet<tb_ContactUs> tb_ContactUs { get; set; }

    public virtual DbSet<tb_Counteronline> tb_Counteronline { get; set; }

    public virtual DbSet<tb_Country> tb_Country { get; set; }

    public virtual DbSet<tb_Customer> tb_Customer { get; set; }

    public virtual DbSet<tb_DeliverySelection> tb_DeliverySelection { get; set; }

    public virtual DbSet<tb_District> tb_District { get; set; }

    public virtual DbSet<tb_DocumentSelection> tb_DocumentSelection { get; set; }

    public virtual DbSet<tb_HomeBanner> tb_HomeBanner { get; set; }

    public virtual DbSet<tb_HomeMainBanner> tb_HomeMainBanner { get; set; }

    public virtual DbSet<tb_HomeProductGroup> tb_HomeProductGroup { get; set; }

    public virtual DbSet<tb_LocalAccount> tb_LocalAccount { get; set; }

    public virtual DbSet<tb_Order> tb_Order { get; set; }

    public virtual DbSet<tb_OrderAccessorySelection> tb_OrderAccessorySelection { get; set; }

    public virtual DbSet<tb_OrderTrackingUpdate> tb_OrderTrackingUpdate { get; set; }

    public virtual DbSet<tb_Permission> tb_Permission { get; set; }

    public virtual DbSet<tb_Product> tb_Product { get; set; }

    public virtual DbSet<tb_ProductAccessorySelection> tb_ProductAccessorySelection { get; set; }

    public virtual DbSet<tb_ProductAccompany> tb_ProductAccompany { get; set; }

    public virtual DbSet<tb_ProductGallery> tb_ProductGallery { get; set; }

    public virtual DbSet<tb_ProductHomeProductGroup> tb_ProductHomeProductGroup { get; set; }

    public virtual DbSet<tb_Promotion> tb_Promotion { get; set; }

    public virtual DbSet<tb_Province> tb_Province { get; set; }

    public virtual DbSet<tb_ServiceSelection> tb_ServiceSelection { get; set; }

    public virtual DbSet<tb_SiteMap> tb_SiteMap { get; set; }

    public virtual DbSet<tb_Ward> tb_Ward { get; set; }

    public virtual DbSet<tb_WishList> tb_WishList { get; set; }

    public virtual DbSet<tb_GetLinkImage> tb_GetLinkImage { get; set; }

    public virtual DbSet<tb_GroupCustomer> tb_GroupCustomer { get; set; }

    public virtual DbSet<tb_ContactMessage> tb_ContactMessage { get; set; }

}

