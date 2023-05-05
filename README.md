# ansible_test

## ansible 安装

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

## ansible 常用模块

### shell 模块
- [shell模块](modules_example/roles/shell-test/README.md)

### copy 模块
- [copy模块](modules_example/roles/copy-test/README.md)

### lineinfile 模块
- [lineinfile模块](modules_example/roles/lineinfile-test/README.md)
