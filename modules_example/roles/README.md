## 目录结构

roles目录中，每个任务可以有单独的role目录，如创建了[role_A]目录为例，介绍其目录文件的作用。

- tasks：用于存放role_A的主要任务，也可以添加其他task文件，供main.yml调用，从而实现更复杂的部署功能。
- handlers：用于存放触发执行{{ handlers }} 的任务。
- defaults：用于存放默认变量，优先级最低，变量优先级可参考[变量优先级](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#variable-precedence-where-should-i-put-a-variable)。
- vars：用于存放变量文件, role_A中任务和模板里用到的变量可以在这里定义。
- files：用于存放需要拷贝到目标主机的文件，例如，作为 `copy` 模块`src`参数的默认根目录。
- templates：用于存放模板文件，格式为`.j2`，文件内容要符合jinja2语法，通常使用 `template` 模块部署服务的配置文件。
- meta：用于存放role_A的依赖列表，例如，role_A依赖于role_B，那么在meta/main.yml中添加如下内容：
    ```yaml
    dependencies:
      - role: role_B
    ```
- tests：用于存放测试 role 本身功能的 playbook和主机定义文件，在开发测试时使用。

## role中各个目录下的main.yaml文件很重要，这是ansible默认加载的YAML文件。
