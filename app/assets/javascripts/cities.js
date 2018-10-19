// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

const monthNames = ["January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"
];

const dayNames = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

$(function(){
  $(document).on('click', '#cities-index', event =>{
    event.preventDefault();
    $.getJSON("/cities", data =>{
      const html = HandlebarsTemplates['city_list']({ cities: data })
      $('.row').remove();
      $( ".navbar" ).after(html)
    })
  })


  $(document).on('click','#next-show', event =>{
    event.preventDefault();
    const showId = parseInt(event.toElement.dataset.id)
    const city = event.toElement.dataset.city
    const cityId = event.toElement.dataset.cityId
    $.getJSON(`/cities/${cityId}`, data =>{
      const shows = data.shows
      const currentShow = shows.find(show => show.id == showId)
      const upcomingShows = shows.filter(show => show.date > currentShow.date)
      //If there are more shows
      if (upcomingShows.length > 0) {
        //sort upcoming shows by date
        const dates = []
        upcomingShows.forEach(show =>{
          dates.push([show.id, show.date])
        })
        dates.sort(function(a, b) {
          return a[1] - b[1];
        });
        //format dates to add into data object for render
        const show = upcomingShows.find(show => dates[0][0] == show.id);
        const date = new Date(show.date);
        const month = monthNames[date.getMonth()];
        const dayNumber = date.getDate();
        const dayOfWeek = dayNames[date.getDay()];
        const fullData = Object.assign({month, dayNumber, dayOfWeek, show, city, cityId}, data);
        const html = HandlebarsTemplates['city_show']({ data: fullData })
        $('.row').replaceWith(html)
      // no more upcoming shows
      } else {
        $('#next-show').text('No More Scheduled Shows for this Venue')
      }
    })
  })


  $(document).on('click','#previous-show', event =>{
    event.preventDefault();
    const showId = parseInt(event.toElement.dataset.id)
    const city = event.toElement.dataset.city
    const cityId = event.toElement.dataset.cityId
    $.getJSON(`/cities/${cityId}`, data =>{
      const shows = data.shows
      const currentShow = shows.find(show => show.id == showId)
      const previousShows = shows.filter(show => show.date < currentShow.date)
      //If there are previous shows
      if (previousShows.length > 0) {
        //sort previous shows by date
        const dates = []
        previousShows.forEach(show =>{
          dates.push([show.id, show.date])
        })
        dates.sort(function(a, b) {
          return a[1] - b[1];
        });
        //format dates to add into data object for render
        const show = previousShows.find(show => dates[0][0] == show.id);
        const date = new Date(show.date);
        const month = monthNames[date.getMonth()];
        const dayNumber = date.getDate();
        const dayOfWeek = dayNames[date.getDay()];
        const fullData = Object.assign({month, dayNumber, dayOfWeek, show, city, cityId}, data);
        const html = HandlebarsTemplates['city_show']({ data: fullData })
        $('.row').replaceWith(html)
      // no more previous shows
      } else {
        $('#previous-show').text('No More Previous Shows for this Venue')
      }
    })
  })



















})
