#let cover-page(
  title: none,
  author: none,
  company: none,
  date: none,
  location: none,
) = {
  page(
    margin: (left: 1in, right: 1in, top: 1.5in, bottom: 1.5in),
    numbering: none,
  )[
    #align(center + horizon)[
      #v(1fr)
      
      #if title != none {
        text(size: 24pt, weight: "bold")[
          #title
        ]
      }
      
      #v(1.5cm)
      
      #if author != none {
        text(size: 18pt)[
          #author
        ]
      }
      
      #v(0.2cm)
      
      #if company != none {
        text(size: 18pt)[
          #company
        ]
      }
      
      #v(1.5cm)
      
      #if date != none {
        text(size: 14pt)[
          #date
        ]
      }
      
      #if location != none {
        text(size: 14pt)[
          #location
        ]
      }
      
      #v(3.5fr)
    ]
  ]
}
