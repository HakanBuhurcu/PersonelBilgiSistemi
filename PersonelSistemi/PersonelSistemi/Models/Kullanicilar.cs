//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PersonelSistemi.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public partial class Kullanicilar
    {
        public int KullaniciID { get; set; }
        [Required(ErrorMessage = "Kullan�c� ad� yaz�n�z.")]
        public string KullaniciAd { get; set; }
        [Required(ErrorMessage ="�ifre yaz�n�z.")]
        public string Parola { get; set; }
        [NotMapped]
        [Required(ErrorMessage = "�ifreyi tekrar yaz�n�z.")]
        public string TekrarParola { get; set; }
    }
}
