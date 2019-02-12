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
    let reloadingIndicator = container.getElementsByClassName("api-partial-reloading-indicator");
    for (let y=0; y<reloadingIndicator.length; y++) {
      reloadingIndicator[y].style.display = "block";
    }
    
    let locals = JSON.parse(container.dataset.locals)
    let url = '/api_partials/render'
    let xhr = new XMLHttpRequest();

    xhr.open('POST', url);
    xhr.setRequestHeader('Content-Type', 'application/json');
    if (container.dataset.response_format == "json") 
      { xhr.responseType = "json" }
    else 
      { xhr.responseType = "text" }
    xhr.onload = function() {
      if (xhr.status === 200) {
        reloadApiPartialComplete(container, locals, xhr.response, reloadingIndicator)  
      } 
    };
    xhr.send(JSON.stringify({
      api_partial: {
        partial: locals.partial,
        locals: locals,
        response_format: container.dataset.response_format
      }        
    }));
  }
}

function reloadApiPartialComplete(container, locals, response, reloadingIndicator) {
  var fn_name = locals.partial.replace(/\//g, '_');
  var fn = window["reload_"+fn_name];  
  if (typeof fn === 'function') {
    fn(container, response);
  }
  for (let y=0; y<reloadingIndicator.length; y++) {
    reloadingIndicator[y].style.display = "none";
  }
}