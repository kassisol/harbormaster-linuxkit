---
title: "About OS"
linktitle: "Overview"
description: "OS"
keywords: [ "os", "about" ]
date: "2018-04-06"
url: "/docs/os/overview/"
menu:
  docs:
    parent: "os_use"
    weight: -85
github_edit: "https://github.com/kassisol/harbormaster-linuxkit/edit/master/docs/overview.md"
---

Included in this image:
* SSH
* Docker
* [HBM](https://github.com/kassisol/hbm)

## Installing Linuxkit

Have a look at the github [page](https://github.com/linuxkit/linuxkit).

## Building image

```bash
$ linuxkit build harbormaster.yml
```

## Booting and Testing

```bash
$ linuxkit run harbormaster
```

```bash
(ns: getty) linuxkit-1ac9b2ff59b2:~# export CONTAINERD_NAMESPACE=services.linuxkit
(ns: getty) linuxkit-1ac9b2ff59b2:~# ctr tasks ls
TASK      PID    STATUS
getty     564    RUNNING
hbm       614    RUNNING
ntpd      653    RUNNING
rngd      697    STOPPED
sshd      752    RUNNING
dhcpcd    452    RUNNING
docker    519    RUNNING
(ns: getty) linuxkit-1ac9b2ff59b2:~# ctr tasks exec --exec-id $(ctr tasks ls | awk '/docker/ { print $2 }') docker docker info
Containers: 0
 Running: 0
 Paused: 0
 Stopped: 0
Images: 0
Server Version: 18.03.0-ce
Storage Driver: overlay2
 Backing Filesystem: extfs
 Supports d_type: true
 Native Overlay Diff: true
Logging Driver: json-file
Cgroup Driver: cgroupfs
Plugins:
 Volume: local
 Network: bridge host macvlan null overlay
 Authorization: hbm
 Log: awslogs fluentd gcplogs gelf journald json-file logentries splunk syslog
Swarm: inactive
Runtimes: runc
Default Runtime: runc
Init Binary: docker-init
containerd version: cfd04396dc68220d1cecbe686a6cc3aa5ce3667c
runc version: 4fc53a81fb7c994640722ac585fa9ca548971871
init version: 949e6fa
Security Options:
 seccomp
  Profile: default
Kernel Version: 4.14.32-linuxkit
Operating System: Alpine Linux v3.7 (containerized)
OSType: linux
Architecture: x86_64
CPUs: 1
Total Memory: 985.8MiB
Name: linuxkit-1ac9b2ff59b2
ID: QPXK:7VYS:RWFB:NUPF:3FEQ:S7BG:2YZN:4UZE:HUAF:T6UH:ELST:D75C
Docker Root Dir: /var/lib/docker
Debug Mode (client): false
Debug Mode (server): true
 File Descriptors: 20
 Goroutines: 35
 System Time: 2018-04-10T15:56:26.321813053Z
 EventsListeners: 0
Registry: https://index.docker.io/v1/
Labels:
Experimental: false
Insecure Registries:
 127.0.0.0/8
Live Restore Enabled: false

(ns: getty) linuxkit-1ac9b2ff59b2:~# ctr tasks exec --exec-id $(ctr tasks ls | awk '/hbm/ { print $2 }') hbm hbm config set authorization true
(ns: getty) linuxkit-1ac9b2ff59b2:~# ctr tasks exec --exec-id $(ctr tasks ls | awk '/docker/ { print $2 }') docker docker info
Error response from daemon: authorization denied by plugin hbm: info is not allowed
```
