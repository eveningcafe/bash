#!/usr/bin/python

def get_hosts(ips, hostnames):
    return dict(zip(ips, hostnames))

class FilterModule( object ):
  def filters( self ):
    return { 'get_hosts' : get_hosts }
