
下面是代码：
```javascript
  import { useEffect } from 'react';

  export default function useDragScrollBar() {
    const myBody = document.body;
    let y1 = 0;
    let y2 = 0;
    const handleMouseOut = e => {
      myBody.style.cursor = "grab";
      y1 = e.clientY;
    }
    const handleMouseUp = e => {
      y2 = e.clientY;
      myBody.style.cursor = "";
      if (document.documentElement && document.documentElement.scrollTop) {
        document.documentElement.scrollTop += y1 - y2;
      }
      else if (document.body) {
        document.body.scrollTop += y1 - y2;
      }
    }
    useEffect(() => {
      myBody.addEventListener('mousedown', handleMouseOut);
      myBody.addEventListener('mouseup', handleMouseUp);
      return () => {
        myBody.removeEventListener('mousedown', handleMouseOut);
        myBody.removeEventListener('mouseup', handleMouseUp);
      }
    });
  }
```




