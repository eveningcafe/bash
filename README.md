### Notes
- Masakari (api and engine): containerized services (pending)


### Topology suggest
- 3 controller nodes, 2 compute nodes - HA configuration for controller nodes
- Network planning:
  - 1st - management network: 
  - 2nd - public network: 
  - 3rd - data network:

### Usage
- Ensure ssh connection between `installer server` (server with foreman, ansible installers)and `openstack servers`
- Edit `inventory/host` with correct servers IPs
- Edit `ansible.cfg` with correct ssh private key path on installer server
- Update `group_vars/all`:
  - Update ansible playbook repository
- Auto generate ansible groups variables (in `group_vars/`): `ansible-playbook init.yml`
- Check proxy status
- Install TICK: 
  - `ansible-playbook TICK.yml`
- Install Ceilometer:
  - `ansible-playbook telemetry.yml`
- Install vitrage, mistral, heat
  - `ansible-playbook triger_service.yml`
  
- Overall installation with HA configuration (3 CONTROLLER nodes and 2 or more COMPUTE nodes)
  - Proxy: `ansible-playbook aio.yml`
  - No proxy: `ansible-playbook aio_noproxy.yml`

### Installation flow explain - overall installation
- Install common packages - setup hostname, update hosts, install chrony, docker and restart servers (apply for all servers)
- Waiting for servers comming back
- Install controller services:
  - Install gnochhi, aodh, ceilometer agent centrer
- Install compute services:
  - Install ceilometer-compute and config
  - Install telegraf 