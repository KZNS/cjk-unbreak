#import "../lib.typ": *

#show: remove-cjk-break-space

#set heading(numbering: "一")
#outline()

= 目录里“一”和标题间的空格保留

目录里“一”和标题间的空格在 typst 中生成，不在 AST 中显示

换行没有
空格，行内 保留空格

- 列表
  也是可以的
  - 有空 格
  - 没空
    格

这种 *粗体* 间的空格也会去掉

你好。你好

你好。
你好

你好。abc。你好

你好。
abc。
你好

去掉的是 `[ ]` 这种空格
