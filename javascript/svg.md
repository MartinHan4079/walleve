### svg练习
> 杭州，深夜，雨。

d3进行中，需要svg基础支持，至此深夜来learning。
前言：
SVG简单来说是一种xml语言，可以用来绘制矢量图形

SVG的元素和属性必须按照标准格式来书写，因为XMl是区分大小写的（html不区分大小写）

SVG里的属性值必须用引号引起来,就算是数值也必须这么做


例子：
```html
  <svg version="1.1"
     baseProfile="full"
     width="300" height="200"
     xmlns="http://www.w3.org/2000/svg">

    <rect width="100%" height="100%" fill="red" />

    <circle cx="150" cy="100" r="80" fill="green" />

    <text x="150" y="125" font-size="60" text-anchor="middle" fill="white">SVG</text>

  </svg>
```
`rect` 矩形 `circle`圆形`cx`,`cy`分别表示向左偏移和向下偏移 `text`文本 `text-anchor`字体的垂直位置

SVG的元素渲染顺序 --后来居上，越后面的元素越可见

SVG引入方式   

1.如果HTML是XHTML并且声明类型为application/xhtml+xml，可以直接把SVG嵌入到XML源码中。

2.如果HTML是HTML5并且浏览器支持HTML5，同样可以直接嵌入SVG。然而为了符合HTML5标准，可能需要做一些语法调整。

3.可以通过 object 元素引用SVG文件：

  ```html
    <object data="image.svg" type="image/svg+xml" />
  ```

4.类似的也可以使用 iframe 元素引用SVG文件：
  ```html
    <iframe src="image.svg"></iframe>
  ```

5.理论上同样可以使用 img 元素，但是在低于4.0版本的Firefox 中不起作用。

6.最后SVG可以通过JavaScript动态创建并注入到HTML DOM中。 这样具有一个优点，可以对浏览器使用替代技术，在不能解析SVG的情况下，可以替换创建的内容。

坐标系统：类似于计算机绘图的坐标系统，x轴水平向右，y轴水平向下，原点在左上角。
  
#### 基本形状
矩形 `rect`
  ```html
    <rect x="10" y="10" rx="10" ry="10" width="30" height="30">
  ```
  x:矩形左上角在x轴的位置

  y:矩形左上角在y轴的位置

  width，height:矩形宽，高

  rx，ry 圆角半径方位

圆形 `circle`
  ```html
    <circle cx="25" cy="75" r="20"/>
  ```
  cx,cy,定义圆心位置，r定义半径
椭圆 `ellipes`
  ```html
    <ellipse cx="75" cy="75" rx="20" ry="5"/>
  ```

  cx,cy,定义椭圆圆心位置，rx,ry定义长轴半径，短轴半径

线条 `line`
  ```html
    <line x1="10" x2="50" y1="110" y2="150"/>
  ```

  x1,y1起点位置，x2,y2终点位置

折线 `polyline`
  ```html
    <polyline points="60 110, 65 120, 70 115, 75 130, 80 125, 85 140, 90 135, 95 150, 100 145"/>
  ```

  points:点集，每个点必须包含两个数字，第一个是x坐标，第二个是y坐标，每个数字用空白、逗号、终止命令符或者换行符分隔开。

折线 `polygon`
  ```html
    <polygon points="60 110, 65 120, 70 115, 75 130, 80 125, 85 140, 90 135, 95 150, 100 145"/>
  ```

  points:点集，每个点必须包含两个数字，第一个是x坐标，第二个是y坐标，每个数字用空白、逗号、终止命令符或者换行符分隔开。
  最后一个点会自动连接起点，绘制成闭合图形
  
路径 `path`
  ```html
    <path d="M 20 230 Q 40 205, 50 230 T 90230"/>
  ```

  d:一个点集数列以及其它关于如何绘制路径的信息
  path的d信息过多 也是命令加数值组成的点集。具体的信息在下一篇

睡觉，还未到一点，外面雨还在下。

> 参考文档：mdn SVG [API详情请见源文档](https://developer.mozilla.org/zh-CN/docs/Web/SVG/Tutorial/Basic_Shapes)


