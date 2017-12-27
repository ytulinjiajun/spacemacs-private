rtags 安装指南
==========
1. 安装依赖： sudo apt install -y clang libclang-dev cmake pkg-config bash-completion lua5.3

2. 下载 rtags 服务器：
 git clone --recursive git@github.com:Andersbakken/rtags.git
 
3. 架设 rtags 服务器：
* cd rtags
* cmake -H. -B_builds
* cd _builds
* make -j8
* sudo make install

4. 配置 rtags 服务器：
* mkdir -p ~/.config/systemd/user

* 创建RTags daemon socket service配置文件:
Add the following to ~/.config/systemd/user/rdm.socket:
[Unit]
Description=RTags daemon socket

[Socket]
ListenStream=%h/.rdm

[Install]
WantedBy=multi-user.target

* 创建 the RTags daemon service配置文件：
Add the following to ~/.config/systemd/user/rdm.service:
[Unit]
Description=RTags daemon

Requires=rdm.socketp

[Service]
Type=simple
ExecStart=/usr/local/bin/rdm --log-file=%h/.rtags/rdm.log --data-dir=%h/.rtags/rtags-cache --verbose --inactivity-timeout 300

* 启用socket service: 
systemctl --user enable rdm.socket
systemctl --user start rdm.socket

5. 为工程构建一个RTags数据库
* 这里主要讲解使用 cmake 维护的工程项目
* 在脚本中给出 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 或者在命令行使用 cmake -H. -B_builds -DCMAKE_EXPORT_COMPILE_COMMANDS=1

* 用RTags来为代码生成索引: rc -J ./compile_commands.json，创建该索引需要一点时间，可以查看日志文件来了解进度： tail -f ~/.rtags/rdm.log这个索引一旦生成，以后就会自动由 Cmake 和 RTags 交互，每次编译总能自动生成 compile_commands.json 文件，而不用用户去手动操作

6. 检查工程的 _builds 目录下是否生成 compile_commands.json, 一旦生成了该文件，配合我定制的 buzhetenghuisi-programming 这个层，之后就可以愉快的使用语义补全和跳转了

