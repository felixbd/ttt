// for code block highlighting
#import "@preview/zebraw:0.3.0": *
#show: zebraw.with(inset: (top: 4pt, bottom: 4pt))

#import "@preview/physica:0.9.1": *


// remove timestamp form pdf metadata
#set document(
  date: none,
)

#set page(
  paper: "a4",
)

// --- DARK MODE --------------------------------------------------------------
// https://forum.typst.app/t/can-i-configure-my-document-e-g-draft-release-version-color-theme-when-creating-a-pdf-without-modifying-the-typst-file-directly/160
#let darkmodeflag = {
  let valid-values = ("true": true, "false": false)
  let value = sys.inputs.at("darkmode", default: "false")
  assert(value in valid-values, message: "`--input darkmode` must be true or false")
  valid-values.at(value)
}

#set page(fill: if darkmodeflag {rgb("444352")})

// #if darkmodeflag [
// #set page(fill: rgb("444352"))
// #set text(fill: rgb("fdfdfd"))
// ----------------------------------------------------------------------------

// TODO add optin for preprint
//
// #set page(background: rotate(24deg,
//  text(18pt, fill: rgb("FFCBC4"))[
//    *CONFIDENTIAL*
//  ]
// ))

// set font
#set text(
  font: ("Fira Sans", "New Computer Modern"),
  lang: "en",
  size: 12pt,
)

// set font for code block
// https://www.frogorbits.com/opinions/styling-code-in-typst/
#show raw: (it) => [
  #set text(
    font: ("Fira Code", "DejaVu Sans Mono"),
    ligatures: true,
    lang: "en",
    size: 12pt,
  )
  #it
]

// --- FRONT MATTER ---

// TITLE PAGE
#include "./titlepage.typ"

#set page(
  // how to get current page number via *context*
  // https://forum.typst.app/t/how-to-use-context-instead-of-a-callback-function-in-locate-function-calls/965/2
  footer: context {
    if calc.even(counter(page).at(here()).first()) {
      align(right, counter(page).display("i"));
    } else {
      align(left, counter(page).display("i"));
    }
  },
)

// ABSTRACT

#include "./abstract.typ"

// https://stackoverflow.com/questions/78272599/show-current-heading-number-and-body-in-page-header
#set page(header: context {
  let selector = selector(heading).before(here())
  let level = counter(selector)
  let headings = query(selector)

  if headings.len() == 0 {
    return
  }

  let heading = headings.last()

  // level.display(heading.numbering)
  h(1em)
  heading.body
})

// TODO: new chapter should always start at a odd (right page) page number
#show heading.where(level: 1): it => pagebreak(weak: true) + it

#set heading(numbering: "1.")

#show outline.entry.where(
  level: 1
): it => {
  v(12pt, weak: true)
  strong(it)
}

#outline(indent: auto)
#pagebreak(to: "even")


// --- MAIN MATTER ---

#counter(page).update(1)
// #set page(numbering: "1.")

#set page(
  numbering: "1",
  // how to get current page number via context
  // https://forum.typst.app/t/how-to-use-context-instead-of-a-callback-function-in-locate-function-calls/965/2
  footer: context {
    if calc.even(counter(page).at(here()).first()) {
      align(left, counter(page).display("1"));
    } else {
      align(right, counter(page).display("1"));
    }
  }
)


= Some random test

== Hello

#lorem(15)

=== heeeello

#lorem(35)

```haskell
print $ show <$> (Just 56)
print $ Just 10 >== \x -> Just $ x + 2
print $ Nothing >== \x -> Just $ show x
```

```text
Just "56"
Just 12
Nothing
```

#pagebreak(weak: false)

== even more section 1 stuff ...

#lorem(130)



= bla bla bla

#lorem(20)


= xyz

#lorem(20)

$ text("MI", weight: "bold")(R, T) = integral_(RR^2) p^(R T)(r, t) log ( (p^(R T)(r, t)) / (p^R (r) quad p^T (t)) ) dd(r) dd(t) $

#lorem(20)

$ jmat(f_1,f_2; x,y) jmat(f,g; x,y,z; delim:"[")  $



// -- BACK MATTER ---
#pagebreak(weak: true)

#counter(heading).update(0)

#set heading(numbering: "A. 1.1.")

= Some Appendix

#lorem(50)

== fuu

=== bar

#lorem(50)

= fubar

== barfu

=== fufubabar

==== gh
