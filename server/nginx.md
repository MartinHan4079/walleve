### nginx 

```
    ps -ef | grep nginx //查看当前nginx的进程及运行文件地址


    cd /usr/local/nginx/sbin 

    ./nginx //启动
    ./nginx  -s stop //关闭
    ./nginx -s reload //重启


    ./nginx -s reload //失败的话   
    
    ./nginx -t  //查看配置文件是否正确

    ./nginx -v //查看版本


    //log 常见文件地址
    /var/nginx/error.log
```

#### 配置简单静态服务器


```
    //在http里面新建


    server {
        listen 8080;
        server_name localhost;
        root /apps/oaapp;
        
        location / {
            root /apps/oaapp;                  # 项目文件的绝对地址
            index index.html index.htm;       # 默认启动文件
        }
    }

```



