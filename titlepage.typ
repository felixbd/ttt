// TITLEPAGE

#set align(center)

// Logos on top-left and top-right
#pad(bottom: 50pt,
  stack(dir: ltr, spacing: 1fr,
    // image("uni-logo.png", height: 1.4cm),
    box(height: 1.4cm, width: 3cm, fill: black),

    // image("institute-logo.png", height: 1.4cm),
    box(height: 1.4cm, width: 4cm, fill: black),
  ),
)

#text(size: 20pt, weight: "bold",)[Bachelor Thesis]

#text(size: 15pt,)[
  Faculty
  #text(font: ("Fira Code", "DejaVu Sans Mono"),size: 15pt,)[03] -
  Mathematics and Computer Science
]

#pad(bottom: -5mm,
  text(size: 15pt,)[on the topic]
)

\
\

#line(
  length: 100%,
  stroke: 2pt,
)

#text(size: 18pt, weight: "bold",)[
  #lorem(11)
]

#pad(bottom: 2mm,
  text(size: 15pt, weight: "bold",)[
    #lorem(6)
  ]
)

#pad(bottom: 15mm,
  line(
    length: 100%,
    stroke: 2pt,
  )
)

#text(size: 12pt, weight: "bold",)[by]
#text(size: 15pt, weight: "bold",)[Bob Smith] \
#text(size: 12pt,)[student id: 1234567]

#set align(left)
#show table.cell.where(x: 0): strong

#pad(top: 6cm, bottom: -10cm)[
  #table(
    stroke: none,
    columns: 2,
    // gutter: 3pt,
    [Study programme:], [Computer Science - B.Sc.],
    [Semester:],        [WiSe `2024/2025`],
    [Git Version:],     [ #raw(sys.inputs.at("gitversion", default: "not a git repo")) ],
    [Date:],            [ #raw(sys.inputs.at("date", default: datetime.today().display())) ],
    [First Reviewer:],  [Prof. Dr. Alice],
    [Second Reviewer:], [Dr. Bob],
  )
]

#pagebreak(weak: true)
