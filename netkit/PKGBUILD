# Contributor: Claudio Pisa <clauz@ninux.org>
pkgname=netkit
pkgver=2.8
pkgrel=3
pkgdesc="A network emulator"
arch=('i686' 'x86_64')
url="http://www.netkit.org"
license=('GPL')
depends=('glibc' 'gawk' 'coreutils' 'findutils' 'util-linux' 'grep' 'procps' 'lsof')
backup=('opt/netkit/netkit.conf')
install='netkit.install'
source=("http://www.netkit.org/download/netkit/$pkgname-$pkgver.tar.bz2" "http://www.netkit.org/download/netkit-filesystem/netkit-filesystem-i386-F5.2.tar.bz2" "http://www.netkit.org/download/netkit-kernel/netkit-kernel-i386-K2.8.tar.bz2")
noextract=("$pkgname-$pkgver.tar.bz2" "netkit-filesystem-i386-F5.2.tar.bz2" "netkit-kernel-i386-K2.8.tar.bz2")
md5sums=('bdfbd6554ef5ff4b95eead24898340cf' '6421d699bdc5a8aba0681a78becd393f' '1b4297abd1c29e6c4563be70f7480562')

build() {
	tar -xSjf $srcdir/$pkgname-$pkgver.tar.bz2 -C $srcdir
	tar -xSjf $srcdir/netkit-filesystem-i386-F5.2.tar.bz2 -C $srcdir
	tar -xSjf $srcdir/netkit-kernel-i386-K2.8.tar.bz2 -C $srcdir
	mkdir -p $pkgdir/opt
	mv $srcdir/netkit/ $pkgdir/opt
	mkdir -p $pkgdir/etc/profile.d
	echo '#!/bin/bash' > $pkgdir/etc/profile.d/netkit.sh 
	echo 'export NETKIT_HOME=/opt/netkit' >> $pkgdir/etc/profile.d/netkit.sh
	echo 'export MANPATH=$MANPATH:$NETKIT_HOME/man' >> $pkgdir/etc/profile.d/netkit.sh
	echo 'export PATH=$NETKIT_HOME/bin:$PATH' >> $pkgdir/etc/profile.d/netkit.sh
	chmod 755 $pkgdir/etc/profile.d/netkit.sh 
}

