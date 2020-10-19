    最近做一个node层处理转发api的服务，其他方法都没啥问题，走到post方法接收formData数据的时候，除了问题。尝试了几种方法都没有走通，最后由于其他事情就搁置了几天，这两天闲一点就专门研究了下。

由于第一次接触转发的概念，formData数据起初的理解是从前端获取到formdata数据然后在中间层处理封装成formdata然后，传给后端就可以了。
最后理解思路是对的但是一直没有搞好传值给后端的实现方法。


最后完成的代码如下：
```js

    const uploadRouter = require('koa-router')();

    var FormData = require('form-data');
    var axios = require('axios');
    const fs = require('fs')
    const path = require('path')


    uploadRouter.post('/upload', async (ctx, next) => {

      const file = ctx.request.files.file

      const reader = fs.createReadStream(file.path);
      let filePath = path.join(__dirname, './public/upload/') + `/${file.name}`;
      // 创建可写流
      const upStream = fs.createWriteStream(filePath);
      // 可读流通过管道写入可写流
      reader.pipe(upStream);

      var form = new FormData();
      form.append('file', reader);

      let getHeaders = (form=>{
        return new Promise((resolve,reject)=>{
          form.getLength((err,length)=>{
            if(err) reject(err)
            let headers = Object.assign({'Content-Length':length},form.getHeaders())
            resolve(headers)
          })
        })
      })


      getHeaders(form)
        .then(headers=>{
          return axios.post(url,form,{headers:headers})
        })
        .then((response)=>{
          console.log(response.data);
        })
        .catch(e=>{console.log(e)})

        return ctx.body = "上传成功！";

    });

    module.exports = uploadRouter.routes();




```