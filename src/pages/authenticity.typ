#let authenticity-page(
  font-body,
  author: none,
  student-number: none,
  date: none,
  location: none,
  signature-image: none,
) = {
  page(
    margin: (left: 1.5in, right: 1.5in, top: 1.5in, bottom: 1.5in),
  )[
    #set text(font: font-body)
    #set par(justify: true, leading: 0.65em)
    
    #heading(outlined: false, numbering: none)[Statement of Authenticity]
    
    #v(0.5cm)
    
    #text(style: "italic", size: 10pt)[
      Issued by the FTenL Examination Board, September 2017
    ]
    
    #v(0.5cm)
    
    I, the undersigned, hereby certify that I have compiled and written this document and the underlying work / pieces of work without assistance from anyone except the specifically assigned academic supervisor. This work is solely my own, and I am solely responsible for the content, organization, and making of this document and the underlying work / pieces of work.
    
    #v(0.5cm)
    
    I hereby acknowledge that I have read the instructions for preparation and submission of documents pieces of work provided by my course my academic institution, and I understand that this document and the underlying pieces of work will not be accepted for evaluation or for the award of academic credits if it is determined that they have not been prepared in compliance with those instructions and this statement of authenticity.
    
    #v(0.5cm)
    
    I further certify that I did not commit plagiarism, did neither take over nor paraphrase (digital or printed, translated or original) material (e.g. ideas, data, pieces of text, figures, diagrams, tables, recordings, videos, code, ...) produced by others without correct and complete citation and correct and complete reference of the source(s). I understand that this document and the underlying work / pieces of work will not be accepted for evaluation or for the award of academic credits if it is determined that they embody plagiarism.

    #v(1.5cm)
    
    #grid(
      columns: (auto, 1fr),
      column-gutter: 1em,
      row-gutter: 0.5em,
      [*Name (in capital letters):*],
      [#if author != none {upper(author)} else {text(fill: gray)[NOT PROVIDED]}],
      [*Student Number:*],
      [#if student-number != none {student-number} else {text(fill: gray)[NOT PROVIDED]}],
      [*Place / Date:*],
      [#if location != none and date != none {
        [#location, #date]
      } else if location != none {
        location
      } else if date != none {
        date
      } else {
        text(fill: gray)[NOT PROVIDED]
      }],
    )

    #v(2cm)
    
    *Signature:*
    
    #v(0.3cm)
    
    // display signature image if provided
    #if signature-image != none {
      block(
        signature-image
      )
    } else {
      v(1cm)
    }
    
    #line(length: 40%, stroke: 0.5pt)
  ]
}
