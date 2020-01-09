
### html基础备忘

### !DOCTYPE html
声明文档类型. 规定了HTML页面必须遵从的良好规则,能自动检测错误和其他有用的东西.`<!DOCTYPE html>`是最短的有效文档声明.


### html
这个元素包裹整个页面，是一个html文件的根元素.

```html
    <html lang="en-US">   <!--设定文档的主语言-->
```
### head
不显示在界面上的内容容器，主要是声明文档编码类型，文件引用，以及引用其他常用的声明.常用的包括引入css样式文件，声明html文档类型,元数据，声明页面的缩放类型等。

#### meta
为页面添加页面的元数据信息.

#### title
`<title>`标签 包含页面的标题 
<!-- more -->

#### link
引用外部资源，常见的引用资源有css样式表，和自定义图标
```html
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="./style.css">
```
#### script
引用脚本,它的位置最好放在`</body>`之前。`async`属性规定一旦脚本可用，则会一部执行——只适用于加载外部脚本。`defer`属性规定脚本在页面完成解析时执行，不指定伤处两种属性时：在浏览器继续解析页面之前，立即读取并执行脚本。
```html
    <script src="file.js"></script>
    <script src="file.js" async></script>
    <script src="file.js" defer></script>
```


### body
显示内容的容器.

#### h1 ~ h6
标题标签，`<h1>`表示主标题,`<h2>`表示二级子标题... .

#### ul ol
`<ul>`无序列表
```html
    <ul>
        <li>牛奶</li>
        <li>鸡蛋</li>
        <li>面包</li>
        <li>鹰嘴豆泥</li>
    </ul>
```
`<ol>`有序列表
```html
    <ol>
        <li>牛奶</li>
        <li>鸡蛋</li>
        <li>面包</li>
        <li>鹰嘴豆泥</li>
    </ol>
```
当然列表是可以嵌套的

#### em strong
`<em>`强调
```html
    <p>I am <em>glad</em> you weren't <em>late</em>.</p>
```
`<strong>`表示重要
```html
    <p>This liquid is <strong>highly toxic</strong> —if you drink it, <strong>you may <em>die</em></strong>.</p>
```

#### a
超链接
```html
    <a href="./index.html" title="首页"></a>

    <!--指向页面中的特定文本-->
    <a href="./index.html#main" title="首页"></a>
    <!-- #mian 指的是页面内的元素id-->

    <a href="https://download.mozilla.org/?product=firefox-39.0-SSL&os=win&lang=en-US" download="firefox-39-installer.exe">Download Firefox 39 for Windows</a>
    <!-- 下载属性-->

    <!-- 电子邮件链接-->
    <a href="mailto:nowhere@mozilla.org?cc=name2@rapidtables.com&bcc=name3@rapidtables.com&amp;subject=The%20subject%20of%20the%20email &amp;body=The%20body%20of%20the%20email">Send mail with cc, bcc, subject and body</a>

```
链接优化：
* 用清晰的链接措辞。
* 尽可能使用相对链接。
* 链接到非html资源 — 留下清晰的路标
* 在下载链接时使用下载属性。

#### dl
描述列表,通常用来标记定义
```html
    <dl>
        <dt>邮件</dt>
        <dd>example@example.com<dd>
        <dt>地址</dt>
        <dd>上海<dd>
    </dl>
```

#### blockquote q cite
引用：块引用,行内引用 eg：
```html  块引用
    <blockquote cite="https://developer.mozilla.org/en-US/docs/Web/HTML/Element/blockquote">
        <p>The <strong>HTML <code>&lt;blockquote&gt;</code>Element</strong> (or <em>HTML BlockQuotation Element</em>) indicates that the enclosed text is an extended quotation.</p>
    </blockquote>
```
```html 行内引用
    <p>The quote element — <code>&lt;q&gt;</code> — is <q cite="https://developer.mozilla.org/en-US/docs/Web/HTML/Element/q">intended for short quotations that don't require paragraph breaks.</q></p>
```
`<cite>`标签 引文 默认斜体 通常放在引用旁边 用来表示文章的出处
```html 
    <p>According to the <a href="https://developer.mozilla.org/en-US/docs/Web/HTML/Element/blockquote"><cite>MDN blockquote page</cite></a>:</p>
```


#### abbr
缩略语
```html
    <p>We use <abbr title="Hypertext Markup Language">HTML</abbr> to structure our web documents.</p>
```


#### address
```html
    <address>
        <p>Chris Mills, Manchester, The Grim North, UK</p>
    </address>
```
标记联系地址：`<address>`元素是为了标记编写HTML文档的人的联系方式，而不是任何其他的地址。因此，如果这是Chris写的文档，上面的内容将会很好。注意，下面的内容也是可以的：
```html
    <address>
        <p>Page written by <a href="../authors/chris-mills/">Chris Mills</a>.</p>
    </address>
```

#### sup sub
上标和下标
```html
    <p>Caffeine's chemical formula is C<sub>8</sub>H<sub>10</sub>N<sub>4</sub>O<sub>2</sub>.</p>
    <p>If x<sup>2</sup> is 9, x must equal 3 or -3.</p>
```

#### code pre var kbd samp
```html
    <pre>
        <code>
            var para = document.querySelector('p');
                para.onclick = function() {
                alert('Owww, stop poking me!');
            }
        </code>
    </pre>

<p>You shouldn't use presentational elements like <code>&lt;font&gt;</code> and <code>&lt;center&gt;</code>.</p>

<p>In the above JavaScript example, <var>para</var> represents a paragraph element.</p>

<p>Select all the text with <kbd>Ctrl</kbd>/<kbd>Cmd</kbd> + <kbd>A</kbd>.</p>

<pre>$ <kbd>ping mozilla.org</kbd>
<samp>PING mozilla.org (63.245.215.20): 56 data bytes 64 bytes from 63.245.215.20: icmp_seq=0 ttl=40 time=158.233 ms</samp></pre>
```

#### time
标记时间的标签
```html
    <time datetime="2016-01-20">20 January 2016</time>
```

#### 语义标记
```
- `<header>` 标题
- `<nav>`    导航栏
- `<main>` 主要内容
- `<aside>` 侧栏;经常嵌套在`  <main> `中
- `<footer>` 页脚
- `<article>` 文章内容
- `<section>` 独立的功能页面
```
hr 分割线




