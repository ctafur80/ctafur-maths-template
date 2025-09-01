

// Color themes.
#let light_palette = (
  bg: rgb("fff"),
  fg: rgb("000"),
  math_env_bg_from: rgb("ededf7"),
  math_env_bg_to: rgb("f5f5e9"),
  euclid_ax_env_from: rgb("faedf3"),
  euclid_ax_env_to: rgb("f5f5e9"),
)

#let dark_palette = (
  bg: rgb("1e1e1e"),
  fg: rgb("a89e9e"),
  math_env_bg_from: rgb("2c2c3d"),
  math_env_bg_to: rgb("3b3b30"),
  euclid_ax_env_from: rgb("3d2c33"),
  euclid_ax_env_to: rgb("3b3b30"),
)


// COLOR THEME SELECTION. <---------- !!!!!!!!!!!
// #let palette = light_palette
#let palette = dark_palette




#let templ(
  // dark_theme: false,
  sheet: "a4",
  lang: "en",
  title: none,
  authors: (), 
  abstract: [],
  doc,
) = {

  set text(lang: lang)

  set page(
    fill: palette.bg,

    paper:
      if sheet == "tablet" {
        "a5"
      },

    margin:
    if sheet == "tablet" {
      (x: 8pt, y: 8pt)
    },

    // numbering: "1",

    footer: none,

    header:
      if sheet == "tablet" {
        none
      } else {
        context {
          let selector = selector(heading).before(here())
          let level = counter(selector)
          let headings = query(selector)

          if headings.len() == 0 {
            return
          }

          let heading = headings.last()
          let this_page = counter(page).display()

          block[
            #text(style: "italic")[
              // TODO Solucionar el problema con esto.
              // #level.display(heading.numbering)
              ---
              #heading.body
              #h(1fr)
              #this_page
            ]
          ]
        }
      }
  )


  set text(
    font: "Noto Sans",
    size: 8pt,
    weight: 300,
    tracking: 0.3pt,
    // font: "New Computer Modern",
    // tracking: 0.2pt,
    // size: 10pt,
    fill: palette.fg,
  )

  show strong: set text(weight: 200)
  show heading: set text(weight: 400)

  show heading.where(level: 1): set text(size: 14pt)
  show heading.where(level: 2): set text(size: 14pt)
  show heading.where(level: 3): set text(size: 10pt)
  show heading.where(level: 4): set text(size: 8pt)


  // Maybe font: "Noto Sans Math" in the future.
  show math.equation: set text(size: 9pt)
  /*
  show math.equation: it => {
    if it.body.func() == math.sans[].func(){
      it
    } else {
      math.equation(block: it.block, math.sans(it))
    }
  }
  */


  show raw: set text(
    font: "JetBrains Mono", // font: "JetBrainsMonoNL NF",
    size: 7pt,
    )

  show raw.where(block: true): block.with(
    fill: luma(40),
    inset: 10pt,
    radius: 4pt,
    width: 100%,
  )


  show figure.caption: set text(style: "italic")



  set par(
    justify: true,
    // first-line-indent: 1em,
    // leading: 0.6em,
  )

  // set heading(numbering: "1.")




  // Enumerates automatically the labeled non-referenced equations.
  set math.equation(numbering: "(1)")
  show math.equation: it => {
      if it.block and not it.has("label") [
        #counter(math.equation).update(v => v - 1)
        #math.equation(it.body, block: true, numbering: none)#label("")
      ] else {
        it
      }
  }

  // show math.text: set text(font: "Noto Sans", weight: 300, size: 7pt)


  /*
  // TODO Try to merge it in the main Typst project for the Spanish language
  // behavior.
  show heading.where(level: 1): set heading(supplement: [Capítulo])
  show heading.where(level: 2): set heading(supplement: [Sección])
  show heading.where(level: 3): set heading(supplement: [Sección])
  show heading.where(level: 4): set heading(supplement: [Sección])
  show heading.where(level: 5): set heading(supplement: [Sección])
  show heading.where(level: 6): set heading(supplement: [Sección])
  */

  // Transforms every instance. I just want in math mode.
  // show "sin": name => { "sen" }
  // show "sin": set text(font: "Open Sans", size: 9pt)
  // show "lim": name => { "lím" }


  // TODO Sigue mal. La centra.
  show bibliography: set heading(level: 2)


  // Title page
  set align(center+horizon)
  text(weight: 400, size: 17pt, title)

  let count = authors.len()
  let ncols = calc.min(count, 3)
  grid(
    columns: (1fr,) * ncols,
    row-gutter: 24pt,
    ..authors.map(author => [#author.name \ #author.affiliation \ #link("mailto:" + author.email)])
  )

  par(justify: false)[
    *Abstract* \
    #abstract
  ]



  // Table of contents
  pagebreak()
  set align(left+top)


  // show outline.entry.where(level: 1): it => {
  //   set text(it, size: 36pt)
  // }
  v(3cm)
  outline(depth: 4)



  set footnote.entry(separator: line(length: 30% + 0pt, stroke: (thickness:
    0.5pt, paint: palette.fg)))



  // Makes a page break before every depth-1 heading.
  show outline: set heading(supplement: [Outline])
  show heading.where(depth: 1): it => {
    if it.supplement != [Outline] {
      pagebreak(weak: true)
    }
    align(center+horizon)[#it]
    pagebreak(weak: false)
    v(3cm)
  }


  show heading.where(depth: 2): it => {
    if it.supplement != [Outline] {
      pagebreak(weak: true)
    }
    v(2cm)
    it
    v(1em)
  }

  show heading.where(depth: 3): it => {
    if it.supplement != [Outline] {
      pagebreak(weak: true)
    }
    v(1.5em)
    it
    v(0.7em)
  }





  set par(justify: true)
  doc
}


#let hrule = block[
  #v(15pt)
  #line(length: 100%, stroke: (paint: palette.fg, thickness: 0.5pt, dash: "dashed"))
  #v(15pt)
]



// Maths Environments. TODO Try to put this in a separate file.
// ----------------------------------------------------------------------------------------



// Proposition
#let proposition(body, number: none, title: none) = {
  let display_number = if number != none { " " + number } else { "" }
  let display_title = if title != none { " (" + title + ")" } else { "" }
  set enum(numbering: "i.")

  block(
    // breakable: false,
    width: 100%,
    fill: gradient.linear(palette.math_env_bg_from, palette.math_env_bg_to),
    inset: 8pt,
    radius: 4pt,
  )[
    #text(weight: 500, style: "italic")[Proposición#display_number#display_title.]
    #body
  ]
}



// Theorem
#let theorem(body, number: none, title: none) = {
  let display_number = if number != none { " " + number } else { "" }
  let display_title = if title != none { " (" + title + ")" } else { "" }
  set enum(numbering: "i.")

  block(
    // breakable: false,
    width: 100%,
    fill: gradient.linear(palette.math_env_bg_from, palette.math_env_bg_to),
    inset: 8pt,
    radius: 4pt,
  )[
    #text(weight: 500, style: "italic")[Teorema#display_number#display_title.]
    #body
  ]
}




// Axiom
#let axiom(body, number: none, title: none) = {
  let display_number = if number != none { " " + number } else { "" }
  let display_title = if title != none { " (" + title + ")" } else { "" }
  set enum(numbering: "i.")

  block(
    // breakable: false,
    width: 100%,
    fill: gradient.linear(palette.math_env_bg_from, palette.math_env_bg_to),
    inset: 8pt,
    radius: 4pt,
  )[
    #text(weight: 500, style: "italic")[Axioma#display_number#display_title.]
    #body
  ]
}



// Euclid axiom
#let euclid_ax(title, it) = {
  counter("euclid").step()

  let the_title = title
  if the_title != [] {
    the_title = [ (#the_title)]
  }

  let number = context counter("euclid").display()
  set enum(numbering: "i.")

  block(
    // breakable: false,
    width: 100%,
    fill: gradient.linear(palette.euclid_ax_env_from, palette.euclid_ax_env_to),
    inset: 8pt,
    radius: 4pt,
  )[
    #text(weight: 500, style: "italic")[Axioma P#number de Euclides#the_title.]
    #text[#it]
  ]
}




// Definition
#let definition(body, number: none, title: none) = {
  let display_number = if number != none { " " + number } else { "" }
  let display_title = if title != none { " (" + title + ")" } else { "" }
  set enum(numbering: "i.")

  block(
    // breakable: false,
    width: 100%,
    fill: gradient.linear(palette.math_env_bg_from, palette.math_env_bg_to),
    inset: 8pt,
    radius: 4pt,
  )[
    #text(weight: 500, style: "italic")[Definición#display_number#display_title.]
    #body
  ]
}




// Lemma
#let lemma(body, number: none, title: none) = {
  let display_number = if number != none { " " + number } else { "" }
  let display_title = if title != none { " (" + title + ")" } else { "" }
  set enum(numbering: "i.")

  block(
    // breakable: false,
    width: 100%,
    fill: gradient.linear(palette.math_env_bg_from, palette.math_env_bg_to),
    inset: 8pt,
    radius: 4pt,
  )[
    #text(weight: 500, style: "italic")[Lema#display_number#display_title.]
    #body
  ]
}




// Corollary
#let corollary(body, number: none, title: none) = {
  let display_number = if number != none { " " + number } else { "" }
  let display_title = if title != none { " (" + title + ")" } else { "" }
  set enum(numbering: "i.")

  block(
    // breakable: false,
    width: 100%,
    fill: gradient.linear(palette.math_env_bg_from, palette.math_env_bg_to),
    inset: 8pt,
    radius: 4pt,
  )[
    #text(weight: 500, style: "italic")[Corolario#display_number#display_title.]
    #body
  ]
}




// Example
#let example(body, number: none, title: none) = {
  let display_number = if number != none { " " + number } else { "" }
  let display_title = if title != none { " (" + title + ")" } else { "" }

  block[
    #text(weight: 500, style: "italic")[Ejemplo#display_number#display_title.]
    #body
    #h(1fr)
    $triangle.filled.br$
  ]
}




// Exercise
#let exercise(body, number: none, title: none) = {
  let display_number = if number != none { " " + number } else { "" }
  let display_title = if title != none { " (" + title + ")" } else { "" }

  block[
    #text(weight: 500, style: "italic")[Ejercicio#display_number#display_title.]
    #body
    #h(1fr)
    $triangle.filled.br$
  ]
}



// Remark.
#let remark(it) = {
  block[#text[*_Observación_*. #it #h(1fr) $triangle.filled.br$]]
}


// Remark about notation.
#let remark_notat(it) = {
  block[#text[*_Notación_*. #it#h(1fr)$triangle.filled.br$]]
}

// Remark about terminology.
#let remark_term(it) = {
  block[#text[*_Terminología_*. #it#h(1fr)$triangle.filled.br$]]
}



// TODO Put a reference to a math environment such as a theorem,
// proposition, etc.
// Proof.
#let proof(it) = {
  block[#text[*_Demostración_*~--- #it#h(1fr)$qed$]]
}





// Page number marker
#let new_page(page) = {
  assert(type(page) == int, message: "El argumento de 'pagina' debe ser un entero.")
  v(3.5em, weak: true)
  line(length: 100%, stroke: 1pt + luma(105))
  align(right)[#text(weight: "bold", style: "italic")[---~pág. #page]]
  v(1.5em, weak: true)
}


#let diversion(it) = {
  block(
    fill: luma(55),
    inset: 8pt,
    radius: 4pt)[#text[#it]]
    // radius: 4pt)[#text[*_Desvío_*~--- #it]]
}








