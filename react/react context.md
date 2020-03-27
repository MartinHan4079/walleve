> react 高级特性学习笔记

### Context
* 解决的问题：传统的react数据是通过 props 属性自上而下（由父及子）进行传递的. 而Context 提供了一种在组件之间共享此类值的方式，不必显式地通过组件树的逐层传递 props。


#### 食用方法（见官方文档）
> React.createContext 创建一个可用的Context对象。
> <MyContext.Provider value={}> 接受value值，使其子组件能够获取到content对象的值。
> useContext() 在组件中使用，用来获取Context。
```javascript
    const themes = {
        light: {
            foreground: "#000000",
            background: "#eeeeee"
        },
        dark: {
            foreground: "#ffffff",
            background: "#222222"
        }
    };

    const ThemeContext = React.createContext(themes.light);

    function App() {
        return (
            <ThemeContext.Provider value={themes.dark}>
                <Toolbar />
            </ThemeContext.Provider>
        );
    }

    function Toolbar(props) {
        return (
            <div>
                <ThemedButton />
            </div>
        );
    }

    function ThemedButton() {
        const theme = useContext(ThemeContext);

        return (
            <button style={{ background: theme.background, color: theme.foreground }}>
                I am styled by theme context!
            </button>
        );
    }
```







