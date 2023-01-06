#!/usr/bin/env bash
# how to set up /etc/sysconfig/iptables on asteriskbox
# do this and then service iptables save && service iptables restart

# clear all
iptables -F

# close everything
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# allow localhost
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
# allow established connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# let ssh in from anywhere
iptables -A INPUT -p tcp --dport 42422 -j ACCEPT

# XXX Is this needed? Probably not because sendgrid doesn't forward to us?
#     This should be sengrid only?
#     Wrong port? 587? switch to 2525?
# let SMTP in from anywhere
#iptables -A INPUT -p tcp --dport 25 -j ACCEPT

