    主要用到的是Subject和useEffect的特性。

```javascript
  import React, { useEffect } from 'react';
  import { Subject,interval } from 'rxjs';
  import { debounce} from 'rxjs/operators';
  /**
   *
   * @param onDebounce$ 函数防抖
   */
  export function debounceSubject(
    onDebounce$: Subject<unknown>
  ): Observable<unknown> {
    return onDebounce$.pipe(debounce(() => interval(249)));
  }

  const Test = () => {

    const onDebounce$ = new Subject()

    useEffect(()=>{
      const subscription = debounceSubject(onDebounce$).subscribe({
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

