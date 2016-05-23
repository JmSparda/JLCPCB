/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(function(){
   $('tr #btneliminar').click(function(e){
      e.preventDefault();
      var opcion = confirm("Desea Eliminar al Trabajador");
      
      if(opcion){
        var fila = $(this).parent().parent();
        var idtrabajador = fila.find('#id_trabajador').text();
        var data = {idTrabajador : idtrabajador};
        $.post("deleteTrabajador", data, function(res,est,jqXHR){
            //alert(res);
            fila.remove();
        }); 
      }
   });
});