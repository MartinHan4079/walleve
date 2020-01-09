### `Set`

### `Set`对象允许你存储任何类型的唯一值，无论是原始值还是对象引用
`Set`的方法和`Map`的方法是一支的，特殊之处在于只能保存唯一的值。



`Set`和`Array`互换
```javascript
    mySet = new Set([1,2,3,4]);
    mySet.size   //4
    [...mySet];    //[1,2,3,4]

    var myArr = [v for ( v of mySet)]; //转数组
    var myArr = Array.from(mySet);  //转数组

    var intersection = new Set([...set1].filter(x => set2.has(x)));
    var difference = new Set([...set1].filter(x => !set2.has(x)));

    mySet.forEach(function(value) {
         console.log(value);
    })
```
`String`相关
```javascript
   var text = 'Indiana';
   var mySet = new Set(text);
   mySet.size;    // 5
```


