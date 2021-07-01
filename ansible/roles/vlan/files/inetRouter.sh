#!/usr/bin/env bash
iptables -t nat -A POSTROUTING ! -d 192.168.0.0/16 -o eth0 -j MASQUERADE
# touch /etc/sysconfig/network-scripts/route-eth1
touch /etc/sysconfig/network-scripts/route-bond0
echo "192.168.3.0/28 via 192.168.255.3" >> /etc/sysconfig/network-scripts/route-bond0
echo "192.168.4.0/26 via 192.168.255.3" >> /etc/sysconfig/network-scripts/route-bond0
# systemctl restart network
# sysctl net.ipv4.conf.all.forwarding=1
