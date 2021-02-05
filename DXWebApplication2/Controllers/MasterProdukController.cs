using DXWebApplication2.Model;
using DXWebApplication2.Models;
using System;
using System.Linq;
using System.Web.Mvc;

namespace DXWebApplication2.Controllers
{
    public class MasterProdukController : Controller
    {
        // GET: MasterProduk
        DXWebApplication2.Models.DARMEX_AGROEntities db = new DXWebApplication2.Models.DARMEX_AGROEntities();
        public ActionResult Index()
        {
            var data = (from a in db.table_produk
                        select new Produk
                        {
                            Id = a.produk_id,
                            produk_id = a.produk_id,
                            produk_name = a.produk_name,
                            table_produk_detail = a.table_produk_detail
                        }).ToList();
            return View(data);
        }
        public ActionResult GridViewDetailsPage(long id)
        {
            ViewBag.ShowBackButton = true;
            return View(db.table_produk.Find(id));
        }
        //Add Get
        public ActionResult GridViewPartial()
        {
            var data = (from a in db.table_produk
                        select new Produk
                        {
                            Id = a.produk_id,
                            produk_id = a.produk_id,
                            produk_name = a.produk_name,
                            table_produk_detail = a.table_produk_detail
                        }).ToList();
            return PartialView("GridViewPartial", data);
        }
        [ValidateAntiForgeryToken]
        public ActionResult GridViewCustomActionPartial(string customAction)
        {
            var produk_id = Convert.ToInt32(Request.Params["SelectedRows"]);

            var model = db.table_produk;
            if (produk_id >= 0)
            {
                try
                {
                    var data = model.FirstOrDefault(it => it.produk_id == produk_id);
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
        public ActionResult GridViewAddNewPartial(table_produk item)
        {
            var model = db.table_produk;
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
        public ActionResult GridViewUpdatePartial(table_produk item)
        {
            var model = db.table_produk;
            if (ModelState.IsValid)
            {
                try
                {
                    var modelItem = model.FirstOrDefault(it => it.produk_id == item.produk_id);
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