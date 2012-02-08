pkgname=libnl3
_pkgname=libnl
pkgver=3.2.7
pkgrel=1
pkgdesc="Convenience library for kernel netlink sockets"
arch=('i686' 'x86_64')
url="http://www.infradead.org/~tgr/libnl/"
license=('LGPL2.1')
depends=('glibc')
makedepends=('git' 'flex')
provides=('libnl')

source=("http://www.infradead.org/~tgr/libnl/files/$_pkgname-$pkgver.tar.gz")
md5sums=('6a233a9dffa0ee3a7f6110c95c5410ab')

build() {

  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir="/usr/lib/$_pkgname" \
    --enable-shared --disable-static --with-pic # --disable-cli
  make
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
