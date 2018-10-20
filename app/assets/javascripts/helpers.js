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
    default:
      console.log('Sorry!');
  }
  // This function is executed whenever this helper is used
})
