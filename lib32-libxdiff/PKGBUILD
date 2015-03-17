# Maintainer: edubart <edub4rt@gmail.com>
_pkgname=libxdiff
pkgname=lib32-$_pkgname
pkgver=0.23
pkgrel=1
pkgdesc="The LibXDiff library implements basic and yet complete functionalities to create file differences/patches"
arch=(i686 x86_64)
url="http://www.xmailserver.org/xdiff-lib.html"
license=('GPL')
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!libtool)
install=
source=(http://www.xmailserver.org/$_pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('8970281543130411d8a1b1f004a8418b')


build() {
  export CFLAGS="${CFLAGS} -march=i686 -m32"
  export CXXFLAGS="${CXXFLAGS} -march=i686 -m32"
  export LDFLAGS="${LDFLAGS} -march=i686 -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}


# vim:set ts=2 sw=2 et:
