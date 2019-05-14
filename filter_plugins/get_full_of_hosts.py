#!/usr/bin/python

def get_full_of_hosts(hostnames, ips):
    return dict(zip(hostnames, ips))

class FilterModule( object ):
  def filters( self ):
    return { 'get_full_of_hosts' : get_full_of_hosts }
