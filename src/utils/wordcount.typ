// Word counting using the wordometer package
// https://github.com/typst/packages/tree/main/packages/preview/wordometer/0.1.5

#import "@preview/wordometer:0.1.5": total-words, word-count as wordometer-count

// Re-export word-count with figures, tables, and listings excluded.
// `exclude` takes element functions / where-selectors; anything matched
// is skipped when counting (the package default keeps the <no-wc> label).
// This is used to wrap content that should be counted.
#let word-count = wordometer-count.with(exclude: (
  // figure,
  // table,
  raw.where(block: true),
  <no-wc>,
))

// Function to display the total word count
// This should be called in the info page within a context block
#let display-word-count() = {
  // total-words is a state/counter from wordometer
  // Access it directly as it's meant to be used in context
  total-words
}
