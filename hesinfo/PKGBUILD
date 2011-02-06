# Maintainer: Steven Allen <steven {a} stebalien {o} com>
pkgname=hesinfo
groups=(athena)
pkgver=3.1.0
pkgrel=1
pkgdesc="Hesinfo Tool"
url="ftp://athena-dist.mit.edu/pub/ATHENA/hesiod"
arch=(i686 x86_64)
license=("MIT")
depends=("hesiod=${pkgver}")
source=("ftp://athena-dist.mit.edu/pub/ATHENA/hesiod/$pkgname-$pkgver.tar.gz")
md5sums=('376b3af2bb3f59a972c218312527eadf')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --mandir=/usr/share/man --prefix=/usr --sysconfdir=/etc
  /usr/bin/make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  /usr/bin/make DESTDIR=${pkgdir} install
}
