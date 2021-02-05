using DXWebApplication2.Model;
using DXWebApplication2.Models;
using System;
using System.Linq;
using System.Web.Mvc;

namespace DXWebApplication2.Controllers
{
    public class MasterProdukDetailController : Controller
    {
        // GET: MasterProdukDetail
        DXWebApplication2.Models.DARMEX_AGROEntities db = new DXWebApplication2.Models.DARMEX_AGROEntities();
        public ActionResult Index()
        {
            var data = (from a in db.table_produk_detail
                        join b in db.table_produk on a.produk_id equals b.produk_id
                        select new ProdukDetail
                        {
                            Id = a.produk_detail_id,
                            produk_detail_id = a.produk_detail_id,
                            produk_id = a.produk_id,
                            produk_name = b.produk_name,
                            produk_detail_name = a.produk_detail_name,
                            price_per_item = a.price_per_item,
                            discount = a.discount
                        }).ToList();
            return View(data);
        }
        public ActionResult GridViewDetailsPage(long id)
        {
            ViewBag.ShowBackButton = true;
            return View(db.table_produk_detail.Find(id));
        }
        //Add Get
        public ActionResult GridViewPartial()
        {
            var data = (from a in db.table_produk_detail
                        join b in db.table_produk on a.produk_id equals b.produk_id
                        select new ProdukDetail
                        {
                            Id = a.produk_detail_id,
                            produk_detail_id = a.produk_detail_id,
                            produk_id = a.produk_id,
                            produk_name = b.produk_name,
                            produk_detail_name = a.produk_detail_name,
                            price_per_item = a.price_per_item,
                            discount = a.discount
                        }).ToList();
            return PartialView("GridViewPartial", data);
        }
        [ValidateAntiForgeryToken]
        public ActionResult GridViewCustomActionPartial(string customAction)
        {
            var produk_detail_id = Convert.ToInt32(Request.Params["SelectedRows"]);

            var model = db.table_produk_detail;
            if (produk_detail_id >= 0)
            {
                try
                {
                    var data = model.FirstOrDefault(it => it.produk_detail_id == produk_detail_id);
                    if (data != null)
                        model.Remove(data);
                    db.SaveChanges();
                }
                catch (Exception e)
                {
                    ViewBag.GeneralError = e.Message;
                }
            }
            return GridViewPartial();
        }
        //Add Post
        [ValidateAntiForgeryToken]
        public ActionResult GridViewAddNewPartial(table_produk_detail item)
        {
            var model = db.table_produk_detail;
            if (ModelState.IsValid)
            {
                try
                {
                    model.Add(item);
                    db.SaveChanges();
                }
                catch (Exception e)
                {
                    ViewBag.GeneralError = e.Message;
                }
            }
            else
                ViewBag.GeneralError = "Please, correct all errors.";
            return GridViewPartial();
        }
        [ValidateAntiForgeryToken]
        public ActionResult GridViewUpdatePartial(table_produk_detail item)
        {
            var model = db.table_produk_detail;
            if (ModelState.IsValid)
            {
                try
                {
                    var modelItem = model.FirstOrDefault(it => it.produk_detail_id == item.produk_detail_id);
                    if (modelItem != null)
                    {
                        this.UpdateModel(modelItem);
                        db.SaveChanges();
                    }
                }
                catch (Exception e)
                {
                    ViewBag.GeneralError = e.Message;
                }
            }
            else
                ViewBag.GeneralError = "Please, correct all errors.";
            return GridViewPartial();
        }
    }
}