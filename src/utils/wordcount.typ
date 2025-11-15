// Word counting using the wordometer package
// https://github.com/typst/packages/tree/main/packages/preview/wordometer/0.1.5

#import "@preview/wordometer:0.1.5": word-count, total-words

// Re-export the word-count function from wordometer
// This is used to wrap content that should be counted
#let word-count = word-count

// Function to display the total word count
// This should be called in the info page within a context block
#let display-word-count() = {
  // total-words is a state/counter from wordometer
  // Access it directly as it's meant to be used in context
  total-words
}
