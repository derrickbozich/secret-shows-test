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

    //serialize form data for active record
    let elements = document.getElementById("new_show").elements;
    let show ={};
    let authenticity_token = ''
    let items = []
    // make an array of object that have name and value props
    for (let i = 0; i < elements.length; i++) {
      let item = elements.item(i)
      items.push({name: item.name, value: item.value})
    }

    // find all items that have artist attributes and collect in an array
    let artists_attributes = items.filter(item => {
      return item.name.includes('artists_attributes')
    })

    //cutting off 'show[name]' so it is just 'name'
    // then go through a switch statement to add to final
    // active record object
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

    // format artist attributes in a way that active record likes
    show.artists_attributes = []
    for (var i = 0; i < artists_attributes.length; i++) {
      let obj = {}
      if (i % 2 === 0) {
        obj = {name: '', image: ''}
        obj.name = artists_attributes[i].value
        obj.image = artists_attributes[i+1].value
        show.artists_attributes.push(obj)
      }
    }

    // final output
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
      .then(data => {
          const html = HandlebarsTemplates['show_index']({ show: data });
          $('.new_show').replaceWith(html);
          history.pushState({}, '','/shows')
      })
  })

  $(document).on('click','#show-index', event =>{
    event.preventDefault();

    $.getJSON(`/shows`, response =>{
      const html = HandlebarsTemplates['show_index']({ show: response });
      if ($('.row').length > 0) {
        $('.row').replaceWith(html);
        history.pushState({}, '','/shows')
      } else if ($('#new_show').length > 0) {
        $('#new_show').replaceWith(html);
        history.pushState({}, '','/shows')
      } else {
        $('.card-deck').replaceWith(html);
        history.pushState({}, '','/shows')
      }
    })
  })

  $(document).on('click','.card', event =>{
    event.preventDefault();
    debugger
    const href = event.toElement.parentElement.href.substring(21) ;
    //  get to shows to get a JSON object back to render to dom
    // if href is for shows:
    if (href.includes('shows')) {
      $.getJSON(href, response =>{
        const html = HandlebarsTemplates['show_show']({ data: response });
        $('.row').replaceWith(html);
        history.pushState({}, '', href)
      })
    } else {
      // if href is for artists
      $.getJSON(href, response =>{
        const html = HandlebarsTemplates['artist_show']({ artist: response });
        $('.row').replaceWith(html);
        history.pushState({}, '', href)
      })
    }

  })

})
