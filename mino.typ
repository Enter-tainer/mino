#import "typst-package/lib.typ": decode-fumen, render-field
#set page(margin: 1cm, height: auto, fill: white)
#set text(lang: "zh", region: "cn", font: ("New Computer Modern", "Source Han Sans SC"))
#align(center)[
  #text(size: 25pt)[
    `@preview/mino:0.1.0`
  ]
]

```typ
#import "@preview/mino:0.1.0": decode-fumen, render-field

#let fumen = decode-fumen("v115@...")
#for i in range(fumen.len()) {
  let field = fumen.at(i).at("field")
  [
    #box[
      #render-field(field, rows: 8, cell-size: 13pt) 
      (#(i+1))
      #fumen.at(i).comment
    ]
    #h(0.5pt)
  ]
}
```

#let fumen = decode-fumen("v115@vhPJHYaAkeEfEXoC+BlvlzByEEfE03k2AlP5ABwfAA?A+rQAAqsBsqBvtBTpBVhQeAlvlzByEEfE03k2AlP5ABwvDf?E33ZBBlfbOBV5AAAOfQeAlvlzByEEfE03+2BlP5ABwvDfEV?5k2AlPJVBjzAAA6WQAAzdBpeB0XBXUBFlQnAlvlzByEEfE0?3+2BlP5ABwvDfEXhWEBUYPNBkkuRA1GCLBUupAAdqQnAlvl?zByEEfE038UBlP5ABwvDfEXhWEBUYPNBkkuRA1GCLBU+rAA?AAPAA")

#for i in range(fumen.len()) {
  let field = fumen.at(i).at("field")
  [
    #box[
      #render-field(field, rows: 8, cell-size: 13pt) 
      (#(i+1))
      #fumen.at(i).comment
    ]
    #h(0.5pt)
  ]
}
