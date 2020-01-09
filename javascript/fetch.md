
今日大暑，外面依旧的热！

早上闲来无事，无意间看到了fetch，想来无事，就做以笔记，以备不时之需。

话说fetch是浏览器自带api无需引用任何外部扩展即可食用，味道甚是鲜美。`fetch`用法相较于XMLHttpRequest简直好用到了极点，食用时，仅需传入一个参数，即资源路径即可，无论请求成功与否，它都会返回一个Promise对象。即一个then就可以拿到返回值。

当然目前来看 除了IE，和edge对其支持不是很好外，其余没什么缺点。

下面来看[MDN](https://developer.mozilla.org/zh-CN/docs/Web/API/Fetch_API/Using_Fetch#进行_fetch_请求)上面的用例：
### 无参
```js
  fetch('http://example.com/movies.json')
    .then(response=> {
      return response.json();
    })
    .then(myJson => {
      console.log(myJson);
    })
```
### 有参
```js
postData('http://example.com/answer', {answer: 42})
  .then(data => console.log(data)) // JSON from `response.json()` call
  .catch(error => console.error(error))

function postData(url, data) {
  // Default options are marked with *
  return fetch(url, {
    body: JSON.stringify(data), // must match 'Content-Type' header
    cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
    credentials: 'same-origin', // include, same-origin, *omit
    headers: {
      'user-agent': 'Mozilla/4.0 MDN Example',
      'content-type': 'application/json'
    },
    method: 'POST', // *GET, POST, PUT, DELETE, etc.
    mode: 'cors', // no-cors, cors, *same-origin
    redirect: 'follow', // manual, *follow, error
    referrer: 'no-referrer', // *client, no-referrer
  })
  .then(response => response.json()) // parses response to JSON
}

```

### 跨域

```js
  fetch('https://example.com', {
    credentials: 'include'  
  })
  //让浏览器发送包含凭据的请求（即使是跨域源） credentials属性设为include
  //请求URL与调用脚本位于同一起源处时发送凭据 credentials属性设为same-origin
  //确保浏览器不在请求中包含凭据 credentials属性设为omit
```

### 上传json数据
```js
  var url = 'https://example.com/profile';
  var data = {username: 'example'};

  fetch(url, {
    method: 'POST', // or 'PUT'
    body: JSON.stringify(data), // data can be `string` or {object}!
    headers: new Headers({
      'Content-Type': 'application/json'
    })
  }).then(res => res.json())
  .catch(error => console.error('Error:', error))
  .then(response => console.log('Success:', response));
```
### 上传文件
```html 
  <input type="file" />
```
```js
  var formData = new FormData();
  var fileField = document.querySelector("input[type='file']");

  formData.append('username', 'abc123');
  formData.append('avatar', fileField.files[0]);

  fetch('https://example.com/profile/avatar', {
    method: 'PUT',
    body: formData
  })
  .then(response => response.json())
  .catch(error => console.error('Error:', error))
  .then(response => console.log('Success:', response));
```
### 上传多文件
```html 
  <input type="file" mutiple/> 
```
```js
  var formData = new FormData();
  var photos = document.querySelector("input[type='file'][multiple]");

  formData.append('title', 'My Vegas Vacation');
  formData.append('photos', photos.files);

  fetch('https://example.com/posts', {
    method: 'POST',
    body: formData
  })
  .then(response => response.json())
  .then(response => console.log('Success:', JSON.stringify(response)))
  .catch(error => console.error('Error:', error));
```

### 检测请求是否成功
```js
  fetch('flowers.jpg').then(function(response) {
    if(response.ok) {
      return response.blob();
    }
    throw new Error('Network response was not ok.');
  }).then(function(myBlob) { 
    var objectURL = URL.createObjectURL(myBlob); 
    myImage.src = objectURL; 
  }).catch(function(error) {
    console.log('There has been a problem with your fetch operation: ', error.message);
  });
```
### 自定义请求对象
```js
  var myHeaders = new Headers();

  var myInit = { method: 'GET',
                headers: myHeaders,
                mode: 'cors',
                cache: 'default' };

  var myRequest = new Request('flowers.jpg', myInit);

  fetch(myRequest).then(function(response) {
    return response.blob();
  }).then(function(myBlob) {
    var objectURL = URL.createObjectURL(myBlob);
    myImage.src = objectURL;
  });
```
Request() 和 fetch() 接受同样的参数。你甚至可以传入一个已存在的 request 对象来创造一个拷贝：可以使用不同的init参数。
```js
  var anotherRequest = new Request(myRequest,myInit);
```

### headers
一个 headers 对象是一个简单的多名值对。
传值方式如下：
```js
//方法1
  var content = "Hello World";
  var myHeaders = new Headers();
  myHeaders.append("Content-Type", "text/plain");
  myHeaders.append("Content-Length", content.length.toString());
  myHeaders.append("X-Custom-Header", "ProcessThisImmediately");
//方法2
  myHeaders = new Headers({
    "Content-Type": "text/plain",
    "Content-Length": content.length.toString(),
    "X-Custom-Header": "ProcessThisImmediately",
  });

```
它的内容可以被获取：
```js
  console.log(myHeaders.has("Content-Type")); // true
  console.log(myHeaders.has("Set-Cookie")); // false
  myHeaders.set("Content-Type", "text/html");
  myHeaders.append("X-Custom-Header", "AnotherValue");
  
  console.log(myHeaders.get("Content-Length")); // 11
  console.log(myHeaders.getAll("X-Custom-Header")); // ["ProcessThisImmediately", "AnotherValue"]
  
  myHeaders.delete("X-Custom-Header");
  console.log(myHeaders.getAll("X-Custom-Header")); // [ ]

```
### useFetch
下面是自定义的react hooks useFetch粗版：暂不支持文件提交

```js
import { useState, useEffect } from 'react';

export default function useFetch(url,params,method = 'GET') {
  const [data, setData] = useState([]);

  useEffect(() => {
    fetch(url,{
        method: method,
        body: JSON.stringify(params),
        headers: new Headers({
          'Content-Type': 'application/json'
        })
      })
      .then(response => response.json())
      .then(data => setData(data));
  }, []);
  return data;
}


//另有

  import { useState, useEffect } from "react";
  export default function useFetch(url) {
    const [data, setData] = useState([]);
    async function getData() {
      const response = await fetch(url);
      const data = await response.json();
      setData(data);
    }
    useEffect(() => {
      getData();
    }, []);
    return data;
  }

```

### Polyfill
要在不支持的浏览器中使用Fetch，可以使用[Fetch Polyfill](https://github.com/github/fetch)。








