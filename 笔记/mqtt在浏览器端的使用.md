
### mqtt浏览器端 使用

```javascript

      try {

        const api = "ws://test.com:8083"
        const options = {
          clean: true, 
          connectTimeout: 4000,
          clientId: '',
          username: '',
          password: '',
        }

        const client = mqtt.connect(api, options)
        client.on('connect', function () {

          console.log("hello", "连接成功")

          client.on('message', (topic, message) => {
            console.log('收到消息：', topic, message.toString())
          }

          client.publish("hello", "this is test", { qos: 1, rein: false } , () => {
            console.log(eventTopic, "发送成功")
            client.end()
          });

        })
      } catch {

        console.error("出错了")

      }

```

具体信息参考文档 [地址](https://github.com/mqttjs/MQTT.js#client)
