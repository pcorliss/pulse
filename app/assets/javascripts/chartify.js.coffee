$ ->
  window.chartify = (data, svg) ->
    console.log "Data:", data

    nv.addGraph ->
      height = 500
      chart = nv.models.multiBarChart()
        .margin top: 50, bottom: 30, left: 40, right: 10
        .height height

      chart.xAxis
        .tickFormat d3.format(',d')

      chart.yAxis
        .tickFormat d3.format(',d')

      d3.select svg
        .datum data
        .transition()
        .duration 500
        .attr 'height', height
        .call chart

      nv.utils.windowResize chart.update

      chart
