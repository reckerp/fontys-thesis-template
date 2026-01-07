// Import from local package (after running 'make install')
#import "@local/fontys-ftenl-thesis-template:0.1.0": thesis

// Import content from separate files
#import "content/abstract.typ": abstract-content
#import "content/glossary.typ": glossary-entries
#import "content/abbreviations.typ": abbreviation-entries

// Configure the thesis template
#show: thesis.with(
  // Document metadata
  title: [Title to your thesis],
  author: "Jane Doe",
  date: "February 1, 2025",

  // Optional: Include signature image (set to none if not available)
  signature-image: image("assets/signature.png", height: 2cm),
  // signature-image: none,

  // Thesis information
  thesis-type: "Internship Report",
  student-number: "1234567",
  study: "Software Engineering",
  period: "01.09.2024 - 01.02.2025",

  // Company information
  company: "Tech Company B.V.",
  company-address: "Tech Street 123",
  company-postal: "1234 AB Amsterdam",
  company-country: "Netherlands",
  company-phone: "+31 (0)20 1234567",
  company-supervisor: "Dr. John Smith",
  location: "Amsterdam",

  // University information
  university-supervisor: "Prof. Maria Johnson",
  examiner: "Prof. Maria Johnson",

  // Content (imported from separate files)
  abstract: abstract-content,
  glossary: glossary-entries,
  abbreviations: abbreviation-entries,

  // Acknowledgements (optional - set to none to disable)
  // acknowledgements: [
  //   I would like to thank my supervisors, colleagues, and family for their support.
  // ],
  acknowledgements: none,

  // AI Usage Declaration
  // Set ai-used to true if you used AI tools in your thesis
  ai-used: false,
  // If ai-used is true, provide details below:
  // ai-tools: [ChatGPT (GPT-4), GitHub Copilot, Grammarly],
  // ai-chapter-description: [Chapter 3 (Literature Review): Used ChatGPT to help structure ideas and improve clarity. Chapter 5 (Implementation): Used GitHub Copilot for code suggestions.],
  // ai-usage-explanation: [AI tools were used to improve writing clarity, grammar, and to assist with code implementation. All AI-generated content was reviewed, edited, and verified by the author.],

  // Appendix (optional - set to none if you don't have an appendix)
  // The appendix appears after the main chapters and before the bibliography
  appendix: include "appendix/appendix.typ",
  // To disable appendix, use: appendix: none,

  // Bibliography (set to none if you don't have references yet)
  // Uncomment the line below when you add references to references.bib
  bibliography-file: bibliography("references.bib"),
  // bibliography-file: none,

  // Document settings
  confidential: false,

  // Font settings (optional - uses defaults if not specified)
  // font-body: ("Linux Libertine", "Georgia"),
  // font-mono: ("Fira Mono", "Courier New"),

  // Table of contents settings
  toc-depth: 3,
)

// Include all chapters (word counting is automatic)
#include "chapters/introduction.typ"
#pagebreak()

#include "chapters/project_definition.typ"
#pagebreak()

// Add your content chapters here by duplicating placeholder_content_chapter.typ
// and renaming it to match your chapter topic (e.g., analysis.typ, design.typ, etc.)
#include "chapters/placeholder_content_chapter.typ"
#pagebreak()

#include "chapters/conclusion.typ"
