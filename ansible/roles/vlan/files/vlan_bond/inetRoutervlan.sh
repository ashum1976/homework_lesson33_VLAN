#!/usr/bin/env bash
ip l a l eth2 eth2.5 type vlan id 5 loose_binding on
ip l a l eth2 eth2.10 type vlan id 10 loose_binding on
ip a a 10.10.10.6/24 dev eth2.5
ip a a 10.10.10.5/24 dev eth2.10
ip l s dev eth2.5 up
ip l s dev eth2.10 up
