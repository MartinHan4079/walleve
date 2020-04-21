### react接入keycloak

[`keyCloak`](https://github.com/keycloak/keycloak/) 是一个针对Web应用和RESTfull Web API 提供SSO(Single Sign On：单点登陆).

前端接入：1. 前往keyCloak服务配置Clients、users、role.

```Typescript

  import Keycloak from 'keycloak-js';

  const initOptions = {
    url: "https://accounts-internal.com/auth",
    realm: "dev",  //对应keycloak的环境
    clientId: 'login-test',
    onLoad: 'login-required',
    'enable-cors': true,
    'cors-allowed-methods': 'POST,PUT,DELETE,GET,OPTIONS,PATCH',
    'cors-allowed-headers': 'Authorization, Origin, X-Requested-With, Content-Type',
  }


  export function keycloakInit(onAuthenticatedCallback:Function) {
    let keycloak = Keycloak(initOptions);
    keycloak
      .init({ onLoad: initOptions.onLoad })
      .then(auth => {
        keycloak.loadUserInfo().success((userInfo) => {
          //...
        });
        localStorage.setItem('token', keycloak.token || '');
        if (!auth) {
          window.location.reload();
        } else {
          //...
          onAuthenticatedCallback()
        }
      })
      .catch(() => {
        console.error('Authenticated Failed');
      });
  }

```

### 具体用法

```Typescript


  // index.tsx

  const renderApp = () => ReactDOM.render(<App />, document.getElementById('root'));

  keycloakInit(renderApp);

```
