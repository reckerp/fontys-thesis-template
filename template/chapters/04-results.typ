#import "@local/fontys-ftenl-thesis-template:0.1.0": chart
= Results

#lorem(25)

== Key Findings

#lorem(30)

=== Quantitative Results

#lorem(20)

#figure(
  table(
    columns: (auto, auto, auto),
    [*Metric*], [*Before*], [*After*],
    [Metric A], [250ms], [120ms],
    [Metric B], [100 req/s], [300 req/s],
    [Metric C], [2.5%], [0.8%],
  ),
  caption: [Performance comparison]
)

#lorem(15)

=== Qualitative Results

#lorem(25)

== Analysis

#lorem(35)

#figure(
  chart(read("../assets/charts/example-flowchart.mmd"), width: 50%),
  caption: [System architecture overview]
)

#lorem(10)


== Challenges

#lorem(20)
