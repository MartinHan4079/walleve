### 需求
名称 | 类型 |	默认值 |	简介
---|---|---|---
alignContent|'stretch' &#166; 'center' &#166; 'flex-start' &#166; 'flex-end' &#166; 'space-between' &#166; 'space-around' | 'stretch' | 定义 `align-content` 样式属性。它适用于所有屏幕尺寸。
alignItems | 'flex-start' &#166; 'center' &#166; 'flex-end' &#166; 'stretch' &#166; 'baseline' | 'stretch' | 定义 `align-items` 样式属性。它适用于所有屏幕尺寸。
children | node | | 组件的内容。
classes | object | | 扩展样式
component | elementType | "div" | 指定用户渲染根组件的html元素
container | boolean |  false | 为true时，组件具有flex的盒子属性，即成为容器
direction | 'row' &#166; 'row-reverse' &#166; 'column' &#166; 'column-reverse' | 'row' | 定义`justify-content`样式属性。它适用于所有屏幕尺寸。
lg | false &#166; 'auto' &#166; true &#166; 1 ~ 12 | false | 定义组件将要使用的网格数
md | false &#166; 'auto' &#166; true &#166; 1 ~ 12 | false | 定义组件将要使用的网格数
sm | false &#166; 'auto' &#166; true &#166; 1 ~ 12 | false | 定义组件将要使用的网格数
xl | false &#166; 'auto' &#166; true &#166; 1 ~ 12 | false | 定义组件将要使用的网格数
xs | false &#166; 'auto' &#166; true &#166; 1 ~ 12 | false | 定义组件将要使用的网格数
spacing | 0 ~ 10 | 0 | 定义类型item组件之间的间距。它只能在类型container组件上使用。
direction | 'nowrap' &#166; 'wrap' &#166; 'wrap-reverse' | 'wrap' | 定义`flex-wrap`样式属性。它适用于所有屏幕尺寸。
zeroMinWidth | boolean | false | 如果为true，则在项目上设置min-width: 0;

ref将被转发到组件的根元素, 提供的任何其他属性都将提供给根元素(HTML元素)