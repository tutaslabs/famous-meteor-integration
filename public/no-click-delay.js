var iOS = /(iPad|iPhone|iPod)/g.test(navigator.userAgent)

if (CustomEvent && iOS) {
  var clickEventsDisabledUntil = 0
  var unmovedTouches = {}
  
  window.addEventListener('touchstart', function(event) {
    for (var i = 0; i < event.changedTouches.length; i++) {
      var touch = event.changedTouches[i]
      unmovedTouches[touch.identifier] = true
    }
  })

  window.addEventListener('touchmove', function(event) {
    for (var i = 0; i < event.changedTouches.length; i++) {
      var touch = event.changedTouches[i]
      delete unmovedTouches[touch.identifier]
    }
  })
  
  window.addEventListener('touchend', function(event) {
    clickEventsDisabledUntil = Date.now() + 1500
    
    for (var i = 0; i < event.changedTouches.length; i++) {
      var touch = event.changedTouches[i]
      
      if (!unmovedTouches[touch.identifier]) { continue }
      
      var click = new CustomEvent('click', { bubbles: true, detail: touch })
      event.target.dispatchEvent(click)
      
      delete unmovedTouches[touch.identifier]
    }
  })
  
  window.addEventListener('click', function(event) { // Catch real click events
    if (event instanceof MouseEvent && Date.now() < clickEventsDisabledUntil) {
      event.stopPropagation()
      event.preventDefault()
    }
  }, true)
}
