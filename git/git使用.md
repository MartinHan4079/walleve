> 记录项目协同开发中遇到的各种git问题，以及git的常用命令
    
### 常用命令

#### 1. 安装好后打开git bash，设置全局用户名和邮箱

```js
    git config --global user.name "your name"

    git config --global user.email "your Email"
```

#### 2. 创建版本库(在已有项目的文件夹中创建版本库)

```js
    git init

    git add .||git add -A || git add fileName //添加所有更新的文件||添加所有文件||

    添加具体的文件

    git add fileName -f 强制添加文件到缓存区 建议少用

    git commit -m "commit description" //提交把修改提交到缓存区

    git remote add orogin git@github.com:**** / ***.git //连接远程仓库

    git push -u origin master || git push origin master //第一次提交到远程 || 以后提交简化

```

#### 3. 常用命令

```js

    git status //查看此刻的仓库状态

    git diff //查看文件的变化

    git log//显示从最近到最远的提交日志

    git log --pretty=oneline //简化日志一行显示

    git reset --hard HEAD^ //回退到上一个版本

    git reset --hard commit id //从历史版本中返回到指定的id的版本

    git reflog //记录每一条命令

    git checkout -- file //撤销更改 reset 也可以把缓存区的修改回退到工作区`

    rm file //删除文件
```
注：`git commit`只会把缓存区的内容提交 进入缓存的方式是add. git管理的是修改不是文件

#### 4、远程仓库

```js
    ssh-keygen -t rsa -C "youremail@example.com" //创建ssh秘钥

```

#### 5. 分支管理合并分支前先返回到主支，再合并 即：master

```js
    git branch   // 查看分支

    git branch <name>   // 创建分支

    git checkout <name>   // 切换分支

    git checkout -b <name>   // 创建并切换到该分支

    git merge <name>   // 合并某分支到当前分支

    git brance -d <name>  //删除分支
```


1. 解决冲突到合并是出现冲突

首先查看文件状态 git status可以查看冲突的位置，手动更改后再提交，最后删除分支git log --graph可以查看分支合并图

2. 分支管理策略

在分支上工作 master应该是稳定版 作为发布用 在分支修改然后合并到master支

3. bug分支

创建bug分支来修改bug，当然创建bug分支前应先保存当前分支的工作进度

```js
    git stash    // 保存当前分支的工作进度

    git stash list    // 查看stash内容

    git stash apply    // 回复到bug修改前的工作进度

    git stash apply stash@{0}    // 恢复到指定的工作进度中去

    git stash pop    // 删除stash存储的内容
```

4. Feature分支

开发新功能时创建feature分支

新功能完成后合并和bug支类似，当新功能要取消时 删除该feature

```js
    git branch -d <name> // 没合并是删除分支

    git branch -D <name> //如果合并后要删除 (强制删除分支)
```

5. 多人协作
```js
    git remote -v    // 查看远程库信息

    git pull    // 同步远程库版本

    git push    // 推送本地版本合并到远程
```

### 问题
1. Your branch is ahead of 'origin/master' by 2 commits. (use "git push" to publish your local commits)
同时又又发现fetch不下来远程分支，或导致出现主枝出现分叉.
解决办法：

```js
    git reset--softHEAD~1

    git reset--softHEAD~1
```

1. 然后把修改的文件自行拷贝一份出来，然后移除本地的所有更改。
2. 拉去远程分支。
3. 然后把刚刚拷贝的文件放回原处。
4. 看下状态，重新提交代码

