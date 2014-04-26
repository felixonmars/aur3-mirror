#!/bin/sh

mkdir_dnsforwarder() {
  if [ ! -d /root/.dnsforwarder ]; then
    dnsforwarder -p >/dev/null && ln -s /etc/dnsforwarder.conf /root/.dnsforwarder/config
  fi
}

post_install() {
  mkdir_dnsforwarder
  echo "There are two methods for anti-spoofing in China mainland. Please modify /etc/dnsforwarder.conf by refering to wiki: "
  echo "https://github.com/holmium/dnsforwarder/wiki/%E9%A6%96%E6%AC%A1%E4%BD%BF%E7%94%A8%E6%96%B9%E6%B3%95"
  echo "Enable service and make nameserver in /etc/resolv.conf point to your LocalInterface <IP>"
  }

post_upgrade() {
   post_install
}

post_remove() {
    rm -fr /root/.dnsforwarder
}