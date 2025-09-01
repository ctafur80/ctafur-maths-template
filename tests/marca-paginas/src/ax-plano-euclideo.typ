
#import "../template.typ": *




== 2.1. Introducción

Este capítulo se podría considerar el inicio del segundo bloque de la
asignatura: la geometría euclidea plana, es decir, en dos dimensiones (2D).

Al contrario que en el capítulo anterior (sobre espacios métricos), nos
encontramos en una geometría en particular.

Como se explica en la introducción del texto, se abordará esta geometría
desde un punto de vista _sintético_, en contraste con el enfoque
_analítico_, que es al que quizás esté más acostumbrado. A este resepecto,
en @venema, en lugar de "enfoque" o "punto de vista" dicen "modelo".

Como quizás ya sepa, la geometría analítica es la que hace uso de
coordenadas y, por tanto, se basa más en nuestro conocimiento del álgebra de
los números reales. La sintética, por su parte, prescinde del álgebra y se
basa en manipular expresiones conjuntistas en base a los axiomas. Es decir,
en la sintética se suele estar más en contacto con los axiomas#footnote[que
en la época de Euclides recibían la denominación de _postulados_], mientras
que, en la analítica, nos solemos encontrar a un nivel de abstracción
superior.

En cualquier caso, el enfoque sintético presentado aquí no llega a ser
"puro", pues hacemos uso de números reales y sus operaciones, tal y como se
muestra en el Axioma P3 (de la Regla Graduada).

Lo primero que debe saber es que los elementos de este espacio métrico (el
plano euclideo) reciben el nombre de _puntos_ (_points_), y se usa la
notación de los elementos para estos, es decir, cosas como $X in bold(P)$.
Otros conjuntos más complejos de elementos reciben, en general, la
designación de _figuras_ (_figures_). Evidentemente, verá cosas como $r
subset.eq bold(P)$ para las figuras.

De forma más general, a cualquier agrupación en el plano euclidiano, ya sea
una figura o un punto, o nada, a veces recibe la designación de _lugar
geométrico_ (_locus_). Este concepto se define en la pág. 35.




== 2.2 Recta

En la definición de _recta_ (pág. 23), el punto (i) se incluye para que un
conjunto formado por un único punto no cumpla las condiciones para ser una
recta.

Algo similar sucede con el punto (i) del Axioma P2 (pág. 24). De no
incluirlo, una recta podría ser todo el plano euclideo, $bold(P)$.

Se podría enunciar de forma menos simbólica ---y, por tanto, más prosaica---
la *Observación 2.3*: "Si los extremos de un segmento pertenecen a una
recta, entonces todo el segmento es parte de esta."

Una vez vista la Observación 2.3 y el Axioma P2, me gustaría aclarar las
relaciones que se dan entre pares (no ordenados) de puntos y los segmentos y
las rectas.

Dos puntos definen los extremos de un bsegmento. Esta relación es una
aplicación biyectiva. Dos puntos, también definen a una única recta, con lo
que se tiene una aplicación, pero esta no es inyectiva ya que se pueden
tener dos pares de puntos que definan a una misma recta.

Evidentemente, un segmento define también a una única recta ya que, al
mencionar a un segmento, es como si mencionáramos a dos puntos (por la
biyectividad).

Tal y como se explica en la *Observación 2.4* (pág. 24), en realidad en el
punto (ii) del Axioma $bold(P)$2 se podría haber limitado a decir que entre
dos puntos no coincidentes siempre hay (al menos) una recta; que sea única
es algo que se puede deducir y, por tanto, se podría haber presentado como
un teorema. Veamos la demostración de este.

#proof[
  Suponemos que existen dos rectas $r$ y $s$ que contienen a dos puntos $A,
  B in bold(P)$.

  Dado un punto arbitrario $X in bold(P)$ tal que $X in r$, por el punto
  (ii) de la Definición 2.2 (de Recta) se tiene que $A$, $B$ y $X$ están
  alineados.

  Desde otro punto de vista, sabemos que $A, B in s$. Entonces, por el punto
  (iii) de la Definición 2.2 (de Recta) tenemos que, como $A$, $B$ y $X$
  están alineados, se da que $X in s$. Con este razonamiento, hemos llegado
  a demostrar que $r subset.eq s$.

  De forma análoga, llegamos a demosrtar que $s subset.eq r$. Uniendo ambas,
  tenemos que $r = s$.
]

Por lo que explicamos antes sobre las relaciones entre pares de puntos y
segmentos y rectas, de este axioma se deduce también que que la recta que
contiene a un segmento es única. Se podría haber puesto quizás también como
corolario esta afirmación.

En lo que respecta a la *Definición 2.6* (de Rectas Secantes y Paralelas),
advierta que se admite que también se califica de _paralelas_ a dos rectas
coincidentes.

En cuanto al *Teorema 2.7*, creo que adolece de no hacer incapié en que esa
_o_ (disyunción) es exclusiva en este caso; y no inclusiva, como suele ser
habitual en matemáticas si no se especifica nada a este respecto.

Además, la demostración que da no llega a convencerme. Entre otras cosas,
faltaría por demostrar que no se puede dar el caso que no sean secantes ni
paralelas simultáneamente.

En cualquier caso, tengo claro, por el uso que hace posteriormente de este
teorema en algunas demostraciones, que se trata de una _o_ exclusiva. Yo lo
enunciaría del modo siguiente.

#theorem(title: "de las Posiciones Relativas de Dos Rectas")[
  Las dos únicas posiciones relativas que pueden tener dos rectas es ser
  secantes o bien ser paralelas (coincidentes o no coincidentes), pero no
  pueden ser ambas cosas simultáneamente así como ninguna.
]

/*
#theorem(title: "de las Posiciones Relativas de Dos Rectas")[
  Dos rectas tienen únicamente tres posiciones relativas entre sí: no se
  tocan en ningún punto (paralelas no coincidentes), se tocan en un único
  punto (secantes) o son la misma (paralelas y coincidentes). No pueden
  tener en común dos puntos, ni tres, etc.
]
*/

Para la demostración del teorema a mi manera, prefiero hacer un uso más
explícito de la lógica y la teoría de conjuntos.

#proof[
  Tenemos que demostrar que no se puede dar ninguno de los dos casos
  siguientes, para dos rectas cualesquiera $r$ y $s$:

  + Que sean secantes y paralelas.
  + Que no sean secantes ni paralelas.

  Vamos a hacer las dos demostraciones por el método de contradicción
  (también llamado _por reducción al absurdo_).

  Vamos a hacer uso de la lógica proposicional simbólica, para que queden
  claros los razonamientos. Tenemos las proposiciones siguientes:

  #[ #set align(center)
    #table(columns: 2, stroke: none, align: (right+bottom, left+bottom),
    inset: 3pt,
      [$p$:], [$r$ y $s$ no tienen ningún punto en común. Es decir, $r inter
        s = emptyset$],
      [$q$:], [$r$ y $s$ se cortan. Es decir, existe un único $X in bb(P)$
        tal que ${X} = r inter s$ siendo ${X} eq.not emptyset$.],
      [$m$:], [$r$ y $s$ son la misma (son coincidentes). Es decir, $r =
        s$.],
      [$n$:], [$r$ y $s$ son paralelas. Por definición del paralelismo de
        rectas, se tiene que $n arrow.long.double.l.r p or m$.]
    ) ]

  Caso 1. Nuestra hipótesis es que $r$ y $s$ se cortan y son paralelas. La
  hipótesis será, por tanto, para este caso, la siguiente:

  $ q and n arrow.long.double.l.r q and (p or m) arrow.long.double.l.r (q
  and m) or (q and p) $

  haciendo uso de la propiedad distributiva para los operadores conjunción y
  disyunción.

  Veamos si puede ser cierto esto. Por la definición de disyunción, con que
  se dé una de las dos proposiciones que une esta, bastaría para que fuese
  cierta la proposición global.

  Primero, $q and m$. Por un lado, $q$ impone ---entre otras cosas--- que
  existe un $X in r$ tal que $X in.not s$, pero esto se contradice con $m$
  ya que esta última dice ---entre otras cosas--- que, para todo $X in r$,
  $X in s$.

  Por la parte de $q and p$ es evidente que se contradicen y, por tanto, da
  falso como resultado.

  Por tanto, al ser ambas falsas, aun cuando estén unidas por una
  disyunción, la proposición general será siempre falsa.

  Caso 2. Nuestra hipótesis es que $r$ y $s$ no se cortan ni son paralelas.

  TKTK.
]

O sea, este teorema viene a decir que dos rectas tienen únicamente tres
posiciones relativas entre sí: no se tocan en ningún punto (paralelas no
coincidentes), se tocan en un único punto (secantes) o son la misma
(paralelas y coincidentes). No pueden tener en común únicamente dos puntos,
ni tres, etc.

Antes de seguir, me gustaría mencionar que quizás lo mejor sería considerar
que un segmento cuyos extremos son el mismo no es en realidad un segmento
sino un punto. Esto quizás nos facilitaría ciertas cosas. No se considera
así en el libro. Por cierto, esto tiene también relación con el punto medio
de un segmento, concepto que se define un poco después.

Ahora, nos podríamos preguntar sobre las posiciones relativas de una recta y
un segmento. Aquí, sí que hay más casos posibles de sus posiciones
relativas.

+ Se cortan. Un único punto en común.
+ La recta contiene al segmento. Es coincidente con la única recta que
  contiene al segmento. La recta contiene a sus extremos. Advierta que esto
  último solo es cierto si el segmento no es un punto.
+ Son paralelos. La recta es paralela a la recta que contiene al segmento.
+ No se cortan ni son paralelos. Aquí es distinto a las posiciones relativas
  entre dos rectas.

Si lo piensa, un segmento es un objeto (también llamado _figura_) más
complejo que una recta. De hecho, creo que se podría considerar a la recta
como la figura más básica después del punto.

Veamos otro resultado de las posiciones relativas de un segmento y una
recta.

// No me convence esto.

#theorem(number: none, title: none)[
  Sea un segmento $[A, B]$ siendo $A eq.not B$ y una recta $r$. Si $[A, B]
  inter r eq.not emptyset$, entonces $[A, B]$ y $r$ son secantes.
]

#proof[
  TKTK.


]

Una vez que se han presentado los conceptos de _rectas secantes_ y
_paralelas_, se puede deducir una consecuencia directa de la *Observación
2.3*.

#corollary(number: none, title: none)[
  Dada una recta y un segmento que no es un solo punto, si son secantes
  entonces también lo serán esta y la recta soporte del segmento.

  /*
  En $(bold(P), d)$, dado un segmento con extremos los puntos $A$ y $B$,
  $[A, B]$, siendo estos no coincidentes, y una recta $r$. Si se cortan $r$
  y $[A, B]$, entonces también se cortarán $r$ y la recta soporte de $[A,
  B]$.
  */
]

Lo cierto es que es algo muy evidente y entiendo perfectamente que no
aparezca este resultado en el libro.

#proof[
  Si se cortan $r$ y $[A, B]$, tienen un único punto en común, es decir,

  $ [A, B] inter r = {X} = X $

  Es evidente, al ser $A$ y $B$ no coincidentes, que habrá algún punto en
  $[A, B]$ que no esté en $r$ ya que hemos dicho que el punto de corte es
  uno solo, y este segmento contiene al menos a dos puntos. Entonces, por el
  Teorema 2.7 (de las Posiciones Relativas de Dos Rectas), no queda otra que
  r y $r_(A B)$ sean secantes, siendo $r_(A B)$ la recta soporte de $[A,
  B]$.

  /*
  Teniendo esto en cuenta y el th-rectas-sec-paralelas, se tiene que $r$ y
  $r_(A B)$ no pueden ser paralelas no coincidentes. Serán coincidentes o
  secantes. Pero en el caso general el segmento $[A, B]$ no estará
  constituido por un único punto, con lo que existirá algún $Y in [A, B]$
  tal que $Y in.not r$. Por tanto, $r$ y $r_(A B)$ no pueden ser
  coincidentes, con lo que serán secantes.
  */

  /*
  Por el teor-incl-segmentos-rectas tenemos que $T in r_(A B)$, con lo que,
  por el th-rectas-sec-paralelas, o bien $r$ y $r_(A B)$ se cortan o bien
  son coincidentes; no pueden ser paralelas no coincidentes. Pero, para que
  fuesen coincidentes, tendrían que contener a todos los mismos puntos, pero
  sabemos que hay puntos de $[A, B]$ que no están en $r$. Por tanto, $r$ y
  $r_(A B)$ son secantes.
  */
]

Advierta que lo contrario no tiene por qué ser cierto. Es decir, pueden
cortarse dos rectas pero no cortarse una de estas con un segmento incluido
en la otra. Esto es fácil de imaginar.

En lo que respecta al Axioma P3 (de la Regla Graduada), este es el que hace
que nuestro sistema de axiomas sea mixto (o que es el que "contamina" a la
geometría pura), al incluir los números reales y sus operaciones.

En lugar de como se presenta en el libro (pág. 25), se puede hacer uso del
concepto de _isometría_, tal y como hago a continuación.

#axiom(title: "P3 de Euclides (de la Regla Graduada)")[
  En $(bold(P), d)$, para toda recta $r subset.eq bold(P)$ existe una
  isometría $gamma: (r, d) arrow.r.long (RR, d')$ siendo $d'$ la distancia
  definida del modo siguiente, para cualesquiera $x, y in RR$,

  $ d'(x, y) = |x - y| $
] <ax-p3-euclides>

Ha de tener en cuenta que en realidad existen muchas de esas isometrías
$gamma$; es decir, muchas "reglas graduadas". Están todas sobre la recta
$r$, pero es como si, para cada posición de medida $0$ de la "regla
graduada" (_ruler_), se tuviese una isometría distinta. E incluso se doblará
el número de isometrías posibles al tener en cuenta que podemos cambiar el
sentido de la "regla". Advierta también que estas "reglas" son algo
especiales, pues tienen también marcados números negativos.

Por cierto, si se fija, $(r, d)$ es un espacio métrico inducido (*Teorema
1.4*) de $bold(P), d$ ya que $r subset.eq bold(P)$.

En cuanto al punto (i) de la *Observación 2.8*, se incluyen tanto un teorma
como una definición. Sería la definición del punto medio de un segmento.
Para esta se requiere de demostrar que dicho punto es único para cada
segmento.

En esta demostración, aunque no lo mencione, hace uso en varios puntos de
que $gamma$ es una biyección y, por tanto, también una inyección. Por
ejemplo, esto justifica que de $A eq.not B$ se tenga que $a eq.not b$.

Me gustaría explicar también cómo se puede llegar, por medio de
manipulaciones algebraicas, al último paso de la primera expresión
matemática que presenta.

$ |t - a| &= |t - b| \
  sqrt((t - a)^2) &= sqrt((t - b)^2) \
  (t - a)^2 &= (t - b)^2 \
  t^2 + a^2 - 2 t a &=  t^2 + b^2 - 2 t b \
  a^2 - 2 t a &=  b^2 - 2 t b \
  a^2 - b^2 &= 2 t a - 2 t b \
  (a + b)(a - b) &= 2 t (a - b) \
  a + b &= 2 t \
  t &= (a + b) / 2 $

Al ser $gamma$ una biyección, el valor $gamma^(-1) ((a+b)/2)$ es único, y lo
designamos por $M$.

Alternativamente, la manipulación algebraica anterior se podría haber
procedido por una manipulación más directa de los valores absolutos. Por
ejemplo, de $|t - a| = |t - b|$ tenemos dos resultados:

$ t - a &= t - b \
  t - a &= -(t - b) $

El primero nos conduce a la igualdad $a = b$, con lo que se tendría
entonces, por la inyectividad de $gamma$, a que $A = B$,cosa que contradice
la hipótesis de partida, por lo que descartamos este resultado. El otro nos
dará lo mismo que antes: $t = (a + b) \/ 2$.

La demostración del punto (ii) es muy parecida a la del punto (i).

#proof[
  Por ejemplo, usando las designaciones

  $ gamma (A') = x, quad gamma (A) = a, quad gamma (B) = b $

  deseamos demostrar que existe un único $A' in r$ para el que se cumple

  $ d(B, A) = d(B, A') $

  Al ser $gamma$ una isometría, se cumple que

  $ d(B, A)   &= d'(gamma (B), gamma (A)) = |b - a| \
    d(B, A')  &= d'(gamma (B), gamma (A')) = |b - x| $

  con lo que se tiene que

  $ |b - a| &= |b - x| $

  Mediante manipulaciones algebraicas similares a las del punto (i), se
  llega a

  $ x = 2b - a $

  con lo que $A' = gamma^(-1) (2b - a)$ será único por ser $gamma$
  biyectiva.

  A partir de esto, es fácil demostrar que $B = "medio"[A, A']$.
]

/*
#proof[
  Deseamos demostrar que existe un único $A' in r$ tal que

  $ d(B, A) = d(B, A') $

  Por comodidad, usaremos la notación

  $ gamma (A') = x, quad gamma (A) = a, quad gamma (B) = b $

  ya que vamos a usar la isometría $gamma$ del Axioma P3 de Euclides. Al ser
  una isometría, se cumple que

  $ d(B, A)   &= d'(gamma (B), gamma (A)) = |b - a| \
    d(B, A')  &= d'(gamma (B), gamma (A')) = |b - x| $

  Vamos a suponer que se da la conclusión a la que deseamos llegar y, en ese
  caso, a ver qué valor o valores nos daría la variable $x$.

  $ d(B, A) &= d(B, A') \
    |b - a| &= |b - x| $

  Por un lado, se tiene que

  $ b - a &= b - x \
    a     &= x $

  pero esto, por la biyección de $gamma^(-1)$, nos conduce a que $A = A'$,
  cosa que contradice la hipótesis de partida. Por lo tanto desechamos este
  resultado. Por otro lado, se tiene que

  $ b - a &= x - b \
    x     &= 2b - a $

  Al ser $gamma^(-1)$ una biyección, habrá un único punto $A'$ de $bb(P)$
  tal que $A' = gamma^(-1) (x) = gamma^(-1) (2b - a)$.

  Entonces,

  $ d(B, A') &= |b - x| = |b - (2b - a)| = |a - b| = d(A, B) = d(B, A) $

  con lo que $B = "medio"[A, A']$ tal y como deseábamos demostrar.
]
*/

En esta definición, se debe hacer cierta puntualización para analizar el
caso extremo en el que los extremos sean el mismo punto, es decir, para
definir $"medio"[A, A]$ para un $A in bold(P)$.

No basta con definirlo como el punto equidistante de los extremos, en la
recta $r$, pues, en este caso extremo, esto es algo que se cumpla para todos
los puntos de $r$. Hay que tener también en cuenta que ese pundo debe
encontrarse en el segmento; en este caso, en $[A, A]$. Esto nos conduce a
una única solución:

$ "medio"[A, A] = A $

ya que el único punto en $[A, A]$ es el propio $A$. Al hacerlo así, no tiene
por qué establecerse esta igualdad por convenio, como se hace en el texto.

Tal y como expliqué antes, si excluyésemos este caso "degenerado" de la
definición de _segmento_, no tendríamos este problema.

En lo que respecta a la definición de _semirrecta_ (pág. 26), advierta que
el punto que se usa para hacer esa separación no se encuentra en ninguna de
las dos semirrectas.

/*
Advierta que la demostración de la *Observación 2.10* se hace con signos de
equivalencia, '$arrow.l.r.long.double$', por lo que sirve para las dos
demostraciones que se desean hacer, es decir, en los dos sentidos. Esto lo
hace en muchas de las demostraciones del texto.
*/




== 2.3. Semiplanos

En lo que respecta a los semiplanos, que se presentan en el Axioma
$bold(P)$4, antes de pasar a ver sus propiedades, presentadas en el *Teorema
2.12*, hay un resultado que me gustaría presentar y que se deduce
directamente de este y que se usa en muchas demostraciones. Sería
básicamente el recíproco del punto (3) de este.

#theorem(title: "Ampliación del Punto (3) del Axioma $bold(P)$4")[
  Dados $X, Y in bold(P) without r$ siendo $X eq.not Y$. Si $[X, Y] inter r
  eq.not emptyset$, entonces $X$ e $Y$ se encuentran en semiplanos
  distintos.
]

Este teorema se enuncia al final de la demostración de la propiedad (4)
(Teorema 2.12), pero no lo demuestran.

#proof[
  Este se deduce de los puntos (1) y (2) del Axioma $bold(P)$4.

  De $[X, Y] inter r eq.not emptyset$ se tiene que existe un punto $U in r$
  tal que $U in [X, Y]$. Al encontrarse en $r$, se tiene, como consecuencia
  del punto (1), que $U in.not H^1$ y $U in.not H^2$. De esto se tiene que
  $[X, Y] subset.eq.not H^i$ para $i = 1, 2$. Entonces, por el (condicional
  contrarrecíproco del) punto (2) del Axioma, se tiene que $X$ e $Y$ se
  encuentran en semiplanos distintos.
]

Veamos algunas observaciones del *Teorema 2.12* (Propiedades de los
Semiplanos). En la (4), el primer paso se justifica concretamente por el
punto (i) del Axioma $bold(P)$2.

// Quizás lo siguiente no haga falta.

Creo que se debería justificar que $C in bold(P) without r$. Como $r$ y la
única recta que pasa por $A$ y $B$ tienen en común a $B$ pero no a $A$ ---ya
que $A in H^1$---, por el Teorema 2.7 (de las Posiciones Relativas de Dos
Rectas) se tendrá que son secantes, con lo que se tiene que $C in.not r$ y,
por tanto, $C in bold(P) without r$.

Tras esto, basta con aplicar el Teorema Ampliación del Punto (3) del Axioma
$bold(P)$4.

La propiedad (6) sería como un teorema de caracterización de los semiplanos.
En cuanto a su demostración, advierta que, tal y como hemos comentado
anteriormente, esos bicondicionales permiten ir en las dos direcciones en la
demostración. Por tanto, en esta ---aunque quizás no lo parezca--- se están
demostrando las dos inclusiones de la igualdad que se desea demostrar;
$subset.eq$ y $supset.eq$. Creo que, al ir de derecha a izquierda, nos
podemos saltar el paso intermedio.

En la demostración del *Teorema 2.16* ("Axioma" de Pasch), determina que los
extremos de los lados están en $H^1$, pues es algo que se puede hacer sin
pérdida de generalidad.

Me gustaría aclarar también el último paso de esta. Llegamos a obtener $[P,
Q] subset.eq H^1$. A partir de esto, si tenemos en cuenta el punto (1) del
Axioma $bold(P)$4, tenemos que para todo $X in [P, Q]$ se tiene que $X
in.not r$, o, lo que es lo mismo, no existe $X in [P, Q]$ tal que $X in r$,
cosa que contradice la hipótesis de la que partimos.




== Axiomas sobre isometrías

El *Teorema 2.18* engloba a varios en realidad. Además, de la conservación
de segmentos por isometría, se deduce de forma directa la conservación de
alineaciones, cosa que es evidente ya que, por la definición de la
alineación de tres puntos, uno estará en el segmento determinado por los
otros dos. Quizás hubiera estado mejor que lo enunciaran también fuera de la
demostración.

Me resulta bastante críptica la presentación de este teorema, al tratar de
llevar al extremo el uso de la simbología matemática. A continuación lo
presento con más prosa; creo que sirve un poco para aclararlo.

#theorem(title: "de Conservaciones de Figuras por Isometrías")[
  Sean $A, B in bold(P)$, $g in "Isom"(bold(P), d)$ y usando la notación de
  prima para un elemento transformado, por ejemplo, $X' = g(X)$ para un
  punto $X in bold(P)$, se tiene:

  + El conjunto transformado por una isometría de un segmento es un segmento
    cuyos extremos son los puntos transformados de los extremos del
    original. Es decir,

    $ g([A, B]) = [g(A), g(B)] $

  + Si tres puntos están alineados, entonces sus transformados por una
    isometría también están alineados entre sí.

  + El conjunto transformado por una isometría de la (única) recta que pasa
    por dos puntos es la única recta que pasa por los transformados de esos
    dos puntos. Es decir,

    $ g(r_(A B)) = r_(A' B') $

  + Los conjuntos transformados por una isometría de los semiplanos
    determinados a partir de una recta son los semiplanos que define la
    recta transformada de la original. Es decir, para los semiplanos $H_r^1$
    y $H_r^2$ determinados a partir de una recta $r$, se tiene que

    $ g({H_r^1, H_r^2}) = {H_(r')^1, H_(r')^2} $
]

Advierta que en estas demostraciones hay que ir en los dos sentidos, como se
hizo antes. Así, demostramos tanto la parte $subset.eq$ como $supset.eq$.

También, debe tener en cuenta que en las distintas demostraciones se hace
uso también de los puntos anteriores de la misma.

Me gustaría aclarar algo de la primera de las demostraciones, pero que sirve
para las demás. En las demostraciones se usan equivalencias, o, lo que es lo
mismo, bicondicionales, por lo que, como hemos dicho, se puede leer en los
dos sentidos: de izquierda a derecha y también de derecha a izquierda. Así
se demuestra escribiéndolo una sola vez. El problema que le encuentro es que
creo que falta una equivalencia a la izquierda de todo, para que quede más
claro. Lo pongo para la primera de estas demostraciones:

$ g(X) in g([A, B]) quad arrow.l.r.long.double quad X in [A, B] $

Así, tiene sentido aplicar la definición de _subconjunto_.

// Quizás para lo anterior haya que decir que se debe a que $g$ es
// biyectiva.

También, en la demostración del último punto (el de los semiplanos), se usa
un resultado de la teoría de conjuntos que no se explica en el texto. En
concreto, se trata de la primera equivalencia que se presenta. Partimos de

$ [X, Y] inter r_(A B) = emptyset $

Haciendo la isometría, tenemos

$ g([X, Y] inter r_(A B)) = g(emptyset) $

Por un lado, se tiene que $g(emptyset) = emptyset$, por las propiedades de
las aplicaciones. Por otro, por las propiedades de las aplicaciones
inyectivas, se tiene que

$ g([X, Y] inter r_(A B)) = g([X, Y]) inter g(r_(A B)) $

Si no le convence con simplemente mencionarlo, en el Apéndice TKTK presento
este teorema, junto con otros que usa como base, con sus demostraciones
respectivas, aunque esta materia pertenecería a la teoría de conjuntos.

Existen otros resultados de conservación por isometrías que no se presentan
en el texto pero que creo que son relevantes para tener como herramientas
para otras demostraciones o problemas.

Por ejemplo, uno viene a decir que, dado un segmento, el transformado por
una isometría de su punto medio es el punto medio de su segmento
transformado. O, de forma más simbólica, como expresamos a continuación.

#theorem(title: "de la Conservación del Punto Medio de un Segmento por Isometría")[
  Dado un segmento $[A, B]$ y una isometría $g in "Isom"(bold(P), d)$, se
  tiene que

  $ g("medio"[A, B]) = "medio"[g(A), g(B)] $
]

#proof[
  Primero, demostraremos la parte $subset.eq$.

  Por la conservación de segmentos por isometrías, es decir, de la primera
  parte del *Teorema 2.18*, se tiene que $g(M) in [A', B']$. Le recuerdo que
  usamos la notación $X' = g(X)$ para un punto cualquiera $X in bold(P)$, al
  igual que se hace en el libro.

  Por la conservación de distancias en $g$ se tiene que

  $ d(M, A) = d(g(M), A') \
    d(M, B) = d(g(M), B') $

  Además, por la definición de _punto medio de un segmento_, se tiene que

  $ d(M, A) = d(M, B) $

  con lo que tenemos que

  $ d(g(M), A') = d(g(M), B') $

  pero esto es la condición para que $g(M) = "medio"[A', B']$. Por cierto,
  aunque es evidente, deseo aclarar que, como $[A', B']$ es un segmento, tal
  y como se muestra en el Teorema 2.18, el punto que equidista de sus
  extremos será único, por la Observación 2.8 (i).

  Ahora, demostraremos la parte $supset.eq$, es decir

  $ "medio"[A', B'] subset.eq g("medio"[A, B]) $

  Partimos de $g(M) = "medio"[A', B']$. Por la definición del _punto medio
  de un segmento_, se tiene que

  $ d(g(M), A') = d(g(M), B') $

  Por ser $g$ una isometría, se tiene que

  $ d(g(M), A') = d(M, A) \
    d(g(M), B') = d(M, B) $

  Además, por la inyectividad de las isometrías, ese $M$ es único. De lo
  anterior tenemos que

  $ d(M, A) = d(M, B) $

  Por tanto,

  $ M = "medio"[A, B] $

  y, entonces,

  $ g(M) = g("medio"[A, B]) $
]

/* Resultado general de la teoría de conjuntos. Dada una expresión
* conjuntista $A = B$ y una aplicación $f$, se tiene que $f(A) = f(B)$. Si
* se tratase, en general, de una relación, esto no tendría por qué ser
* cierto.
*/

Podría haber presentado esta demostración en el estilo del libro, es decir,
encadenando bicondicionales, $arrow.l.r.long.double$, pero deseo que quede
al menos una explicación con mayor detalle, por si el lector no las
entiende.

Alternativamente, se podría haber usado el Axioma P3 para esta demostración.

Ahora, veamos un resultado de las isometrías para dos rectas secantes. Viene
a decir que, dadas dos rectas secantes, su transformada por una isometría
son dos rectas secantes cuyo punto de corte es el punto transformado por la
isometría del punto de corte de las mismas.

#theorem(title: "de la Isometría de Dos Rectas Secantes")[
  Dadas dos rectas $r$ y $s$ secantes con punto de corte $V in bold(P)$ y
  una isometría $g in "Isom"(bold(R), d)$, se tiene que

  $ g(r) inter g(s) = g(V) $
]

#proof[
  Lo primero que debe comprobarse es que $g(r)$ y $g(s)$ son rectas, por el
  Teorema 2.18.

  Evidentemente, $g(V) in g(r) inter g(s)$, ya que, por ejemplo, por darse
  $V in r$, se tiene que $g(V) in g(r)$.

  De $V in r inter s$ se deduce que $V in r$ y $V in s$, y, de esto, a su
  vez, que $g(V) in g(r)$ y $g(V) in g(r)$, o, lo que es lo mismo, $g(V) in
  g(r) inter g(s)$.

  Al tener $g(r)$ y $g(s)$ al menos un punto en común, no pueden ser
  paralelas no coincidentes; aunque sí pueden ser coincidentes. Veamos que
  no es así.

  Supongamos que existe, además de $g(V)$, otro punto $Z in g(r) inter
  g(s)$. Esto es lo mismo que afirmar que $Z in g(r)$ y $Z in g(s)$.

  Por ser $g$ una biyección, existe un único punto $Z_1$ que pertenece a $r$
  y a $s$ tal que $g(Z_1) = Z$. Pero esto es un problema puesto que tenemos
  dos puntos, $V$ y $Z_1$, que pertenecen a la intersección de $r$ y $s$,
  cosa que contradice la hipótesis de partida, es decir, que las dos rectas
  son secantes.
]

#theorem(title: "de las Isometrías de Semirrectas")[
  Dada una isometría $g in "Isom"(bold(P), d)$ y una de las semirrectas
  $dash(r)$ con etremo el punto $V$ en la recta $r$, se tiene que
  $g(dash(r))$ es una de las semirrectas definidas por el punto $g(V)$ en la
  recta $g(r)$.
]

Terminar de copiar de los otros apuntes. TKTK.

En cuanto a la *Definición 2.19* (pág. 33), creo que también se puede
afirmar la simetría de la congruencia de figuras. Es decir, podemos
continuar con esa definición y afirmar que, por ser $g$ biyectiva, se tiene
que para todo $X', Y' in cal(F)_2$ se tienen $X = g^(-1) (X)$ e $Y = g^(-1)
(Y)$ tales que $X, Y in cal(F)_1$.

En la demostración del *Lema 2.21* (pág. 33)), la primera igualdad que
aparece podemos justificarla aquí con el Teorema de la Conservación del
Punto Medio de un Segmento por Isometría, presentado aquí anteriormente.

Me da la sensación de que, llegado a este punto del libro, se salta algunos
pasos en las demostraciones. Esto va a más en el capítulo siguiente, y, de
hecho, se menciona al comienzo de dicho capítulo.

En cualquier caso, por aclarar las cosas, me gustaría presentar una
demostración más completa del *Teorema 2.22*. No obstante, a partir de aquí
me adaptaré al estilo del libro y únicamente mencionaré las cosas que no
quedan claras y los pasos que creo que pueden ser difíciles de intuir.

#proof[
  Dado un $A in bold(P)$ tal que $A in H^1$, hacemos su reflexión de eje
  $r$, $A' = sigma (A)$.

  Por el Lema 2.21, sabemos que $"medio"[A, A'] in r$; lo designaremos por
  $M$. Al contrario de lo que se afirma en la demostración del libro, aún no
  sabemos si se cortan, pues el lema no lo dice. Veamos por qué se cortan.

  TKTK.



  Al pertenecer $A$ a $H^1$, por el punto (1) del Axioma $bold(P)$4 se tiene
  que todo punto de $H^1$ está fuera de $r$. Por tanto, $A in.not r$.


  como tenemos un
  punto, $M$ que pertenece tanto a $r$ como a $s$ y un punto $A$ que
  pertenece a $s$ pero no a $r$, ambas rectas, es decir, $r$ y $s$, serán
  secantes, por aplicación del Teorema 2.7 (de las Posiciones Relativas de
  Dos Rectas). Entonces, también serán secantes el segmento $[A, A']$ y la
  recta $r$, es decir, se cumple que $[A, A'] inter r eq.not emptyset$.
  Aplicando ahora el Teorema Ampliación del Punto (3) del Axioma $bold(P)$4,
  tenemos que, como $A in H^1$, no queda otra más que $A' in H^2$.


  Por la Observación 2.3 y el punto (ii) del Axioma $bold(P)$2 (incluyendo
  la unicidad), sabemos que existe una única recta que contiene al segmento
  $[A, A']$. La designaremos por $s$.

  Al pertenecer $A$ a $H^1$, por el punto (1) del Axioma $bold(P)$4 se tiene
  que todo punto de $H^1$ está fuera de $r$. Por tanto, como tenemos un
  punto, $M$ que pertenece tanto a $r$ como a $s$ y un punto $A$ que
  pertenece a $s$ pero no a $r$, ambas rectas, es decir, $r$ y $s$, serán
  secantes, por aplicación del Teorema 2.7 (de las Posiciones Relativas de
  Dos Rectas). Entonces, también serán secantes el segmento $[A, A']$ y la
  recta $r$, es decir, se cumple que $[A, A'] inter r eq.not emptyset$.
  Aplicando ahora el Teorema Ampliación del Punto (3) del Axioma $bold(P)$4,
  tenemos que, como $A in H^1$, no queda otra más que $A' in H^2$.

  Ahora, nos fijaremos en que, por el punto (1) de la definición de
  _reflexión axial_, se tiene que $sigma(r) = r$. Aplicando entonces la
  última parte del Teorema 2.18 ---la que trata sobre los semiplanos---,
  tenemos que $H^1$ y $H^2$ son los semiplanos determinados por $sigma(r)$.
  Entonces, quedarían dos posibilidades únicamente: que los semiplanos
  transformados sean los mismos o que se intercambien. Del resultado
  anterior, es decir, de que si $A in H^1$ entonces $A' in H^2$, se tiene
  que se intercambian siempre, es decir,

  $ sigma(H^1) = H^2; quad sigma(H^2) = H^1 $
]











/*
Algo que creo que se puede afirmar sobre las isometrías es que, mediante
estas, todo punto se transforma en un único punto. Al ser una aplicación,
esto debe ser así.
*/


