// Exemple de document pour le template Typst AlgoTel
// Version française de sample-algotel.typ

// Importer le template et les environnements de théorèmes
// Les autres paquets (cetz, fletcher, algo, etc.) s'importent directement depuis @preview/
#import "algotel.typ": algotel, qed
#import "algotel.typ": theorem, lemma, proposition, corollary, definition, remark, example, proof

#show: algotel.with(
  title: [Comment formater une soumission pour\ AlgoTel/CoRes avec le style Typst de la conférence],
  short-title: [Formater une soumission pour AlgoTel],
  authors: (
    (name: "Jens Gustedt", affiliations: (1,), thanks: "Je ne suis pas financé."),
    (name: "Quelqu'un D'autre", affiliations: (2,), thanks: "Mais lui l'est !"),
    (name: "Un Figurant", affiliations: (1,)),
  ),
  affiliations: (
    (id: 1, name: "INRIA & LORIA, campus scientifique, BP 239, F-54 506 Vandœuvre lès Nancy, France"),
    (id: 2, name: "Blue-box, Maribor, Slovénie"),
  ),
  abstract: [Ce document présente le template Typst pour la conférence AlgoTel. Il décrit comment configurer les métadonnées du document, rédiger du contenu scientifique incluant mathématiques, figures, tableaux et algorithmes, et fournit des conseils de rédaction.],
  keywords: ("mots-clés bien choisis", "obligatoires !"),
  lang: "fr",
)

= Introduction <sec:introduction>

Le template Typst pour AlgoTel est dérivé de la classe LaTeX `algotel.cls`.
Son objectif principal est d'assurer une mise en page cohérente de tous les articles
d'AlgoTel et de fournir aux éditeurs, rapporteurs et lecteurs les
informations nécessaires. Si vous avez besoin d'une introduction à
Typst, consultez la documentation officielle sur #link("https://typst.app/docs/")[typst.app/docs].

Un nouveau paragraphe s'indente automatiquement.

= Configuration du document <sec:setup>

== En-tête du document <sec:front-matter>

Les informations suivantes sont requises :

- Le(s) nom(s) des auteur(s), fourni(s) dans le paramètre `authors`.
  Chaque auteur peut avoir des affiliations (sous forme de liste d'identifiants) et une note
  de remerciement optionnelle (`thanks`).
- Le titre du manuscrit, fourni par le paramètre `title`.
  Si votre titre est trop long pour l'en-tête courant, vous pouvez fournir
  un paramètre `short-title` qui sera utilisé à la place.
- Les affiliations, fournies sous forme de liste avec les champs `id` et `name`.
- Des mots-clés qui caractérisent votre travail, fournis par le paramètre `keywords`.
  Soyez attentif au choix de ces mots-clés : vous êtes l'auteur,
  vous savez mieux que quiconque ce qui permettra à votre
  article d'être facilement et correctement identifié par les moteurs de recherche.
- Un résumé de votre manuscrit, fourni par le paramètre `abstract`.
  Celui-ci ne devrait pas dépasser un paragraphe et refléter
  de manière concise les contributions principales de votre travail.

== Options du template <sec:options>

Le template supporte le français et l'anglais, contrôlé par le paramètre `lang`. Cela affecte l'étiquette des mots-clés ("Mots-clefs :" vs "Keywords:") et le titre de la bibliographie. Le format de papier peut être `"a4"` (défaut) ou `"us-letter"` :

```typst
#show: algotel.with(
  // ...
  lang: "fr",         // "fr" ou "en"
  paper: "a4",        // "a4" (défaut) ou "us-letter"
)
```

Le template utilise des polices compatibles avec la version LaTeX :
- *Corps du texte* : #link("https://github.com/alerque/libertinus/releases")[Libertinus Serif], puis #link("https://www.gust.org.pl/projects/e-foundry/tex-gyre/termes")[TeX Gyre Termes] (compatible Times), fallback vers #link("https://github.com/liberationfonts/liberation-fonts/releases")[Liberation Serif]
- *Titres* : #link("https://www.gust.org.pl/projects/e-foundry/tex-gyre/heros")[TeX Gyre Heros] (compatible Helvetica), fallback vers #link("https://github.com/liberationfonts/liberation-fonts/releases")[Liberation Sans]
- *Code* : #link("https://www.gust.org.pl/projects/e-foundry/tex-gyre/cursor")[TeX Gyre Cursor] (compatible Courier), fallback vers #link("https://github.com/liberationfonts/liberation-fonts/releases")[Liberation Mono]

*Bonne pratique :* Pour des résultats optimaux correspondant à la sortie LaTeX, installez les familles de polices sur votre système :
- *TeX Gyre* : disponible sur #link("https://www.gust.org.pl/projects/e-foundry/tex-gyre")[GUST e-foundry] ou `apt install fonts-texgyre` (Debian/Ubuntu)
- *Libertinus* : disponible sur #link("https://github.com/alerque/libertinus/releases")[GitHub] ou `apt install fonts-libertinus` (Debian/Ubuntu)
- *Liberation* : disponible sur #link("https://github.com/liberationfonts/liberation-fonts/releases")[GitHub] ou `apt install fonts-liberation` (Debian/Ubuntu)

Si les polices préférées ne sont pas installées, Typst utilisera automatiquement l'alternative suivante dans la chaîne. Des avertissements peuvent apparaître lors de la compilation, mais le document sera rendu correctement.

*Note :* L'application web Typst (typst.app) inclut les polices TeX Gyre par défaut, aucune installation n'est nécessaire pour la compilation en ligne.

= Rédiger du contenu <sec:content>

La plupart des paquets LaTeX ont des équivalents Typst, soit intégrés, soit disponibles via le dépôt #link("https://typst.app/universe")[Typst Universe] @typst-docs. Les paquets comme `cetz`, `cetz-plot`, `fletcher` et `algo` s'importent directement depuis le Typst Universe :

```typst
#import "@preview/cetz:0.4.2"
#import "@preview/fletcher:0.5.8"
```

Les environnements de théorèmes (`theorem`, `lemma`, `proof`, etc.) s'affichent automatiquement en français lorsque `lang: "fr"` est défini.

== Sections et titres <sec:headings>

Typst utilise `=` pour les titres : `= Section`, `== Sous-section`, `=== Sous-sous-section`. Ajoutez une étiquette après le texte du titre pour les références croisées :

```typst
= Ma section <sec:ma-section>

Voir @sec:ma-section pour les détails.
```

== Mathématiques <sec:mathematics>

Typst offre un excellent support mathématique intégré. Les mathématiques en ligne utilisent `$...$` et les équations sur ligne séparée utilisent `$ ... $` (avec des espaces) :

```typst
La probabilité est $P(X > x) = e^(-lambda x)$.

$ sum_(i=1)^n i = frac(n(n+1), 2) $ <eq:sum>
```

La probabilité est $P(X > x) = e^(-lambda x)$.

$ sum_(i=1)^n i = frac(n(n+1), 2) $ <eq:sum>

Les équations peuvent être référencées : voir @eq:sum. Expressions plus complexes :

$ integral_0^infinity e^(-x^2) dif x = frac(sqrt(pi), 2) $

== Figures <sec:figures>

=== À partir d'images <sec:figures-images>

Les figures peuvent inclure des images matricielles (PNG, JPEG), des graphiques vectoriels (SVG), ou des fichiers PDF :

```typst
#figure(
  image("algotel-logo-bw-transparent.png", width: 8cm),
  caption: [Le logo AlgoTel.],
) <fig:logo>
```

#figure(
  image("algotel-logo-bw-transparent.png", width: 8cm),
  caption: [Le logo AlgoTel.],
) <fig:logo>

=== Diagrammes avec Fletcher <sec:figures-fletcher>

// Fletcher for node-edge diagrams
#import "@preview/fletcher:0.5.8"

Le paquet `fletcher` permet de créer facilement des diagrammes nœuds-arêtes. Voici un exemple de graphe :

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
  caption: [Un graphe simple dessiné avec Fletcher.],
) <fig:fletcher>

=== Graphiques avec CeTZ <sec:figures-plots>

// CeTZ for TikZ-like drawings and plots
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"

Le paquet `cetz-plot` permet de créer des graphiques de qualité publication. Voici un exemple traçant $f(x) = x^2$ :

```typst
// Générer les points pour f(x) = x^2
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

// Générer les points pour f(x) = x^2
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
  caption: [Graphique de $f(x) = x^2$ avec une ligne de référence horizontale.],
) <fig:plot>

Pour des données réelles, vous pouvez charger depuis des fichiers externes :
- *CSV* : `#let data = csv("data.csv")` puis accéder aux lignes/colonnes
- *JSON* : `#let data = json("data.json")` pour des données structurées
- *Manuel* : Définir les tableaux directement comme montré ci-dessus

== Tableaux <sec:tables>

Typst offre un support puissant des tableaux :

```typst
#figure(
  table(
    columns: 3,
    stroke: 0.5pt,
    inset: 8pt,
    table.header[*Algorithme*][*Complexité*][*Espace*],
    [Dijkstra], [$O(E log V)$], [$O(V)$],
    [Bellman-Ford], [$O(V E)$], [$O(V)$],
    [Floyd-Warshall], [$O(V^3)$], [$O(V^2)$],
  ),
  caption: [Comparaison des algorithmes de plus court chemin.],
) <tab:algorithms>
```

#figure(
  table(
    columns: 3,
    stroke: 0.5pt,
    inset: 8pt,
    table.header[*Algorithme*][*Complexité*][*Espace*],
    [Dijkstra], [$O(E log V)$], [$O(V)$],
    [Bellman-Ford], [$O(V E)$], [$O(V)$],
    [Floyd-Warshall], [$O(V^3)$], [$O(V^2)$],
  ),
  caption: [Comparaison des algorithmes de plus court chemin.],
) <tab:algorithms>

== Algorithmes <sec:algorithms>

// Algo for pseudocode (algorithm2e-like)
#import "@preview/algo:0.3.6"

Pour le pseudocode, le paquet `algo` fournit des environnements similaires à algorithm2e :

```typst
#algo.algo(
  title: "Euclide",
  parameters: ($a$, $b$),
)[
  tant que $b != 0$ #i\
    $t <- b$\
    $b <- a mod b$\
    $a <- t$ #d\
  retourner $a$
]
```

#let keywords = ("Données", "début",
"Résultat", "si", "tant que", "faire", "alors", "retourner", "pour")

#figure(
  algo.algo(
    title: "Euclide",
    parameters: ($a$, $b$),
    keywords: keywords,
  )[
    tant que $b != 0$ #algo.i\
      $t <- b$\
      $b <- a mod b$\
      $a <- t$#algo.d\
    retourner $a$
  ],
  kind:"algo",
  supplement: "Algorithme",
  caption: [Algorithme d'Euclide pour calculer le PGCD.],
) <algo:euclid>

== Théorèmes et preuves <sec:theorems>

Le template fournit des environnements de type théorème avec un compteur partagé. On peut référencer automatiquement un théorème, par exemple le @thm-important avec `@thm-important`.
Les noms s'affichent automatiquement en français :

```typst
#import "algotel.typ": theorem, lemma, definition, proof

#definition(name:"Connexité")[
  Un graphe $G = (V, E)$ est _connexe_ s'il existe un chemin
  entre toute paire de sommets.
]

#theorem[
  Tout arbre à $n$ sommets possède exactement $n - 1$ arêtes.
]<thm-important>

#proof[
  Par récurrence sur $n$. Le cas de base $n = 1$ est trivial...
]
```

#definition(name:"Connexité")[
  Un graphe $G = (V, E)$ est _connexe_ s'il existe un chemin entre toute paire de sommets $u, v in V$.
]

#lemma[
  Si $G$ est un arbre, alors la suppression de toute arête déconnecte $G$.
]

#theorem[
  Tout arbre à $n$ sommets possède exactement $n - 1$ arêtes.
]<thm-important>

#proof[
  Par récurrence sur $n$. Pour $n = 1$, l'arbre a un seul sommet et $0 = 1 - 1$ arêtes. Supposons la propriété vraie pour tous les arbres à moins de $n$ sommets. Considérons un arbre $T$ à $n$ sommets. Supprimons une feuille $v$ et son arête incidente. Le graphe restant est un arbre à $n - 1$ sommets, donc $n - 2$ arêtes par hypothèse de récurrence. En rajoutant l'arête, on obtient $n - 1$ arêtes.
]

#corollary[
  Un graphe connexe à $n$ sommets et $n - 1$ arêtes est un arbre.
]

#remark[
  L'environnement `proof` ajoute automatiquement le symbole QED ($square$) à la fin. Vous pouvez aussi utiliser `#qed` manuellement si nécessaire.
]

Environnements disponibles : `theorem`, `lemma`, `proposition`, `corollary` (numérotés, italique), `definition` (numéroté, normal), `remark`, `example` (non numérotés, normal).

== Références, citations et notes de bas de page <sec:refs>

*Références croisées* avec la syntaxe `@étiquette` :
- Référence de section : @sec:introduction
- Référence de figure : @fig:logo
- Référence de tableau : @tab:algorithms
- Référence d'algorithme : @algo:euclid
- Référence d'équation : @eq:sum

*Citations* avec la syntaxe `@clé` entre crochets : @typst-docs. Citations multiples : @typst-docs @oetiker99.

*Notes de bas de page* avec la fonction `#footnote[...]`.#footnote[Comme celle-ci.] Elles utilisent automatiquement des symboles (†, ‡, §, ...) comme dans le template LaTeX.

*Liens hypertexte* avec `#link("url")[texte]` : #link("https://algotel.eu.org/")[site web AlgoTel].

= Conseils de rédaction <sec:tips>

==== Conventions de numérotation Veuillez utiliser les conventions standards pour toutes les commandes et environnements
qui fournissent une numérotation, comme les environnements de type théorème ou
les sections. En particulier, la numérotation usuelle commence à 1 et non à 0.

==== Noms propres Soyez attentif à l'écriture des noms de personnes. Les usages
dans différents pays sont différents ! Assurez-vous d'utiliser une transcription
standard pour les noms utilisant un alphabet différent du français, et
utilisez pleinement les capacités de Typst pour les jeux de caractères
accentués basés sur l'alphabet latin. Assurez-vous de saisir le concept
correct de "nom de famille" dans chaque langue.

==== Vérification orthographique Il est considéré comme très impoli de laisser des fautes
d'orthographe évidentes dans le manuscrit avant de l'envoyer. Les ordinateurs sont
faits pour cela, *utilisez-les*.

==== Cohérence
Vous pouvez utiliser l'orthographe traditionnelle ou la nouvelle orthographe,
mais ne les mélangez pas dans un même article. De même pour les
différentes graphies possibles d'un même mot comme
"_clé_" versus "_clef_". *Soyez cohérent*.

==== Style mathématique
Le texte courant doit toujours constituer des phrases françaises correctes. Toutes les formules mathématiques complexes doivent être présentées sur
des lignes séparées et non dispersées dans le texte courant.
Utilisez l'environnement d'équation de Typst avec numérotation---ces numéros facilitent grandement le processus de relecture, et après publication permettent aux lecteurs d'y faire référence facilement dans leurs propres travaux.

Les quantificateurs "$exists$" et "$forall$" ne sont pas des
abréviations des expressions "_il existe_" et
"_pour tout_". Ils sont réservés aux formules logiques en
_tant que telles_, c'est-à-dire pour les travaux qui traitent eux-mêmes
des formules logiques comme sujet d'étude.

Le signe égal "$=$" peut avoir différentes significations selon les communautés :
+ Il peut représenter une identité mathématique découverte _a posteriori_. Par exemple :
  #align(center)[_Un calcul simple montre que $4! = 24$._]
+ Il peut représenter une _définition_, comme dans :
  #align(center)[_Par convention, on pose $0! = 1$._]
Pour ce second usage de "$=$", les informaticiens tendent souvent à utiliser "$:=$". Les rapporteurs devraient être tolérants envers ces différents usages.

#bibliography("sample-algotel.bib")
