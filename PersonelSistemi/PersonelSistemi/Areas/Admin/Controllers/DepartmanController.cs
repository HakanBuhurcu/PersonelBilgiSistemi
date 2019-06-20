using PersonelSistemi.Models;
using System.Linq;
using System.Web.Mvc;
using System.Net;
using PersonelSistemi.ViewModels;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System;

namespace PersonelSistemi.Areas.Admin.Controllers
{
    [Authorize]
    public class DepartmanController : Controller
    {
        TelefonRehberiEntities db = new TelefonRehberiEntities();
        // GET: Admin/Departman
        public ActionResult Index()
        {
            var departmanlar = db.Departmanlar.ToList();
            return View(departmanlar);
        }


        public ActionResult Ekle()
        {
            return View("DepartmanForm",new Departmanlar());
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Ekle(Departmanlar departman)
        {
            if (ModelState.IsValid)
            {
                db.Departmanlar.Add(departman);
                try
                {
                     db.SaveChanges();
                     MesajViewModel mesaj = new MesajViewModel(departman.DepAd + " departmanı başarıyla eklendi.", "/Admin/Departman", "Departmanlar Listesi", true);
                     return View("_Mesaj", mesaj);

                }catch(Exception)
                {
                    MesajViewModel message = new MesajViewModel("Bir hata oluştu.", "/Admin/Departman", "Departmanlar Listesi", false);
                    return View("_Mesaj", message);
                }
                
            }
            MesajViewModel msg = new MesajViewModel("Bir hata oluştu.", "/Admin/Departman", "Departmanlar Listesi", false);
            return View("_Mesaj", msg);
        }

        public ActionResult Guncelle(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Departmanlar departman = db.Departmanlar.Find(id);
            if (departman == null)
            {
                return RedirectToAction("NotFound", "Error");
            }
            return View("DepartmanForm", departman);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Guncelle(Departmanlar departman)
        {
            if (ModelState.IsValid)
            {
                db.Entry(departman).State = EntityState.Modified;
                try
                {
                    db.SaveChanges();
                    MesajViewModel msg = new MesajViewModel(departman.DepAd + " departmanı başarıyla güncellendi.", "/Admin/Departman",
                   "Departmanlar Listesi", true);
                    return View("_Mesaj", msg);

                }
                catch(Exception)
                {
                    MesajViewModel message = new MesajViewModel("Bir hata oluştu.", "/Admin/Departman", "Departmanlar Listesi", false);
                    return View("_Mesaj", message);
                }
                
                
            }

            MesajViewModel mesaj = new MesajViewModel("Bir hata oluştu.", "/Admin/Departman", "Departmanlar Listesi", false);
            return View("_Mesaj", mesaj);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Sil(int id)
        {
            Departmanlar departman = db.Departmanlar.Find(id);
            db.Departmanlar.Remove(departman);
            try
            {
                 db.SaveChanges();
                 return Json(new { IsSuccess = true });
            }
            catch (DbUpdateException)
            {
                return Json(new { IsSuccess = false });
            }
            
           

        }

    }


}