/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(function(){
   
   function validarFields(apellidop, apellidom, nombre, fechanacimiento, tipodocumento, numerodocumento,direccion,telefono,email, sucursal, rol){
       expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
       var hoy = new Date();
       var anioactual = hoy.getFullYear();
       var aniomaximopermitido = anioactual - 18;
       var aniominimopermitido = anioactual - 60;       
       var fechalimitemaxima= new Date(aniomaximopermitido,01,01);
       var fechalimiteminima = new Date (aniominimopermitido, 01, 01 );       
       var fechaingresada = new Date(fechanacimiento);
       if(apellidop.length>1 && apellidop.length <=20){
           if(apellidom.length>1 && apellidom.length <=30){
               if(nombre.length>1 && nombre.length <=30){
                   if(fechaingresada > fechalimiteminima && fechaingresada < fechalimitemaxima){
                       if(tipodocumento !== ""){
                           if(direccion.length>1 && direccion.length<=100){
                               if(telefono.length>1 && telefono.length<=20){
                                   if($.isNumeric(telefono)){
                                       if(expr.test(email)){
                                           if(sucursal !==""){
                                               if(rol !==""){
                                                        var archivos = document.getElementById('archivos').files;
                                                        if(archivos.length === 1){
                                                            for(var i =0;i<archivos.length;i++){
                                                                 var name = archivos[i].name;
                                                                 var ext = name.substring(name.lastIndexOf('.')+1).toLowerCase();
                                                                 if(ext !== 'jpg' && ext !== 'png'){
                                                                     alert('Archivo '+name + ' Incorrecto, solo imagenes JPG o PNG...');
                                                                     return false;
                                                                 }
                                                            }
                                                            return true;
                                                        }
                                                        else{
                                                            alert("Ingrese Alguna imagen de tipo JPG o PNG");
                                                        }
                                                   
                                               }else{
                                                   alert("Seleccione un ROL")
                                               }
                                           }else{
                                               alert("Selecione una SUCURSAL")
                                           }
                                       }else{
                                           alert("Email mal ingresado");
                                       }
                                   }
                                   else{
                                       alert("Escriba solo Numeros");
                                   }
                               }
                               else{
                                   alert("Escriba un Numero de Telefono Correcto");
                               }
                           }
                           else{
                               alert("Escriba un direccion correcta");
                           }
                       }
                       else{
                           alert("Seleccione el Tipo de Documento");
                       }
                   }
                   else{
                      alert("Escriba una fecha correcta");
                      alert("Ano minimo es: "+ (fechalimiteminima).getFullYear());
                      alert("Ano maximo es: "+ (fechalimitemaxima).getFullYear());
                   }
               }else{
                   alert("Escriba un Nombre Correcto");
               }
           }else{
               alert("Escriba un Apellido Correcto");
           }
       }else{
           alert("Escriba un Apellido Correcto");
       }
       return false;
   }
   
   $('#btnregistro').click(function(e){
       e.preventDefault();
       var apellidop = $('#per_apellidop').val();
       var apellidom = $('#per_apellidop').val();
       var nombre = $('#per_nombre').val();
       var fechanacimiento = $('#per_fechanacimiento').val();
       var tipodocumento = $('#per_documentoID').val();
       var numerodocumento = $('#per_numerodocumento').val();
       var direccion = $('#per_direccion').val();
       var telefono = $('#per_telefono').val();
       var email = $('#per_email').val();
       var sucursal = $('#suc_id').val();
       var rol = $('#rol_id').val();
       
       if(validarFields(apellidop, apellidom, nombre, fechanacimiento, tipodocumento, numerodocumento,direccion,telefono,email,sucursal,rol)){
           var data = new FormData($('#frm_nuevo')[0]);
           $.ajax({
               url : "creartrabajador",
               type : "post",
               data : data,
               contentType: false,
               processData: false,
               success: function (data) {
                   alert(data);
               }
           });
       }
       //alert(validarFields(apellidop, apellidom, nombre, fechanacimiento, tipodocumento, numerodocumento,direccion,telefono,email,sucursal,rol));
   });
});

