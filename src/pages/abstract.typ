#let abstract-page(
  font-body,
  abstract: none,
) = {
  page(
    margin: (left: 1.5in, right: 1.5in, top: 1.5in, bottom: 1.5in),
    numbering: "i",
  )[
    #set text(font: font-body)
    
    #heading(outlined: false, numbering: none)[Abstract]
    
    #v(0.5cm)
    
    #abstract
  ]
}
