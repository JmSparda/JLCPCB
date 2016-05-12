var v=true;
$("span.help-block").hide();

function verificar(){
    var v1=0,v2=0,v3=0,v4=0,v5=0,v6=0,v7=0,v8=0,v9=0,v10=0,v11=0,v12=0,v13=0,v14=0
    
    v1=validar('per_apellidop');
    v2=validar('per_apellidom');
    v3=validar('per_nombre');
    v4=validar('per_fechanacimiento');
    v5=validar('per_documentoID');
    v6=validar('per_numerodocumento');
    v7=validar('per_direccion');
    v8=validar('per_telefono');
    v9=validar('per_email');
    v10=validar('archivos');
    v11=validar('foto');
    v12=validar('suc_id');
    v13=validar('rol_id');
    v14=validar('tra_iniciocontrato');
    
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
    
    
    if(v1===false || v2===false || v3===false || v4===false || v5===false || v6===false || v7===false || v8===false || v9===false || v10===false || v11===false || v12===false || v13===false || v14===false){
        $("#exito").hide();
        $("#error").show();
        
    }else{
        $("#error").hide();
        $("#exito").show();
       
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
}

function validar(campo){
    var a=0;
    expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    var hoy = new Date();
    var anioactual = hoy.getFullYear();
    var aniomaximopermitido = anioactual - 18;
    var aniominimopermitido = anioactual - 60;
    var fechalimitemaxima= new Date(aniomaximopermitido,01,01);
    var fechalimiteminima = new Date (aniominimopermitido, 01, 01 );
    
    if(campo==='per_apellidop'){
        per_apellidop = document.getElementById(campo).value;
        if (per_apellidop === null || per_apellidop.length === 0 || /^\s+$/.test(per_apellidop)){
            $('#'+campo).parent().attr("class","form-group has-error has-feedback");
            $('#'+campo).parent().children('span').text("Ingresar Apellido Paterno").show();
            return false;
        }
        else if(!isNaN(per_apellidop)){
            $('#'+campo).parent().attr("class","form-group has-error hass-feedback");
            $('#'+campo).parent().children("span").text("Debe Ingresar Solo Letras").show();        
            return false;
        } 
        else {
            $('#'+campo).parent().attr("class","form-group has-success has-feedback");
            $('#'+campo).parent().children("span").text("").hide();
            return true;
        }
    }
    
    if(campo==='per_apellidom'){
        per_apellidom = document.getElementById(campo).value;
        if (per_apellidom === null || per_apellidom.length === 0 || /^\s+$/.test(per_apellidom)){
            $('#'+campo).parent().attr("class","form-group has-error has-feedback");
            $('#'+campo).parent().children("span").text("Ingresar Apellido Materno").show();
            return false;
        }
        else if(!isNaN(per_apellidom)){
            $('#'+campo).parent().attr("class","form-group has-error hass-feedback");
            $('#'+campo).parent().children("span").text("Debe Ingresar Solo Letras").show();        
            return false;
        } 
        else {
            $('#'+campo).parent().attr("class","form-group has-success has-feedback");
            $('#'+campo).parent().children("span").text("").hide();
            return true;
        }
    }
    
    if(campo==='per_nombre'){
        per_nombre = document.getElementById(campo).value;
        if (per_nombre === null || per_nombre.length === 0 || /^\s+$/.test(per_nombre)){
            $('#'+campo).parent().attr("class","form-group has-error has-feedback");
            $('#'+campo).parent().children("span").text("Ingresar Nombre").show();
            return false;
        }
        else if(!isNaN(per_nombre)){
            $('#'+campo).parent().attr("class","form-group has-error hass-feedback");
            $('#'+campo).parent().children("span").text("Debe Ingresar Solo Letras").show();        
            return false;
        } 
        else {
            $('#'+campo).parent().attr("class","form-group has-success has-feedback");
            $('#'+campo).parent().children("span").text("").hide();
            return true;
        }
    }   
    
    if(campo==='per_fechanacimiento'){
        
        per_fechanacimiento = document.getElementById(campo).value;
        var fechaingresada = new Date(per_fechanacimiento);        
        
        if (per_fechanacimiento === null || per_fechanacimiento.length === 0 || /^\s+$/.test(per_fechanacimiento)){
            $('#'+campo).parent().attr("class","form-group has-error has-feedback");
            $('#'+campo).parent().children("span").text("Ingresar Fecha").show();
            return false;
            
        }else if(fechaingresada < fechalimiteminima ){
            $('#'+campo).parent().attr("class","form-group has-error has-feedback");
            $('#'+campo).parent().children("span").text("Ano minimo es: "+ (fechalimiteminima).getFullYear()).show();
            return false;
            
        } else if(fechaingresada > fechalimitemaxima){
            $('#'+campo).parent().attr("class","form-group has-error has-feedback");
            $('#'+campo).parent().children("span").text("Ano maximo es: "+ (fechalimitemaxima).getFullYear());
            return false;
        }
        else{
            $('#'+campo).parent().attr("class","form-group has-success has-feedback");
            $('#'+campo).parent().children("span").text("").hide();
            return true;
        }
    }
    
    if (campo==='per_documentoID'){
        indice = document.getElementById(campo).selectedIndex;
        if( indice === null || indice === 0 ) {
            $('#per_documentoID').parent().attr("class", "form-group has-error");
            return false;
        }
        else{
            $('#per_documentoID').parent().attr("class", "form-group has-success");
            return true;
        }
    }
    
    if(campo==='per_numerodocumento'){
        per_numerodocumento = document.getElementById(campo).value;
        documentoid = document.getElementById('per_documentoID').value;
        
        if (per_numerodocumento === null || per_numerodocumento.length === 0 || /^\s+$/.test(per_nombre)){
            $('#'+campo).parent().attr("class","form-group has-error has-feedback");
            $('#'+campo).parent().children("span").text("Ingresar Numero de Documento").show();
            return false;
        }
        else if(documentoid === "1" && per_numerodocumento.length !== 8){
            $('#'+campo).parent().attr("class","form-group has-error has-feedback");
            $('#'+campo).parent().children("span").text("El DNI cuenta con 8 digitos").show();
            return false;
        }else if(documentoid === "2" && per_numerodocumento.length !== 10){
            $('#'+campo).parent().attr("class","form-group has-error has-feedback");
            $('#'+campo).parent().children("span").text("La PASSAPORTE cuenta con 10 digitos").show();
            return false;
        }else if(documentoid === "3" && per_numerodocumento.length !== 11){
            $('#'+campo).parent().attr("class","form-group has-error has-feedback");
            $('#'+campo).parent().children("span").text("La VISA cuenta con 11 digitos").show();
            return false;
        }else{
            $('#'+campo).parent().attr("class","form-group has-success has-feedback");
            $('#'+campo).parent().children("span").text("").hide();
            return true;
        }
    }
    
    if(campo==='per_direccion'){
        per_direccion = document.getElementById(campo).value;
        if (per_direccion === null || per_direccion.length === 0 || /^\s+$/.test(per_direccion)){
            $('#'+campo).parent().attr("class","form-group has-error has-feedback");
            $('#'+campo).parent().children('span').text("Ingresar Direccion").show();
            return false;
        }
        else {
            $('#'+campo).parent().attr("class","form-group has-success has-feedback");
            $('#'+campo).parent().children("span").text("").hide();
            return true;
        }
    }
    
    if(campo==='per_telefono'){
        per_telefono = document.getElementById(campo).value;
        if (per_telefono === null || per_telefono.length === 0 || /^\s+$/.test(per_telefono)){
            $('#'+campo).parent().attr("class","form-group has-error has-feedback");
            $('#'+campo).parent().children('span').text("Ingresar un Telefono").show();
            return false;
        }else if(isNaN(per_telefono)){
            $('#'+campo).parent().attr("class","form-group has-error hass-feedback");
            $('#'+campo).parent().children("span").text("Debe Ingresar Solo Numeros").show();        
            return false;
        } 
        else {
            $('#'+campo).parent().attr("class","form-group has-success has-feedback");
            $('#'+campo).parent().children("span").text("").hide();
            return true;
        }
    }
    if(campo==='per_email'){
        per_email = document.getElementById(campo).value;
        if(per_email === null || per_email.length === 0 || /^\s+$/.test(per_email)){
            $('#'+campo).parent().attr("class","form-group has-error has-feedback");
            $('#'+campo).parent().children('span').text("Ingresar un Correo").show();
            return false;
        } else if(!expr.test(per_email)){
            $('#'+campo).parent().attr("class","form-group has-error has-feedback");
            $('#'+campo).parent().children('span').text("Ingresar correctamente el Correo").show();
            return false;
        } else{
            $('#'+campo).parent().attr("class","form-group has-success has-feedback");
            $('#'+campo).parent().children("span").text("").hide();
            return true;
        }
    }
    
    if(campo==='archivos'){
        archivos = document.getElementById(campo).files;
        if(archivos.length === 1){
            for(var i =0;i<archivos.length;i++){
                var name = archivos[i].name;
                var ext = name.substring(name.lastIndexOf('.')+1).toLowerCase();
                if(ext !== 'jpg' && ext !== 'png'){
                    $('#'+campo).parent().attr("class","form-group has-error has-feedback");
                    $('#'+campo).parent().children('span').text("Archivo "+name+" Incorrecto, solo imagenes JPG o PNG").show();
                    return false;
                }
            }
            $('#'+campo).parent().attr("class","form-group has-success has-feedback");
            $('#'+campo).parent().children("span").text("").hide();
            return true;
        }
        else{
            $('#'+campo).parent().attr("class","form-group has-error has-feedback");
            $('#'+campo).parent().children('span').text("Ingrese Alguna imagen de tipo JPG o PNG").show();
            return false;
        }
    }
    
    if (campo==='suc_id'){
        indice = document.getElementById(campo).selectedIndex;
        if( indice === null || indice === 0 ) {
            $('#suc_id').parent().attr("class", "form-group has-error");
            return false;
        }
        else{
            $('#suc_id').parent().attr("class", "form-group has-success");
            return true;
        }
    }
    
    if (campo==='rol_id'){
        indice = document.getElementById(campo).selectedIndex;
        if( indice === null || indice === 0 ) {
            $('#rol_id').parent().attr("class", "form-group has-error");
            return false;
        }
        else{
            $('#rol_id').parent().attr("class", "form-group has-success");
            return true;
        }
    }
    
    if(campo==='tra_iniciocontrato'){
        
        tra_iniciocontrato = document.getElementById(campo).value;
        var fechaingresada = new Date(tra_iniciocontrato);        
        
        if (tra_iniciocontrato === null || tra_iniciocontrato.length === 0 || /^\s+$/.test(tra_iniciocontrato)){
            $('#'+campo).parent().attr("class","form-group has-error has-feedback");
            $('#'+campo).parent().children("span").text("Ingresar Fecha").show();
            return false;
            
        }else{
            $('#'+campo).parent().attr("class","form-group has-success has-feedback");
            $('#'+campo).parent().children("span").text("").hide();
            return true;
        }
    }    
}
///esto se subio al repositorio GIT :V