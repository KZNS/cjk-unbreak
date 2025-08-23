#import "@preview/touying:0.6.1": utils

#let get-positional-param-names(it) = (
  if it.has("body") {
    // TODO: add more cases for math functions
    if it.func() == math.underbrace {
      ("body", "annotation")
    } else if it.func() in (place, align) {
      ("alignment", "body")
    } else {
      ("body",)
    }
  } else if it.has("children") {
    ("children",)
  } else {
    // has no fields?
    none
  }
)

#let reconstruct(it, named-params, positional-params) = {
  let label = named-params.remove("label", default: none)
  if label != none {
    return utils.label-it((it.func())(..named-params, ..positional-params), label)
  } else {
    return (it.func())(..named-params, ..positional-params)
  }
}

#let transform-childs(it, transform-func) = {
  if type(it) == content {
    if utils.is-sequence(it) {
      for item in it.children {
        transform-func(item)
      }
    } else if utils.is-styled(it) {
      let child = transform-func(it.child)
      utils.reconstruct-styled(it, child)
    } else {
      let positional-param-names = get-positional-param-names(it)
      if positional-param-names != none {
        let fields = it.fields()
        let positional-params = {
          for name in positional-param-names {
            let x = fields.remove(name, default: none)
            if name == "children" {
              x.map(i => transform-func(i))
            } else {
              (transform-func(x),)
            }
          }
        }
        for (key, value) in fields {
          fields.insert(key, transform-func(value))
        }
        reconstruct(it, fields, positional-params)
      } else {
        // has no fields
        it
      }
    }
  } else if type(it) == array {
    it.map(i => transform-func(i))
  } else {
    it
  }
}
