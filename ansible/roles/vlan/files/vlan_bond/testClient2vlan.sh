#!/usr/bin/env bash
ip l a l eth1 eth1.10 type vlan id 10 loose_binding on
ip a a 10.10.10.250/24 dev eth1.10
ip l s dev eth1.10 up
