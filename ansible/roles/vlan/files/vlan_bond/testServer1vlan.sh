#!/usr/bin/env bash
ip l a l eth1 eth1.5 type vlan id 5 loose_binding on
ip a a 10.10.10.4/24 dev eth1.5
ip l s dev eth1.5 up
