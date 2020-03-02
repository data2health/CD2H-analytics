<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="json" uri="http://labs.cd2h.org/JSONTagLib"%>

<script src="//d3js.org/d3.v4.min.js" type="text/javascript"></script>

<script type="text/javascript">
	d3.json("data.jsp", function(error, data) {

		// sort so newest update first
		data.nodes.sort(function(a, b) {
			var da = new Date(a.updatedat).getTime();
			var db = new Date(b.updatedat).getTime();
			return a.repo - b.repo || da > db ? -1 : da > db ? 1 : 0;
		});

		var tr = d3.select("tbody").selectAll("tr").data(data.nodes).enter().append("tr");

		// add repo name column as a link 
		var names = tr.append("th");
		names.each(function(d) {
			var self = d3.select(this);
			self.append("a")
				.attr("href", "dashboardDetail.jsp?repo="+d.name)
				.style("color", "#0a6196")
				.text(d.name);
		});

		// add description column 
		tr.append("td")
			.text(function(d) {return d.description});

		// add last updated column and format time better
		var format = d3.timeFormat("%x %I:%M %p");
		tr.append("td")
			.text(function(d) {return format(new Date(d.updatedat))});

		// add the svg for milestones
		var mileSVG = tr.append("td")
			.append("svg")
			.attr("width", 71)
			.attr("height", 25);
		// add the bar for total milestones
		mileSVG.append("rect")
			.attr("height", 20)
			.attr("width", function(d) {return 71 * (d.total_milestones / d.total_milestones);})
			.style("fill", "#d5e2e5")
			.on("mouseover", function(d) {d3.select(this).raise();})
			.on("mouseout", function(d) {d3.select(this).lower();})
			.append("title")
				.text(function(d) {return "Total Milestones: " + d.total_milestones;});
		// add the bar for completed milestones			
		mileSVG.append("rect")
			.attr("height", 20)
			.style("fill", "#1e4784")
			.attr("width", function(d) {return 71 * (d.closed_milestones / d.total_milestones);})
			.attr("stroke", "white")
			.attr("stroke-width", "0")
			.on("mouseover", function(d) {d3.select(this).transition().attr("stroke-width","3");})
			.on("mouseout", function(d) {d3.select(this).transition().attr("stroke-width", "0");})
			.append("title")
				.text(function(d) {return "Completed Milestones: " + d.closed_milestones;});
		
		// add the svg for issues
		var issueSVG = tr.append("td")
			.append("svg")
			.attr("width", 71)
			.attr("height", 20);
		
		// add the bar for total issues 
		issueSVG.append("rect")
			.attr("height", 20)
			.attr("width", function(d) {return 71 * (d.total_issues / d.total_issues);})
			.style("fill", "#d5e2e5").on("mouseover", function(d) {d3.select(this).raise();})
			.on("mouseout", function(d) {d3.select(this).lower();})
			.append("title")
				.text(function(d) {return "Total Issues: " + d.total_issues;});
		// add the bar for completed issues 
		issueSVG.append("rect")
			.style("fill", "#1e4784")
			.attr("stroke", "white")
			.attr("stroke-width", "0")
			.on("mouseover",function(d) {d3.select(this).transition().attr("stroke-width","3");})
			.on("mouseout", function(d) {d3.select(this).transition().attr("stroke-width", "0");})
			.attr("height", 20).attr("width", function(d) {return 71 * (d.closed_issues / d.total_issues);})
				.append("title").text(function(d) {return "Completed Issues: " + d.closed_issues;});

	});
</script>
