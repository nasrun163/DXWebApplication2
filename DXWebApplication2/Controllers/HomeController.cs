using DXWebApplication2.Models;
using System;
using System.Linq;
using System.Web.Mvc;

namespace DXWebApplication2.Controllers
{
    public class HomeController : Controller
    {
        DXWebApplication2.Models.DARMEX_AGROEntities db = new DXWebApplication2.Models.DARMEX_AGROEntities();
        public ActionResult Index()
        {
            var data = db.SelectAllTransaksi(null).ToList();
            return View(data);
        }
        public ActionResult GridViewDetailsPage(int id)
        {
            ViewBag.ShowBackButton = true;
            var data = db.SelectAllTransaksi(id);
            return View(data);
        }
        //Add Get
        public ActionResult GridViewPartial()
        {
            var data = db.SelectAllTransaksi(null).ToList();
            return PartialView("GridViewPartial", data);
        }
        [ValidateAntiForgeryToken]
        public ActionResult GridViewCustomActionPartial(string customAction)
        {
            var transaksi_id = Convert.ToInt32(Request.Params["SelectedRows"]);

            var model = db.table_transaksi;
            if (transaksi_id >= 0)
            {
                try
                {
                    var data = model.FirstOrDefault(it => it.transaksi_id == transaksi_id);
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
        public ActionResult GridViewAddNewPartial(table_transaksi item)
        {
            var model = db.table_transaksi;
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
        public ActionResult GridViewUpdatePartial(table_transaksi item)
        {
            var model = db.table_transaksi;
            if (ModelState.IsValid)
            {
                try
                {
                    var modelItem = model.FirstOrDefault(it => it.transaksi_id == item.transaksi_id);
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