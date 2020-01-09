### 数组

`Array.from()` 方法从一个类似数组或可迭代对象中创建一个新的数组实例

```javascript
    const bar = ["a","b","c"]
    const barItem = Array.from(bar)
    console.log(barItem)   // ["a","b","c"]

    const strArr = Array.from('foo')
    console.log(strArr)  // ["f","o","o"]
```

`Array.of()` 方法创建一个具有可变数量参数的新数组实例，而不考虑参数的数量或类型
参数：elementN 任意个参数，将按顺序成为返回数组中的元素
返回值：新的`Array`实例
```javascript
    Array.of(7)    // [7]
```

`Array.entries()` 方法返回一个新的Array Lterator对象，该对象包含数组中的每个索引的键/值对

```javascript
    var arr = ["a","b","c"]
    var iterator = arr.entries()
    console.log(iterator)
    console.log(iterator.next())       //[0,'a']
    console.log(iterator.next().value) //[1,'b']
    console.log(iterator.next().value) //[2,'c']

    var arr = ["a","b","c"]
    var iterator1 = arr.entries()
    let bb = []
    for(let i=0; i < arr.length+1; i++){
        var tem =iterator1.next()
        console.log(tem.done)
        if(tem.done !== true){
            console.log(tem.value)
            a[i] = tem.value
        }
    }
    console.log(bb)


    eg:二维数组排序
    function sortArr(arr){
        var goNext = true
        var entries = arr.entries
        while (goNext) {
            var result = entries.next()
            if(result.done !== true){
                result.value[1].sort((a,b) => a - b)
                goNext = true
            }else {
                goNext = false
            }
        }
        return arr
    }
    var arr = [[1,34],[456,765,645,234,765,75],[1,4,6,8,3,4,6],[865,3,5645,8,67,4,456,3]]
    sortArr(arr)

    var arr = ["a","b","c"]
    var iterator = arr.entries()
    for (let e of iterator){
        console.log (e)
    }
    // [0,'a']
    // [1,'b']
    // [2,'c']
```

`Array.keys` 返回一个新的Array迭代器，它包含数组中每个索引的键

```javascript
    let arr = ['a','b','c']
    let iterator = arr.keys()
    console.log(iterator.next()) //object {value:0,done:false}
```

`Array.includes()` 方法用来判断一个数组是否包含一个指定的值，根据情况，如果包含则返回true，否则返回false

```javascript
    let a = [1,2,3]
    a.includes(2) //true
```


`Array.indexOf() / Array.lastIndexOf()` 方法返回在数组中可以找到一个给定元素的第一个索引，如果不存在，则返回-1

```javascript
    var str = 'To be, or not to be, that is the question.'
    var count = 0
    var pos = str.indexOf('e')
    while (pos !== -1){
        count++
        pos = str.indexOf('e', pos + 1)
    }
    console.log(count)
```


`Array.every()` 检测数组的所有元素是否都通过了指定函数的测试

```javascript
    function isBigEnough(element,index,array) {
        return (element >= 10)
    }
    var passed = [12, 5, 8, 130, 44].every(isBigEnough)  //false
    passed = [12,30,40].every(isBigEnough)
```

`Array.filter()` 方法创建一个新数组，其包含通过所提供函数实习那的测试的所有元素 

```javascript
    function isBigEnough(value) {
        return value >= 10
    }
    var filtered = [12, 1, 3, 45, 56, 44].filter(isBigEnough) //[12,45,56,44]
```
`Array.find() 、Array.findIndex()` find()方法返回数组中满足提供的测试函数的第一个元素的值，否则返回undefined ,findIndex()方法返回数组中满足提供的测试函数的第一个索引

```javascript
    function isBigEnough(element) {
        return element >= 15
    }
    var ret1 = [12, 5, 8, 130, 44].find(isBigEnough)
    var ret2 = [12, 5, 8, 130, 44].findIndex(isBigEnough)
    console.log(ret1)   //130
    console.log(ret2)   //3
```

`Array.forEach()` 方法对数组的每一个元素执行一次提供的函数 没有返回值。为一些相同的元素，绑定事件处理器

```javascript
    const arr = ['a','b','c']
    arr.forEach(function(element) {
        console.log(element)
    })
    arr.forEach( element => console.log(element))
```

`concat` 链接两个或更多的数组 并返回结果
可以用来连接值 或者数组

```javascript
    let a=[1,2,3];
    let b=a.concat(4,5);
    console.log(b); //[1,2,3,4,5]
    let c=[6,7,8];
    let d=a.contact(b,c);
    console.log(d); //[1,2,3,4,5,6,7,8]
```

`join` 方法用于把数组中的所有元素放入一个字符串 用指定的分隔符进行分割

```javascript
    let arr = new Array(3)
    arr[0] = "George"
    arr[1] = "John"
    arr[2] = "Thomas"
    let arr1 = arr.join(".")
    let arr2 = arr.join()
    console.log(arr1) //George.John.Thomas
    console.log(arr2) //George,John,Thomas
```

`split` 方法用于把一个字符串分割成字符串数组 和join执行的操作相反的

```javascript
    let str = "How are you doing today?"
    let str1 = str.split(" ")   //How,are,you,doing,today?
    let str2 = str.split("")    //H,o,w, ,a,r,e, ,y,o,u, ,d,o,i,n,g, ,t,o,d,a,y,?
    let str3 = str.split(" ",3) //How,are,you
    "2:3:4:5".split(":")        //["2","3","4","5"]
    "|a|b|c".split("|")         //["","a","b","c"]
```

`pop` 删除并返回数组的最后一个元素

```javascript
    let arr4 = [1,2,3,4]
    let num = arr4.pop() //num=4 arr4=[1,2,3]
```

`push` 向数组的末尾添加一个或者多个元素，并返回新的长度

```javascript
    let arr1 = [1,2,3,4]
    let len = arr1.push(5)
    console.log(len)  //5
    console.log(arr1) //[1,2,3,4,5]
```

`reverse` 反转数组

```javascript
    let arr1 = [1,2,3,4]
    let arr2 = arr1.reverse(); //[4,3,2,1]
```

`shift` 方法用于把数组的第一个元素从其中删除，并返回第一个元素的值

```javascript
    let arr1 = [1,2,3,4]
    let value = arr1.shift()
    console.log(arr1,value) //[2,3,4],1
```

`slice` 从已有的数组中返回选定的元素 该方法不会修改数组而是返回一个子数组 包含从 start 到 end （不包括该元素）的 arrayObject 中的元素
`arrayObject.slice(start,end)` `end`是可选的 

```javascript
    let arr1 = [1,2,3,4]
    let arr2 = arr1.slice(2,3)
    console.log(arr2); //[3] 
```

`sort` 对数组的元素进行排序  字符编码的顺序进行排序 先把数组元素转成字符串在进行排序

```javascript
    let arr1 = [1,5,3,4]
    let arr2 = arr1.sort()
    console.log(arr1,arr2) //arr1=[1,3,4,5] arr2=[1,3,4,5]
```

`splice` 像数组中添加/删除项目，然后返回被删除的项目。该方法会改变原始数组

```javascript
    let arr1 = [1,5,3,4]
    arr1.splice(2,0,"William")
    console.log(arr1) //[1,5,"William","3","4"]
```

`toString` 把数组转换为字符串，并返回结果，结果与没有参数的join()返回的字符串相同

```javascript
    let arr1 = [1,5,3,4]
    let arr2 = arr1.toString()
    console.log(arr2) //1,5,3,4
```

`toLocaleString` 把数组转换为本地数组，并返回结果


`unshift` 向数组的开头添加一个或更多元素，并返回新的长度

```javascript
    let arr1 = [1,5,3,4]
    let len = arr1.unshift("6")
    console.log(arr1,len) //["6",1,5,3,4]  5
```

