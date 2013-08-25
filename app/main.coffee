# I want them drag and droppable
# http://localhost:5000/examples/DragAndDrop.html
# hit area might be nice:
# http://localhost:5000/examples/DragAndDrop_hitArea.html
#
# Color Filtering
# http://localhost:5000/examples/Filters.html
# With a UI
# http://localhost:5000/examples/Filters_input.html
#
# Full screen experience:
# http://www.fabiobiondi.com/blog/2012/08/createjs-and-html5-canvas-resize-fullscreen-and-liquid-layouts/
window.App =
  init: ->
    @set_stage()
    @write_text("hi")
    @stage.update()
    
  set_stage: ->
    grip = ->
      canvas = $('canvas#main').get(0)
      new createjs.Stage(canvas)
    @stage ?= grip()
    @stage.canvas.height = window.innerHeight
    @stage.canvas.width = window.innerWidth
    @stage.update()

  write_text: ->
    @text = new createjs.Text("Hello World!", "36px Arial", "#000")
    @stage.addChild(@text)
    @text.x = 60
    @text.y = 20

