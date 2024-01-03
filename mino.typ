#import "typst-package/lib.typ": decode-fumen, render-field
#set page(margin: 1.5cm)

#align(center)[
  #text(size: 25pt)[
    DT Cannon
  ]
]

#let fumen = decode-fumen("v115@vhPJHYaAkeEfEXoC+BlvlzByEEfE03k2AlP5ABwfAA?A+rQAAqsBsqBvtBTpBVhQeAlvlzByEEfE03k2AlP5ABwvDf?E33ZBBlfbOBV5AAAOfQeAlvlzByEEfE03+2BlP5ABwvDfEV?5k2AlPJVBjzAAA6WQAAzdBpeB0XBXUBFlQnAlvlzByEEfE0?3+2BlP5ABwvDfEXhWEBUYPNBkkuRA1GCLBUupAAdqQnAlvl?zByEEfE038UBlP5ABwvDfEXhWEBUYPNBkkuRA1GCLBU+rAA?AAPAA")

#for i in range(fumen.len()) {
  let field = fumen.at(i).at("field")
  [#box(render-field(field, rows: 8, cell-size: 14pt)) #h(2em)]
}
