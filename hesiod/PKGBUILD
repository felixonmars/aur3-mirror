# Maintainer: Steven Allen <steven {a} stebalien {o} com>
# Contributor: Lee Burton <lburton@mrow.org>

pkgname=hesiod
groups=(athena)
pkgver=3.2.1
pkgrel=1
pkgdesc="Hesiod Name Service Support"
url="ftp://athena-dist.mit.edu/pub/ATHENA/hesiod"
arch=(i686 x86_64)
license="MIT"
depends=('glibc' 'libidn')
provides=("hesinfo=$pkgver")
replaces=('hesinfo')
conflicts=('hesinfo')
source=("ftp://athena-dist.mit.edu/pub/ATHENA/hesiod/$pkgname-$pkgver.tar.gz")
md5sums=('d8fe6d7d081c9c14d5d3d8a466998eeb')
options=(!staticlibs !libtool)

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=${pkgdir} install
  install -m644 -D COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
