#import "internal-structures.typ": *

#let transform-childs(rest, func) = {
  if is-sequence(rest) {
    for item in rest.children {
      func(item)
    }
  } else if is-styled(rest) {
    let child = func(rest.child)
    reconstruct-styled(rest, child)
  } else if rest.func() == link {
    link(rest.dest, func(rest.body))
  } else if rest.has("body") {
    let fields = rest.fields()
    let body = func(fields.remove("body"))
    let labe = fields.remove("label", default: none)
    let alignment = fields.remove("alignment", default: none)
    let supplement = fields.remove("supplement", default: auto)

    let unlabeled = if (rest.has("alignment")) {
      rest.func()(alignment, body, ..fields)
    } else if (rest.func() == figure) {
      rest.func()(body, supplement: supplement, ..fields)
    } else {
      rest.func()(body, ..fields)
    }
    if rest.has("label") {
      [#unlabeled#labe]
    } else {
      unlabeled
    }
  } else if rest.has("children") {
    let fields = rest.fields()
    let children = fields.remove("children").map(i => func(i))
    rest.func()(..children, ..fields)
  } else {
    rest
  }
}
