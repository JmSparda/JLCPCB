/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(function(){
   $('tr #btneliminar').click(function(e){
      e.preventDefault();
      var opcion = confirm("Desea Eliminar al Perfil");
      
      if(opcion){
        var fila = $(this).parent().parent();
        var idperfil = fila.find('#id_perfil').text();
        var data = {idPerfil : idperfil};
        $.post("deletePerfil", data, function(res,est,jqXHR){
            //alert(res);
            fila.remove();
        }); 
      }
   });
   
   $('#btnmodificarperfil').click(function(e){
       e.preventDefault();
       var data = $('#frmmodificar').serialize();
       //console.log(data);
       $.post("updatePerfil",data, function(res,est,jqXHR){
           //alert(res);
           setTimeout(function(){
               window.location = "perfiles.jsp";
           },300);
       });
   });
   
});