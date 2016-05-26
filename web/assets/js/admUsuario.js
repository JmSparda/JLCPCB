/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(function(){
   $('tr #btneliminar').click(function(e){
      e.preventDefault();
      var opcion = confirm("Desea Eliminar al Usuario");
      
      if(opcion){
        var fila = $(this).parent().parent();
        var idusuario = fila.find('#id_usuario').text();
        var data = {idUsuario : idusuario};
        $.post("deleteUsuario", data, function(res,est,jqXHR){
            //alert(res);
            fila.remove();
        }); 
      }
   });
   
   
   $("#frmmodificar").validate({
       rules : { //SE CREAN LAS REGLAS
           usu_usuario : {
               required: true
           },
           usu_password : {
               required: true,
               minlength : 6,
               maxlength : 20
           },
           usu_pass2 : {
               required: true,
               equalTo : "#usu_password" //IGUALAMOS AL PASSWORD ANTERIOR
           }
       },
       messages : { //CREAMOS LOS MENSAJES PARA CADA REGLA
           
           usu_usuario : {
               required : "El campo Usuario es Requerido"
           },
           usu_password : {
               required : "La contraseña es obligatorio",
               minlength : "Minimo de 6 caracteres",
               maxlength : "Maximo 20 caracteres"
           },
           usu_pass2 : {
               required : "La contraseña es Requerido",
               equalTo : "Las contraseñas tienen que ser iguales"
           }
       },submitHandler : function(form){
           $('#btnmodificarusuario').click(function(e){
                e.preventDefault();
                var data = $('#frmmodificar').serialize();
                //console.log(data);
                $.post("updateUsuario",data, function(res,est,jqXHR){
                    //alert(res);
                    if(res === "1"){
                        window.location = "tabla-usuarios.jsp";
                    }else{
                        alert("ERROR AL MODIFICAR");
                    }
                    /*setTimeout(function(){
                        window.location = "tabla-usuarios.jsp";
                    },300);*/
                });
            });
       }
   });
});