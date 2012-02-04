
kernver=`uname -r`

pkgname=ipt_netflow-cvs
pkgver=1.6
pkgrel=1
url=http://sourceforge.net/projects/ipt-netflow/
pkgdesc="Netflow capture module for iptables (netfilter). CVS version."
arch=('i686' 'x86_64')
license=('GPL')
depends=('iptables')
makedepends=('wget' 'cvs' 'kernel26-headers')
source=(modprobe.conf)
install=depmods
md5sums=('ab9ce5dba0377556326851d09d7cfe94')

build() {
	cd $srcdir
        iptver="`iptables --version | sed s,^[^0-9]*,,`"
	wget -c "http://netfilter.org/projects/iptables/files/iptables-$iptver.tar.bz2"
	tar xf iptables-$iptver.tar.bz2
	cd iptables-$iptver
	./configure
	make -j9
	cd ..
	cvs -z3 -d:pserver:anonymous@ipt-netflow.cvs.sourceforge.net:/cvsroot/ipt-netflow co -P ipt_netflow
	cd ipt_netflow
	./configure --ipt-src=../iptables-$iptver
	make KVERSION=$kernver all
}

package() {
	install -D -o root -g root -m 0644 $srcdir/ipt_netflow/ipt_NETFLOW.ko $pkgdir/lib/modules/$kernver/ipt_NETFLOW/ipt_NETFLOW.ko
	install -D -o root -g root -m 0755 $srcdir/ipt_netflow/libipt_NETFLOW.so $pkgdir/usr/lib/iptables/libipt_NETFLOW.so
	install -D -o root -g root -m 0644 modprobe.conf $pkgdir/etc/modprobe.d/ipt_netflow.conf
}
