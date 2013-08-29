window.App =
  init: ->
    padding = 30
    w = innerWidth - padding
    h = innerHeight - padding

    # Random data set
    dataset = []
    numDataPoints = 50
    xRange = Math.random() * 1000
    yRange = Math.random() * 1000
    for i in [0..numDataPoints] by 1
      dataset.push [
        Math.round(Math.random() * xRange)
        Math.round(Math.random() * yRange)
      ]


    #Create scale functions
    xScale = d3.scale.linear().domain([0, d3.max(dataset, (d) ->
      d[0]
    )]).range([padding, w - padding * 2])
    yScale = d3.scale.linear().domain([0, d3.max(dataset, (d) ->
      d[1]
    )]).range([h - padding, padding])
    rScale = d3.scale.linear().domain([0, d3.max(dataset, (d) ->
      d[1]
    )]).range([2, 5])

    #Define X axis
    xAxis = d3.svg.axis().scale(xScale).orient("bottom").ticks(5)

    #Define Y axis
    yAxis = d3.svg.axis().scale(yScale).orient("left").ticks(5)

    #Create SVG element
    svg = d3.select("body").append("svg").attr("width", w).attr("height", h)

    #Create circles
    svg.selectAll("circle").data(dataset).enter().append("circle").attr("cx", (d) ->
      xScale d[0]
    ).attr("cy", (d) ->
      yScale d[1]
    ).attr "r", (d) ->
      rScale d[1]


    #Create labels
    #svg.selectAll("text").data(dataset).enter().append("text").text((d) ->
    #  d[0] + "," + d[1]
    #).attr("x", (d) ->
    #  xScale d[0]
    #).attr("y", (d) ->
    #  yScale d[1]
    #).attr("font-family", "sans-serif").attr("font-size", "11px").attr "fill", "red"

    #Create X axis
    svg.append("g").attr("class", "axis").attr("transform", "translate(0,#{h - padding})").call xAxis

    #Create Y axis
    svg.append("g").attr("class", "axis").attr("transform", "translate(#{padding},0)").call yAxis
