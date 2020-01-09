
### 编写整洁的react代码

> 本文将重点讨论适用于现代React软件开发的简洁代码实践

#### Don’t Repeat Yourself (DRY)
如果您在多个地方都做相同的事情，请合并重复的代码。如果您在代码中看到模式，则表明它是DRYing的主要方法。
```javascript
    // Dirty
    const MyComponent = () => (
    <div>
        <OtherComponent type="a" className="colorful" foo={123} bar={456} />
        <OtherComponent type="b" className="colorful" foo={123} bar={456} />    
    </div>
    );
```

```javascript
    // Clean
    const MyOtherComponent = ({ type }) => (
        <OtherComponent type={type} className="colorful" foo={123} bar={456} />
    );
    const MyComponent = () => (
        <div>
            <MyOtherComponent type="a" />
            <MyOtherComponent type="b" />
        </div>
    );
```

但是DRY代码时，有时会不由自主地把代码过度的整洁，代码不必要的麻烦，因此要适当掌握提炼代码的度。


#### 可预测性和可测试性

整洁的代码，可相对方便编写单元测试，具体现在还没写过单元测试用例，这里就不做阐述

#### 可读性（注释）
仅添加注释以解释复杂的想法；也就是说，不要对显而易见的代码添加注释。减少注释还可以减少视觉混乱。
```javascript
    // Dirty
    const fetchUser = (id) => (
        fetch(buildUri`/users/${id}`) // Get User DTO record from REST API
            .then(convertFormat) // Convert to snakeCase
            .then(validateUser) // Make sure the the user is valid
    );
```

```javascript
    // Clean
    const fetchUser = (id) => (
        fetch(buildUri`/users/${id}`)
            .then(snakeToCamelCase)
            .then(validateUser)
    );
```


#### 命名



#### 整洁代码遵循公认的设计模式和最佳实践

电脑已经存在很长时间了。多年来，程序员在解决某些问题的方式中发现了模式。这些称为设计模式。换句话说，随着时间的流逝，已经有一些算法被证明可以工作，因此您应该站在您之前的肩膀上，这样您就不必犯同样的错误。

然后是最佳做法。它们类似于设计模式，但范围更广，不特定于编码算法。它们可能涉及诸如“您应该对代码进行整理”或“在编写库包时，将React包括为”之类的内容peerDependency。

在构建React应用程序时，这里是一些最佳实践。

1. 使用小的功能，每个功能都有一个职责。这称为单一责任原则。确保每个功能都能完成一项工作。这可能意味着将复杂的组件分解为许多较小的组件。这也将带来更好的可测试性。

2. 随时注意抽象。换句话说，不要将内部需求强加给代码使用者。

3. 遵守严格的命名规则。这将帮助您编写干净，一致的代码。


#### 整洁代码"不必"（有必要）花费更长的时间编写


### 真实用例


#### 重复代码
观察下面代码
```javascript
    // Dirty
    import Title from './Title';
    export const Thingie = ({ description }) => (
    <div class="thingie">
        <div class="description-wrapper">
        <Description value={description} />
        </div>
    </div>
    );
    export const ThingieWithTitle = ({ title, description }) => (
    <div>
        <Title value={title} />
        <div class="description-wrapper">
        <Description value={description} />
        </div>
    </div>
    );
```
整理后 代码如下: 这里将children传递给thingie,然后在ThingieWithTitle中返回带有children的Thingie组件。
```javascript
    // Clean
    import Title from './Title';
    export const Thingie = ({ description, children }) => (
    <div class="thingie">
        {children}
        <div class="description-wrapper">
            <Description value={description} />
        </div>
    </div>
    );
    export const ThingieWithTitle = ({ title, ...others }) => (
        <Thingie {...others}>
            <Title value={title} />
        </Thingie>
    );
```




#### 默认值

```javascript
    // Dirty
    const Icon = ({ className, onClick }) => {
        const additionalClasses = className || 'icon-large';
        return (
            <span
                className={`icon-hover ${additionalClasses}`}
                onClick={onClick}>
            </span>
        );
    };
```
使用es6,整理以后
```javascript   
    // Clean
    const Icon = ({ className = 'icon-large', onClick }) => (
        <span className={`icon-hover ${className}`} onClick={onClick} />
    );
```
下面是一个采用React设置prop默认值，它可以产生更有效的代码，在基于生命周期的组件中默认props，允许根据您的默认值进行检查propTypes。还有一个优点：它使默认逻辑与组件本身的默认逻辑相分离
```javascript   
    // Cleaner
    const Icon = ({ className, onClick }) => (
        <span className={`icon-hover ${className}`} onClick={onClick} />
    );
    Icon.defaultProps = {
        className: 'icon-large',
    };
```


#### 将状态和呈现分开
将状态数据加载逻辑与呈现（或显示）逻辑混合使用会导致组件复杂。而是编写一个有状态的容器组件，其唯一职责是加载数据。然后编写另一个组件，其唯一职责是显示数据。这称为`容器模式`。
```javascript
    // Dirty
    class User extends Component {
        state = { loading: true };

        render() {
            const { loading, user } = this.state;
            return loading
            ? <div>Loading...</div>
            : <div>
                <div>
                    First name: {user.firstName}
                </div>
                <div>
                    First name: {user.lastName}
                </div>
                ...
                </div>;
        }

        componentDidMount() {
            fetchUser(this.props.id)
            .then((user) => { this.setState({ loading: false, user })})
        }
    }

```
在干净的版本中，重点关注加载数据，显示内容用在展示组件中去。使代码更易于理解，而且由于您可以独立测试每个问题，因此测试工作量也大大减少。并且由于RenderUser是无状态功能组件，因此结果是可预测的。
```javascript
    // Clean
    import RenderUser from './RenderUser';
    class User extends Component {
        state = { loading: true };

        render() {
            const { loading, user } = this.state;
            return loading ? <Loading /> : <RenderUser user={user} />;
        }

        componentDidMount() {
            fetchUser(this.props.id)
            .then(user => { this.setState({ loading: false, user })})
        }
    }
```


#### 使用函数组件
```javascript
    // Dirty
    class TableRowWrapper extends Component {
        render() {
            return (
            <tr>
                {this.props.children}
            </tr>
            );
        }
    }
```
整洁版本清除了许多屏幕混乱。通过优化React的核心，可以使用更少的内存，因为没有创建实例。
```javascript
    // Clean
    const TableRowWrapper = ({ children }) => (
        <tr>
            {children}
        </tr>
    );
```

#### 扩展运算符和解构的运用
```javascript
    // Dirty
    const MyComponent = (props) => {
        const others = Object.assign({}, props);
        delete others.className;
        return (
            <div className={props.className}>
            {React.createElement(MyOtherComponent, others)}
            </div>
        );
    };
```
```javascript 
    // Clean
    const MyComponent = ({ className, ...others }) => (
        <div className={className}>
            <MyOtherComponent {...others} />
        </div>
    );  
```


```javascript
    // Dirty
    const splitLocale = locale.split('-');
    const language = splitLocale[0];
    const country = splitLocale[1];
```

```javascript
    // Clean
    const [language, country] = locale.split('-');
```


> 总结：熟能生巧,多学，多用，多看