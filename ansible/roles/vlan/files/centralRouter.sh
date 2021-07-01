#!/usr/bin/env bash
echo "DEFROUTE=no" >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "GATEWAY=192.168.255.2" >> /etc/sysconfig/network-scripts/ifcfg-bond0
echo "DEFROUTE=yes" >> /etc/sysconfig/network-scripts/ifcfg-bond0
touch /etc/sysconfig/network-scripts/route-eth4
echo "192.168.4.0/26 via 192.168.3.4" >> /etc/sysconfig/network-scripts/route-eth4
#
# sysctl net.ipv4.conf.all.forwarding=1
