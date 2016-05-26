$(document).ready(function(){ //utilizando VALIDATE de JQUERY
   $("#frmregistrousuario").validate({
       rules : { //SE CREAN LAS REGLAS
           
           per_id : {
                required: true
           },
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
           per_id : {
               required : "Seleccione a un Trabajador"
           },
           
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
       },
       
       submitHandler : function(form){
           var data = $("#frmregistrousuario").serialize(); //Se serializan los datos
           //console.log(data); // esto es para ver si ha enviado por consola la data serializada
           $.post("registrar",data,function(res, est, jqXHR){
               //alert(res);
               if(res === "1"){
                   $('#per_id').defaultSelected;
                   $('#usu_usuario').val("");
                   $('#usu_password').val("");
                   $('#usu_pass2').val("");
                   //alert("Registro Correcto haga clic en aceptar para ser redireccionado al Login");
                   setTimeout(function(){
                       window.location = "tabla-usuarios.jsp";
                   },100);
               }else{
                   alert("Error al Registrar Usuario");
               }
               
               
           });
           
       }
   });
   
   $("#frmregistrousuarioperfil").validate({
       rules : { //SE CREAN LAS REGLAS
           
           usu_id : {
                required: true
           }
       },
       messages : { //CREAMOS LOS MENSAJES PARA CADA REGLA
           usu_id : {
               required : "Seleccione a un Usuario"
           }
       },
       
       submitHandler : function(form){
           //form.submit();
           //alert();
           var data = $("#frmregistrousuarioperfil").serialize(); //Se serializan los datos
           //console.log(data); // esto es para ver si ha enviado por consola la data serializada
           $.post("addUsuProf",data,function(res, est, jqXHR){

               window.location = "tabla-usuarios.jsp";
           });
       }
   });
   
   $("#frmlogin").validate({
       rules : { //SE CREAN LAS REGLAS
           
           usu_usuario : {
               required: true
           },
           usu_password : {
               required: true
           }
       },
       messages : { //CREAMOS LOS MENSAJES PARA CADA REGLA
           usu_usuario : {
               required : "El campo Usuario es Requerido"
           },
           usu_password : {
               required : "La contraseña es obligatorio"
           }
       },
       
       submitHandler : function(form){
           var data = $("#frmlogin").serialize();
           $.post("login", data, function(res, est, jqXHR){
               if(res==="1"){
                   //alert("Binvenido, presione aceptar para ser redireccionado al panel principal");
                   setTimeout(function(){
                       window.location = "dashboard.jsp";
                   },300);
               }else{
                   alert("Credenciales Incorrectas");
               }
               
           });
       }
   });
   
   
   $("#frmregistroperfil").validate({
      rules :{
          prof_codigo : {
              required : true
          },
          prof_nombre : {
              required : true
          },
          prof_descripcion : {
              required : true
          }
      },
      messages : {
          prof_codigo : {
              required: "Ingrese un codigo"
          },
          prof_nombre : {
              required : "Ingrese un Nombre"
          },
          prof_descripcion : {
              required : "Ingrese una Descripcion"
          }
      },
      
      submitHandler : function(form){
           var data = $("#frmregistroperfil").serialize(); //Se serializan los datos
           //console.log(data); // esto es para ver si ha enviado por consola la data serializada
           $.post("addPerfil",data,function(res, est, jqXHR){
               //alert(res);
               if(res === "1"){
                   $('#prof_codigo').val("");
                   $('#prof_nombre').val("");
                   $('#prof_descripcion').val("");
                   setTimeout(function(){
                       window.location = "tabla-perfiles.jsp";
                   },100);
               }else{
                   alert("Error al Registrar Perfil");
               }
           });
       }
      
   });

   $("#frmregistromodulo").validate({
      rules :{
          modu_cod : {
              required : true
          },
          modu_nombre : {
              required : true
          },
          modu_desc : {
              required : true
          }
      },
      messages : {
          modu_cod : {
              required: "Ingrese un codigo"
          },
          modu_nombre : {
              required : "Ingrese un Nombre"
          },
          modu_desc : {
              required : "Ingrese una Descripcion"
          }
      },
      
      submitHandler : function(form){
           var data = $("#frmregistromodulo").serialize(); //Se serializan los datos
           //console.log(data); // esto es para ver si ha enviado por consola la data serializada
           $.post("addModulo",data,function(res, est, jqXHR){
               //alert(res);
               if(res === "1"){
                   $('#modu_cod').val("");
                   $('#modu_nombre').val("");
                   $('#modu_desc').val("");
                   setTimeout(function(){
                       window.location = "tabla-modulos.jsp";
                   },100);
               }else{
                   alert("Error al Registrar Modulo");
               }
           });
       }
      
   });
   
});