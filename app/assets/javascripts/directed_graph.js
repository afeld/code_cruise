// from http://bl.ocks.org/rkirsling/5001347#app.js

(function(){
  // set up SVG for D3
  var $win = $(window),
      width  = $win.width(),
      height = $win.height(),
      colors = d3.scale.category10();

  var svg = d3.select('.graph')
    .append('svg');

  // set up initial nodes and links
  //  - nodes are known by 'id', not by index in array.
  //  - links are always source < target; edge directions are set by 'left' and 'right'.
  var nodesById = {};
  var nodes = gon.topics.map(function(topic){
    var node = $.extend({}, topic);
    nodesById[node.id] = node;
    return node;
  });
  var links = gon.relationships.map(function(rel){
    return $.extend({}, rel, {
      source: nodesById[rel.parent_id],
      target: nodesById[rel.child_id],
      left: false,
      right: true
    });
  });

  // init D3 force layout
  var force = d3.layout.force()
      .nodes(nodes)
      .links(links)
      .size([width, height])
      .linkDistance(180)
      .charge(-1000)
      .on('tick', tick);

  // define arrow markers for graph links
  svg.append('svg:defs').append('svg:marker')
      .attr('id', 'end-arrow')
      .attr('viewBox', '0 -5 10 10')
      .attr('refX', 6)
      .attr('markerWidth', 3)
      .attr('markerHeight', 3)
      .attr('orient', 'auto')
    .append('svg:path')
      .attr('d', 'M0,-5L10,0L0,5')
      .attr('fill', '#000');

  // handles to link and node element groups
  var path = svg.append('svg:g').selectAll('path'),
      circle = svg.append('svg:g').selectAll('g');

  // mouse event vars
  var selected_node = null;

  var NODE_RADIUS = 40;

  // update force layout (called automatically each iteration)
  function tick() {
    // draw directed edges with proper padding from node centers
    path.attr('d', function(d) {
      var deltaX = d.target.x - d.source.x,
          deltaY = d.target.y - d.source.y,
          dist = Math.sqrt(deltaX * deltaX + deltaY * deltaY),
          normX = deltaX / dist,
          normY = deltaY / dist,
          sourcePadding = NODE_RADIUS,
          targetPadding = NODE_RADIUS + 5,
          sourceX = d.source.x + (sourcePadding * normX),
          sourceY = d.source.y + (sourcePadding * normY),
          targetX = d.target.x - (targetPadding * normX),
          targetY = d.target.y - (targetPadding * normY);
      return 'M' + sourceX + ',' + sourceY + 'L' + targetX + ',' + targetY;
    });

    circle.attr('transform', function(d) {
      return 'translate(' + d.x + ',' + d.y + ')';
    });
  }

  var TRANSITION_TIME = 750;

  // action to take on mouse click
  function onNodeClick(d) {
    d3.select(this).select('text').transition()
      .duration(TRANSITION_TIME)
      .style('stroke-width', '.5px')
      .style('font', '20px sans-serif');

    d3.select(this).select('circle').transition()
      .duration(TRANSITION_TIME)
      .attr('r', NODE_RADIUS * 2);

    // select node
    selected_node = d;
  }


  // path (link) group
  path = path.data(links);

  // add new links
  path.enter().append('svg:path')
    .attr('class', 'link')
    .style('marker-end', function(d) { return d.right ? 'url(#end-arrow)' : ''; });


  // circle (node) group
  // NB: the function arg is crucial here! nodes are known by id, not by index!
  circle = circle.data(nodes, function(d) { return d.id; });

  // add new nodes
  var g = circle.enter().append('svg:g');

  g.append('svg:circle')
    .attr('class', 'node')
    .attr('r', NODE_RADIUS)
    .style('fill', function(d) { return (d === selected_node) ? d3.rgb(colors(d.id)).brighter().toString() : colors(d.id); })
    .style('stroke', function(d) { return d3.rgb(colors(d.id)).darker().toString(); });

  // show node titles
  g.append('svg:text')
      .attr('x', 0)
      .attr('y', 4)
      .attr('class', 'title')
      .text(function(d) { return d.title; });

  g.on('click', onNodeClick);

  // set the graph in motion
  force.start();
})();
