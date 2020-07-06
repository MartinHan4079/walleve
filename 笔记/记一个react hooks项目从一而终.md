    项目立项和需求问题不做讨论。只是记录一下，前端项目从项目搭建到项目上线的过程。

### 起始（项目搭建）

首先，框架选择上，公司统一用的react，也没有做什么技术评审，直接react hook拿来用了。

1. 搭建使用的是create-react-app搭建的项目进行了reject。需要修改部分webpack配置。

2. 项目计划全部采用Hooks进行开发。用到的主要生态工具`rxjs`、``echarts`、`Typescript`、`SCSS`、`antd`等。

3. 考虑到项目以后可能会有多人协作开发, 使用了`husky`、`prettier`。等代码检查和整理工具，再代码提交时进行代码的格式化。

4. 全局接入`keycloak`。

5. 不引入redux. 原因：小范围的状态管理使用useContext代替，少量的全局状态，使用rxjs的subject进行简单封装即可。无大范围的状态管理，就没有考虑引入redux。

### 开发（需求整理等）

项目一期分了多个大的模块，需要对接和同步更新不同的其他系统。整体规划是一个月进行一个模块的整理开发测试，和另外的系统相应功能的更新。

开发中，首先就是ajax的封装，使用rxjs的ajax进行了封装。其次路由问题：由于采用keycloak，路由需要从远程获取配置信息，但是keycloak又不支持多余路由字段的配置，

最后根据远程返回的菜单数据进行处理，根据字段匹配进行路由的动态渲染（前端需要维护一个路由文件）。


### 开发中遇到的问题

1. 由于项目中有大量的表格和表单，一开始项目出现许多的重复代码。一开始想转换思路使用antd pro提供的组件，但是看到antd pro的代码，看不明白，感觉封装过度。
最后就自己拿着antd的table自己做了简单封装，并自定义了公用的查询表单和table联动的useHooks，用起来还是蛮香的。去除了近一半的代码。(不喜勿喷)

```ts
    import { useState, useMemo, useEffect, useCallback } from "react";
    import { Form } from "antd";
    import { defaultPagination, AntdPagination } from "../config";
    import { usePagination } from "./usePagination";
    import {
      deleteObjectItemIfUndefined,
      ITObject,
    } from "../utils/util";
    import { ResponseData } from "../utils/request";

    export function useTableHooks<T>(observerCallback: Function) {
      const [form] = Form.useForm();

      const [defaultValue, setDefaultValue] = useState({});
      const [loading, setLoading] = useState<boolean>(false);
      const [list, setList] = useState<T[]>([]);
      const { query, onChangePagination } = usePagination();
      const [showPagination, setShowPagination] = useState<AntdPagination>(
        defaultPagination
      );

      useEffect(() => {
        setLoading(true);
        const params = { ...defaultValue, ...query };
        const subscriptions = observerCallback(params).subscribe(
          (response: ResponseData) => {
            if (response.code === "200") {
              const { list, total, pageNum } = response.data;
              setList(list);
              setShowPagination({ total, current: pageNum });
            }
            setLoading(false);
          }
        );
        return () => {
          subscriptions.unsubscribe();
        };
      }, [defaultValue, observerCallback, query]);

      const onFinish = useCallback((values: ITObject) => {
        setDefaultValue(deleteObjectItemIfUndefined(values));
      }, []);

      const handleReset = useCallback(() => {
        form.resetFields();
        setDefaultValue({});
      }, [form]);

      return useMemo(() => {
        return {
          form,
          loading,
          list,
          defaultValue,
          showPagination,
          onChangePagination,
          onFinish,
          handleReset,
          setDefaultValue,
        };
      }, [
        defaultValue,
        form,
        handleReset,
        list,
        loading,
        onChangePagination,
        onFinish,
        showPagination,
      ]);
    }
```


```jsx
    <Form form={form} layout="inline" onFinish={onFinish}>
      <Form.Item>
        <Button type="primary" htmlType="submit">
          查询
        </Button>
      </Form.Item>
      <Form.Item>
        <Button onClick={handleReset}>重置</Button>
      </Form.Item>
    </Form>

    <StandardTable
      loading={loading}
      rowKey="code"
      dataSource={list}
      columns={columns}
      showPagination={showPagination}
      onChange={onChangePagination}
    />

```

还有就是hooks的使用每个页面进行了状态和布局的文件区分，把状态全部提取到useHooks中页面中只包含UI和布局信息.类似如下
`index.jsx`
```jsx
    const TestManage: React.FC<{}> = () => {
      const {
        loading,
        form,
        columns,
        onFinish,
        list,
        showPagination,
        onChangePagination,
        handleReset,
      } = useTableHooks();

      return (
        <MainContent>
          <div></div>
        </MainContent>
      );
    };
```


### 项目的部署

项目全部使用jenkins进行自动化部署，前端只需要对仓库和sh命令脚本进行配置即可。具体的ngin运维人员进行配置。


项目环境分为三个部分test环境、uat环境、和生产环境，每一次开发都会严格按照test-> uat-> 生产的流程发布。


### 存在问题

1. 缺少单元测试。
2. 缺少文档。
