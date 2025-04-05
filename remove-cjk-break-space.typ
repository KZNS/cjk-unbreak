#import "transform-childs.typ": transform-childs
#import "@preview/touying:0.6.1": utils

#let cjk-char = "[\p{Han}，。；：！？‘’“”（）「」【】…—]"
#let ends-with-cjk(it) = {
  (
    it != none
      and (
        (it.has("text") and it.text.ends-with(regex(cjk-char))) or (it.has("body") and ends-with-cjk(it.body))
      )
  )
}
#let start-with-cjk(it) = {
  (
    it != none
      and (
        (it.has("text") and it.text.starts-with(regex(cjk-char))) or (it.has("body") and start-with-cjk(it.body))
      )
  )
}

#let remove-cjk-break-space(rest) = {
  rest = transform-childs(rest, remove-cjk-break-space)
  if utils.is-sequence(rest) {
    let last-a = none
    let last-b = none
    for item in rest.children {
      if last-b == [ ] {
        if ends-with-cjk(last-a) or start-with-cjk(item) {
          last-b = []
        }
      }
      last-a
      last-a = last-b
      last-b = item
    }
    last-a
    last-b
  } else {
    rest
  }
}
