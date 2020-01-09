### `String`方法
* `charAt()` 返回指定位置的字符
* `charCodeAt()` 返回表示给定索引的字符的Unicode的值
* `codePointAt()` 返回使用UTF_16编码的给特定位置的值的非负整数
* `concat()` 连接两个字符串文本，并返回一个新的字符串
* `includes()` 判断一个字符串里是否包含其他字符串
* `endsWidth()` 判断一个字符串的结尾是否包含其他字符串中的字符
* `indexOf()` 从字符串对象中返回首个被发现的给定值的索引值，如果没有找到则返回-1
* `lastIndexOf()` 从字符串对象中返回最后一个被发现的给定值，如果没有找到则返回-1
* `localeCompare()` 返回一个数字表示是否引用字符串在排序中位于比较字符串的前面，后面，或者两者相同
* `match()` 使用正则表达式与字符串相比较
* `normalize()` 返回调用字符串值的Unicode标准化形式
* `padEnd()` 在当前字符串尾部填充指定的字符串，直到达到指定的长度。返回一个新的字符串
* `padStart()` 在当前字符串头部填充指定的字符串，直到达到指定的长度。返回一个新的字符串
* `repeat()` 返回指定重复字数的由元素组成的字符串对象
* `replace()` 被用来在正则表达式和字符串直接比较，然后用新的字串来替换被匹配的子串
* `search()` 对正则表达式和指定字符串进行匹配搜索，返回第一个出现的匹配项的下标
* `slice()` 摘取一个字符串区域，返回一个新的字符串
* `split()` 通过分离字符串成串，将字符串对象分割成字符串数组
* `startsWidth()` 判断字符串的起始位置是否匹配其他字符串中的字符
* `substr()` 通过指定字符数返回在指定位置开始的字符串中的字符
* `substring()` 通过指定字符数返回在指定位置开始的字符串中的字符
* `toLocaleLowerCase()` 根据当前区域设置，将字符串的字符串转换成小写。对于大多数语言来说，`toLowerCase`的返回值是一致的
* `toLocaleUpperCase()` 根据当前区域设置，将字符串中的字符转换成大写，对于大多数语言来说，`toUpperCase`的返回值是一致的
* `toLowerCase()` 将字符串转换成小写并返回
* `toUpperCase()` 将字符串转换成大写并返回
* `toString()` 返回用字符串表示的特定对象，重写`Object.prototype.toString`方法
* `trim()` 去除字符串左右两边的空格
* `valueOf()` 返回特定对象的原始值， 重写`Object.prototype.valueOf()`方法


### 将其他值转换成字符串
*`String()` 使用 String() 方法将其它对象转化为字符串可以被认为是一种更加安全的做法，虽然该方法底层使用的也是 toString() 方法，但是针对 null/undefined/symbols，String() 方法会有特殊的处理
```javascript
    var outputStrings = [];
    for (let i = 0, n = inputValues.length; i < n; ++i) {
    outputStrings.push(String(inputValues[i]));
    }
```



### 转义字符
* `\0`  空字符 `" "`
* `\'` 单引号
* `\"` 双引号
* `\\` 反斜杠
* `\n` 换行
* `\r` 回车
* `\v` 垂直制表符
* `\t` 水平制表符
* `\b` 退格
* `\f` 换页
* `\uXXXX` unicode码
