// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(function(){

  $("input[type='text']").on('input', function() {
      validateField(this)
  });

  $("input[type='time']").on('change', function() {
      validateField(this)
  });

  $("input[type='date']").on('change', function() {
      validateField(this)
  });

  function validateField(event){
    switch (event.name) {
      case 'show[name]':
        handleValidation(event, 'shows must have a name', 'string')
        break;
      case 'show[city_name]':
        handleValidation(event, 'city name is required', 'string')
        break;
      case 'show[venue_name]':
        handleValidation(event, 'venue name is required', 'string')
        break;
      case 'show[artists_attributes][0][name]':
        handleValidation(event, 'at least one artist name is required', 'string')
        break;
      case 'show[artists_attributes][0][image]':
        handleValidation(event, 'artists need a valid image link', 'string')
        break;
      case 'show[artists_attributes][][name]':
        handleValidation(event, 'names must be longer than one character', 'string')
        break;
      case 'show[artists_attributes][][image]':
        handleValidation(event, 'artists need a valid image link', 'string')
        break;
      case 'show[poster]':
        handleValidation(event, 'a show needs a flyer', 'string')
        break;
      case 'show[date]':
        handleValidation(event, 'a date is required', 'string')
        break;
      case 'show[time]':
        handleValidation(event, 'a time is required', 'string')
        break;
      default:
        return
    }
    return
  }

  const handleValidation = (element, message, type) => {
    if (element.value.length > 0 && typeof element.value === type) {
      if (element.className.includes(' error')) {
        element.className = element.className.replace(" error", "")
        element.nextElementSibling.innerHTML = ''
        return
      }
      return
    } else {
      element.nextElementSibling.innerHTML = message
      if (element.className.includes(' error')) {
        return
      } else {
        element.className = element.className + " error"
      }
    }
  }

  $(document).on('click','.add-artist', event =>{
    event.preventDefault();
    // generate additional form fields for artists

    const html = HandlebarsTemplates['add_artist_field']({})
    $('#artists-form').after(html);
    $("input[type='text']").on('input', function() {
        validateField(this)
    });
  })

  function validateAll(){
    let readyToSubmit = true
    let elements = $(".form-control");
    for (let i = 1; i < elements.length; i++) {
      validateField(elements[i])
      if (elements[i].className.includes(' error')) {
        readyToSubmit = false
      }
    }
    return readyToSubmit
  }

  $(document).on('click','.delete-artist', event =>{
    event.toElement.parentElement.parentElement.remove()
  })

  $(document).on('click','#create-show', event =>{
    event.preventDefault();

    function gatekeeper(){
      if (validateAll()) {
        serialize()
      } else {
        return
      }
    }
    gatekeeper()

    function serialize(){
      //serialize form data for active record
      let elements
      let inEditMode = false
      let action = ''
      try {
        elements = document.getElementById("new_show").elements;
      } catch (e) {
        elements = document.getElementsByClassName("edit_show")[0].elements;
        action = document.getElementsByClassName("edit_show")[0].action.replace("http://localhost:3000", "")
        inEditMode = true
      }

      debugger
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
        return item.name.includes('artists_attributes') && !item.name.includes('id')
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
      for (let i = 0; i < artists_attributes.length; i++) {
        let obj = {}
        if (i % 3 === 0) {
          obj = {name: '', image: '', set_order:''}
          obj.name = artists_attributes[i].value
          obj.image = artists_attributes[i+1].value
          obj.set_order = artists_attributes[i+2].value
          show.artists_attributes.push(obj)
        }
      }

      // final output
      show = {show: show}
      if (inEditMode) {
        fetch(action, {
            method: "PATCH", // *GET, POST, PUT, DELETE, etc.
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
              $('.edit_show').replaceWith(html);
              $('#city-name').remove()
              history.pushState({}, '','/shows')
          })
      } else {
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
              let shows = orderShows(data)
              const html = HandlebarsTemplates['show_index']({ show: shows });
              $('#new_show').replaceWith(html);
              $('#city-name').remove()
              $('.alert').remove()
              history.pushState({}, '','/shows')
          })
      }
    }
  })

  function orderShows(shows){
    return shows.sort(function(a,b) {
      return new Date(a.date) - new Date(b.date);
      });
  }

  $(document).on('click','#show-index', event =>{
    event.preventDefault();

    $.getJSON(`/shows`, response =>{
      let shows = orderShows(response)
      const html = HandlebarsTemplates['show_index']({ show: shows });
      if ($('.row').length > 0) {
        $('#city-name').remove()
        $('.row').replaceWith(html);
        $('.alert').remove()
        history.pushState({}, '','/shows')
      } else if ($('#new_show').length > 0) {
        $('#city-name').remove()
        $('#new_show').replaceWith(html);
        $('.alert').remove()
        history.pushState({}, '','/shows')
      } else if ($('#city-name').length > 0) {
        $('#city-name').remove()
        $('.card-deck').replaceWith(html);
        $('.alert').remove()
        $('.notice').html('')
        history.pushState({}, '','/shows')
      } else if ($('.edit_show').length > 0) {
        $('.edit_show').replaceWith(html);
        $('.alert').remove()
        $('.notice').html('')
      } else if ($('.card-deck').length > 0) {
        $('.card-deck').replaceWith(html);
        history.pushState({}, '','/shows')
      } else if ($('.cities-index').length > 0) {
        $('.cities-index').replaceWith(html);
        history.pushState({}, '','/shows')
      }
    })
  })

  $(document).on('click','.card', event =>{
    event.preventDefault();

    let href
    if (event.toElement.href) {
      href = event.toElement.href
    } else if (event.toElement.parentElement.href) {
      //get rid of 'http://localhost'
      href = event.toElement.parentElement.href.substring(21) ;
    }
    // get request to shows/artists to get a JSON object back to render to dom
    // if href is for shows:
    if (href.includes('shows')) {
      $.getJSON(href, response =>{
        const html = HandlebarsTemplates['show_show']({ data: response });
        if ($('.row').length > 0) {
          $('#city-name').remove()
          $('.row').replaceWith(html);
          $('.alert').remove()
          history.pushState({}, '', href)
        } else {
          $('#city-name').remove()
          $('.card-deck').replaceWith(html);
          $('.alert').remove()
          history.pushState({}, '', href)
        }
      })
    } else if (href.includes('artists')) {
      // if href is for artists
      $.getJSON(href, response =>{
        const html = HandlebarsTemplates['artist_show']({ artist: response });
        $('#city-name').remove()
        $('.row').replaceWith(html);
        $('.alert').remove()
        history.pushState({}, '', href)
      })
    }
  })
})
