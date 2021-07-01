#!/usr/bin/env bash
echo "DEFROUTE=no" >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "GATEWAY=192.168.3.3" >> /etc/sysconfig/network-scripts/ifcfg-eth1
echo "DEFROUTE=yes" >> /etc/sysconfig/network-scripts/ifcfg-eth1
# systemctl restart network
# sysctl net.ipv4.conf.all.forwarding=1
