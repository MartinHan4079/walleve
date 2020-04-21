### 记一个rxjs封装的ajax请求

具体代码如下
```Typescript
  import { Observable } from 'rxjs';
  import { map, catchError, retry, tap } from 'rxjs/operators';
  import { ajax, AjaxError } from 'rxjs/ajax';

  import config from '../config';
  import { getToken } from './utils';
  import { message } from 'antd';

  const { baseURL } = config;

  export interface ResponseData {
    success:boolean
    code:string
    message:string
    data:any
    time:number
  }

  type Method = 'POST' | 'GET' | 'DELETE' | 'PUT';

  type Config = {
    url:string
    method?:Method
    params?:any
    baseUrl?:string
  }

  const errorRequest = (error: AjaxError ) => {
    return new Observable(() => {
      if(error.status === 401) {
        //...
      }
    })
  };


  function setQueryUrl(params: { [x: string]: string | number | boolean; }) {
    let query = '?';
    for (let key in params) {
      query += encodeURIComponent(key) + '=' + encodeURIComponent(params[key]) + '&';
    }
    query = query.substring(0,query.length-1);
    return query;
  }

  const request = (config:Config) => {

    let payload = config.params;

    let headers = {
      'Access-Control-Allow-Credentials': true,
      'Access-Control-Allow-Origin':'*',
      'Set-Cookie': 'CookieName=CookieValue; SameSite=Strict',
      'Authorization': `${getToken()}`,
    }

    if (Object.prototype.toString.call(config.params) !== '[object FormData]') {
      payload = JSON.stringify(config.params);
      headers = Object.assign(headers,{'Content-Type':'application/json'})
    }

    const congifAjax = {
      url: `${config.baseUrl?config.baseUrl:baseURL}${config.url}`,
      method: config.method || "GET",
      headers: headers,
      body: payload,
    }

    if(config.method === "GET") {
      congifAjax.url = `${congifAjax.url}${setQueryUrl(config.params)}`;
    }

    return ajax(congifAjax).pipe(
      tap((ajaxResponse) => {
        if(ajaxResponse.status !== 200) {
          console.error(ajaxResponse)
        }else {
          const {response} = ajaxResponse
          if(response.code && response.code !== '200') {
             console.error(response)
          }
        }
      }),
      map(({response}) => response),
      retry(1),
      catchError(error => {
        return errorRequest(error);
      })
    );
  };

  export default request;

```

### 用法

```Typescript

    export const getUser = (params: string) => request({
      url:'/getUser',
      method:'GET',
      params:params
    });


    interface LoginParam {
      username:string
      password:string
    }
    export const login = (params: LoginParam) => {
      const payload = new FormData();
      payload.append('username',params.username)
      payload.append('password',params.password)
      return request({
        url:'',
        method:'POST',
        params:payload,
        baseUrl:"..."
      });
    }

```