# ansible_test

## 一、ansible 安装

- install ansible
```bash
cd ansible_test
sh install_ansible.sh
```

- check ansible
```bash
ansible --version

ansible 2.9.24
  config file = /etc/ansible/ansible.cfg
  configured module search path = [u'/root/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python2.7/site-packages/ansible
  executable location = /usr/bin/ansible
  python version = 2.7.5 (default, Oct 14 2020, 14:45:30) [GCC 4.8.5 20150623 (Red Hat 4.8.5-44)]
```

## 二、ansible 执行

```bash
ansible-playbook -i hosts -e@config playbooks/xxx.yml
```
- `-i`： 指定hosts文件
- `-e`： 指定变量文件
- `playbooks/xxx.yml`： 指定执行的playbook文件
- `-vvv`： 指定日志级别
- `--syntax-check`： 检查语法

**执行顺序：**
- 指定`config`文件
- 执行`playbooks/xxx.yml`文件
- 执行制定的`role`文件
- 执行制定的`task`文件
- 从`config`文件中读取变量
- 从`group_vars`文件中读取变量

## 三、ansible 常用模块

|              |  |               |                                                   | | |          | |
|--------------| --- |---------------|---------------------------------------------------| --- | --- |----------| --- |
| **shell**    | [shell模块](modules_example/roles/shell-test/README.md) | **copy**      | [copy模块](modules_example/roles/copy-test/README.md) |**lineinfile** | [lineinfile模块](modules_example/roles/lineinfile-test/README.md) | **file** | [file模块](modules_example/roles/file-test/README.md) |
| **template** | [template模块](modules_example/roles/template-test/README.md) | **unarchive** | [unarchive模块](modules_example/roles/unarchive-test/README.md) | | | | |


### shell 模块
- [shell模块](modules_example/roles/shell-test/README.md)

### copy 模块
- [copy模块](modules_example/roles/copy-test/README.md)

### lineinfile 模块
- [lineinfile模块](modules_example/roles/lineinfile-test/README.md)

### file 模块
- [file模块](modules_example/roles/file-test/README.md)

### template 模块
- [template模块](modules_example/roles/template-test/README.md)

### unarchive 模块
- [unarchive模块](modules_example/roles/unarchive-test/README.md)
