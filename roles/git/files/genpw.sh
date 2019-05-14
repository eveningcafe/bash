#!/bin/bash

echo "===================GENERATE PASSWORDS==================="

INDEXER_PASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
INDEXER_MONITOR_PASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
MYSQL_PASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
MYSQL_PASS_SST=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
MYSQL_MONITOR_PASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
KEYSTONE_DBPASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
GLANCE_DBPASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
NOVA_DBPASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
NEUTRON_DBPASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
CINDER_DBPASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
MASAKARI_DBPASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
ADMIN_PASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
GLANCE_PASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
NOVA_PASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
PLACEMENT_PASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
NEUTRON_PASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
CINDER_PASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
MASAKARI_PASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
OCH_DB_PASSWD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
OCH_PASSWD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
OCH_DOMAIN_PASSWD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
MON_AGT_DB_PASSWD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
MON_AGT_PASSWD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
METRIC_DB_PASSWD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
METRIC_PASSWD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
ALARM_DB_PASSWD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
ALARM_PASSWD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
METADATA_PROXY_SHARED_SECRET=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
RABBIT_PASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
RABBIT_ERL_COOKIE=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
RABBIT_MONITOR_PASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
MEMCACHED_PASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
HAPROXY_PASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
INFLUXDB_PASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
CEPH_NOVA_KEYRING=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
DASHBOARD_DB_PASSWD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
LB_DB_PASSWD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
LB_PASSWD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
INCOMING_PASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
ZOO_PASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
POSTGRES_PWD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
POSTGRES_REPL_PASSWORD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
KEEPALIVED_HAPROXY_AUTHPASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
KEEPALIVED_POSTGRES_AUTHPASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
KEEPALIVED_MYSQL_AUTHPASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
KEEPALIVED_ETCD_AUTHPASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
KEEPALIVED_GNOCCHI_INDEXER_AUTHPASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)

echo "===================UPDATE PASSWORDS==================="

# all.yml
sed -i "s/KEEPALIVED_GNOCCHI_INDEXER_AUTHPASS/${KEEPALIVED_GNOCCHI_INDEXER_AUTHPASS}/g" $1/all.yml
sed -i "s/KEEPALIVED_HAPROXY_AUTHPASS/${KEEPALIVED_HAPROXY_AUTHPASS}/g" $1/all.yml
sed -i "s/KEEPALIVED_POSTGRES_AUTHPASS/${KEEPALIVED_POSTGRES_AUTHPASS}/g" $1/all.yml
sed -i "s/KEEPALIVED_MYSQL_AUTHPASS/${KEEPALIVED_MYSQL_AUTHPASS}/g" $1/all.yml
sed -i "s/KEEPALIVED_ETCD_AUTHPASS/${KEEPALIVED_ETCD_AUTHPASS}/g" $1/all.yml
sed -i "s/RABBIT_ERL_COOKIE/${RABBIT_ERL_COOKIE}/g" $1/all.yml
sed -i "s/MYSQL_PASS/${MYSQL_PASS}/g" $1/all.yml
sed -i "s/MYSQL_MONITOR_PASS/${MYSQL_MONITOR_PASS}/g" $1/all.yml
sed -i "s/HAPROXY_PASS/${HAPROXY_PASS}/g" $1/all.yml
sed -i "s/INFLUXDB_PASS/${INFLUXDB_PASS}/g" $1/all.yml
sed -i "s/RABBIT_PASS/$RABBIT_PASS/g" $1/all.yml
sed -i "s/RABBIT_MONITOR_PASS/$RABBIT_MONITOR_PASS/g" $1/all.yml
sed -i "s/MEMCACHED_PASS/$MEMCACHED_PASS/g" $1/all.yml
sed -i "s/AD_PASSWD/$ADMIN_PASS/g" $1/all.yml
sed -i "s/ID_DB_PASSWD/$KEYSTONE_DBPASS/g" $1/all.yml
sed -i "s/IMG_DB_PASSWD/${GLANCE_DBPASS}/g" $1/all.yml
sed -i "s/IMG_SRV_PASSWD/${GLANCE_PASS}/g" $1/all.yml
sed -i "s/CP_DB_PASSWD/${NOVA_DBPASS}/g" $1/all.yml
sed -i "s/CP_SRV_PASSWD/${NOVA_PASS}/g" $1/all.yml
sed -i "s/PL_PASSWD/${PLACEMENT_PASS}/g" $1/all.yml
sed -i "s/META_PASSWD/${METADATA_PROXY_SHARED_SECRET}/g" $1/all.yml
sed -i "s/NW_DB_PASSWD/${NEUTRON_DBPASS}/g" $1/all.yml
sed -i "s/NW_SRV_PASSWD/${NEUTRON_PASS}/g" $1/all.yml
sed -i "s/BLK_DB_PASSWD/${CINDER_DBPASS}/g" $1/all.yml
sed -i "s/BLK_SRV_PASSWD/${CINDER_PASS}/g" $1/all.yml
sed -i "s/CPU_HA_DB_PASSWD/${MASAKARI_DBPASS}/g" $1/all.yml
sed -i "s/CPU_HA_PASSWD/${MASAKARI_PASS}/g" $1/all.yml
sed -i "s/OCH_DB_PASSWD/${OCH_DB_PASSWD}/g" $1/all.yml
sed -i "s/OCH_PASSWD/${OCH_PASSWD}/g" $1/all.yml
sed -i "s/OCH_DOMAIN_PASSWD/${OCH_DOMAIN_PASSWD}/g" $1/all.yml
sed -i "s/MON_AGT_DB_PASSWD/${MON_AGT_DB_PASSWD}/g" $1/all.yml
sed -i "s/MON_AGT_PASSWD/${MON_AGT_PASSWD}/g" $1/all.yml
sed -i "s/METRIC_DB_PASSWD/${METRIC_DB_PASSWD}/g" $1/all.yml
sed -i "s/METRIC_PASSWD/${METRIC_PASSWD}/g" $1/all.yml
sed -i "s/ALARM_DB_PASSWD/${ALARM_DB_PASSWD}/g" $1/all.yml
sed -i "s/ALARM_PASSWD/${ALARM_PASSWD}/g" $1/all.yml
sed -i "s/CEPH_NOVA_KEYRING/${CEPH_NOVA_KEYRING}/g" $1/all.yml
sed -i "s/DASHBOARD_DB_PASSWD/${DASHBOARD_DB_PASSWD}/g" $1/all.yml
sed -i "s/LB_DB_PASSWD/${LB_DB_PASSWD}/g" $1/all.yml
sed -i "s/LB_PASSWD/${LB_PASSWD}/g" $1/all.yml
sed -i "s/INCOMING_PASS/${INCOMING_PASS}/g" $1/all.yml
sed -i "s/ZOO_PASS/${ZOO_PASS}/g" $1/all.yml
sed -i "s/POSTGRES_PWD/${POSTGRES_PWD}/g" $1/all.yml
sed -i "s/POSTGRES_REPL_PASSWORD/${POSTGRES_REPL_PASSWORD}/g" $1/all.yml
sed -i "s/INDEXER_PASS/${INDEXER_PASS}/g" $1/all.yml
sed -i "s/INDEXER_MONITOR_PASS/${INDEXER_MONITOR_PASS}/g" $1/all.yml

# controller.yml
sed -i "s/MYSQL_PASS_SST/$MYSQL_PASS_SST/g" $1/controller.yml
sed -i "s/MYSQL_PASS/$MYSQL_PASS/g" $1/controller.yml

# mysql.yml
sed -i "s/MYSQL_PASS_SST/$MYSQL_PASS_SST/g" $1/mysql.yml
sed -i "s/MYSQL_PASS/$MYSQL_PASS/g" $1/mysql.yml
