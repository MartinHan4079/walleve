> python项目云服务器部署

首先python项目打包就不说了，从把文件上传到服务器(centos7.4)开始：

本地文件上传至服务器`scp` 第一个是本地文件地址，后一个是服务器ip和相应的文件保存地址。

```
scp /test/flaskr-1.0.0-py3-none-any.whl root@45.40.244.229:/upload/flaskr-1.0.0-py3-none-any.whl
```

文件上传好以后，云服务器安装python3，

1.去官网找python3源码下载地址，使用wegt下载python3源码压缩包。


先安装依赖环境，不然pip3安装的时候会报错。。。
```
  yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel


  wegt https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz
```

解压：
```
  tar -zxvf Python-3.7.4.tgz
```

然后到/usr/local/目录下建立一个空目录python3.下面编译安装（gcc没有安装的话，可安装后继续，安装方法自行google）

然后转到python3的解压文件夹目录下 `eg:/Python-3.7.4 ` 执行以下

```
./configure --prefix=/usr/local/python3

make && make install 
```
`make install` 这一步如果报错，需要google，大多数是依赖环境没有安装，安装一下就好。当然报错一定要先去把错误解决以后才能往下执行，不然后面会冒出来各种错
比如安装好以后发现，虚拟环境打不开什么的。。

执行完以后,添加软连接
```
ln -S /usr/local/python3/bin/python3 /usr/bin/python3
```
至此python3安装完成 还需要安装pip3工具

```
curl https://bootstrap.pypa.io/get-pip.py | python3
```
添加软连接
```
ln -S /usr/local/python3/bin/pip3 /usr/bin/pip3
```

python3安装完成以后，新建文件夹.env
```
  mkdir .env
  python3 -m venv .env
  . /.env/bin/activate


  //切换目录
  pip3 install flaskr-1.0.0-py3-none-any.whl
  export FLASK_APP = flaskr
  //初始化数据库
  flask init_db

  //安装生产环境服务器
  pip install waitress

  //启动服务
  waitress-serve --call 'flaskr:create_app'

```




