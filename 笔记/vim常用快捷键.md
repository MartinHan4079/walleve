
### Vim 常用快捷键

#### 进入vi的命令
```
`vi filename` 打开或新建文件 并将光标置于第一行行首
`vi + n filename` 打开文件 并将光标置于第n行行首
`vi + /pattern filename` 打开文件，并将光标置于第一个与pattern匹配的串处
`vi -r filename` 当vi编辑被意外关闭时，恢复filename
```

#### 移动光标命令
```
`h` 光标左移一个字符
`l` 光标右移一个字符
`space` 光标右移一个字符
`Backspace` 光标上移一行
`k and Ctrl+p` 光标上移一行
`j and Ctrl+n` 光标下移一行
`Enter` 光标下移一行
`w and W` 光标右移一个字符 位置：字符的句首
`b and B` 光标左移一个字符 位置：字符的字尾
`e and E` 光标右移一个字符 位置：字符的字尾
`)` 光标移至句尾
`(` 光标移至句首
`}` 光标移至块的开头
`{` 光标移至块的结尾
`nG` 光标移至第n行 行首
`n+` 光标下移n行
`n-` 光标上移n行
`n$` 光标移至第n行 行尾
`H` 光标移至屏幕顶行 
`M` 光标移至屏幕中间行
`L` 光标移至屏幕最后一行
`0` 数字0 光标移至当前行的行首
`$` 光标移至当前行的 行尾
```

#### 屏幕翻滚命令
```
`Ctrl+u` 向上翻半屏
`Ctrl+d` 想下翻半屏
`Ctrl+f` 想下翻一屏
`Ctrl+b` 向上翻一屏
`z + Enter` 将当前行翻滚至屏幕顶部 
```

#### 插入文本命令
```
`i` 在光标前 插入文本
`I` 在当前行 行首插入文本
`a` 在光标后 插入文本
`A` 在当前行 行尾插入文本
`o` 在光标的下一行新开一行 
`O` 在光标的上一行新开一行

`r` 替换当前字符
`R` 替换当前字符及其之后的字符`Esc`推出
`s` 从当前光标位置处开始，以输入的文本替代指定数目的字符
`S` 删除指定数目的行，并以输入的文本替
```

***
```
`ncw and nCW` 修改指定数目的字   
`nCC` 修改指定数目的行
```
***


#### 删除命令
```
`ndw and ndW` 删除光标处开始及其后的n-1个字 
`do` 删除至行首
`d$` 删除至行尾 
`ndd` 删除当前行及其后n-1行 
`x || X` 删除一个字符，小写x删除光标后的字符,大写X删除光标前的字符
`Ctrl+u` 删除输入方式下所输入的文本 
```

#### 搜索和替换命令
```
`/pattern` 从光标开始向文件尾 搜索pattern
`?pattern` 从光标开始向文件头 搜索pattern
`n` 在同一个方向上重复上一次搜索命令
`N` 在反方向上重复上一次搜索命令


`:s/p1/p2/g` 将当前行中所有的p1替换成p2
`:n1,n2s/p1/p2/g` 将第n1行至n2行中的所有p1替换成p2
`:g/p1/s//p2/g` 将文件中的所有p1替换成p2
```

#### 操作行命令
```
`: n1,n2 co n3` 将n1行到n2行之间的内容拷贝到第n3行下
`: n1,n2 m n3` 将n1行到n2行之间的内容移动至第n3行下
`: n1,n2 d` 将n1行到n2行之间的内容删除
`: w` 保存当前文件
`: e filename` 打开文件filename进行编辑
`: x ` 保存当前文件并退出
`: q` 推出vi
`: q!` 不保存文件 并推出vi
`：!command` 执行shell命令command 
`：n1,n2 w!command` 将文件中n1行至n2行的内容作为command的输入并执行之，若不指定n1，n2，则表示将整个文件内容作为command的输入 
`：r!command` 将命令command的输出结果放到当前行 
```