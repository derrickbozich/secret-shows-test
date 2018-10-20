// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(function(){

  $(document).on('click','#create-show', event =>{
    event.preventDefault();
    //serialize form data
    let elements = document.getElementById("new_show").elements;
    let data ={};
    for(let i = 0 ; i < elements.length ; i++){
        let item = elements.item(i);
        data[item.name] = item.value;
    }
    //  post to shows to get a JSON object back to render to dom
    $.post('/shows', data, response =>{
      debugger
      const html = HandlebarsTemplates['show_index']({ show: response });
      $('.new_show').replaceWith(html);
    })
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
