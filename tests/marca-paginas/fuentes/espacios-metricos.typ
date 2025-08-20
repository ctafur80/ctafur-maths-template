
#import "../main-template.typ": *






// -------------------------------------------------------------------------
#new_page(11)

#diversion[
  Este capítulo es algo distinto a los demás. Trata conceptos geométricos
  generales, válidos para todas las geometrías. En el siguiente ya nos
  introducimos en la geometría euclidiana, que será la que usemos a lo largo
  de todo el libro, con la excepción de una pequeña incursión que hacemos en
  la geometría hiperbólica en el Capítulo 9.

  En los capítulos de la geometría euclidiana, algunos de los conceptos que
  se dan son también generales para todas las geometrías y, por tanto, se
  podrían haber presentado en este capítulo, perfectamente. Sin embargo, se
  ha optado por dispersar en distintos capítulos las definiciones relativas
  a los espacios métricos (es decir, generales para cualquier geometría),
  para que resulte más "digerible" para el lector.
]

Algo que debe tener en cuenta es que, en este capítulo, algunos de los
ejemplos solo se plantean, sin resolverlos, y se presentan al final del
mismo como ejercicios.

En lo que respecta a la *Definición 1.1 (de Métrica)*, me gusta más la
siguiente, ya que me parece más "elegante".

#definition(title: "Métrica o Distancia")[
  Dado un conjunto $bold(P)$ no vacío, una _métrica_ o _distancia_ es toda
  aplicación $d: bold(P) times bold(P) arrow.r.long bb(R)^+ union {0}$ en la
  que para cualesquiera $x, y, z in bold(P)$ se cumple:

  #[ #set enum(numbering: "(i)")
  + $d (x, y) = 0$ si y solo si $x = y$.
  + $d (x, y) = d (y, x)$. (Simetría.)
  + $d (x, y) lt.eq d(x, z) + d(z, y)$. (Desigualdad triangular.)
  ]
] <def-metrica>

La definición que dan en el libro establece como codominio a todo $bb(R)$ y
luego hace una corrección de este en el punto (i). Quizás se deba a que
resulta más cómoda si se desea comprobar punto por punto, en los ejercicios,
demostraciones, etc.

Lo único es que, con la mía, hay que tener cuidado para ciertas cosas. Por
ejemplo, para demostrar el paso que si $d (x, y) = 0$ entonces $x = y$.
Conviene hacerlo con el condicional contrarrecíproco, que sería lo mismo que
en la definición del libro.




// -------------------------------------------------------------------------
#new_page(12)

El *Ejemplo 1.2* es lo mismo que el *Ejercicio 1.2* (pág. 17 con la solución
en la pág. 256). Se obvian los primeros puntos de la Definición 1.1 (de
Métrica), pero aquí los presentamos para que esté más completo. (Usaremos la
Definición 1.1 (de Métrica) presentada en estos apuntes.)

Advierta que las coordenadas que se usan en este ejercicio son distintas a
las que está acostumbrado de otras asignaturas donde se toca la geometría
(euclidiana) analítica. En estas lo normal es usar coordenadas del tipo

$ u = (x_1, y_1), quad v = (x_2, y_2) $

en lugar de

$ x = (x_1, x_2), quad y = (y_1, y_2) $

Lo primero será ver que $bb(R)^2$ es no vacío, cosa que sabemos
perfectamente, por tratarse de un conjunto que conocemos. Por ejemplo,
contiene al elemento $(0, 0)$.

Luego, se debe comprobar que el rango de la función $d_E$ se encuentra en
$bb(R)^+ union {0}$. Esto es fácil de ver por la fórmula de la función pues
todo lo que esté elevado al cuadrado producirá un valor mayor o igual que
$0$. La suma de esos valores también lo será y, a su vez, la raíz cuadrada
de esa suma.

Del punto 1, es trivial ver que si $x = y$ entonces $d_E (x, y) = 0$, con
una argumentación similar a la anterior. Más complicado es el otro
condicional, es decir, que de $d_E (x, y) = 0$ se deduce que $x = y$. Es más
cómodo hacerlo mediante su condicional contrarrecíproco, es decir, que de $x
eq.not y$ se deduce que $d_E (x, y) eq.not 0$. Habría que ver los tres casos
posibles en los que se da el antecedente, es decir, $x eq.not y$:

+ $x_1 eq.not y_1$, $x_2 eq.not y_2$.
+ $x_1 eq.not y_1$, $x_2 = y_2$.
+ $x_1 = y_1$, $x_2 eq.not y_2$.

En todos y cada uno de estos casos, se tiene que al menos una de las
subexpresiones $(x_i - y_i)^2$ para algún $i$ que valga $1$ o $2$, será
mayor estricto que $0$; cosa que sabemos que sucede con la función potencia
de exponente $2$. Entonces, en cualquier caso, se tendrá que alguna de estas
contribuye con un valor mayor estricto que $0$; la otra, como poco, con $0$.
La suma será entonces mayor estricto que $0$ y su raíz, evidentemente,
también lo será.


/*
$ d_E (x, x) = sqrt((x_1 - x_1)^2 + (x_2 - x_2)^2) = sqrt(0^2 + 0^2) =
sqrt(0) = 0 $

Si $x eq.not y$, tenemos una de las tres situaciones siguientes:

+ $x_1 = y_1$ y $x_2 eq.not y_2$.
+ $x_1 eq.not y_1$ y $x_2 = y_2$.
+ $x_1 eq.not y_1$ y $x_2 eq.not y_2$.

En cualquiera de los casos, habrá, para algún $i = 1, 2$, un $x_i - y_i
eq.not 0$ y, por tanto, un $(x_i - y_i)^2 > 0$. Por tanto, en esos tres
casos, se tiene que $d_E (x, y) > 0$.
*/

Punto 2.

$ d_E (x, y)
  &= sqrt((x_1 - y_1)^2 + (x_2 - y_2)^2) \
  &= sqrt(1 (x_1 - y_1)^2 + 1 (x_2 - y_2)^2) \
  &= sqrt((-1)^2 (x_1 - y_1)^2 + (-1)^2 (x_2 - y_2)^2) \
  &= sqrt([(-1) (x_1 - y_1)]^2 + [(-1) (x_2 - y_2)]^2) \
  &= sqrt((y_1 - x_1)^2 + (y_2 - x_2)^2) \
  &= d_E (y, x) $

En cuanto al *Ejemplo 1.3*, lo más relevante está en que nos podemos basar
en la desigualdad triangular en $(bb(R), +)$ para demostrar que se cumple el
punto 3 en la definición de _métrica_. Esta se da como conocimiento básico,
es decir, como prerrequisito.

Aunque el *Teorema 1.4 (de la Métrica Inducida)* pueda parecer más bien una
definición, en realidad lo que viene a explicar es que la restricción del
dominio de un espacio métrico es siempre un espacio métrico. A este se le
suele llamar _espacio métrico inducido_, y, a esa métrica, _métrica
inducida_. También se podía haber optado por llamarlo _espacio métrico
restringido_.

Para entender esto, además de conocer el concepto de _espacio métrico_, debe
saber qué es una _restricción_ de una aplicación, cosa que se estudia
normalmente en asignaturas de lógica y teoría de conjuntos.

En cuanto a la notación, se podría usar también la notación usual para la
restricción de una aplicación, que en este caso sería algo como $delta |_(M'
times M')$, para $M' subset.eq M$.

La nueva función se comporta del mismo modo que la vieja, solo que en un
dominio más restringido.

$ delta : && M times M & arrow.r.long     && bb(R) \
          && (x, y)    & arrow.r.bar.long && delta (x, y) $

mientras que

$ delta |_(M' times M') :
    && M' times M' & arrow.r.long
      && bb(R) \
    && (x, y)      & arrow.r.bar.long
      && delta |_(M' times M') (x, y) = delta (x, y) $

En la demostración de este teorema, creo que, por hacerla más completa,
quizás se debería comentar también que que ninguna de las propiedades de la
Definición 1.1 (de Métrica) es del tipo cierre (_closure_).




// -------------------------------------------------------------------------
#new_page(13)

*Definición 1.5*. Alternativamente a como se define el concepto de
_isometría_, podríamos definirla como

$ g : med (M, delta) arrow.r.long (M', delta') $

Y, de hecho, en el libro se usa esta notación un poco después, en la
*Definición 1.8*. En el fondo, la que usa el libro se refiere de forma
implícita a esta. En su definición se entiende de forma tácita cuáles son
las métricas en cada uno de los conjuntos.



*Teorema 1.7*. En la demostración, creo que obvia demasiados puntos.
Básicamente, solo muestra las transformaciones que conducen a la
conservación de distancias en estas nuevas relaciones, pero se deja todo lo
relacionado con la teoría de conjuntos. Los hechos que faltan se basan en
algunos resultados sobre las aplicaciones. Puede consultarlos en pineda
(TKTK) (pág. 104-105). Concretamente, el 3.59 (de Caracterización de una
Aplicación Biyectiva) y 3.60.

Veamos primero la demostración de la inversa, $g^(-1)$. La relación inversa
de $g$ será una aplicación biyectiva, al serlo también $g$. Además, se
tienen

$ g^(-1) compose g = "id"_M, quad
  g compose g^(-1) = "id"_(M') $

Esta última es la que se usa en la parte en la que demuestra que se
conservan las distancias. Pero debería explicarse también que, al ser
$g^(-1)$ una aplicación biyectiva, los valores tanto de $g^(-1) (u)$ como de
$g^(-1) (v)$ son únicos por la inyectividad, y, además, el rango de valores
que producen abarcan a todo $M$, por la suprayectividad.

Ahora, pasemos a la demostración de la composición. Lo primero, sería ver si
tiene sentido la composición de esas dos aplicaciones, $h compose g$. Como
sabemos de la teoría de conjuntos, $"Im"(g) subset.eq "Dom"(h)$ es un
requisito para esto. En nuestro caso concreto se cumple ya que tenemos que
$"Im"(g) = "Dom"(h)$.

También, debería explicarse que, al ser tanto $g$ como $h$ biyectivas, se
tiene que $h compose g$ será también biyectiva, con lo que todo valor $x in
M$ producirá un único valor de $M''$ por $h compose g$ (por la
inyectividad), y los valores producidos abarcarán a todo $M''$ (por la
suprayectividad).


En la *Definición 1.8*, también se puede usar una notación más explícita, al
igual que sucede con lo que dijimos antes sobre la definición de
_isometría_. En este caso, sería '$"Isom"(M, delta)$'.


En cuanto a las propiedades presentadas al final de la página, las dos
primeras son casos particulares del Teorema 1.7. Por su parte, la
demostración del punto 3 es trivial.




// -------------------------------------------------------------------------
#new_page(14)

La *Nota 1.9* viene a decir que la estructura $("Isom"(M, delta), compose)$
es un grupo (_group_), siendo '$compose$' la composición de aplicaciones. Se
le suele llamar también _grupo de isometrías_ $("Isom"(M, delta), compose)$,
o, abreviadamente, $(M, delta)$.

Es fácil demostrar que se cumplen esas tres propiedades que la hacen un
grupo. La propiedad asociativa (la primera que menciona) se cumple por
cumplirse esta, en general, para todas las aplicaciones. La del elemento
neutro (la segunda) es la propiedad identidad mencionada en el punto 3 de
las propiedades anteriores. La del elemento simétrico (la tercera) es
también sencilla: se tiene que la simétrica de una isometría será su
aplicación inversa (o, lo que es lo mismo, su simétrica respecto a la
composición).

Muchas veces, en lugar del operador '$compose$' se usa uno análogo al de la
multiplicación de números, es decir, '$dot.op$' o la notación en aposición.
De hecho, a la composición de aplicaciones muchas veces se la llama también
_producto_, de ahí que también se ponga '$1$' por '$"id"$', como aparece en
el texto.




// -------------------------------------------------------------------------
#new_page(15)

*Ejemplo 1.11*. En realidad, creo que la forma de definir $delta_G$ no es
muy precisa. Sería mejor "la menor de las posibles longitudes".

Algo interesante es demostrar también por qué la aplicación

$ delta_G = "Distancia máxima entre" p med "y" med q $

no es una métrica. Una razón es que puede darse $delta (x, x) > 0$ para
algún $x in G$, cosa que invalida el punto 1 de la Definición 1.1 (de
Métrica).




// -------------------------------------------------------------------------
#new_page(16)

La *Definición. 1.12* en realidad está definiendo dos cosas: (i) segmento y
(ii) tres puntos alineados. Además de llamarlo "segmento de extremos $a$ y
$b$", también se le suele llamar "segmento $a$ $b$".

Por cierto, se podría pensar en el concepto de _segmento_ como en una
generalización del de _intervalo_ de $(bb(R)), +, dot.op$.

En la definición de _puntos alineados_, se podría explicar también que esto
está relacionado con el concepto de _recta_, que se define en el capítulo
siguiente. Si tres elementos están alineados, también se dice que son
_colineales_.




// -------------------------------------------------------------------------
#new_page(17)

La demostración del punto (i) de la *Ovservación 1.13* es, en su estructura,
similar a muchas otras que aparecen a lo largo de todo el texto. Debe tener
en cuenta que esos bicondicionales sirven para ir en los dos sentidos; es
decir, en esta demostración en concreto, si la leemos de izquierda a derecha
estaremos demostrando que $[a, a] subset.eq {a}$. Si se va en el otro
sentido, que $[a, a] supset.eq {a}$, o, lo que es lo mismo, que ${a}
subset.eq [a, a]$.



*Ejercicio 1.3*. Debe tener cuidado con la demostración de la desigualdad
triangular:

$ delta (a, b) lt.eq delta (a, c) + delta (c, b) $

De las $8$ formas de combinar las igualdades o negaciones de estas, los
casos siguientes no se pueden dar por incompatibilidad de TKTK:

+ $a = b$, $a = c$ y $b eq.not c$.
+ $a = b$, $a eq.not c$ y $b = c$.
+ $a eq.not b$, $a = c$ y $b = c$.



*Ejercicio 1.5*. Este es el ejercicio más relevante de este capítulo. Tiene
cierta relación con algo que se verá en el capítulo dedicado a las
isometrías. El apartado que me parece más difícil de comprender es el D.
Pero primero haré una aclaración sobre el C.

Punto C. Con las condiciones del problema hasta este apartado, se llega
fácilmente a las igualdades siguientes:

$ |g(x) - g(a)| &= |x - a| \
  |g(x) - g(b)| &= |x - b| $

Se podrían manipular y llegar al resultado, pero en el texto se resuelve de
un modo más elegante.

La primera de las expresiones anteriores es equivalente a

$ sqrt((g(x) - g(a))^2) = sqrt((x - a)^2) $

Nos centraremos solo en esta; la segunda se manipularía de forma análoga.

Como esas raíces son positivas, podemos elevar al cuadrado ambas partes de
la igualdad y no obtendremos múltiples resultados. Tenemos entonces que

$ (g(x) - g(a))^2 = (x - a)^2 $

A partir de aquí, se puede hacer la manipulación que se muestra en el texto.
Advierta que en algún punto se hacen las sustituciones $g(a) = a$ y $g(b) =
b$.

Punto D. Lo primero que hace es demostrar un resultado general para este
espacio métrico, $(bb(R), d_(bb(R)))$. Concretamente, que si dos de sus
isometrías cumplen

$ f_1 (0) = f_2 (0), quad f_1 (1) = f_2 (1) $

entonces son la misma, es decir, $f_1 = f_2$. Veamos por qué.

Para demostrar esto, nos basaremos en el resultado del punto C. Partiendo de
la hipótesis, supongamos ahora otra isometría $g = f_1^(-1) compose f_2$,
pues, tal y como se explicó, la composición de dos isometrías sobre un mismo
espacio métrico es también una isometría sobre ese mismo espacio métrico;
por tanto, $g in "Isom"(bb(R), d_(bb(R)))$.

Por la hipótesis tenemos que

$ g(0)
    = (f_1^(-1) compose f_2) (0)
    = f_1^(-1) (f_2 (0))
    = f_1^(-1) (f_1 (0))
    = "id"_(bb(R)) (0) = 0 $

y

$ g(1)
    = (f_1^(-1) compose f_2) (1)
    = f_1^(-1) (f_2 (1))
    = f_1^(-1) (f_1 (1))
    = "id"_(bb(R)) (1) = 1 $

Es decir, en esta nueva isometría tenemos dos puntos fijos. Por tanto, tal y
como se demuestra en el punto $C$, se tendrá que $g = "id"_(bb(R))$.

Vamos a operar:

$ f_1 compose g = f_1 compose (f_1^(-1) compose f_2) = (f_1 compose
f_1^(-1)) compose f_2 = "id"_(bb(R)) compose f_2 = f_2 $

y, por otro lado,

$ f_1 compose g = f_1 compose "id"_(bb(R)) = f_1 $

con lo que tenemos que $f_1 = f_2$.

Terminada la demostración de este resultado, pasamos a ver ahora que, para
una isometría $g(x) = sigma x + tau$ siendo $sigma in {-1, 1}$ y $tau in
bb(R)$, se cumplirá que $g(0) = h(0)$ y $g(1) = h(1)$ para una isometría
cualquiera $h$ en $(bb(R), d_(bb(R)))$, con lo que podremos concluir que
ambas isometrías son la misma, como consecuencia del resultado anterior.

Primero, recordar que, como se vio en el punto A de este mismo ejercicio,
esa función $g$ es una isometría de $(bb(R), d_(bb(R)))$.

Tal y como vamos a ver ahora, basta con tomar la siguiente definición de
$g$:

$ g(x) = [h(1) - h(0)] x + h(0) $

Esto se debe a que deseamos, por un lado, que $g(0) = h(0)$. Para que se dé
esto, debe cumplirse lo siguiente:

$ h(0) = g(0) = sigma 0 + tau = tau $

Por otro lado, se debe dar que $g(1) = h(1)$. Veámoslo:

$ h(1) = g(1) = sigma + tau = sigma + h(0) $

de lo que se deduce que $sigma = h(1) - h(0)$. Estos dos resultados producen
la fórmula que hemos dado para $g(x)$.

Por cierto, advierta que $|h(1) - h(0)| = 1$ por ser $h$ una isometría. Por
tanto, $sigma in {-1, 1}$.




