# **Roger skyline (part I)**

42 (Paris)

### **Description**

This is just a prototype to quickly test the assignments of the `roger-skyline-1` project
using `docker` and `docker-compose`.

### **Usage**

Executing the `run.sh` script docker will: 

+ build the image from the `Dockerfile` 
+ create the bridge network from the `network.sh` script
+ deploy the `react` version of [Hacker News](https://news.ycombinator.com/) with `docker-compose`

### Network

To the running container is assigned the static ip `172.42.0.2`, exposed on port `5000` and binded on port `80` of your host's network. To see the running service open in browser at: `172.42.0.2:5000`

![hnews](img/hnews.png)

+ Source: [react-hn](https://github.com/insin/react-hn)

---

Happy hacking!

### **License**

This work is published under the terms of [42 Unlicense](https://github.com/gcamerli/42unlicense).
