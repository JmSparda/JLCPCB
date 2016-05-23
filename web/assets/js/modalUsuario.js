/*$(function(){
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
});*/

function search(ele) {
    if(event.keyCode === 13) {
        var id = ele.value;
        var data = {
            ID : id;
        }
        $.post("searchTrabajador",data,function(res,est,jqXHR){
           alert(res); 
        });
    }
}