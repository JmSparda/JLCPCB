$(function(){ //utilizando VALIDATE de JQUERY
   $("#frmregistrousuario").validate({
       rules : { //SE CREAN LAS REGLAS
           
           tra_id : {
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
           tra_id : {
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
                   $('#tra_id').defaultSelected;
                   $('#usu_usuario').val("");
                   $('#usu_password').val("");
                   $('#usu_pass2').val("");
                   alert("Registro Correcto haga clic en aceptar para ser redireccionado al Login");
                   setTimeout(function(){
                       window.location = "dashboard.jsp";
                   },300);
               }else{
                   alert("Error al Registrar Usuario");
               }
               
               
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
                   alert("Binvenido, presione aceptar para ser redireccionado al panel principal");
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
           console.log(data); // esto es para ver si ha enviado por consola la data serializada
           $.post("addPerfil",data,function(res, est, jqXHR){
               //alert(res);
               if(res === "1"){
                   $('#prof_codigo').val("");
                   $('#prof_nombre').val("");
                   $('#prof_descripcion').val("");
                   setTimeout(function(){
                       window.location = "perfiles.jsp";
                   },100);
               }else{
                   alert("Error al Registrar Perfil");
               }
           });
       }
      
   });
   
});