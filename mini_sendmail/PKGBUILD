# $Id$
# Maintainer: You
# Contributor: Vsevolod Balashov <vsevolod@balashov.name>
pkgname=mini_sendmail
pkgver=1.3.6
pkgrel=2
pkgdesc="Mini sendmail for chrooted environment."
url="http://www.acme.com/software/mini_sendmail/"
license="other"
depends=('glibc')
source=(http://www.acme.com/software/mini_sendmail/mini_sendmail-${pkgver}.tar.gz
        https://dev.openwrt.org/export/6919/packages/net/mini_sendmail/patches/200-fullname.patch
	Makefile.patch)
md5sums=('fb1585d2ad81c519a26d83bfd783dee8'
         '70269118a7930ab543e96e253b7c94f0'
         '53b179fa3f5dcc1d86584ab19d223f0e')

arch=(i686 x86_64)

build() {
  cd $srcdir/${pkgname}-${pkgver}
  patch -p1 <$srcdir/200-fullname.patch
  patch -p0 <$srcdir/Makefile.patch
  make
  install -D -T mini_sendmail $pkgdir/usr/bin/mini_sendmail
  install -D -T mini_sendmail.8 $pkgdir/usr/share/man/man8/mini_sendmail.8
}
