# Contributor: Spooky Hunter <spookyh+arch@gmail.com>

pkgname=udhcp
pkgver=0.9.8cvs20050303
pkgrel=3
pkgdesc="Lightweight DHCP server/client"
arch=('any')
url="http://busybox.net/"
license=('GPL')
backup=('etc/udhcpd.conf')
source=('http://ftp.acc.umu.se/mirror/cdimage/snapshot/Debian/pool/main/u/udhcp/udhcp_0.9.8cvs20050303.orig.tar.gz'
        'http://ftp.acc.umu.se/mirror/cdimage/snapshot/Debian/pool/main/u/udhcp/udhcp_0.9.8cvs20050303-2.1.diff.gz'
	'udhcpd.service')

sha256sums=('fc5d6c7bb2961c18d07241b3056756291b623f2771d3624afb4b70b62dfc21bc'
            '4836ca7e9baecce95941c6291f33beaa8cab5a3be061518ea0aaaa043e423542'
            'e56e5069fdc4131fbd3b4ff4c1d8d1cdf5302b9d607593332610f1cdb335c1d3')

prepare () {
  cd "$srcdir/$pkgname"
  #  gunzip udhcp_0.9.8cvs20050303-2.1.diff.gz
  patch -Np1 -i ../udhcp_0.9.8cvs20050303-2.1.diff
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" USRSBINDIR="$pkgdir/usr/bin" install 

  install -D -m 0644 $srcdir/$pkgname/samples/udhcpd.conf $pkgdir/etc/udhcpd.conf

  install -D -m 0644 $srcdir/udhcpd.service $pkgdir/usr/lib/systemd/system/udhcpd.service

  install -d $pkgdir/var/lib/misc
  touch $pkgdir/var/lib/misc/udhcpd.leases
}
