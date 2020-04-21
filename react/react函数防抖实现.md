### react + rxjs + hooks函数防抖实现

```javascript

  import React, { useEffect } from 'react';
  import { Subject,interval } from 'rxjs';
  import { debounce} from 'rxjs/operators';

  const Test = () => {
    const onDebounce$ = new Subject()

    useEffect(()=>{
      const subscription = onDebounce$.pipe(debounce(()=>interval(300))).subscribe({
        next: (vaues:any) => {
          console.log(values)
        }
      })
      return ()=> {
        subscription.unsubscribe()
      }
    },[onDebounce$,values])


    const handleClick = (e: any) => {
      onDebounce$.next(e);
    }

    return (
      <div onClick={(e:any)=>{handleClick(e)}}>
        this is test
      <div>
    )

  }
```

