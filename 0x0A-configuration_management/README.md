# **Configuration Management**

In this project, I delved into the world of Configuration Management. I learned
about the importance of configuration management as well as its advantages while
writing simple provisioning scripts.

## Dependencies
`$ apt-get install -y ruby=1:2.7+1 --allow-downgrades`

`$ apt-get install -y ruby-augeas`

`$ apt-get install -y ruby-shadow`

`$ apt-get install -y puppet`

### Styling puppet-lint 4.0.0
`$ gem install puppet-lint`

## **Tasks**
### 0. Create a file
Using Puppet, create a file in /tmp.
Requirements:
* File path is `/tmp/school`
* File permission is `0744`
* File owner is `www-data`
* File group is `www-data`
* File contains `I love Puppet`
  
file: [0-create_a_file.pp](./0-create_a_file.pp)

### 1. Install a package
Using Puppet, install `flask` from `pip3`.
Requirements:
* Install `flask`
* Version must be `2.1.0`
  
file: [1-install_a_package.pp](./1-install_a_package.pp)

### 2. Execute a command
Using Puppet, create a manifest that kills a process named `killmenow`.
Requirements:
* Must use the `exec` Puppet resource
* Must use `pkill`
  
file: [2-execute_a_command.pp](./2-execute_a_command.pp)
