### angular工作区： 多应用程序项目

OctoPer的负载测试IDE（kraken）是具有多个前端应用程序的angular项目,
* 用于管理Docker容器和容器镜像的管理UI
* [使用Gatling](https://kraken.octoperf.com/gatling/)调试和执行负载测试的Gatling UI
这两个UI均基于Angular8，并共享许多组件，css和外部库依赖项。

这篇博文是想给每个想要创建具有多个应用程序和库的Angular Workspace的开发人员一份参考指南。

根据我创建Kraken的经验，首先说明如何使用Angular/Cli生成此类项目，
然后进行共享资源和单元测试，并给出有关部署的提示

### Angular多应用项目创建
首先，让我们要知道什么是angular Workspace
    Workspace是一组angular应用程序和库。`angular.json` 是Angular Workspace
    的根级别文件为构建和开发工具提供了工作区范围和特定于项目(应用程序或库)的配置默认值。

希望可以使用`Angular cli`生成Angular工作空间及其配置。就是本文章的主题：如何使用angular Cli
生成工作空间和其应用程序和库。

请记住，在Angular术语中项目既可以是应用程序，也可以是库。两者都存储在projects工作区的文件夹中，
并在根`angular.json`文件中进行配置。

#### 先决条件
Angular需要Node.js版本`10.9.0`或更高版本(运行`node -v`查看当前版本)。
Angular cli生成的Angular应用程序都依赖于以npm软件包的形式提供的外部库。
Node.js包含一个npm软件包管理器。运行`npm -v`以检查npm版本。我建议使用命令将npm更新到最新的可用版本
(在本博客发布时为6.10.0) `npm install -g npm@latest`。

最后，你需要Angular Cli, 使用以下命令在全局安装它：
```sh
    npm install -g @angular/cli
```

#### 创建工作区(Workspace)
`ng new <name>`命令用户生成工作空间
```sh
  ng new kraken --createApplication=false --directory=frontend --interactive=false
```
* `--createApplication=false`参数避免创建初始应用程序（默认值为true）。否则，Angular CLI src在新工作空间的文件夹中创建一个应用程序。在工作空间的子文件夹（projects）中生成应用程序。
* `--interactive=false`参数用在此处，用以避免angular cli创建项目时提示无用的参数，例如初始应用程序（我们不生成）是否应包含路由模块或要使用的CSS预处理程序。
* `--directory=frontend`参数是初始化工作空间的目录名称。默认为工作空间名称。
<img src="https://octoperf.com/img/blog/kraken-angular-workspace-multi-application-project/angular-cli-new-workspace.png" />

正如我们在上面的屏幕截图中看到的那样，此命令在`frontend`文件夹中生成了几个文件

第一个是Angular Workspace配置文件 `angular.json`。目前，它仅包含有关项目（应用程序和库）
位置的信息。一旦我们生成了一些东西，它将变得非常复杂。

```json
    {
      "$schema": "./node_modules/@angular/cli/lib/config/schema.json",
      "version": 1,
      "newProjectRoot": "projects",
      "projects": {}
    }
```
该package.json文件列出了Angular所需的所有依赖关系。
由于该ng new命令还安装了npm依赖项，因此将生成package-lock.json文件
以及包含下载的依赖项的node_modules文件夹。

tsconfig.json文件指定打字稿编译器选项（anuglar项目使用TS）。
而tslint.json文件配置打字稿短绒，是一个工具，用于分析源代码，
标记编程错误，错误，文体错误，以及可疑的构造。

最后，README.md还会生成一个文件。
阅读该文档以获取与Angular CLI用法有关的信息：如何构建，服务和测试新生成的应用程序


#### 创建应用程序（application）
`ng generate application <name>` 命令用于projects在工作区的子文件夹中创建新的应用程序。
运行以下命令以生成两个应用程序：Administration和Gatling：
```sh
    cd frontend
    ng generate application administration --style=scss --routing=true
    ng generate application gatling --style=scss --routing=true
```
* 参数--style=scss设置用于样式文件的SCSS预处理器（默认为CSS）--参数可以不带。
* 参数--routing=true告诉Angular CLI生成路由NgModule --参数可以不带。

这些命令在子文件夹projects生成administration、gatling两个项目，其中包含的文件如下（和常规的angular cli生成的项目，缺少package.json文件）

* 两个tsconfig.*.ts文件。它们扩展了工作空间的根目录，tsconfig.ts并设置了特定的配置以编译应用程序（tsconfig.app.ts）或其单元测试（tsconfig.spec.ts）。在Angular文档中阅读有关TypeScript配置的更多信息。
* 该src文件夹包含您应用程序的所有TypeScript，HTML和CSS源（有关src文件夹结构的更多信息）。
* karma.conf.js用于单元测试的Karma配置文件。
* e2e用于使用量角器运行端到端测试的文件夹。

命令也更新了根angular.json文件，添加了两个应用程序配置：
```json
    {
      "$schema": "./node_modules/@angular/cli/lib/config/schema.json",
      "version": 1,
      "newProjectRoot": "projects",
      "projects": {
        "administration": {
          "projectType": "application",
          [...]
        },
        "gatling": {
          "projectType": "application",
          [...]
        }
      },
      "defaultProject": "administration"
    }
```
我们稍后将了解针对每个应用程序项目的配置，因为我们将必须更新它们以共享资源。


#### 创建库 （librany）
`ng generate library <name>`命令用于生成库。
在工作空间文件夹中（frontend如果您遵循本教程的介绍），请运行以下命令：
```sh
    ng generate library tools
    ng generate library vendors

```

再次在这里，angular.json使用两个新创建的库更新文件：

```json

    {
      "$schema": "./node_modules/@angular/cli/lib/config/schema.json",
      "version": 1,
      "newProjectRoot": "projects",
      "projects": {
        "administration": {
          [...]
        },
        "gatling": {
          [...]
        },
        "tools": {
          "projectType": "library",
          [...]
          }
        },
        "vendors": {
          "projectType": "library",
          [...]
        }
      },
      "defaultProject": "administration"
    }


```

它还为每个库projects/tools和projects/vendors创建相应的文件。文件与应用程序生成时的文件类似。

要注意的一件事是，在生成库时不能指定样式预处理器。angular.json库的工作空间配置（文件）中没有与此相关的配置。您每次在库中生成组件时都必须指定样式，例如使用`command ng generate component my-component --style=scss --project=tools`。


#### 创建共享服务
这里的想法是在库中生成服务，并在应用程序中使用它。
让我们在tools库中创建一个虚拟服务：
```
    ng generate service hello-world --project=tools

```

语法是，`ng generate service <service-name>`并且该参数--project是必需的，以指定在那个库中生成服务。

这将创建一个文件projects/tools/src/hello-world.service.ts及其单元测试（projects/tools/src/hello-world.service.spec.ts）。更新它以创建一个简单的getter：

```ts
    import {Injectable} from '@angular/core';

    @Injectable({
      providedIn: 'root'
    })
    export class HelloWorldService {
      get message(): string {
        return 'Hello World!';
      }
    }
```

    注意：该服务通过providedIn: 'root'选项声明为可注入。这意味着该服务是单例。它可以在任何组件或服务中使用，而无需提供它。无论您在哪里使用它，它始终是同一实例。

    如果没有此选项，我们可能会使用每个实例的语法为每个实例注入一个实例@Component({providers: [HelloWorldService]})。我们也可以使用语法在模块级别执行相同的操作@NgModule({providers: [HelloWorldService]})。

    在Angular文档中阅读有关依赖注入的更多信息。

更新AppComponent
`projects/administration/src/app/app.component.ts`使用上面的服务

```ts
    import {Component} from '@angular/core';
    import {HelloWorldService} from 'projects/tools/src/lib/hello-world.service';

    @Component({
      selector: 'app-root',
      templateUrl: './app.component.html',
      styleUrls: ['./app.component.scss']
    })
    export class AppComponent {
      title = 'administration';

      constructor(helloWorld: HelloWorldService) {
        this.title = helloWorld.message;
      }
    }
```
如果使用的是`IntelliJIdea`或`Webstorm`，则`HelloWorld`服务的默认导入为
`import {HelloWorldService} from '../../../tools/src/lib/hello-world.service';`。
如果您四处移动文件，这将很丑陋且难以维护。您可以打开项目设置，然后选择TypeScript>导入>“
使用相对于tsconfig.json的路径”选项：
<img src="https://octoperf.com/img/blog/kraken-angular-workspace-multi-application-project/idea-import-settings.png">



#### 安装`Angular Material UI`
Angular Material是一组遵循Material Design设置的约定的组件。
借助Angular CLI，只需运行以下命令即可在两个应用程序上安装Angular Material。
```sh
    ng add @angular/material
    ng add @angular/material --project=gatling
```

    注意：第一个命令不需要--project=administration参数，因为它是工作区配置中的默认项目（"defaultProject": "administration"在angular.json文件中）。

这两个命令在package.json文件中添加依赖项@angular/material，还自动更新各种项目文件，添加适当的样式，导入字体和NgModules：
```sh
    UPDATE projects/administration/src/main.ts (391 bytes)
    UPDATE projects/administration/src/app/app.module.ts (502 bytes)
    UPDATE angular.json (10132 bytes)
    UPDATE projects/administration/src/index.html (482 bytes)
    UPDATE projects/administration/src/styles.scss (181 bytes)
```

我发现将外部依赖项重新组合到单个NgModule中更加干净。 这就是为什么我们之前创建了一个vendors库。

因此，让我们更新VendorsModule文件projects/vendors/src/lib/vendors.module.ts以导入和导出MatButtonModule，从而在一个地方重新组合我们的外部依赖项：
```ts
    import {NgModule} from '@angular/core';
    import {MatButtonModule} from '@angular/material';

    @NgModule({
      imports: [MatButtonModule],
      exports: [MatButtonModule]
    })
    export class VendorsModule { }
```

然后，我们在AppModule中导入VendorsModule
projects/administration/src/app/app.module.ts：
```ts
    @NgModule({
      [...]
      imports: [
        VendorsModule,
      ],
      [...]
    })
    export class AppModule { }
```
最后，使用mat-raised-buttonAppComponent中的指令
projects/administration/src/app/app.component.html：

```html
    <div style="text-align:center">
      <h1>
        Welcome to {{ title }}!
      </h1>
      <div><img width="300" alt="Angular Logo" src="data:image/svg+xml;base64,..."></div>
      <button mat-raised-button color="primary" >Click Me!</button>
    </div>
```


#### 启动应用程序
要为Angular应用程序提供服务，需运行命令ng serve --project=administration。

然后，您可以在`http://localhost:4200/`上打开网页：

如果按照本教程的每个步骤进行操作，则应该看到“欢迎使用Hello World !”消息以及提出的材料“ Click Me！”按钮。

否则，您可以下载源代码（仅npm install在启动应用程序之前运行）。

如果您想看一个更复杂的应用程序，请转到“ 完整的应用程序示例”一章。

另请注意，如果要同时启动administration和gatling应用程序，则会看到错误消息：
```
    Port 4200 is already in use. Use '--port' to specify a different port.
    Error: Port 4200 is already in use. Use '--port' to specify a different port.
```

需要使用--port选项 具体请官方文档或者阅读“ 如何使用HAProxy服务多个角度的应用程序(下文有介绍)”一章以了解如何设置应用程序使用的默认端口。




### Angular多应用程序共享资源
让我们回到负载测试IDE。将像Kraken这样的大型应用程序拆分为几个模块和库是很不错的。 
它简化了维护并提高了代码的可重用性。

关于可重用性，跨组件库共享CSS样式和资产，拥有完全隔离的模块可能会更干净一些，
但是由于我所有的库和应用程序都依赖于Angular Material，
因为我不想为每个项目重复导入代码。

#### 库和应用程序共享CSS
在上面的介绍中，我们导入了默认的Angular Material主题之一。
为了使Kraken具有IDE的外观和感觉，我想使用自定义Angular Material主题，其主题为：

* 黑暗的背景
* 颜色比基本的主色和及其他提示颜色（添加警告，成功，危险和其他颜色），
* 组件的布局更加密集（尚无多层密度）。
<img src="https://octoperf.com/img/blog/kraken-angular-workspace-multi-application-project/kraken-ui.png">
`Kraken`的用户界面

要创建此UI，我必须创建几个组件库：

* 可调整大小的拆分面板，
* 控制台和文件树的标签，
* 代码编辑器，
* 和结合了所有这些的主工作区。

它们都使用位于工作区根目录styles文件夹中的通用CSS 。
例如，自定义材质主题SCSS文件将初始化Material Design并声明自定义颜色：
```scss
    @import '../node_modules/@angular/material/theming';

    [...]

    $app-primary: mat-palette($mat-blue);
    $app-accent: mat-palette($mat-green);
    $app-info: mat-palette($mat-light-blue);
    $app-success: mat-palette($mat-light-green);
    $app-error: mat-palette($mat-deep-orange);
    $app-background: mat-palette($mat-gray);

    [...]

    $mat-theme: (
      [...]
    );

    @include angular-material-theme($mat-theme);

```

并且紧凑的Scss文件,声明了用于更改组件密度的自定义CSS类：
```scss
    @import 'app-padding';
    @import 'app-font';

    // Must also disable the ripple effect
    @mixin compact-checkbox($size: 34px) {
      $half: $size / 2;
      .mat-checkbox-inner-container {
        height: $half;
        width: $half;
      }
    }

    @mixin compact-button($size: 34px) {
      .mat-icon-button {
        width: $size;
        height: $size;
        line-height: $size * 0.9;

        .ng-fa-icon {
          font-size: $size * 0.5;
        }
      }
    }
    [...]

````

为了在管理和加特林负载测试应用程序中使用这些SCSS文件，
我们必须在Angular的工作区配置中声明它们angular.json：
```json
    "stylePreprocessorOptions": {
      "includePaths": [
        "styles"
      ]
    },
```

在`stylePreprocessorOptions`必须加入到`projects > administration / gatling > architect > build > options`。

在运行单元测试时，如果某些被测组件需要通用样式，则可能会出现以下错误：

```js
    ERROR in ../icon/src/lib/icon/icon.component.scss                                                                                                                   
    Module build failed (from /home/kojiro/workspaces/kraken/frontend/node_modules/sass-loader/lib/loader.js):

    @import 'app-margin';
          ^
    Can't find stylesheet to import.

```

在这种情况下，只需将添加`stylePreprocessorOptions`到
`projects > my-project > architect > test > options`工作空间配置部分。


#### 跨库和应用程序共享资产
除了公共CSS文件外，您可能还希望在应用程序和库之间共享资产。

例如，在Kraken的资产中，我们存储：

* Kraken logo，
* Ace编辑器使用的Javascript文件。
实际上，由于配置，Ace主题和模式文件位于ext文件夹中并已复制angular.json。
例如，Gatling build架构师选项包括以下配置：
```ts
    "assets": [
      "projects/gatling/src/favicon.ico",
      "projects/gatling/src/assets",
      {
        "glob": "**/*",
        "input": "assets/",
        "output": "assets/"
      },
      {
        "glob": "**/worker-*.js",
        "input": "node_modules/ace-builds/src-min/",
        "output": "assets/ace/"
      },
    ],
```

它首先声明特定于Gatling应用程序的资产。
然后，它将使用语法`"glob": "**/*"`将其包含在根资产文件夹中的所有文件。
最后，所有Ace方法都被复制到中`assets/ace/`。

我们还使用许多其他与Ace代码编辑器相关的javascript文件。
这些主题，模式和代码段必须在Architect选项的scripts部分中声明build：
```json
    "scripts": [
    "node_modules/ace-builds/src-min/mode-xml.js",
    "node_modules/ace-builds/src-min/mode-yaml.js",
    "node_modules/ace-builds/src-min/ext-searchbox.js",
    "node_modules/ace-builds/src-min/ext-language_tools.js",
    "node_modules/ace-builds/src-min/ext-modelist.js",
    "ext/mode-log.js",
    "ext/theme-kraken.js",
    "ext/snippets/scala.js"
  ]
```
无论您要使用资产和外部脚本实现什么目标，建议您浏览一下Angular-Cli文档页面：
[Stories Asset Configuration](https://github.com/angular/angular-cli/wiki/stories-asset-configuration)。



#### Angular工作区和单元测试
Angular CLI允许您使用以下语法在特定项目上运行单元测试：
```sh
    ng test --project=<my-project>
```

* 默认情况下，它将连续运行单元测试，让您知道它们是成功还是失败。
如果是使用fit而不是it在单元测试定义上运行该特定测试（您也可以fdescribe在测试套件上使用）。

* 它会在带有选项的文件夹中自动生成测试覆盖率报告。
`/coverage/my-project--watch=false --codeCoverage=true`


我希望有一个报告可以重新组合所有覆盖率信息，并通过并行运行单元测试来加快测试执行速度。
因此，我创建了以下脚本：
```sh
    #!/bin/bash
    rm -rf coverage
    rm -rf coverage-all

    for dir in projects/*; do
      if [["$dir" != *-e2e]]
      then
        prefix="projects/";
        project=${dir#$prefix}; #Remove prefix
        echo "$project"
        ng test --watch=false --codeCoverage=true --sourceMap=true --project=$project &
      fi
    done

    wait  # Wait for all tasks to complete

    ./node_modules/istanbul/lib/cli.js report --dir ./coverage-all/ html

    google-chrome ./coverage-all/index.html &

```

它对每个不以结尾结尾的项目-e2e（这些都是端到端测试项目）并行运行单元测试，
并且覆盖范围平行。然后，使用Istanbul client汇总所有报告。
    警告：如果您有多个项目，则此脚本将同时运行多个Web浏览器。它可能会在计算机运行时冻结您的计算机！

Istanbul需要JSON格式的报告才能进行汇总.因此，也要更新karma.conf.js文件。它们位于每个应用程序或库的根目录。只需添加json报告：
```json
    coverageIstanbulReporter: {
      dir: require('path').join(__dirname, '../../coverage/analysis'),
      reports: ['html', 'lcovonly', 'json'],
      fixWebpackSourcePaths: true
    },

```

如果您想知道如何编写单元测试，请查看有关[测试的Angular文档](https://angular.io/guide/testing)。

### 如何使用HAProxy服务服务多个Angular应用程序
在Kraken中，我们有两个Angular应用程序：`Administration`和`Gatling`。

这个想法是要在不同的端口和`base Href`上服务；然后将它们打包为在相同端口上使用但使用不同的基本Href的docker映像。
将它们打包为在相同端口上使用，但使用不同的`base Href`的docker映像。

#### 在特定端口和`base Href`上部署Angular应用
默认情况下，Angular在相同的URL和端口上为所有应用程序提供服务：`http://localhost：4200`。

为了能够在开发过程中同时启动两个应用程序，
请在Angular工作区配置angular.json文件中更改其中一个的端口。
例如，在Kraken中，Gatling应用程序的serve架构师配置为在端口4222上为其提供服务：
```json
    "serve": {
      "builder": "@angular-devkit/build-angular:dev-server",
      "options": {
        "browserTarget": "gatling:build",
        "port": 4222
      },
      "configurations": {
        "production": {
          "browserTarget": "gatling:build:production"
        }
      }
    },
```
然后，ng serve使用以下参数运行命令：
```sh
    ng serve --open --project=gatling --baseHref /gatling/
```
由于参数和配置的原因，它将通过URL `http://localhost:4222/gatling`打开Web浏览器。


#### 将Angular应用打包为Docker映像
借助Angular-Cli ng build命令可以构建Angular应用程序：
```sh
    ng build gatling --prod --baseHref /gatling/
```

同样，这里`--baseHref /gatling/`用于指定base Href。 该应用程序内置于文件夹中`dist/gatling`。
以下DOCKERFILE生成一个NGINX Docker映像，其中包含已构建的应用程序：

```sh
    FROM nginx:1.15.9-alpine
    ARG APPLICATION
    COPY nginx.conf /etc/nginx/nginx.conf
    WORKDIR /usr/share/nginx/html
    COPY dist/$APPLICATION .
    RUN ls -laR .
    EXPOSE 80
```
ng build命令的输出将复制到/usr/share/nginx/html图像的文件夹中，并使用以下Nginx配置：
```json

    worker_processes  1;

    events {
        worker_connections  1024;
    }

    http {
        server {
            listen 80 default_server;
            server_name  localhost;

            root   /usr/share/nginx/html;
            index  index.html index.htm;
            include /etc/nginx/mime.types;

            gzip on;
            gzip_min_length 1000;
            gzip_proxied expired no-cache no-store private auth;
            gzip_types text/plain text/css application/json application/javascript application/x-javascript text/xml application/xml application/xml+rss text/javascript;

            location / {
                try_files $uri $uri/ /index.html;
            }
        }
    }
```

运行以下命令以生成Docker映像：
```sh
    docker build --rm=true -t gatling-ui:latest --build-arg APPLICATION=gatling .
```


#### 使用HAProxy提供生产镜像
HAProxy是一种开源软件，可为基于TCP和HTTP的应用程序提供高可用性代理服务器。
对于Kraken，我们使用它在适当的Frontend上重定向HTTP请求，具体取决于`base Href`（感谢path_beg/administration关键字）。
这是配置文件：
```sh

    global

    defaults
        mode    http
        option  forwardfor
        option  http-server-close
        # Set the max time to wait for a connection attempt to a server to succeed
        timeout connect 30s
        # Set the max allowed time to wait for a complete HTTP request
        timeout client  50s
        # Set the maximum inactivity time on the server side
        timeout server  50s
        # handle the situation where a client suddenly disappears from the net
        timeout client-fin 30s

    frontend http-in
        bind *:80
        mode http

        acl has_administration  path_beg /administration
        acl has_gatling  path_beg /gatling

        use_backend kraken-administration if has_administration
        use_backend kraken-gatling if has_gatling

    backend kraken-administration
        server kraken-administration-ui kraken-administration-ui:80 check fall 3 rise 2
        reqrep ^([^\ ]*\ /)administration[/]?(.*)     \1\2

    backend kraken-gatling
        server kraken-gatling-ui kraken-gatling-ui:80 check fall 3 rise 2
        reqrep ^([^\ ]*\ /)gatling[/]?(.*)     \1\2

```

启动它的最简单方法是使用HAProxy Docker映像。

要查看完整的示例（使用启动两个前端应用程序，多个后端服务器和HAProxy docker-compose)。



### 完整的应用

我希望这篇博文对希望尝试Angular开发复杂的多项目工作区的人有所帮助。

可以在GitHub上找到[Kraken的Angular前端的源代码](https://github.com/OctoPerf/kraken/tree/1.3.0/frontend)，请查看完整的最新代码示例。如果您认为我错过了Angular开发的重要部分或犯了一个错误，请给我写评论。

最后，如果您想了解有关负载测试IDE的Kraken的更多信息，请查看其[GitHub页面](https://github.com/OctoPerf/kraken)。



原文地址：
<a target="_black" href="https://octoperf.com/blog/2019/08/22/kraken-angular-workspace-multi-application-project/">原文地址</a>
