#!/bin/bash

rabbitmq-server

rabbitmqctl stop_app

if [ -n "$CLUSTER_WITH" ]; then
	rabbitmqctl join_cluster rabbit@$CLUSTER_WITH
fi

if [ -n "$RAM_NODE" ]; then
	rabbitmqctl rchange_cluster_node_type ram
fi

rabbitmqctl start_app