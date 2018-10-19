// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

const monthNames = ["January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"
];

const dayNames = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]




$(function(){
  $('#cities-index').click(event =>{
    event.preventDefault();
    $.getJSON("/cities", data =>{
      let html = HandlebarsTemplates['city_list']({ cities: data })
      $('.row').remove();
      $( ".navbar" ).after(html)
      debugger
    })
  })
})

$(function(){
  $('#next-show').click(event =>{
    event.preventDefault();
    let showId = parseInt(event.toElement.dataset.id)
    let city = event.toElement.dataset.city
    let cityId = event.toElement.dataset.cityId
    $.getJSON(`/cities/${cityId}`, data =>{
      let shows = data.shows
      let currentShow = shows.find(show => show.id == showId)
      let upcomingShows = shows.filter(show => show.date > currentShow.date)
      if (upcomingShows.length > 0) {
        //need to bundle show and parsed date info

        let nextShow = upcomingShows[0];
        let date = new Date(nextShow.date);
        let month = monthNames[date.getMonth()];
        let dayNumber = date.getDate();
        let dayOfWeek = dayNames[date.getDay()];

        let html = HandlebarsTemplates['city_show']({ data: nextShow })
        debugger
      } else {

      }
      debugger
    })
  })
})
