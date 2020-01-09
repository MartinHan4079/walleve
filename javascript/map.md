### `Map`

`Map`对象保存键值对。任何值(对象或者原始值)都可以作为一个键或者一个值 。参数是一个可迭代（iterable）对象。null会被当作undefined.

#### 方法

`clear()` 移除`Map`对象的所有键/值对。

`delete(key)` 移除任何与键相关的值，并且返回该值

`entries()` 返回一个新的Iterator对象，它按插入顺序包含了`Map`对象中每个元素的键。

`forEach(callbackFn[, thisArg])` 按插入顺序，为Map对象里的每一个键值对调用一次callbackFn函数.如果为forEach提供了thisArg，它将在每次回调中作为this值。

`get(key)` 返回对应的值，不存在则返回undefined

`has(key)`返回一个布尔值，表示Map实例是否包含键对应的值

`keys()` 返回一个新的`Interator`对象，它按插入顺序包含了`Map`对象中的每一个元素的键

`set(key, value)` 设置`Map`对象中的键的值，返回该`Map`对象

`values()` 返回一个新的`Interator`对象，它按插入顺序包含了`Map`对象中每一个元素的值

```javascript
var myMap = new Map();

var keyObj = {},
    keyFunc = function () {},
    keyString = "a string";
// 添加键
myMap.set(keyString, "this is test!");
myMap.set(keyObj, "this is text");

myMap.size;  //3

// 读取值
myMap.get(keyString);
myMap.get(keyObj);
myMap.get(keyFunc);

myMap.get("a string");

myMap.get({}) //undefined
myMap.get(function() {}) //undefined
```

#### NaN作为键值
```javascript
myMap.set(NaN, "not a number");
myMap.get(NaN);  //"not a number"
var otherNaN = Number("foo");
myMap.get(otherNaN); //"not a number"
```




#### for···of迭代
```javascript

for (var [key, value] of myMap) {
    console.log(key + " = " + value);
}

for(var key of myMap.keys()) {
    console.log(key);
}
for(var value of myMap.values()) {
    console.log(value);
}

for(var [key, value] of myMap.entries()) {
    console.log(key + " = " + value);
}
````

#### forEach()迭代

```javascript
myMap.forEach(function(value, key) {
    console.log(key + " = " + value);
}, myMap)
```
