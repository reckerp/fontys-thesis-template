# Fontys Bachelor Thesis Template

> NOTE: This template is NOT officially endorsed by Fontys University of Applied Sciences (FTenL).

A comprehensive (unofficial) [Typst](https://typst.app/) template for bachelor theses at Fontys University of Applied Sciences (FTenL), Netherlands.

## Quick Start

> NOTE: You must follow these install steps, since the package is NOT public on "Typst Universe"

1. Install [Typst](https://typst.app/open-source/)
2. Clone the repository
3. Run `make install` to install the template to the correct location. This will create a symlink to this folder.
4. Now you can run `typst init @local/fontys-ftenl-thesis-template:0.1.0 my-thesis` where you want to your thesis to live

## Features

- Cover page
- Information page with all required details
- Abstract page
- **Fully automatic word counting** - powered by the wordometer package!
- Automatic table of contents, list of figures, and list of tables
- Support for abbreviations and glossary
- **Mermaid chart support** - create professional diagrams using the oxdraw package
- Harvard citation style (Cite Them Right 12th edition)
- Statement of authenticity
- Customizable fonts (body text and monospace)
- Clean, modular structure with separate content files
- **Proper page numbering** following academic standards:
  - Roman numerals (i, ii, iii...) for front matter
  - Arabic numerals (1, 2, 3...) for main content, bibliography, and appendix
  - Roman numerals (continuing) for statement of authenticity

## Project Structure

```
 ── thesis /
    ├── chapters/              # Your thesis chapters
    │   ├── 01-introduction.typ
    │   ├── 02-literature-review.typ
    │   ├── 03-methodology.typ
    │   ├── 04-results.typ
    │   ├── 05-discussion.typ
    │   └── 06-conclusion.typ
    ├── content/               # Separate content files
    │   ├── abstract.typ       # Your abstract
    │   ├── glossary.typ       # Glossary entries
    │   └── abbreviations.typ  # List of abbreviations
    ├── assets/                # Assets directory
    │   ├── charts/            # Mermaid chart files (.mmd)
    │   └── signature.png      # Your signature (optional)
    ├── appendix/              # Appendix files (optional)
    │   └── appendix.typ       # Appendix content
    ├── main.typ               # Main file (configure)
    └── references.bib         # Bibliography file
```

## Complete Parameter Reference

### Required Parameters

- `title` (content): Thesis title
- `author` (string): Author name

### Thesis Information

- `thesis-type` (string): Type of thesis (default: "Bachelor Thesis")
- `student-number` (string): Your student number
- `study` (string): Your study program (default: "Software Engineering")
- `period` (string): Internship/thesis period (optional)
- `date` (string): Submission date (default: current date)

### Company Information

- `company` (string): Company name
- `company-address` (string): Company street address (optional)
- `company-postal` (string): Postal code and city (optional)
- `company-country` (string): Country (optional)
- `company-phone` (string): Company phone number (optional)
- `company-supervisor` (string): Your supervisor at the company
- `location` (string): Location for the cover page (optional)

### University Information

- `university-supervisor` (string): Your university supervisor
- `examiner` (string): The examiner (optional)

### Content

- `abstract` (content): Abstract text (import from content/abstract.typ)
- `glossary` (array): Glossary entries (import from content/glossary.typ)
- `abbreviations` (array): Abbreviations list (import from content/abbreviations.typ)
- `bibliography-file` (string or none): Path to .bib file (e.g., "references.bib")
- `appendix` (content or none): Appendix content (include from appendix/appendix.typ)
- `confidential` (boolean): Whether the thesis is confidential (default: false)

### Styling

- `font-body` (string or array): Font(s) for body text (default: Linux Libertine with fallbacks)
- `font-mono` (string or array): Font(s) for code/monospace text (default: DejaVu Sans Mono with fallbacks)
- `font-size` (length): Base font size (default: 11pt)
- `margin` (dictionary): Page margins (default: 1.5in left/right, 1in top/bottom)
