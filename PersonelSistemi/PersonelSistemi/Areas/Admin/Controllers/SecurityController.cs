using PersonelSistemi.Models;
using PersonelSistemi.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace PersonelSistemi.Areas.Admin.Controllers
{
    public class SecurityController : Controller
    {
        TelefonRehberiEntities db = new TelefonRehberiEntities();
        // GET: Admin/Security
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(Kullanicilar kullanici)
        {
            var user = db.Kullanicilar.FirstOrDefault(x => x.KullaniciAd == kullanici.KullaniciAd && x.Parola == kullanici.Parola);
            if (user !=null)
            {
                FormsAuthentication.SetAuthCookie(user.KullaniciAd, false);
                return Json(new { RedirectUrl = Url.Action("Index", "Personel") });
            }
            else
            {
                MesajViewModel msg = new MesajViewModel("Kullanıcı adı ve/veya parola hatalı", null, null, false);
                return View("_Mesaj",msg);
            }
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }

        [Authorize]
        public ActionResult PasswordChange()
        {
            
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult PasswordChange(string parola)
        {
            string user_name = User.Identity.Name;
            Kullanicilar user = db.Kullanicilar.Where(k => k.KullaniciAd == user_name).SingleOrDefault();
            user.Parola = parola;
            user.TekrarParola = parola;
            
            try
            {
                db.SaveChanges();
                MesajViewModel msg = new MesajViewModel("Şifre başarıyla değiştirilmiştir.",null,null,true);
                return View("_Mesaj",msg);
            }
            catch (Exception)
            {
                MesajViewModel msg = new MesajViewModel("Bir hata oluştu.", null, null, false);
                return View("_Mesaj", msg);
            }
           
           
               
            
           
        }
    }
}