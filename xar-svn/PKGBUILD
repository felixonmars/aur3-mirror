# $Id$
# Maintainer: Silvio Knizek <killermoehre@gmx.net>

_pkgname=xar
pkgname=${_pkgname}-svn
pkgver=1.5.2r233
pkgrel=2
pkgdesc="eXtensible ARchiver"
arch=('i686' 'x86_64')
url="https://code.google.com/p/xar/"
license=('BSD')
groups=('')
depends=('libxml2' 'openssl' 'zlib')
optdepends=('bzip2: for data compression' 'xz: for data compression')
makedepends=('svn' 'bzip2' 'xz')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("xar-svn::svn+http://${_pkgname}.googlecode.com/svn/trunk/")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local ver="$(svnversion)"
  printf "1.5.2r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$pkgname/xar"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --with-bzip2 \
    --with-lzma=/usr/lib \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$pkgname/xar"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
