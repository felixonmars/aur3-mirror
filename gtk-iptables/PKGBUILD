# Contributor: Leos Mach <leos@darkfate.net>
pkgname=gtk-iptables
pkgver=0.5.1
pkgrel=2
arch=('i386' 'x86_64')
pkgdesc="gtk-iptables is a gtk-based frontend for iptables written in C."
url="http://gtk-iptables.sourceforge.net/index.html"
license=('GPL')
depends=('iptables' 'gksu')
source=(http://downloads.sourceforge.net/gtk-iptables/gtk-iptables-0.5.1.tar.gz)
md5sums=('6b098c24dab7f1dde382d4d41dc29008')

build() {
    cd $startdir/src/$pkgname-$pkgver
    ./configure --prefix=/usr --sysconfdir=/etc 
    make || return 1
        make DESTDIR=$startdir/pkg install
	install -D -m644 ${startdir}/$pkgname.desktop ${pkgdir}/usr/share/applications/$pkgname.desktop
	}