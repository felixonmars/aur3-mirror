# Maintainer: Espen Fossen <espenaf@junta.no>
pkgname=irtrans-irserver
pkgver=6.09.04
pkgrel=1
pkgdesc="IRTrans Server"
arch=('i686' 'x86_64')
url="http://www.irtrans.de"
license=('BSD')
backup=('etc/conf.d/irtrans-irserver')
source=(http://ftp.disconnected-by-peer.at/irtrans/irserver-src-$pkgver.tar.gz
	irtrans-irserver.confd
	irtrans-irserver.service
	81-irtrans.rules
	udev.patch)
md5sums=('280994a94a59f0e4877d9f0bb1cd19a7'
         '679ad115bada164e9b16445bf9ec64de'
         '0c1daac3276a183742b4f4ded7e589b3'
         '3f517ee8e355f3511dfa983d49a358db'
         'a09c6fd7d988408aa8e0a46cd7b63cad')

if test "$CARCH" == x86_64; then
  _irbuild=irserver64
else
  _irbuild=irserver
fi

build() {
	patch -p1 -i $srcdir/udev.patch 
	cd "$srcdir/"
	make "${_irbuild}"
}

package() {
	cd "$srcdir/"

        mkdir -p $pkgdir/etc/conf.d
        mkdir -p $pkgdir/etc/irserver/remotes
        mkdir -p $pkgdir/etc/udev/rules.d
        mkdir -p $pkgdir/usr/bin
        mkdir -p $pkgdir/usr/lib/systemd/system/

	install -D -m 755 ./$_irbuild $pkgdir/usr/bin/irserver
	install -D -m 644 ./irtrans-irserver.confd $pkgdir/etc/conf.d/irtrans-irserver
        install -m 0644 $srcdir/irtrans-irserver.service  $pkgdir/usr/lib/systemd/system/irtrans-irserver.service
	install -m 644 ${srcdir}/remotes/* ${pkgdir}/etc/irserver/remotes
        install -m 0644 $srcdir/81-irtrans.rules  $pkgdir/etc/udev/rules.d/81-irtrans.rules
}
