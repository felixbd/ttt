// ABSTRACT in `en` and `de`

#set quote(block: true)
#show quote: set pad(right: 10mm, left: 10mm)

#let value = context text.lang

#align(center)[= Abstract]
#quote()[    
  Hier in #value:
  #lorem(150)
]
 
\
\

#text(lang: "de")[
  #align(center)[= Zusammenfassung]
  #quote()[
    Hier in #value:             
    #lorem(150)
  ]
]
