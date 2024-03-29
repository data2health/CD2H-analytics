<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<style>
.node {
	stroke: #fff;
	stroke-width: 1.5px;
}

.link {
	stroke: #999;
	stroke-opacity: .6;
}
</style>

<script src="https://d3js.org/d3.v3.min.js"></script>
<script>

var width = parseInt(d3.select("#content").style("width"))-50,
	height = width,
    radius = 4,
    charge = -50,
    linkDistance = 30;

<c:if test="${not empty param.charge}">
	charge = ${param.charge};
</c:if>
<c:if test="${not empty param.ld}">
	linkDistance = ${param.ld};
</c:if>

var color = d3.scale.category10().domain(d3.range(0,5));

var force = d3.layout.force()
    .charge(charge)
    .linkDistance(linkDistance)
    .size([width, height]);

var svg = d3.select("#graph").append("svg")
	.attr("xmlns","http://www.w3.org/2000/svg")
    .attr("width", width)
    .attr("height", height);

var graph = null;

d3.select(window).on('resize', function() {
	})

	d3.json("${param.data_page}", function(error, new_graph) {
		graph = new_graph;
  force
      .nodes(graph.nodes)
      .links(graph.links)
      .start();
 
	var rScale = d3.scale.linear()
	 .domain([0, d3.max(graph.nodes, function(d) { return d.score; })])
	 .range([3, 500]);

	var eScale = d3.scale.linear()
	 .domain([0, d3.max(graph.links, function(d) { return d.value; })])
	 .range([1, 3]);

  var link = svg.selectAll(".link")
      .data(graph.links)
    .enter().append("line")
      .attr("class", "link")
      .style("stroke-width", function(d) { return eScale(d.value); });

  var node = svg.selectAll(".node")
      .data(graph.nodes)
    .enter().append("path")
    .attr("class", "node")
    .attr("d", d3.svg.symbol()
            .size(function(d) {return rScale(d.score);})
        .type(function(d) { if (d.group >  4) return d3.symbolCircle; else return d3.symbolSquare; }))
    .style("fill", function(d) { return color(d.group); })
	.on("dblclick", function(d) { window.open(d.url,"_self");})
    .on("mouseover", fade(.2))
    .on("mouseout", fade(1))
    .call(force.drag);

  node.append("title")
      .text(function(d) { return d.name; });

  force.on("tick", function() {
    link.attr("x1", function(d) { return d.source.x; })
        .attr("y1", function(d) { return d.source.y; })
        .attr("x2", function(d) { return d.target.x; })
        .attr("y2", function(d) { return d.target.y; });

    node.attr("transform", function(d) {return "translate(" + d.x + "," + d.y + ")";})
	    .attr("d", d3.svg.symbol()
			.size(function(d) {return rScale(d.score);})
	        .type(function(d) { return updateType(d); }))
		.style("fill", function(d) {return updateStyle(d);});
  });

  var linkedByIndex = {};
  graph.links.forEach(function(d) {
      linkedByIndex[d.source.index + "," + d.target.index] = 1;
  });

  function isConnected(a, b) {
      return linkedByIndex[a.index + "," + b.index] || linkedByIndex[b.index + "," + a.index] || a.index == b.index;
  }

  function fade(opacity) {
      return function(d) {
          node.style("stroke-opacity", function(o) {
              thisOpacity = isConnected(d, o) ? 1 : opacity;
              this.setAttribute('fill-opacity', thisOpacity);
              return thisOpacity;
          });

          link.style("stroke-opacity", function(o) {
              return o.source === d || o.target === d ? 1 : opacity;
          });
      };
  }
});

function updateData() {
	var alg = document.querySelector('input[name="detectionAlg"]:checked').value;
	if(alg=="site") { drawColorKey2(graph.sites); }
	else { d3.select("#legend").remove(); }
	force.start(); }

function updateStyle(d) {
	  return color(d.group % 4);	
}

function updateType(d) {
	if  (d.group  <  4)
		return  d3.svg.symbolTypes[0];
	return d3.svg.symbolTypes[3];
}


</script>
