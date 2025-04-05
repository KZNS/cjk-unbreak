# cjk-unbreak

cjk-unbreak is a package that removes spaces around CJK characters introduced by
line breaks or element changes in the source Typst file.

## Usage

Add the following code at the beginning of your document:

```typst
#import "@preview/cjk-unbreak:0.1.0": remove-cjk-break-space
#show: remove-cjk-break-space
```

The `remove-cjk-break-space` function will transform the content and remove
spaces like `[ ]` in `([中文], [ ], [字符])`, but it will not modify spaces
within text like `[中文 字符]`.

### Transform

cjk-unbreak use a function called `transform-childs` to modify the AST of the
content.
Unlike `show` in Typst, which applies multiple times until the content
stabilizes, the transform is applid only once.

See the source code of `remove-cjk-break-space` to learn more about how to use
`transform-childs`.

## Other information

This package is a temporary solution to
[Issue#792](https://github.com/typst/typst/issues/792).

Thanks to [admk for providing the idea](https://github.com/typst/typst/issues/792#issuecomment-2310139085)
to remove `[ ]` from the sequence,
and to [touying](https://typst.app/universe/package/touying/), who demonstrated
how to modify the AST of content.
