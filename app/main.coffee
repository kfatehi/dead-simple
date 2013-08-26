window.App =
  init: ->
    @options =
      maxLabelLength: 10
      nodeRadius: 5
      fontSize: 12
    @size = 
      width: innerWidth
      height: innerHeight
    @build_layout treeData, (d) ->
      if (!d.contents || d.contents.length is 0) then null else d.contents
    @render_tree $('g#container').get(0)

  build_layout: (data, cb) ->
    @tree = d3.layout.tree().sort(null)
      .size([@size.height, @size.width - @options.maxLabelLength * @options.fontSize])
      .children (d) -> cb(d)
    @nodes = @tree.nodes(data)
    @links = @tree.links(@nodes)

  render_tree: (target) ->
    layoutRoot = d3.select(target).append("svg:svg")
      .attr("width", @size.width).attr("height", @size.height)
      .append("svg:g")
      .attr("class", "container")
      .attr("transform", "translate(#{@options.maxLabelLength},0)")

    # Edges between nodes as a <path class="link" />
    link = d3.svg.diagonal().projection (d) -> [d.y, d.x]

    layoutRoot.selectAll("path.link")
      .data(@links)
      .enter()
      .append("svg:path")
      .attr("class", "link")
      .attr("d", link)

    # Nodes as
    # <g class="node">
    #   <circle class="node-dot" />
    #   <text />
    # </g>
    nodeGroup = layoutRoot.selectAll("g.node")
      .data(@nodes)
      .enter()
      .append("svg:g")
      .attr("class", "node")
      .attr "transform", (d) ->
        "translate(#{d.y}, #{d.x})"

    nodeGroup.append("svg:circle")
      .attr("class", "node-dot")
      .attr("r", @options.nodeRadius)

    nodeGroup.append("svg:text")
      .attr("text-anchor", (d) ->
        if d.children then "end" else "start"
      ).attr("dx", (d) =>
        gap = 2 * @options.nodeRadius
        if d.children then -gap else gap
      ).attr("dy", 3)
        .text (d) -> d.name

