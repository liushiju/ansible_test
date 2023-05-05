## copy 模块

### 官方文档
  - [copy模块](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/copy_module.html)

### 示例
```bash
- name: Copy a file with owner and permissions
  ansible.builtin.copy:
    src: /srv/myfiles/foo.conf
    dest: /etc/foo.conf
    owner: foo
    group: foo
    mode: '0644'

- name: Copy file with owner and permission, using symbolic representation
  ansible.builtin.copy:
    src: /srv/myfiles/foo.conf
    dest: /etc/foo.conf
    owner: foo
    group: foo
    mode: u=rw,g=r,o=r

- name: Another symbolic mode example, adding some permissions and removing others
  ansible.builtin.copy:
    src: /srv/myfiles/foo.conf
    dest: /etc/foo.conf
    owner: foo
    group: foo
    mode: u+rw,g-wx,o-rwx

- name: Copy a new "ntp.conf" file into place, backing up the original if it differs from the copied version
  ansible.builtin.copy:
    src: /mine/ntp.conf
    dest: /etc/ntp.conf
    owner: root
    group: root
    mode: '0644'
    backup: yes

- name: Copy a new "sudoers" file into place, after passing validation with visudo
  ansible.builtin.copy:
    src: /mine/sudoers
    dest: /etc/sudoers
    validate: /usr/sbin/visudo -csf %s

- name: Copy a "sudoers" file on the remote machine for editing
  ansible.builtin.copy:
    src: /etc/sudoers
    dest: /etc/sudoers.edit
    remote_src: yes
    validate: /usr/sbin/visudo -csf %s

- name: Copy using inline content
  ansible.builtin.copy:
    content: '# This file was moved to /etc/other.conf'
    dest: /etc/mine.conf

- name: If follow=yes, /path/to/file will be overwritten by contents of foo.conf
  ansible.builtin.copy:
    src: /etc/foo.conf
    dest: /path/to/link  # link to /path/to/file
    follow: yes

- name: If follow=no, /path/to/link will become a file and be overwritten by contents of foo.conf
  ansible.builtin.copy:
    src: /etc/foo.conf
    dest: /path/to/link  # link to /path/to/file
    follow: no
```

### 参数
| 参数                       | 说明                              |
|--------------------------|---------------------------------|
| attributes <br> `string` |设置文件属性|
| backup <br> `boolean`    |创建备份文件|
| checksum <br> `string`    |计算文件的校验和|
| content <br> `string`     |要写入目标文件的内容|
|decrypt <br> `boolean`     |如果源文件是加密的，则解密|
|dest <br> `path`           |目标文件的绝对路径名|
|directory_mode <br> `string`|设置目标目录的权限|
|follow <br> `boolean`      |如果源文件是符号链接，则跟随|
|force <br> `boolean`       |强制复制目标文件，即使它已经存在|
|group <br> `string`        |设置目标文件的所有者组|
|local_follow <br> `boolean`|如果源文件是符号链接，则跟随|
|mode <br> `string`         |设置目标文件的权限|
|owner <br> `string`        |设置目标文件的所有者|
|remote_src <br> `boolean`  |如果为True，则从控制机复制源文件|
|selevel <br> `string`      |设置目标文件的SELinux级别|
|serole <br> `string`       |设置目标文件的SELinux角色|
|setype <br> `string`       |设置目标文件的SELinux类型|
|seuser <br> `string`       |设置目标文件的SELinux用户|
|src <br> `path`            |源文件的绝对路径名|
|unsafe_writes <br> `boolean`|如果为True，则在写入文件之前，将文件写入临时目录中，然后使用mv命令将其移动到目标位置|
|validate <br> `string`     |在复制文件之前，使用此命令验证目标文件的有效性|

### 返回值
| 返回值                     | 描述 |
|-------------------------|------|
| backup_file <br> `path` |如果备份文件已创建，则返回备份文件的绝对路径名|
| checksum <br> `string`  |如果文件已复制，则返回文件的校验和|
| dest <br> `path`        |目标文件的绝对路径名|
| gid <br> `integer`      |目标文件的组ID|
| group <br> `string`     |目标文件的所有者组|
| md5sum <br> `string`    |如果文件已复制，则返回文件的MD5校验和|
| mode <br> `string`      |目标文件的权限|
| owner <br> `string`     |目标文件的所有者|
| size <br> `integer`     |目标文件的大小|
| src <br> `path`         |源文件的绝对路径名|
| state <br> `string`     |复制操作的结果|
| uid <br> `integer`      |目标文件的用户ID|
