    项目上线后的一次总结

最近项目刚刚上线，清闲了一点来聊一聊用到的工具。ps: 有一样的的可以加个好友一块探讨技术。

项目的前端部分完全采用hooks的方式。相较与class的生命周期，是省去了很多的代码，在加上antd4对hook进行了支持，特别是对form进行了大量的重构。
对表单的处理越来越方便，简洁，直观。

下面说下rxjs在项目中用的比较多的地方
1. ajax使用rxjs进行简单的封装[这里有介绍](https://www.jackeybiao.com/#/post/10)，
2. 使用rxjs进行局部、全局的状态管理[这里有介绍](https://www.jackeybiao.com/#/post/7)
3. 函数防抖[这里有介绍](https://www.jackeybiao.com/#/post/8)


下面是用到的一些开源工具

1. antd组件
2. 引入typescript
2. keycloak实现的用户管理，菜单，路由，权限管理
3. echarts做的可视化页面
4. husky + prettier + pretty-quick 做的代码格式化(未对代码格式问题进行提交报错处理)
5. scss等工具


### 开发中遇到的问题

1. keycloak接入路由与权限和菜单匹配问题

处理方式：前端固定路由，用获取过来的用户菜单进行路由和菜单匹配过滤无权限的路由，然后进行路由渲染。

2. 项目中查询结合table的页面很多导致很多代码重复。

处理方式：整理了一个form和和table公用的hooks。减少不必要的代码[这里有做介绍](https://www.jackeybiao.com/#/post/16)。


3. 项目上线

再上线过程中，使用jenkins部署过程中发现npm里面下不到node-sass包，导致部署老是失败。最后被迫使用了阿里的npm镜像。部署上线。


4. typescript升级问题

再项目开发过程中，typescript从3.7直接跳到了3.9，3.9带来了很多性能上的提升，就想着升级版本。升级以后发现部署报错。。着急。发现很多webpack里面的配置需要进行修改和部分react的工具要进行升级。(项目用的create-react-app reject)。最后项目赶工，就没来得及直接回退了版本。后面闲了再进行升级。


5. 最后吐槽一下

编码规范，和文档是多么的重要！！！

