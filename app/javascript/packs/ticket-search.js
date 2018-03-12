var client = algoliasearch('34J3CD22N1', 'a3c9a51b10d2e20663956f322782527f');
var index = client.initIndex('Event');

//initialize autocomplete on search input (ID selector must match)
autocomplete('.algolia-search', { hint: false }, {
  source: autocomplete.sources.hits(index, { hitsPerPage: 5 }),
  //value to be displayed in input control after user's suggestion selection
  displayKey: 'name',
  //hash of templates used when rendering dataset
  templates: {
    //'suggestion' templating function used to render a single suggestion
    suggestion: function(suggestion) {
      return '<span>' + suggestion._highlightResult.name.value + '</span><span>' +
        suggestion._highlightResult.city.value + '</span>';
    }
  }
});


