function reloadApiPartials(tags=[]) {
  let apiPartials = document.getElementsByClassName('api-partial')

  for( let i=0; i<apiPartials.length; i++) {
    // Check if there are tags. if so, only reload partials with at least 1 matching
    if (tags.length > 0) {
      if (apiPartials[i].dataset.tags) {
        let intersection = JSON.parse(apiPartials[i].dataset.tags).filter(value => -1 !== tags.indexOf(value));
        if (intersection.length == 0) continue
      }
      else continue
    }
    
    let container = apiPartials[i];    
    let locals = {};
    for (let key in container.dataset) {
      if (!key.includes("partial") && key.includes("locals_")) {
        let new_key = key.replace('locals_','')
        locals[new_key] = container.dataset[key]
      }
    }
    let url = '/api_partials/render'
    let xhr = new XMLHttpRequest();
    xhr.open('POST', url);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function() {
      if (xhr.status === 200)
        reloadApiPartialComplete(container, xhr.responseText)
    };
    xhr.send(JSON.stringify({
      api_partial: {
        partial: container.dataset.locals_partial,
        locals: locals 
      }        
    }));
  }
}

function reloadApiPartialComplete(container, response) {  
  var fn_name = container.dataset.locals_partial.replace(/\//g, '_');
  var fn = window["reload_"+fn_name];
  if (container.dataset.response_format == 'json')
    response = JSON.parse(response)
  if (typeof fn === 'function') {
    fn(container, response);
  }
}