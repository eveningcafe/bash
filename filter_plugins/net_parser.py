#!/usr/bin/python

from netaddr import *;

def net_parser(cidr):
    ip = IPNetwork(cidr)
    net_ip = str(ip.network)
    net_mask = str(ip.netmask)
    return (net_ip, net_mask)

class FilterModule( object ):
  def filters( self ):
    return { 'net_parser' : net_parser }
