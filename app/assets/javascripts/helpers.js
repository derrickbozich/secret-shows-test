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

function getCookie(cname){
  let name = cname + "=";
  let decodedCookie = decodeURIComponent(document.cookie);
  let ca = decodedCookie.split(';');
  for(let i = 0; i <ca.length; i++) {
      let c = ca[i];
      while (c.charAt(0) == ' ') {
          c = c.substring(1);
      }
      if (c.indexOf(name) == 0) {
          return c.substring(name.length, c.length);
      }
  }
  return "";
}

Handlebars.registerHelper('iff', function(a, operator, b, opts) {
    a = getCookie('test')
    let bool = false;

    switch(operator) {
       case '==':
           bool = a == b;
           break;
       case '>':
           bool = a > b;
           break;
       case '<':
           bool = a < b;
           break;
       default:
           throw "Unknown operator " + operator;
    }
    debugger
    if (bool) {
        return opts.fn(this);
    } else {
        return opts.inverse(this);
    }
});
