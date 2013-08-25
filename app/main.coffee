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
    if treeData?
      $('body').append('tree data loaded!')
