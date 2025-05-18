#import "lib.typ": *

#set page(margin: 1em, width: 30em, height: auto)

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

#import "@preview/cuti:0.3.0": *
#show: show-cn-fakebold
只检查 text 间的空格，其他类型不会去掉：\
这种*粗体* 间的空格 *粗体*不会去掉\
代码`code` 代码 `code`代码\
代码`代码` 代码 `代码`代码\

#let f(x) = { [中文] }
#f(1)中文\
#f(1) 中文\
#f(1)
中文

你好。你好\
你好。
你好

你好。abc。你好\
你好。
abc。
你好

去掉的是 `[ ]` 这种空格

#place(bottom, float: true)[23333]
