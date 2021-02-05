using DevExpress.Web;
using DevExpress.Web.Mvc;
using DXWebApplication2.Model;
using DXWebApplication2.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace DXWebApplication2.Model
{
    public class Customer : table_costumer
    {
        public int Id { get; set; }
    }
    public class Produk : table_produk
    {
        public int Id { get; set; }
    }
    public class ProdukDetail : table_produk_detail
    {
        public int Id { get; set; }
        public string produk_name { get; set; }
        //public List<table_produk> data { get; set; }
    }
    public static class GridViewHelper
    {
        public static List<table_produk> GetProduks()
        {
            DXWebApplication2.Models.DARMEX_AGROEntities db = new DXWebApplication2.Models.DARMEX_AGROEntities();
            return db.table_produk.ToList();
        }
        public static List<table_costumer> GetCustomers()
        {
            DXWebApplication2.Models.DARMEX_AGROEntities db = new DXWebApplication2.Models.DARMEX_AGROEntities();
            return db.table_costumer.ToList();
        }
    }    
}