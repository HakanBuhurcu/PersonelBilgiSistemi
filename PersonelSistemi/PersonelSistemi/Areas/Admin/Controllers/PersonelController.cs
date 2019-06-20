using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PersonelSistemi.Models;
using PersonelSistemi.ViewModels;

namespace PersonelSistemi.Areas.Admin.Controllers
{
    [Authorize]
    public class PersonelController : Controller
    {
        TelefonRehberiEntities db = new TelefonRehberiEntities();
        // GET: Admin/Personel
        
        public ActionResult Index()
        {
            var personeller = db.Personeller.ToList();
            return View(personeller);
        }

        // GET: Personel/Detay/5
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

        // GET: Personel/Ekle
        public ActionResult Ekle()
        {
            var yoneticiler = db.Personeller.Select(p => new {p.PersonelID, AdSoyad = p.Ad + " " + p.Soyad});
            PersonelFormViewModel model = new PersonelFormViewModel(db.Departmanlar, new SelectList(yoneticiler,"PersonelID","AdSoyad"),new Personeller());
            return View("PersonelForm",model);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Ekle( Personeller personel)
        {
            if (ModelState.IsValid)
            {
                db.Personeller.Add(personel);
                try
                {
                    db.SaveChanges();
                    return Json(new { personelId=personel.PersonelID, AdSoyad = personel.Ad + " " + personel.Soyad});

                }
                catch(Exception)
                {
                    MesajViewModel message = new MesajViewModel("Bir hata oluştu", "/Admin/Personel", 
                                           "Personeller Listesi", false);
                    return View("_Mesaj", message);
                }
                
              
            }

            MesajViewModel mesaj = new MesajViewModel("Bir hata oluştu", "/Admin/Personel", "Personeller Listesi", false);
            return View("_Mesaj", mesaj);

        }



        // GET: Personel/Guncelle/2
        public ActionResult Guncelle(int? id)
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
            var yoneticiler = db.Personeller.Select(p => new {p.PersonelID, AdSoyad = p.Ad + " " + p.Soyad });
            PersonelFormViewModel model = new PersonelFormViewModel(db.Departmanlar, new SelectList(yoneticiler, "PersonelID", "AdSoyad"), personel);
            return View("PersonelForm",model);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Guncelle(Personeller personel)
        {
            if (ModelState.IsValid)
            {
                db.Entry(personel).State = EntityState.Modified;
                try
                {
                      db.SaveChanges();
                      return Json(new { personelId = personel.PersonelID, AdSoyad = personel.Ad + " " + personel.Soyad });

                }
                catch(Exception)
                {
                   MesajViewModel msg = new MesajViewModel(personel.Ad + " " + personel.Soyad + " başarıyla güncellendi.", 
                                         "/Admin/Personel", "Personeller Listesi", true);
                   return View("_Mesaj",msg);
                }

            }

            MesajViewModel mesaj = new MesajViewModel("Bir hata oluştu", "/Admin/Personel", "Personeller Listesi", false);
            return View("_Mesaj", mesaj);

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Sil(int id)
        {
            Personeller personeller = db.Personeller.Find(id);
            db.Personeller.Remove(personeller);
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