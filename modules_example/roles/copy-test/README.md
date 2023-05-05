## shell 模块

### 官方文档
  - [shell模块](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/shell_module.html)
  
### 示例
```bash
- name: Execute the command in remote shell; stdout goes to the specified file on the remote
  ansible.builtin.shell: somescript.sh >> somelog.txt

- name: Change the working directory to somedir/ before executing the command
  ansible.builtin.shell: somescript.sh >> somelog.txt
  args:
    chdir: somedir/

# You can also use the 'args' form to provide the options.
- name: This command will change the working directory to somedir/ and will only run when somedir/somelog.txt doesn't exist
  ansible.builtin.shell: somescript.sh >> somelog.txt
  args:
    chdir: somedir/
    creates: somelog.txt

# You can also use the 'cmd' parameter instead of free form format.
- name: This command will change the working directory to somedir/
  ansible.builtin.shell:
    cmd: ls -l | grep log
    chdir: somedir/

- name: Run a command that uses non-posix shell-isms (in this example /bin/sh doesn't handle redirection and wildcards together but bash does)
  ansible.builtin.shell: cat < /tmp/*txt
  args:
    executable: /bin/bash

- name: Run a command using a templated variable (always use quote filter to avoid injection)
  ansible.builtin.shell: cat {{ myfile|quote }}

# You can use shell to run other executables to perform actions inline
- name: Run expect to wait for a successful PXE boot via out-of-band CIMC
  ansible.builtin.shell: |
    set timeout 300
    spawn ssh admin@{{ cimc_host }}

    expect "password:"
    send "{{ cimc_password }}\n"

    expect "\n{{ cimc_name }}"
    send "connect host\n"

    expect "pxeboot.n12"
    send "\n"

    exit 0
  args:
    executable: /usr/bin/expect
  delegate_to: localhost
```

### 参数
| 参数              | 说明                              | 
|-----------------|---------------------------------|
| chdir <br> `path`| 在执行命令之前更改工作目录                   |
| cmd <br> `string`| 要执行的命令，后面有可选参数                  |
| creates <br> `path`| 仅当文件不存在时才运行命令                   |
| executable <br> `path`| 改变用于执行命令的shell，绝对路径，如：/bin/bash |
|free_form <br> `string`| 制定要远程执行的命令                      |
|removes <br> `path`| 仅当文件存在时才运行命令                    |
|stdin <br> `string`| 将字符串发送到命令的标准输入                  |
|stdin_add_newline <br> `boolean`| 将多行数据添加到stdin                   |

### 返回值
| 返回值                                      | 描述                              |
|------------------------------------------|---------------------------------|
| cmd <br> `string`                        | 命令，包括参数，用于执行远程命令|
| delta <br> `string`                      | 有关命令是否更改系统的信息，如：更改文件，创建文件，删除文件，更改权限等|
| end <br> `tring`                         | 命令结束时的时间戳，以秒为单位|
| msg <br> `string`                        | 命令的输出|
| rc <br> `integer`                        | 命令的退出状态码|
| start <br> `string`                      | 命令开始时的时间戳，以秒为单位|
| stderr <br> `string`                     | 命令的标准错误|
| stderr_lines <br> `list/elements=string` | 命令的标准错误，按行分割|
|stdout <br> `string`                     | 命令的标准输出|
|stdout_lines <br> `list/elements=string` | 命令的标准输出，按行分割|