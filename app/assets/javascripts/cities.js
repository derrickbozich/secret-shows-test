// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(function(){
  $(document).on('click', '#cities-index', event =>{
    event.preventDefault();
    $.getJSON("/cities", data =>{
      const html = HandlebarsTemplates['city_list']({ cities: data })
      $('.row').replaceWith(html);
      $('.card-deck').replaceWith(html);
      $('.new_show').replaceWith(html);
      history.pushState({}, '','/cities')
    })
  })

  $(document).on('click','#next-show', event =>{
    event.preventDefault();
    const show = new ShowFinder(event, 'next')
    show.findShows();
  })

  $(document).on('click','#previous-show', event =>{
    event.preventDefault();
    const show = new ShowFinder(event, 'previous')
    show.findShows();
  })
})

class ShowFinder{
  constructor(eventInput, direction){
    this.showId = parseInt(eventInput.toElement.dataset.id)
    this.city = eventInput.toElement.dataset.city
    this.cityId = eventInput.toElement.dataset.cityId
    this.direction = direction
    }

  findShows(){
    $.getJSON(`/cities/${this.cityId}`, data =>{
      const shows = data.shows
      const currentShow = shows.find(show => show.id == this.showId)
      let futureOrPastShows;
      // if user clicks 'next show', define futureOrPastShows as shows happening in future
      if (this.direction == "next") {
        futureOrPastShows = shows.filter(show => show.date > currentShow.date)
      } else {
        futureOrPastShows = shows.filter(show => show.date < currentShow.date)
      }
      //If there are future or past shows
      if (futureOrPastShows.length > 0) {
        //sort previous shows by date
        const dates = []
        futureOrPastShows.forEach(show =>{
          dates.push([show.id, show.date])
        })
        //might need to change the - to + conditionally
        dates.sort(function(a, b) {
          return a[1] - b[1];
        });
        //format dates to add into data object for render
        const show = futureOrPastShows.find(show => dates[0][0] == show.id);
        const dateObj = new DateFormatter(show.date)
        const fullData = Object.assign({dateObj, show, cityId: this.cityId}, {});
        const html = HandlebarsTemplates['city_show']({ data: fullData })
        $('.row').replaceWith(html)
      // no more previous shows
      } else {
        if (this.direction == 'next') {
          $('#next-show').text('No More Scheduled Shows for this Venue')
        } else {
          $('#previous-show').text('No More Previous Shows for this Venue')
        }
      }
    });
  }
}
