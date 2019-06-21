class  ValidateMixins{
String validateEmail(String value){
if(!value.contains('@'))
    return  "Email invalido";
return null;
}

String validatePass(String value){

  if(value.length < 6)
    return "Contraseña Invalida";
    return null;
  }
}

