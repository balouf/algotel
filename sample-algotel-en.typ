// Sample document for the AlgoTel Typst template
// This is a port of sample-algotel.tex

// Import template and theorem environments
// Other packages (cetz, fletcher, algo, etc.) should be imported directly from @preview/
#import "algotel.typ": algotel, qed
#import "algotel.typ": theorem, lemma, proposition, corollary, definition, remark, example, proof

#show: algotel.with(
  title: [How to format a submission for AlgoTel/CoRes with the conference's own Typst style],
  short-title: [Formatting a submission for AlgoTel],
  authors: (
    (name: "Jens Gustedt", affiliations: (1,2,), thanks: "I am not supported."),
    (name: "Somebody Who", affiliations: (2,), thanks: "But he is!"),
    (name: "Some Dummy", affiliations: (1,)),
  ),
  affiliations: (
    (id: 1, name: "INRIA & LORIA, campus scientifique, BP 239, F-54 506 Vandœuvre lès Nancy, France"),
    (id: 2, name: "Blue-box, Maribor, Slovenia"),
  ),
  abstract: [This document presents the Typst template for the AlgoTel conference. It describes how to set up document metadata, write scientific content including mathematics, figures, tables and algorithms, and provides writing guidelines.],
  keywords: ("some well classifying words", "mandatory!"),
  lang: "en",  // Remove or set to "fr" if the article is in French
)


= Introduction <sec:introduction>

The Typst template for AlgoTel is derived from the LaTeX class `algotel.cls`.
Its main purpose is to ensure a common layout policy of all articles
in AlgoTel and to provide editors, referees and readers with the
necessary information. If you think you need an introduction to
Typst, you should consider the official documentation at #link("https://typst.app/docs/")[typst.app/docs].

= Document Setup <sec:setup>

== Front Matter <sec:front-matter>

We need the following type of information:

- The name(s) of the author(s), provided in the `authors` parameter.
  Each author can have affiliations (as a list of IDs) and an optional
  `thanks` note.
- The title of the manuscript, provided by the `title` parameter.
  If your title is too long for the running head, you can provide
  a `short-title` parameter that will be used instead.
- The affiliations, provided as a list with `id` and `name` fields.
- Some keywords that classify your work, provided by the `keywords`
  parameter. Be careful on the choice of these keywords, you are the
  author, you should know best what is adequate such that your
  article can be easily and correctly identified by search engines.
- An abstract of your manuscript, provided by the `abstract` parameter.
  This should be no longer than a paragraph and concisely
  reflect the main contributions of your work.

== Template Options <sec:options>

The template supports both French and English, controlled by the `lang` parameter. This affects the keywords label ("Mots-clefs :" vs "Keywords:"). The paper format can be set to `"a4"` (default) or `"us-letter"`:

```typst
#show: algotel.with(
  // ...
  lang: "fr",         // "fr" or "en"
  paper: "a4",        // "a4" (default) or "us-letter"
)
```

The template uses fonts that match the LaTeX version:
- *Body text*: #link("https://github.com/alerque/libertinus/releases")[Libertinus Serif], then #link("https://www.gust.org.pl/projects/e-foundry/tex-gyre/termes")[TeX Gyre Termes] (Times-compatible), fallback to #link("https://github.com/liberationfonts/liberation-fonts/releases")[Liberation Serif]
- *Headings*: #link("https://www.gust.org.pl/projects/e-foundry/tex-gyre/heros")[TeX Gyre Heros] (Helvetica-compatible), fallback to #link("https://github.com/liberationfonts/liberation-fonts/releases")[Liberation Sans]
- *Code*: #link("https://www.gust.org.pl/projects/e-foundry/tex-gyre/cursor")[TeX Gyre Cursor] (Courier-compatible), fallback to #link("https://github.com/liberationfonts/liberation-fonts/releases")[Liberation Mono]

*Best practice:* For optimal results matching the LaTeX output, install the font families on your system:
- *TeX Gyre*: available from #link("https://www.gust.org.pl/projects/e-foundry/tex-gyre")[GUST e-foundry] or `apt install fonts-texgyre` (Debian/Ubuntu)
- *Libertinus*: available from #link("https://github.com/alerque/libertinus/releases")[GitHub] or `apt install fonts-libertinus` (Debian/Ubuntu)
- *Liberation*: available from #link("https://github.com/liberationfonts/liberation-fonts/releases")[GitHub] or `apt install fonts-liberation` (Debian/Ubuntu)

If the preferred fonts are not installed, Typst will automatically fall back to the next available alternative in the chain. You may see warnings during compilation, but the document will still render correctly.

*Note:* The Typst web app (typst.app) includes TeX Gyre fonts by default, so no installation is needed when compiling online.

= Writing Content <sec:content>

Most LaTeX packages have Typst equivalents, either built-in or available via the #link("https://typst.app/universe")[Typst Universe] package repository @typst-docs. Packages like `cetz`, `cetz-plot`, `fletcher`, and `algo` can be imported directly from the Typst Universe:

```typst
#import "@preview/cetz:0.4.2"
#import "@preview/fletcher:0.5.8"
```

== Sections and Headings <sec:headings>

Typst uses `=` for headings: `= Section`, `== Subsection`, `=== Subsubsection`. Add a label after the heading text for cross-references:

```typst
= My Section <sec:my-section>

See @sec:my-section for details.
```

== Mathematics <sec:mathematics>

Typst has excellent built-in math support. Inline math uses `$...$` and display math uses `$ ... $` (with spaces):

```typst
The probability is $P(X > x) = e^(-lambda x)$.

$ sum_(i=1)^n i = frac(n(n+1), 2) $ <eq:sum>
```

The probability is $P(X > x) = e^(-lambda x)$.

$ sum_(i=1)^n i = frac(n(n+1), 2) $ <eq:sum>

Equations can be referenced: see @eq:sum. More complex expressions:

$ integral_0^infinity e^(-x^2) dif x = frac(sqrt(pi), 2) $

== Figures <sec:figures>

=== From Images <sec:figures-images>

Figures can include raster images (PNG, JPEG), vector graphics (SVG), or PDF files:

```typst
#figure(
  image("algotel-logo-bw-transparent.png", width: 8cm),
  caption: [The AlgoTel logo.],
) <fig:logo>
```

#figure(
  image("algotel-logo-bw-transparent.png", width: 8cm),
  caption: [The AlgoTel logo.],
) <fig:logo>

=== Diagrams with Fletcher <sec:figures-fletcher>

// Fletcher for node-edge diagrams
#import "@preview/fletcher:0.5.8"


The `fletcher` package provides easy node-edge diagrams. Here is a network graph example:

```typst
#import fletcher: diagram, node, edge
#diagram(
  node((0, 0), [A]),
  node((1, -1), [B]),
  node((1, 1), [C]),
  edge((0,0), (1,-1), "-"),
  edge((0,0), (1,1), "-"),
  edge((1,-1), (1,1), "-"),
)
```

#figure(
  {
    import fletcher: diagram, node, edge
    diagram(
      node-stroke: 0.5pt,
      node-shape: circle,
      node((0, 0), [A]),
      node((1, -1), [B]),
      node((1, 1), [C]),
      edge((0,0), (1,-1), "-"),
      edge((0,0), (1,1), "-"),
      edge((1,-1), (1,1), "-"),
    )
  },
  caption: [A simple network graph drawn with Fletcher.],
) <fig:fletcher>

=== Plots with CeTZ <sec:figures-plots>



// CeTZ for TikZ-like drawings and plots
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"

The `cetz-plot` package allows creating publication-quality plots. Here is an example plotting $f(x) = x^2$:

```typst
// Generate data points for f(x) = x^2
#let data = range(-20, 21).map(i => {
  let x = i / 10
  (x, calc.pow(x, 2))
})

#cetz.canvas({
  import cetz-plot: *
  plot.plot(
    size: (8, 6),
    x-label: $x$,
    y-label: $f(x)$,
    x-grid: true,
    y-grid: true,
    {
      plot.add(data, label: $x^2$)
      plot.add-hline(2, style: (stroke: (dash: "dashed")), label: $y = 2$)
    }
  )
})
```

// Generate data points for f(x) = x^2
#let data = range(-20, 21).map(i => {
  let x = i / 10
  (x, calc.pow(x, 2))
})

#figure(
  cetz.canvas({
    import cetz-plot: *
    plot.plot(
      size: (8, 6),
      x-label: $x$,
      y-label: $f(x)$,
      x-grid: true,
      y-grid: true,
      {
        plot.add(data, label: $x^2$)
        plot.add-hline(2, style: (stroke: (dash: "dashed")), label: $y = 2$)
      }
    )
  }),
  caption: [Plot of $f(x) = x^2$ with a horizontal reference line.],
) <fig:plot>

For real-world data, you can load from external files:
- *CSV*: `#let data = csv("data.csv")` then access rows/columns
- *JSON*: `#let data = json("data.json")` for structured data
- *Manual*: Define arrays directly as shown above

== Tables <sec:tables>

Typst has powerful built-in table support:

```typst
#figure(
  table(
    columns: 3,
    stroke: 0.5pt,
    inset: 8pt,
    table.header[*Algorithm*][*Complexity*][*Space*],
    [Dijkstra], [$O(E log V)$], [$O(V)$],
    [Bellman-Ford], [$O(V E)$], [$O(V)$],
    [Floyd-Warshall], [$O(V^3)$], [$O(V^2)$],
  ),
  caption: [Comparison of shortest path algorithms.],
) <tab:algorithms>
```

#figure(
  table(
    columns: 3,
    stroke: 0.5pt,
    inset: 8pt,
    table.header[*Algorithm*][*Complexity*][*Space*],
    [Dijkstra], [$O(E log V)$], [$O(V)$],
    [Bellman-Ford], [$O(V E)$], [$O(V)$],
    [Floyd-Warshall], [$O(V^3)$], [$O(V^2)$],
  ),
  caption: [Comparison of shortest path algorithms.],
) <tab:algorithms>

== Algorithms <sec:algorithms>

// Algo for pseudocode (algorithm2e-like)
#import "@preview/algo:0.3.6"


For pseudocode, the `algo` package provides algorithm2e-like environments:

```typst
#algo.algo(
  title: "Euclid",
  parameters: ($a$, $b$),
)[
  while $b != 0$ #i\
    $t <- b$\
    $b <- a mod b$\
    $a <- t$ #d\
  return $a$
]
```

#figure(
  algo.algo(
    title: "Euclid",
    parameters: ($a$, $b$),
  )[
    while $b != 0$ #algo.i\
      $t <- b$\
      $b <- a mod b$\
      $a <- t$#algo.d\
    return $a$
  ],
  caption: [Euclidean algorithm for computing GCD.],
  kind: "Algo",
  supplement: [Algorithm]
) <algo:euclid>

== Theorems and Proofs <sec:theorems>

The template provides theorem-like environments with a shared counter. We can reference a theorem, for instance @thm-important with `@thm-important`.

```typst
#import "algotel.typ": theorem, lemma, definition, proof

#definition(name:"Connectivity")[
  A graph $G = (V, E)$ is _connected_ if there exists a path
  between any two vertices.
]

#theorem[
  Every tree with $n$ vertices has exactly $n - 1$ edges.
]<thm-important>

#proof[
  By induction on $n$. The base case $n = 1$ is trivial...
]
```

#definition(name:"Connectivity")[
  A graph $G = (V, E)$ is _connected_ if there exists a path between any two vertices $u, v in V$.
]

#lemma[
  If $G$ is a tree, then removing any edge disconnects $G$.
]


#theorem[
  Every tree with $n$ vertices has exactly $n - 1$ edges.
]<thm-important>


#proof[
  By induction on $n$. For $n = 1$, the tree has a single vertex and $0 = 1 - 1$ edges. Assume the property holds for all trees with fewer than $n$ vertices. Consider a tree $T$ with $n$ vertices. Remove any leaf $v$ and its incident edge. The remaining graph is a tree with $n - 1$ vertices, hence $n - 2$ edges by the induction hypothesis. Adding back the edge gives $n - 1$ edges.
]

#corollary[
  A connected graph with $n$ vertices and $n - 1$ edges is a tree.
]

#remark[
  The `proof` environment automatically adds the QED symbol ($square$) at the end. You can also use `#qed` manually if needed.
]

Available environments: `theorem`, `lemma`, `proposition`, `corollary` (numbered, italic), `definition` (numbered, normal), `remark`, `example` (unnumbered, normal).

== References, Citations, and Footnotes <sec:refs>

*Cross-references* use the `@label` syntax:
- Section reference: @sec:introduction
- Figure reference: @fig:logo
- Table reference: @tab:algorithms
- Algorithm reference: @algo:euclid
- Equation reference: @eq:sum

*Citations* also use `@key` syntax and appear in brackets: @typst-docs. Multiple citations: @typst-docs @oetiker99.

*Footnotes* use the `#footnote[...]` function.#footnote[Like this one.] They automatically use symbolic markers (†, ‡, §, ...) as in the LaTeX template.

*Hyperlinks* use `#link("url")[text]`: #link("https://algotel.eu.org/")[AlgoTel website].

= Writing Tips <sec:tips>

*Numbering conventions.* Please use the standard conventions for all commands and environments
that provide a numbering such as theorem-like environments or
sections. In particular usual counting starts at~1 and not at~0.

*Proper names.* Please be careful in the writing of personal names. Customs in
different countries are different! Be sure to use a standard
transcription of names that use a different alphabet than English, and
also be sure to use the full capabilities of Typst for accentuated
character sets that are based on the Latin alphabet. Be sure to catch
the correct concept of "last name" in that language.

*Spell checking.* It is considered as being very impolite to leave obvious spelling
errors in the manuscript before sending it out. Computers are made for
these, *use them*.

*Consistency.* You might either use the North American variant for spelling or the
British one, but please don't mix them in one paper. The same holds
for different possible spellings for the same word as for example
"_acknowledg(e)ment_" or "_formulae_" versus
"_formulas_". *Be consistent*.

*Mathematics style.* Running text must always constitute correct French or English sentences. All complicated mathematical formulae should be given on
separate lines and should not be spread out into the running text.
Use Typst's equation environment with numbering---such numbers ease the referee process very much, and after eventual publication easily allow readers to refer to in their own work.

The quantifiers "$exists$" and "$forall$" don't stand as
abbreviations of the partial phrases "_there is_" and
"_for all_". They are reserved for logical formulae as
_such_, that is for work that talks itself of logical
formulae as a subject.

The equal sign "$=$" may have different meanings in different communities:
+ It might stand for mathematical identity that is discovered _a posteriori_. As an example:
  #align(center)[_An easy computation shows that $4! = 24$._]
+ It might stand for a _definition_, as in:
  #align(center)[_For convenience, set $0! = 1$._]
For the later use of "$=$", computer scientists often tend to use "$:=$". Referees should be tolerant to these different customs.

#bibliography("sample-algotel.bib")
