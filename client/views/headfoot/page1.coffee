Template.page1.rendered = ->
    fview = FView.from this
    x = Math.round((320/window.innerWidth)*1200)

    fview.parent.modifier.setSize  [undefined,x]
