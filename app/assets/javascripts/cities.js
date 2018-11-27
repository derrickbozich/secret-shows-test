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
    show.getShow()
  })

  $(document).on('click','#previous-show', event =>{
    event.preventDefault();
    const show = new ShowFinder(event, 'previous')
    show.getShow()
  })
})

class ShowFinder{
  constructor(eventInput, direction){
    this.showId = parseInt(eventInput.toElement.dataset.id)
    this.city = eventInput.toElement.dataset.city
    this.cityId = eventInput.toElement.dataset.cityId
    this.direction = direction
    }

  getShow(){
      $.getJSON(`/cities/${this.cityId}/shows/${this.showId}/${this.direction}`, show =>{
        if (show) {
          const dateObj = new DateFormatter(show.date)
          const fullData = Object.assign({dateObj, show, cityId: this.cityId}, {});
          const html = HandlebarsTemplates['city_show']({ data: fullData })
          $('.row').replaceWith(html)
        // no more previous shows
        } else {
          if (this.direction === 'next') {
            $('#next-show').text('No More Scheduled Shows for this Venue')
          } else {
            $('#previous-show').text('No More Previous Shows for this Venue')
          }
        }
      })
  }
}
