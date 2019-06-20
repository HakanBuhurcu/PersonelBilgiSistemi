$(function () {
    $("#submitbuton").click(function () {
     
       
        password = $("#password").val();
        confirm = $("#confirmpassword").val();

        if (password != '' && confirm != '') {

            matched = (password == confirm) ? true : false;

           if (!matched) {
            
               $("#Mesaj").attr({ 'class': 'alert alert-danger', 'role': 'alert' });
               $("#Mesaj").html("Şifreler eşleşmiyor");
               $("#submitbuton").attr("disabled", true);
               $("#Mesaj").show(250);
               setTimeout(function () {
                 $("#Mesaj").hide(250);
               }, 2000);

               setTimeout(function () {
                 $("#Mesaj").removeAttr("class", "role");
                 $("#Mesaj").html('');
                 $("#submitbuton").removeAttr("disabled");
                }, 2250);

              return false;
          }
        }

        

       
            
            
        
        
            

    });
    $("#tblPersoneller").on("click", ".btnPersonelSil", function () {
     
        var id = $(this).data("id");
        var btn = $(this);
        swal({
            title: 'Silmek istediğinize emin misiniz?',
            text: "Sildiğinizde geri dönüşümü olmayacaktır!",
            type: 'warning',
            showCancelButton: true,
            cancelButtonText: 'İptal',
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Evet,Sil!'
        }).then((result) => {

            if (result.value) {
                var CSRF_TOKEN = $('input[name = "__RequestVerificationToken"]').attr('value');
                $.ajax({
                    type: 'POST',
                    url: '/Personel/Sil',
                    data: {
                        'id': id,
                        '__RequestVerificationToken': CSRF_TOKEN
                    },
                    success: function (data) {
                        if (data.IsSuccess) {
                            btn.parent().parent().remove();
                            swal(
                                "Başarılı",
                                "Personel başarıyla silindi.",
                                "success");
                        }
                        else {
                            swal(
                                "Silinemez",
                                "Bu personel başka bir personelin yöneticisi olduğundan silemezsiniz.",
                                "error");
                        }
                    }
                });
         
            }

            });

        
        
    });
    $("#tblDepartmanlar").on("click",".btnDepartmanSil", function () {
        
        var id = $(this).data("id");
        var btn = $(this);
        swal({
            title: 'Silmek istediğinize emin misiniz?',
            text: "Sildiğinizde geri dönüşümü olmayacaktır!",
            type: 'warning',
            showCancelButton: true,
            cancelButtonText: 'İptal',
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Evet,Sil!'
        }).then((result) => {

            if (result.value) {
                var CSRF_TOKEN = $('input[name = "__RequestVerificationToken"]').attr('value');
                $.ajax({
                    type: 'POST',
                    url: '/Departman/Sil',
                    data: {
                        'id': id,
                        '__RequestVerificationToken': CSRF_TOKEN
                    },
                    success: function (data) {
                        if (data.IsSuccess) {
                            btn.parent().parent().remove();
                            swal(
                                "Başarılı",
                                "Departman başarıyla silindi.",
                                "success");
                        }
                        else {
                            swal(
                            "Silinemez",
                            "Bu departmanda kayıtlı personel bulunduğu için silemezsiniz.",
                            "error");
                        }
                        
                    }
                });

            }

        });



    });
    $("#BtnPersonelSil").click(function () {
        var id = $(this).data("id");
        swal({
            title: 'Silmek istediğinize emin misiniz?',
            text: "Sildiğinizde geri dönüşümü olmayacaktır!",
            type: 'warning',
            showCancelButton: true,
            cancelButtonText: 'İptal',
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Evet,Sil!'
        }).then((result) => {

            if (result.value) {
                var CSRF_TOKEN = $('input[name = "__RequestVerificationToken"]').attr('value');
                $.ajax({
                    type: 'POST',
                    url: '/Personel/Sil',
                    data: {
                        'id': id,
                        '__RequestVerificationToken': CSRF_TOKEN
                    },
                    success: function (data) {
                        if (data.IsSuccess) {
                            swal(
                                "Başarılı",
                                "Personel başarıyla silindi.",
                                "success").then(function () {
                                    window.location.replace('/Admin/Personel');
                                });
                            
                        }
                        else {
                            swal(
                                "Silinemez",
                                "Bu personel başka bir personelin yöneticisi olduğundan silemezsiniz.",
                                "error");
                        }
                        
                    }
                });

            }

        });
    });
    
});



function ResetForm(data) {

    
    var postUrl = $("#form0").attr("action");
    if (!~postUrl.indexOf("Guncelle"))
    {
         $("#form0")[0].reset();
    }

    if (~postUrl.indexOf("Personel"))
    {

        if (~postUrl.indexOf("Ekle")) {
            $('#yoneticilerselect').append($('<option>', { value: data.personelId, text: data.AdSoyad }));
            $('#Mesaj').append('<div class="alert alert-success" role="alert">' + data.AdSoyad +
                ' başarıyla eklendi <a href="/Admin/Personel">Personeller Listesi</a></div>');
        }
        else
        {
            $('#yoneticilerselect option[value=' + data.personelId + ']').html(data.AdSoyad);
            $('#Mesaj').append('<div class="alert alert-success" role="alert">' + data.AdSoyad +
                ' başarıyla güncellendi. <a href="/Admin/Personel">Personeller Listesi</a></div>');
        }
    }
        

    $("#kaydet").attr("disabled", true);

    $("#Mesaj").show(250);
    setTimeout(function () {
        $("#Mesaj").hide(250);

    }, 2000);

    setTimeout(function () {
       $("#Mesaj").html('');
       $("#kaydet").removeAttr("disabled");
    }, 2250);
    


}
function SuccessPost(data) {
    if (data.RedirectUrl) {
        window.location.replace(data.RedirectUrl);
    }
    else {
        $("#Giris").attr("disabled", true);

        $("#Mesaj").show(250);
        setTimeout(function () {
            $("#Mesaj").hide(250);

        }, 2000);

        setTimeout(function () {
            $("#Mesaj").html('');
            $("#Giris").removeAttr("disabled");
        }, 2250);
    }
}
