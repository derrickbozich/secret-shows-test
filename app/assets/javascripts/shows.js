// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(function(){

  $(document).on('click','#add-artist', event =>{
    event.preventDefault();
    // generate additional form fields for artists
    const html = HandlebarsTemplates['add_artist_field']({})
    $('#artists-form').append(html);
  })


  $(document).on('click','#create-show', event =>{
    event.preventDefault();
    //serialize form data
    let elements = document.getElementById("new_show").elements;
    let show ={};
    let authenticity_token = ''
    let items = []
    for (let i = 0; i < elements.length; i++) {
      let item = elements.item(i)
      items.push({name: item.name, value: item.value})
    }

    let artists_attributes = items.filter(item => {
      return item.name.includes('artists_attributes')
    })
    items.forEach(item => {
      if (item.name.includes('authenticity_token')) {
        authenticity_token = item.value
      }
      let i = item.name.slice(5)
      let ii = i.substring(0, i.length-1)
      item.name = ii
      switch (item.name) {
        case 'name':
          show.name = item.value
          break;
        case 'city_name':
          show.city_name = item.value
          break;
        case 'venue_name':
          show.venue_name = item.value
          break;
        case 'poster':
          show.poster = item.value
          break;
        case 'date':
          show.date = item.value
          break;
        case 'time':
          show.time = item.value
          break;
        default:
      }
    })


    show.artists_attributes = []
    for (var i = 0; i < artists_attributes.length; i++) {
      let newArtistsAttributes = []
      let obj = {name: '', image: ''}
      for (let i = 1; i <= 2 ; i++) {
        let temp = artists_attributes.shift()
        if (temp.name.includes('name')){
          obj.name = temp.value
        } else {
          obj.image = temp.value
        }
      }
      newArtistsAttributes.push(obj)
      show.artists_attributes.push(newArtistsAttributes)
    }

    show = {show: show}

    fetch('/shows', {
        method: "POST", // *GET, POST, PUT, DELETE, etc.

        credentials: "same-origin", // include, *same-origin, omit
        headers: {
            "Content-Type": "application/json; charset=utf-8",
            'X-CSRF-Token': authenticity_token
            // "Content-Type": "application/x-www-form-urlencoded",
        },

        body: JSON.stringify(show) // body data type must match "Content-Type" header
    }).then((res) => res.json())
      .then(data => { debugger })

    //  post to shows to get a JSON object back to render to dom
    // $.post('/shows', data, response =>{
    //   debugger
    //   const html = HandlebarsTemplates['show_index']({ show: response });
    //   $('.new_show').replaceWith(html);
    // })
  })

  $(document).on('click','#show-index', event =>{
    event.preventDefault();

    //  post to shows to get a JSON object back to render to dom
    $.getJSON('/shows', response =>{
      const html = HandlebarsTemplates['show_index']({ show: response });
      $('.row').replaceWith(html);
    })
  })

  $(document).on('click','.card', event =>{
    event.preventDefault();
    const id = event.toElement.dataset.showid

    //  post to shows to get a JSON object back to render to dom
    $.getJSON(`/shows/${id}`, response =>{

      const html = HandlebarsTemplates['show_show']({ data: response });
      $('.row').replaceWith(html);
      debugger
    })
  })

})
