#!/bin/bash

function rabbit_ops_setup {
    docker exec -i rabbitmq rabbitmqctl set_policy ha-all '^(?!amq\.).*' '{"ha-mode": "all"}'
    docker exec -i rabbitmq rabbitmqctl delete_user guest
    docker exec -i rabbitmq rabbitmqctl add_user {{ rabbit_user }} {{ rabbit_passwd }}
    docker exec -i rabbitmq rabbitmqctl set_permissions {{ rabbit_user }} ".*" ".*" ".*"
}

rabbit_ops_setup
