# ansible-playbook-labo

ansible-playbook-labo is an ansible playbook. This playbook is a sample for a labo. 
In this playbook we will install all tools for the tools server. 

## Requirement

Many requirement is mandatory:

**In the target machine:**

Add user eg: provisionner and add this user in sudoer

```bash
sudo adduser provisionner
sudo adduser provisionner sudo
```

**In the host machine (where ansible will be run)**

Create SSH key if you want use ssh key connection
```bash
ssh-keygen -C <name>
ssh-copy-id -f provisionner@<server>
```

**Install docker(optional but this is the clean way)**


## build

```bash
make build
```
or 
```bash
docker build -t $(NAME):latest .

```

## debug

Warning: if you want use Makefile you need to set the location of your ssh


```bash
make debug
```
or 
```bash
docker run --rm -ti -v $(ROOT_DIR):/app -v $(SSH_LOCATION):/home/.ssh $(NAME):latest bash
```


## Connection SSH or basic authentication

for the connection with the target machine we can use 2 types of connection: 

**Via ssh-key**
if you use  ssh key connection that you generate in requirement.
this ssh key will be store in /home/.ssh in the container.

**Via basic authentication**
if you want use basic connection you had to change all.yml in group_vars:
```yaml
ansible_connection: ssh
ansible_user: provisionner
ansible_ssh_pass: ansible
```


###Warning

with Vmware player <15.0 i have a bug with ssh connection into the alpine container so if you don't want lose six hours of debug you had to upgrade Vmware player ;) 