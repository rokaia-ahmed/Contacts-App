

validate(String value){
  if(value.isEmpty){
    return 'this field is required';
  }else{
    return null ;
  }
}
validatePhone(String value){
  if(value.isEmpty){
    return 'this field is required';
  }else if(value.length <11){
    return 'phone must have 11 number';
  }
  else{
    return null ;
  }
}