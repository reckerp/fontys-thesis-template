// Import glossarium functions to reference glossary terms in this chapter
#import "@preview/glossarium:0.5.9": gls, glspl
#import "@local/fontys-ftenl-thesis-template:0.1.0": chart

= Introduction

== Reason for This Report

#lorem(30)

== Problem and Background

This section explores modern software architecture patterns, particularly focusing on @microservices and their deployment using @container:pl. We utilize @API and @REST principles throughout the implementation, with data exchange formatted as @JSON. The @scalability of the system is a key concern in this research.

When we reference these abbreviations again, they will appear in their short form: @API, @REST, and @JSON.

#lorem(40)

== Company

#lorem(35)

== Business Case

#lorem(30)

== Examples: Charts and Tables

The following sections demonstrate how to include charts and tables in your document.

=== Example Table

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

=== Example Chart

#figure(
  chart(read("../assets/charts/example-flowchart.mmd"), width: 50%),
  caption: [System architecture overview]
)

#lorem(20)
