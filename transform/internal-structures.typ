// sequence
#let typst-internal-sequence = ([A] + [ ] + [B]).func()
#let is-sequence(it) = {
  type(it) == content and it.func() == typst-internal-sequence
}

// styled
#let typst-internal-styled = [#set text(fill: red)].func()
#let is-styled(it) = {
  type(it) == content and it.func() == typst-internal-styled
}
#let reconstruct-styled(it, new-child) = {
  typst-internal-styled(new-child, it.styles)
}
