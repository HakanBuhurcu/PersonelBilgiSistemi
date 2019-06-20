using PersonelSistemi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PersonelSistemi.ViewModels
{
    public class PersonelFormViewModel
    {
        public Personeller personel { get; set; }
        public IEnumerable<Departmanlar> departmanlar { get; set; }
        public SelectList yoneticiler;

       
        public PersonelFormViewModel(IEnumerable<Departmanlar> departmanlar,SelectList yoneticiler)
        {
            this.departmanlar = departmanlar;
            this.yoneticiler = yoneticiler;
        }

        public PersonelFormViewModel(IEnumerable<Departmanlar> departmanlar, SelectList yoneticiler,Personeller personel)
        {
            this.departmanlar = departmanlar;
            this.yoneticiler = yoneticiler;
            this.personel = personel;
        }
    }
}