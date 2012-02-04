# Contributor: Mark Smith <markzzzsmith@yahoo.com.au>
pkgname=ndisc6
pkgver=1.0.0
pkgrel=1
pkgdesc="A collection of IPv6 networking utilities - ndisc6, rdisc6, tcptraceroute6, tracert6, rltraceroute6, tcpspray6"
arch=('i686' 'x86_64')
url="http://www.remlab.net/ndisc6/"
license="GPL"
depends=('glibc')
makedepends=('glibc' 'gcc')
source=(http://www.remlab.net/files/ndisc6/$pkgname-$pkgver.tar.bz2
        rdnssd.rc.d
	rdnssd.confd)
md5sums=('0aa142213f4b24a6c7dcf75d2a2c05a8'
         '3421fd731c4da4f9e07fc6b6ff4e5084'
         'f1910902932e2622fc166960819db6c4')

build() {

  cd $startdir/src/$pkgname-$pkgver

  ./configure --localstatedir=/var --sysconfdir=/etc --prefix=/usr || return 1
  make || return 1

  make DESTDIR=$startdir/pkg install

  install -Dm755 $srcdir/rdnssd.rc.d $pkgdir/etc/rc.d/rdnssd
  install -Dm644 $srcdir/rdnssd.confd $pkgdir/etc/conf.d/rdnssd
}
