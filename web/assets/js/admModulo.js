/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(function(){
   $('tr #btneliminar').click(function(e){
      e.preventDefault();
      var opcion = confirm("Desea eliminar el Modulo");
      if(opcion){
          var fila = $(this).parent().parent();
          var idmodulo = fila.find('#id_modulo').text();
          var data = {idModulo : idmodulo};
          $.post("deleteModulo",data,function(res,est,jqXHR){
             fila.remove(); 
          });
      }
   });
   
   $('#btnmodificarmodulo').click(function(e){
      e.preventDefault();
      var data = $('#frmmodificar').serialize();
      $.post("updateModulo",data,function(res,est,jqXHR){
          if(res === "1"){
              setTimeout(function(){
                  window.location = "tabla-modulos.jsp"; 
              },300);
          }else{
              alert(res);
          }
      });
   });
   
});

