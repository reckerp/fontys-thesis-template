#let acknowledgements-page(
  font-body,
  ai-acknowledgements: false,
  further-acknowledgements: none,
) = {
  page(
    margin: (left: 1.2in, right: 1.0in, top: 1.0in, bottom: 1.0in),
    numbering: "i",
  )[
    #set text(font: font-body)
    
    #heading(outlined: false, numbering: none)[Acknowledgements]
    
    #v(0.5cm)

    #further-acknowledgements

    #if ai-acknowledgements {
      [
        This thesis acknowledges limited use of artificial intelligence (AI) tools, including GitHub Copilot, Grammarly, and ChatGPT, for language refinement and idea structuring. These tools were employed for grammar and spelling correction, clarity and concision improvements, and generation of alternative phrasings. All AI suggestions were critically reviewed, adapted, and rewritten by the author. The research design, analysis, results, conclusions, and all substantive content were produced by the author.

        The use of AI was conducted under the author’s direction and in accordance with the academic and ethical standards of Fontys University of Applied Sciences. No AI tools were used to fabricate, falsify, or misrepresent data or sources. All citations and references were verified by the author. Full responsibility for the accuracy, integrity, and originality of this thesis is accepted.
      ]
    }

  ]
}
