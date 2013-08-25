window.App =
  init: ->
    console.log('started')
    canvas = $('canvas#main').get(0)
    stage = new createjs.Stage(canvas)
    shape = new createjs.Shape()
    shape.graphics.beginFill('rgba(255,0,0,1)').drawRoundRect(0, 0, 120, 120, 10)
    stage.addChild(shape)
    stage.update()


App.init()
