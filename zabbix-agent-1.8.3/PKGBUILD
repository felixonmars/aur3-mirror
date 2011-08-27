# Contributor: Igor Pakhmutov <xasyaip@gmail.com>
pkgname=zabbix-agent-1.8.3
pkgver=1.8.3
pkgrel=0
pkgdesc="Software for monitoring of your applications, network and servers."
arch=('i686' 'x86_64')
url="http://www.zabbix.com"
license=('GPL')
install=(zabbix-agent.install)
source=(http://downloads.sourceforge.net/sourceforge/zabbix/zabbix-$pkgver.tar.gz  zabbix_agent.conf zabbix_agentd.conf zabbix-agentd zabbix-agent.install)

md5sums=('575c31880d73f6fe41e730874ebfc633 '
         '9c20157a77b1ee4915265971f338fb41'
         '9e2a08c7dc89dccf6f7b21a156360713'
         '664cd2ebfc711d722fc62c968704d0ca'
         'f36fddf29e295c2a7bd95ca1ce4320c7')


build() {
  cd $startdir/src/zabbix-$pkgver
  ./configure --prefix=/usr --enable-agent
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -d -m0750 $startdir/pkg/var/run/zabbix  $startdir/pkg/var/log/zabbix
  install -d $startdir/pkg/etc/zabbix 
  install -D -m0640 $startdir/src/zabbix_agent.conf $startdir/pkg/etc/zabbix/zabbix_agent.conf
  install -D -m0640 $startdir/src/zabbix_agentd.conf $startdir/pkg/etc/zabbix/zabbix_agentd.conf
  install -D -m0755 $startdir/src/zabbix-agentd $startdir/pkg/etc/rc.d/zabbix-agentd 
}
