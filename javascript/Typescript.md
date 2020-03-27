> window上vs code使用typescript时，不管怎么配置.ts文件，智能补全和类型提示就是不起作用，最后发现vs code 内置的功能居然默认关闭了。vscode插件搜索中输入@builtin 改下TypeScript and JavaScript Language Features 的状态. 


### 基础类型

#### Boolean
```ts
  let isDone: boolean = false;
```

#### Number
```ts
  let decimal: number = 6;
  let hex: number = 0xf00d;
```

#### String
```ts
  let color: string = 'blue';

  let sentence: string = `Hello ${color}`;
```

#### Array
```ts
  let list: number[] = [1, 2, 3];

  let list1: Array<number> = [1, 2, 3];
```

#### Tuple 
```ts
  let x: [string, number];
  x = ['hello', 10];
```

#### Enum
enum Color { Red, Green, Blue}
let c: color = Color.Green;

#### Any
```ts
let netSure: any = 4;
```
#### Void
```ts
function warnUser(): void {
  console.log("This is my warning message");
}

let unusable: void = undefined;
```

#### Null and Undefined
```ts
  let u: undefined = undefined
  let n: null = null;
```


#### Never
```ts
function error(message: string): never {
  throw new Error(message);
}
```


#### Object
```ts
  declare function create(o: objetc | null): void;
```

#### Type assertions
```ts
  let someValue: any = "this is a string";
  let strLength: number = (<string>someValue).length;
  //or
  let strLength: number = (someValue as string).length;
```


### interface
```ts
  interface LabeledValue {
    label: string;
  }
  function printLabel(labeledObj: LabeledValue) {
    console.log(labeledObj.label);
  }
```

### class

```ts
class Animal {
    move(distanceInMeters: number = 0) {
        console.log(`Animal moved ${distanceInMeters}m.`);
    }
}

class Dog extends Animal {
    bark() {
        console.log('Woof! Woof!');
    }
}
```

### Generics
```ts
  function identity<T>(arg: T): T {
    return arg;
  }
```



在使用工具时，需要安装相应工具的@type声明文件。

比如使用react时就需要安装@type/react、@type/react-dom、@type/react-router 、@type/react-router-dom、等等。