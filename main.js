import { decoder } from 'tetris-fumen';

function pageToString(page) {
  const field = page.field;
  let ops = [];
  if (page.operation) {
    const mino = page.mino()
    const pos = mino.positions()
    for (let i = 0; i < 4; ++i) {
      const x = pos[i].x
      const y = pos[i].y
      ops.push([x, y])
    }
  }
  const res = [];
  for (let i = 0; i < 20; i++) {
    let line = '';
    for (let j = 0; j < 10; j++) {
      const piece = field.at(j, i)
      if (page.operation && ops.find((op) => op[0] === j && op[1] === i)) {
        line += page.mino().type.toLowerCase()
      } else {
        line += piece
      }
    }
    res.push(line);
  }
  return res;
}

export default function decodeFumen(fumen) {
  const pages = decoder.decode(fumen);
  const res = pages.map(page => {
    return {
      field: pageToString(page),
      comment: page.comment,
    }
  })
  return res
}
