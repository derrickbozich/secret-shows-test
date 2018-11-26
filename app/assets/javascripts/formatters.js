
class DateFormatter{
  constructor(date){
    const dateObj = new Date(date)
    this.date = dateObj;
    this.month = this.findMonth();
    this.dayNumber = dateObj.getDate() + 1;
    this.dayOfWeek = this.findDayOfWeek();
    this.mon = this.findShortMonth();
    this.monthAndDay = this.getMonthAndDay();
  }
  getMonthAndDay(){
    return `${this.date.getMonth() + 1}/${this.date.getDate() + 1}`
  }
  findMonth(){
    const monthName = ["January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"
    ];
    return monthName[this.date.getMonth()]
  }
  findDayOfWeek(){
    const dayName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    return dayName[this.date.getDay()];
  }

  findShortMonth(){
    const shortMonths = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return shortMonths[this.date.getMonth()]
  }
}
