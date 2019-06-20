using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PersonelSistemi.ViewModels
{
    public class MesajViewModel
    {
        public string Mesaj { get; set; }

        public string Url { get; set; }

        public string linkText { get; set; }

        public bool isSuccess { get; set; }

     //   public bool isLink{ get; set; }

        public MesajViewModel(string mesaj,string url, string linkText,bool isSuccess  )
        {
            this.isSuccess = isSuccess;
           // this.isLink = isLink;
            Mesaj = mesaj;
            Url = url;
            this.linkText = linkText;
        }
    }
}