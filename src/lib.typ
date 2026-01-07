// Fontys University Bachelor Thesis Template
// Main entry point for the template

#import "pages/cover.typ": cover-page
#import "pages/info.typ": info-page
#import "pages/abstract.typ": abstract-page
#import "pages/acknowledgements.typ": acknowledgements-page
#import "pages/authenticity.typ": authenticity-page
#import "utils/wordcount.typ": display-word-count, word-count
#import "utils/chart.typ": chart
#import "@preview/glossarium:0.5.9": make-glossary, register-glossary, print-glossary, gls, glspl
#import "@preview/abbr:0.3.0"

#let thesis(
  // Document metadata
  title: none,
  author: none,
  date: datetime.today().display("[month repr:long] [day], [year]"),

  // Thesis information
  thesis-type: "Bachelor Thesis",
  student-number: none,
  study: "Software Engineering",
  period: none,

  // Company information
  company: none,
  company-address: none,
  company-postal: none,
  company-country: none,
  company-phone: none,
  company-supervisor: none,
  location: none,

  // University information
  university-supervisor: none,
  examiner: none,

  // Abstract and content
  abstract: none,

  // Acknowledgements
  acknowledgements: none,

  // Additional content
  glossary: none,
  abbreviations: none,

  // Bibliography
  bibliography-file: none,

  // Appendix
  appendix: none,

  // Signature
  signature-image: none,

  // Document settings
  confidential: false,

  // Font settings (using commonly available fonts with fallbacks)
  font-body: ("Times New Roman", "Times"),
  font-mono: ("Courier New", "Courier"),
  font-size: 11pt,

  // Page settings (A4 only)
  margin: (left: 1.2in, right: 1in, top: 1in, bottom: 1in),

  // Table of contents settings
  toc-depth: 3,

  // The document content
  body,
) = {
  // Validate required parameters
  assert(title != none, message: "thesis() requires a 'title' parameter. Please provide a title for your thesis.")
  assert(author != none, message: "thesis() requires an 'author' parameter. Please provide the author name.")

  // Initialize glossarium for glossary terms (MUST come before register-glossary)
  show: make-glossary

  // Register glossary entries AFTER make-glossary
  if glossary != none and type(glossary) == array and glossary.len() > 0 {
    register-glossary(glossary)
  }

  // Register abbreviation entries BEFORE abbr.show-rule
  if abbreviations != none and type(abbreviations) == array and abbreviations.len() > 0 {
    abbr.make(..abbreviations)
  }

  // Initialize abbr package for abbreviations
  show: abbr.show-rule

  // Set document metadata
  set document(
    title: title,
    author: author,
  )

  // Set default text properties
  set text(
    font: font-body,
    size: font-size,
    lang: "en",
  )

  // Set page properties for the main document (always A4)
  set page(
    paper: "a4",
    margin: margin,
  )

  // Set paragraph properties
  set par(
    justify: true,
    leading: 0.65em,
  )

  // Set heading properties
  set heading(
    numbering: "1.1",
  )

  // Style headings
  show heading.where(level: 1): it => {
    set text(size: 16pt, weight: "bold", font: font-body)
    block(
      above: 1.5em,
      below: 1em,
      it
    )
  }

  show heading.where(level: 2): it => {
    set text(size: 14pt, weight: "bold", font: font-body)
    block(
      above: 1.2em,
      below: 0.8em,
      it
    )
  }

  show heading.where(level: 3): it => {
    set text(size: 12pt, weight: "bold", font: font-body)
    block(
      above: 1em,
      below: 0.6em,
      it
    )
  }

  // Set raw text (code) font
  show raw: set text(font: font-mono, size: 0.9em)

  // Style code blocks
  show raw.where(block: true): it => {
    set par(justify: false)
    block(
      width: 100%,
      fill: luma(245),
      inset: 10pt,
      radius: 4pt,
      stroke: 0.5pt + luma(200),
      it
    )
  }

  // Style inline code
  show raw.where(block: false): it => {
    box(
      fill: luma(245),
      inset: (x: 3pt, y: 0pt),
      outset: (y: 3pt),
      radius: 2pt,
      it
    )
  }


  // Configure table styling
  set table(
    inset: 4pt,
    stroke: 0.5pt,
  )

  // Configure bibliography style
  set bibliography(
    style: "harvard-cite-them-right",
    title: "References",
  )

  // 1. Cover page
  if title != none and author != none {
    cover-page(
      title: title,
      author: author,
      company: company,
      date: date,
      location: location,
    )
  }

  // Set page numbering to Roman numerals for front matter
  set page(
    numbering: "i",
    number-align: center,
  )

  // 2. Information page
  if thesis-type != none {
    info-page(
      font-body,
      thesis-type: thesis-type,
      author: author,
      student-number: student-number,
      study: study,
      period: period,
      company: company,
      company-address: company-address,
      company-postal: company-postal,
      company-country: company-country,
      company-phone: company-phone,
      company-supervisor: company-supervisor,
      university-supervisor: university-supervisor,
      examiner: examiner,
      word-count: display-word-count(),
      confidential: confidential,
    )
  }

  // 3. Abstract
  if abstract != none {
    abstract-page(
      font-body,
      abstract: abstract,
    )
  }

  authenticity-page(
    font-body,
    author: author,
    student-number: student-number,
    date: date,
    location: location,
    signature-image: signature-image,
  )

  // Acknowledgements page (only if provided)
  if acknowledgements != none {
    acknowledgements-page(
      font-body,
      acknowledgements: acknowledgements,
    )
  }


  // 4. Table of contents
  pagebreak()

  // Apply bold styling only to the Table of Contents
  {
    show outline.entry.where(level: 1): it => {
      v(12pt, weak: true)
      strong(it)
    }

    outline(
      title: "Table of Contents",
      depth: toc-depth,
      indent: auto,
    )
  }

  // 5. List of figures (only if figures exist)
  context {
    let figures = query(figure.where(kind: image))
    if figures.len() > 0 {
      pagebreak()
      heading(numbering: none, outlined: true)[List of Figures]
      outline(
        title: none,
        target: figure.where(kind: image),
      )
    }
  }

  // 6. List of tables (only if tables exist)
  context {
    let tables = query(figure.where(kind: table))
    if tables.len() > 0 {
      pagebreak()
      heading(numbering: none, outlined: true)[List of Tables]
      outline(
        title: none,
        target: figure.where(kind: table),
      )
    }
  }


  context {
    let listings = query(figure.where(kind: raw))
    if listings.len() > 0 {
      pagebreak()
      heading(numbering: none, outlined: true)[List of Listings]
      outline(
        title: none,
        target: figure.where(kind: raw),
      )
    }
  }



  // 7. List of abbreviations (only if provided and not empty)
  if abbreviations != none {
    if type(abbreviations) == array and abbreviations.len() > 0 {
      pagebreak()
      {
        // Temporarily disable heading numbering for abbr.list()
        set heading(numbering: none, outlined: true)
        abbr.list()
      }
    }
  }

  // Configure abbr styling to use normal text
  abbr.config(style: it => it)

  // 8. Glossary (only if provided and not empty)
  if glossary != none {
    if type(glossary) == array and glossary.len() > 0 {
      pagebreak()
      heading(numbering: none, outlined: true)[Glossary]
      print-glossary(
        show-all: true,
        disable-back-references: true,
        glossary
      )
    }
  }

  // Configure figure numbering and spacing
  set figure(
    gap: 1em,
  )

  // Reset page numbering to Arabic numerals for main content
  pagebreak()

  set page(
    numbering: "1",
    number-align: center,
  )

  counter(page).update(1)

  // Main document body (wrapped in word-count for automatic counting)
  word-count(body)

  // Bibliography (only if provided)
  if bibliography-file != none {
    pagebreak()
    bibliography-file
  }

  // Appendix (only if provided)
  if appendix != none {
    pagebreak()
    appendix
  }
}

// Export page components for custom usage
#let cover = cover-page
#let info = info-page
#let abstract-content = abstract-page
#let authenticity = authenticity-page
