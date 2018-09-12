document.addEventListener("turbolinks:load", function(){
  $input = $("[data-behavior='autocomplete']")

  let options = {
    getValue: 'name',
    url: function(phrase){
      return '/search.json?utf8=✓&query=' + phrase;
    },
    categories: [
      {
        listLocation: "artists",
        header: '<strong>artists</strong>',
      },
      {
        listLocation: "cities",
        header: '<strong>cities</strong>',
      }
    ],
    list: {
      match: { enabled: true},
      maxNumberOfElements: 5

      // onChooseEvent: function() {
      //   let url = $input.getSelectedItemData().url
      //   $input.val('')
      //   Turbolinks.visit(url)
      //   console.log(url);
      // }
    }
  }

  $input.easyAutocomplete(options)
});
