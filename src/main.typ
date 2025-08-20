

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
    tracking: 0.3pt,
    // font: "New Computer Modern",
    // tracking: 0.2pt,
    // size: 10pt,
    fill: palette.fg,
  )

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
    font: "JetBrains Mono",
    // font: "JetBrainsMonoNL NF",
    size: 9pt,
    )


  show figure.caption: set text(style: "italic")



  set par(
    justify: true,
    // first-line-indent: 1em,
    // leading: 0.6em,
  )

  // set heading(numbering: "1.")



  // Enumerates automatically the non-referenced equations.
  set math.equation(numbering: "(1)")
  show math.equation: it => {
      if it.block and not it.has("label") [
        #counter(math.equation).update(v => v - 1)
        #math.equation(it.body, block: true, numbering: none)#label("")
      ] else {
        it
      }
  }


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



  set align(center+horizon)
  text(weight: "bold", size: 17pt, title)

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


  pagebreak()
  set align(left+top)

  outline()


  // TODO Assign footnote top border depending on dark_theme value.
  // set footnote(stroke: red)



  // Makes a page break before every chapter (depth-1 heading).
  show outline: set heading(supplement: [Outline])
  show heading.where(depth: 1): it => {
    if it.supplement != [Outline] {
      pagebreak(weak: true)
    }
    it
  }




  set par(justify: true)
  doc
}





// Maths. TODO Try to put this in a separate file.
// ----------------------------------------------------------------------------------------



// Proposition
#let proposition(body, number: none, title: none) = {
  let display_number = if number != none { " " + number } else { "" }
  let display_title = if title != none { " (" + title + ")" } else { "" }
  set enum(numbering: "(i)")

  block(
    // breakable: false,
    width: 100%,
    fill: gradient.linear(palette.math_env_bg_from, palette.math_env_bg_to),
    inset: 8pt,
    radius: 4pt,
  )[
    #text(weight: "bold", style: "italic")[Proposición#display_number#display_title.]
    #body
  ]
}



// Theorem
#let theorem(body, number: none, title: none) = {
  let display_number = if number != none { " " + number } else { "" }
  let display_title = if title != none { " (" + title + ")" } else { "" }
  set enum(numbering: "(i)")

  block(
    // breakable: false,
    width: 100%,
    fill: gradient.linear(palette.math_env_bg_from, palette.math_env_bg_to),
    inset: 8pt,
    radius: 4pt,
  )[
    #text(weight: "bold", style: "italic")[Teorema#display_number#display_title.]
    #body
  ]
}




// Axiom
#let axiom(body, number: none, title: none) = {
  let display_number = if number != none { " " + number } else { "" }
  let display_title = if title != none { " (" + title + ")" } else { "" }
  set enum(numbering: "(i)")

  block(
    // breakable: false,
    width: 100%,
    fill: gradient.linear(palette.math_env_bg_from, palette.math_env_bg_to),
    inset: 8pt,
    radius: 4pt,
  )[
    #text(weight: "bold", style: "italic")[Axioma#display_number#display_title.]
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
  set enum(numbering: "(i)")

  block(
    // breakable: false,
    width: 100%,
    fill: gradient.linear(palette.euclid_ax_env_from, palette.euclid_ax_env_to),
    inset: 8pt,
    radius: 4pt,
  )[
    #text(weight: "bold", style: "italic")[Axioma P#number de Euclides#the_title.]
    #text[#it]
  ]
}




// Definition
#let definition(body, number: none, title: none) = {
  let display_number = if number != none { " " + number } else { "" }
  let display_title = if title != none { " (" + title + ")" } else { "" }
  set enum(numbering: "(i)")

  block(
    // breakable: false,
    width: 100%,
    fill: gradient.linear(palette.math_env_bg_from, palette.math_env_bg_to),
    inset: 8pt,
    radius: 4pt,
  )[
    #text(weight: "bold", style: "italic")[Definición#display_number#display_title.]
    #body
  ]
}




// Lemma
#let lemma(body, number: none, title: none) = {
  let display_number = if number != none { " " + number } else { "" }
  let display_title = if title != none { " (" + title + ")" } else { "" }
  set enum(numbering: "(i)")

  block(
    // breakable: false,
    width: 100%,
    fill: gradient.linear(palette.math_env_bg_from, palette.math_env_bg_to),
    inset: 8pt,
    radius: 4pt,
  )[
    #text(weight: "bold", style: "italic")[Lema#display_number#display_title.]
    #body
  ]
}




// Corollary
#let corollary(body, number: none, title: none) = {
  let display_number = if number != none { " " + number } else { "" }
  let display_title = if title != none { " (" + title + ")" } else { "" }
  set enum(numbering: "(i)")

  block(
    // breakable: false,
    width: 100%,
    fill: gradient.linear(palette.math_env_bg_from, palette.math_env_bg_to),
    inset: 8pt,
    radius: 4pt,
  )[
    #text(weight: "bold", style: "italic")[Corolario#display_number#display_title.]
    #body
  ]
}




// Example
#let example(body, number: none, title: none) = {
  let display_number = if number != none { " " + number } else { "" }
  let display_title = if title != none { " (" + title + ")" } else { "" }

  block[
    #text(weight: "bold", style: "italic")[Ejemplo#display_number#display_title.]
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
    #text(weight: "bold", style: "italic")[Ejercicio#display_number#display_title.]
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








