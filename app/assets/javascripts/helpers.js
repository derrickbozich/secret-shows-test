Handlebars.registerHelper("dateFormatter", function(string, format){
  const date = new DateFormatter(string)
  let expr = format;
  switch (expr) {
    case 'dayNumber':
      return date.dayNumber;
      break;
    case 'mon':
      return date.mon;
      break;
    case 'dayName':
      return date.dayName;
      break;
    case 'month':
      return date.month;
      break;
    case 'dayOfWeek':
      return date.dayOfWeek;
      break;
    case 'monthAndDay':
      return date.monthAndDay;
      break;
    default:
      console.log('Sorry!');
  }
  // This function is executed whenever this helper is used
})

Handlebars.registerHelper("idGenerator", function(){
  return Math.floor(Math.random() * 10000000000000)
  // This function is executed whenever this helper is used
})
