### Notes
- Masakari (api and engine): containerized services (pending)

### Documents
- Pending

### Playbook structure
- Pending

### Topology
- 3 controller nodes, 2 compute nodes - HA configuration for controller nodes
- Network planning:
  - 1st - management network: 10.10.0.0/24
  - 2nd - public network: 192.168.2.0/24
  - 3rd - data network: 10.10.1.0/24

### Usage
- Ensure ssh connection between `installer server` (server with foreman, ansible installers)and `openstack servers`
- Edit `inventory/host` with correct servers IPs
- Edit `ansible.cfg` with correct ssh private key path on installer server
- Update `group_vars/all`:
  - Update ansible playbook repository
  - Update haproxy and vip configuration
  - Update docker registry configuration
- Edit keepalived controllers priority in directory `host_vars/`
- Auto generate ansible groups variables (in `group_vars/`): `ansible-playbook init.yml`
- Review `group_vars/all` again 
- Config COMPUTE servers to support virtualization
- Check proxy status
- Install controllers: 
  - Proxy: `ansible-playbook controller.yml`
  - No proxy: `ansible-playbook controller_noproxy.yml`
- Install computes:
  - Proxy: `ansible-playbook compute.yml`
  - No proxy: `ansible-playbook compute_noproxy.yml`
- Overall installation with HA configuration (3 CONTROLLER nodes and 2 or more COMPUTE nodes)
  - Proxy: `ansible-playbook aio.yml`
  - No proxy: `ansible-playbook aio_noproxy.yml`

### Installation flow explain - overall installation
- Install common packages - setup hostname, update hosts, install chrony, docker and restart servers (apply for all servers)
- Waiting for servers comming back
- Install controller services:
  - Create docker registry on the first CONTROLLER node
  - Build dockerized services for OpenStack on the first CONTROLLER node
  - Bootstrap OpenStack Environment on the first CONTROLLER node
    - Create databases for OpenStack services 
    - Config keystone and generate fernet keys, credentials key for AAA
    - Start dockerized OpenStack services for CONTROLLER role and update config to existing services databases 
  - Pull services images from the first CONTROLLER node and start OpenStack services on others CONTROLLER nodes
  - Synchronize keystone keys (credentials and fernet keys) between the first CONTROLLER node and others CONTROLLER nodes

- Install compute services:
  - Install nova-compute and config libvirt, ssh key for nova user (for live migration tasks)
  - Install Open vSwitch
  - Start dockerized services for neutron on COMPUTE nodes
  - Create Open vSwitch bridges, update `/etc/network/interfaces` and restart NICs to get new configuration

- Install glusterfs:
  - Install glusterfs server on CONTROLLER nodes, create volume and config replica
  - Install glusterfs client on COMPUTE nodes, mount `/var/lib/nova/instances` to gluster volume on CONTROLLER nodes and update `/etc/fstab` to save mount configuration permanently.
