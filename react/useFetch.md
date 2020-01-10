> 简单的hooks封装fetch
```js
  export default function useFetch(url,params) {
  const [data, setData] = useState([]);
  useEffect(() => {
    fetch(url,{
        method: "GET",
        body: JSON.stringify(params),
        headers: new Headers({
          'Content-Type': 'application/json'
        })
      })
      .then(response => response.json())
      .then(data => setData(data));
    }, []);
    return data;
  }
```

[原文地址](https://stackoverflow.com/questions/53059059/react-hooks-making-an-ajax-request)

```js
import React, { useState, useEffect } from "react";
import axios from "axios";

function useTriggerableEndpoint(fn) {
  const [res, setRes] = useState({ data: null, error: null, loading: null });
  const [req, setReq] = useState();

  useEffect(
    async () => {
      if (!req) return;
      try {
        setRes({ data: null, error: null, loading: true });
        const { data } = await axios(req);
        setRes({ data, error: null, loading: false });
      } catch (error) {
        setRes({ data: null, error, loading: false });
      }
    },
    [req]
  );

  return [res, (...args) => setReq(fn(...args))];
}

const todosApi = "Api地址";

function postTodoEndpoint() {
  return useTriggerableEndpoint(data => ({
    url: todosApi,
    method: "POST",
    data
  }));
}

export default function App() {
  const [title, setTitle] = useState("");
  const [body, setBody] = useState("");
  const [newTodo, postNewTodo] = postTodoEndpoint();

  function createTodo() {
    postNewTodo({
      title,
      body,
      userId: 1
    });
  }

  return (
    <div>
      <h1>New Todo</h1>
      <label>
        Title: <input value={title} onChange={e => setTitle(e.target.value)} />
      </label>
      <label>
        Body: <input value={body} onChange={e => setBody(e.target.value)} />
      </label>
      <button onClick={createTodo}>Create Todo</button>
      <div className="new-todo">
        {(newTodo.loading && "Creating Todo...") ||
          (newTodo.data &&
            `Todo with title ${newTodo.data.title} created with ID ${
              newTodo.data.id
            }`) ||
          (newTodo.error && `Todo creation failed because: ${newTodo.error}.`)}
      </div>
    </div>
  );
}

```



