# Swarm Deployment

This deployment requires `vagrant-hostmanager` plugin:

```bash
$ vagrant plugin install vagrant-hostmanager
```

## Deploy

```bash
$ vagrant up
$ ansible-playbook -i inventory swarm.yml
```

## Post Deployment

```bash
$ vagrant ssh swarm-master
$ docker info
```
