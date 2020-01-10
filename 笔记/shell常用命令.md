
### shell常用命令备忘

#### ls 列出文件
```
`ls -la` 列出当前目录下的所有文件和文件夹
`ls a*` 列出当前目录下的所有以a字母开头的文件
`ls -l *.txt` 列出当前目录下所以后缀名为txt的文件
```

#### cp 复制
```
`cp a.txt b.txt` 把文件a的内容复制到b文件
`cp a.txt ./test` 把文件a复制到test目录下
`cp -a test test2` 递归的把目录test下的所有文件（包括隐藏的文件）复制到新的目录 test2
```

#### cat 查看 和 组合文件
```
`cat a.txt` 查看文件内容
`cat a.txt >> b.txt` 把a文件的内容组合到b文件内容的末尾
`cat -n a.txt` 查看文件并给文件按标上行号
```

#### touch 创建文件
```
`touch a.txt` 创建一个名为a的txt类型文件
```

#### rm 删除文件
```
`rm -rf a.txt` 强制删除文件a.txt
`tm -i a.txt` 删除文件前会有提示 是否确定删除该文件
```

#### mkdir 创建目录
```
`mkdir test` 在当前目录下创建名为test的目录
```
### rmdir 删除目录
```
`rmdir test` 删除当前目录下的test目录
```

#### mv 移动 重命名文件
```
`mv a.txt b.txt` 将文件a.txt重命名为b.txt
`mv a.txt ./test` 将文件a.txt移动到test目录下
```

#### cd 更换目录
```
`cd ~` 切换到用户目录
`cd ..` 返回到上一层目录
`cd ./test/` 进入test目录
```

#### grep 搜索文件
```
`ls -la | grep a.txt` 搜索a.txt文件
```

#### find 查找文件 和搜索目录
```
`find filename` 查找当前文件夹下是否有该文件或目录
```

#### rz sz 上传和下载文件


#### head 显示文件前10行内容
```
`head a2.txt` 显示a2.txt的前10行内容
```
#### tail 显示文件最后10行内容
```
`tail a2.txt` 显示a2.txt的最后10行内容
```
