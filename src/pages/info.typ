#let info-page(
  font-body,
  thesis-type: none,
  author: none,
  student-number: none,
  study: none,
  period: none,
  company: none,
  company-address: none,
  company-postal: none,
  company-country: none,
  company-phone: none,
  company-supervisor: none,
  university-supervisor: none,
  examiner: none,
  word-count: none,
  confidential: false,
) = {
  page(
    margin: (left: 1.2in, right: 1.0in, top: 1.0in, bottom: 1.0in),
  )[
    #set text(font: font-body)
    
    #heading(outlined: false, numbering: none)[Information Page]
    
    #v(0.5cm)
    
    Fontys University of Applied Sciences\
    Technology and Logistics\
    Tegelseweg 255, 5912 BG Venlo, Netherlands
    
    #v(1cm)
    
    #table(
      columns: (1fr, 1.5fr),
      stroke: 0.5pt,
      inset: 8pt,
      align: left + horizon,
      
      [*Type of report:*], [#thesis-type],
      [*Student name:*], [#author],
      [*Student number:*], [#student-number],
      [*Study:*], [#study],
      [*Period:*], [#period],
      [*Company name:*], [#company],
      [*Address:*], [#company-address],
      [*Postal code + City:*], [#company-postal],
      [*Country:*], [#company-country],
      [*Telephone:*], [#company-phone],
      [*Company supervisor:*], [#company-supervisor],
      [*Supervising Lecturer:*], [#university-supervisor],
      [*Examiner (when applicable):*], [#examiner],
      [*Word count:*], [#word-count],
      [*Company Confidential:*], [#if confidential [Yes] else [No]],
    )
  ]
}
