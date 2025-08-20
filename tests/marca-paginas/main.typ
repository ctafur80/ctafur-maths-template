

#import "./main-template.typ": *





// Filling the `templ-book-typ` template data.
#show: templ.with(
  sheet: "tablet",
  lang: "es",
  title: [Apuntes de Geometría Básica],
  authors: (
    (
      name: "Carlos E. Tafur Egido",
      affiliation: "Artos Institute",
      email: "tung@artos.edu",
    ),
    (
      name: "Eugene Deklan",
      affiliation: "Honduras State",
      email: "e.deklan@hstate.hn",
    ),
  ),
  abstract: [
    Apuntes de la asignatura Geometría Básica del primer curso del grado
    universitario de matemáticas de la Universidad Nacional de Educación a
    Distancia (UNED).
  ],
)





// TODO When I put it in templ-book file it doesn't make any effect.
// Updating the counters by sections
#show heading.where(level: 1): it => {
  // pagebreak()
  counter("proposition").update(0)
  counter("theorem").update(0)
  counter("example").update(0)
  counter("lemma").update(0)
  counter("corollary").update(0)
  counter("exercise").update(0)
  counter("axiom").update(0)
  counter("deffinition").update(0)
  it
}







// ----------------------------------------------------------------------------



= Introducción
#include("fuentes/introduccion.typ")


= Capítulo 1. Espacios métricos
<ch-espacios-metricos>
#include("fuentes/espacios-metricos.typ")



= Capítulo 2. Axiomas del plano euclideo
<ch-axiomas-plano-euclideo>
#include("fuentes/ax-plano-euclideo.typ")






// #set par(justify: false)
#bibliography("./bibliografia.yml", style: "chicago-author-date")






