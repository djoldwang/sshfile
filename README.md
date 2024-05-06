## sshfile

chrome 浏览器插件「安全外壳 SSH」配置文件生成脚本

「安全外壳 SSH」插件地址 https://chrome.google.com/webstore/detail/iodihamcpbpeioajjeobimgagajmlibd

## sshfile.txt文件格式（每个字段中间使用 table 分隔符进行分割）

名称  账号  IP或主机名  端口

例：

路由器  admin  192.168.1.1 22

核心交换机  admin  192.168.1.2 22

接入交换机  admin  192.168.1.3  22

服务器  admin  192.168.1.4  65022

## 使用说明

手动收集所需信息并填写至 sshfile.txt 文件中，执行 sshfile.sh 脚本生成所需 json 文件
