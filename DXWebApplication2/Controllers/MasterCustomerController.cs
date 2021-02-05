using DXWebApplication2.Model;
using DXWebApplication2.Models;
using System;
using System.Linq;
using System.Web.Mvc;

namespace DXWebApplication2.Controllers
{
    public class MasterCustomerController : Controller
    {
        // GET: MasterCustomer        
        DXWebApplication2.Models.DARMEX_AGROEntities db = new DXWebApplication2.Models.DARMEX_AGROEntities();
        public ActionResult Index()
        {
            var data = (from a in db.table_costumer
                        select new Customer
                        {
                            Id = a.costumer_id,
                            costumer_id = a.costumer_id,
                            costumer_name = a.costumer_name,
                            address = a.address
                        }).ToList();
            return View(data);
        }
        public ActionResult GridViewDetailsPage(long id)
        {
            ViewBag.ShowBackButton = true;
            return View(db.table_costumer.Find(id));
        }
        //Add Get
        public ActionResult GridViewPartial()
        {
            var data = (from a in db.table_costumer
                        select new Customer
                        {
                            Id = a.costumer_id,
                            costumer_id = a.costumer_id,
                            costumer_name = a.costumer_name,
                            address = a.address
                        }).ToList();
            return PartialView("GridViewPartial", data);
        }
        [ValidateAntiForgeryToken]
        public ActionResult GridViewCustomActionPartial(string customAction)
        {
            var costumer_id = Convert.ToInt32(Request.Params["SelectedRows"]);

            var model = db.table_costumer;
            if (costumer_id >= 0)
            {
                try
                {
                    var data = model.FirstOrDefault(it => it.costumer_id == costumer_id);
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
        public ActionResult GridViewAddNewPartial(table_costumer item)
        {
            var model = db.table_costumer;
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
        public ActionResult GridViewUpdatePartial(table_costumer item)
        {
            var model = db.table_costumer;
            if (ModelState.IsValid)
            {
                try
                {
                    var modelItem = model.FirstOrDefault(it => it.costumer_id == item.costumer_id);
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