using PersonelSistemi.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace PersonelSistemi.Controllers
{
    public class HomeController : Controller
    {
        TelefonRehberiEntities db = new TelefonRehberiEntities();
        // GET: Guest
        public ActionResult Index()
        {
            var model = db.Personeller.ToList();
            return View(model);
        }

        // GET: Guest/Detay/5
        public ActionResult Detay(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Personeller personel = db.Personeller.Find(id);
           
            if (personel == null)
            {
                return RedirectToAction("NotFound", "Error");
            }
            return View(personel);
           
        }
    }
}