#import "@preview/oxdraw:0.1.0": *

#let default-chart-style = (
  background: white,
  overrides: (
    node_styles: (
      default: (
        fill: "#f8f9fa",
        stroke: "#495057",
        stroke-width: 2,
        text: "#212529"
      )
    ),
    edge_styles: (
      default: (
        color: "#495057",
        line: "solid",
        stroke-width: 2
      )
    )
  )
)

/// Render a Mermaid chart from file content
///
/// IMPORTANT: You must use read() to pass the chart content from your project file.
/// This ensures paths are resolved relative to your project, not the template package.
///
/// Example: chart(read("../assets/charts/example.mmd"), width: 50%)
#let chart(
  content,
  background: white,
  custom-overrides: none,
  width: auto,
  height: auto,
) = {
  // Convert bytes to string if needed
  let chart-content = if type(content) == bytes {
    str(content)
  } else {
    content
  }
  
  // Merge custom overrides with defaults if provided
  let final-overrides = if custom-overrides != none {
    // Merge custom overrides with defaults
    let merged = default-chart-style.overrides
    if "node_styles" in custom-overrides {
      merged.node_styles = custom-overrides.node_styles
    }
    if "edge_styles" in custom-overrides {
      merged.edge_styles = custom-overrides.edge_styles
    }
    merged
  } else {
    default-chart-style.overrides
  }
  
  // Render the chart with oxdraw
  let rendered = oxdraw(
    chart-content,
    background: background,
    overrides: final-overrides
  )
  
  // Apply size constraints if specified
  if width != auto or height != auto {
    box(
      width: width,
      height: height,
      rendered
    )
  } else {
    rendered
  }
}
