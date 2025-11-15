// Glossary and abbreviations utilities

#let create-glossary(entries) = {
  if entries == none {
    return
  }
  if type(entries) == array and entries.len() == 0 {
    return
  }
  
  pagebreak()
  
  heading(numbering: none, outlined: true)[Glossary]
  
  v(0.5cm)
  
  for entry in entries {
    block(
      inset: (bottom: 0.5em),
    )[
      *#entry.term:* #entry.definition
    ]
  }
}

#let create-abbreviations(entries) = {
  if entries == none {
    return
  }
  if type(entries) == array and entries.len() == 0 {
    return
  }
  
  pagebreak()
  
  heading(numbering: none, outlined: true)[List of Abbreviations]
  
  v(0.5cm)
  
  table(
    columns: (auto, 1fr),
    stroke: none,
    inset: 6pt,
    align: (left, left),
    ..entries.map(entry => (
      [*#entry.abbr*],
      [#entry.full]
    )).flatten()
  )
}
