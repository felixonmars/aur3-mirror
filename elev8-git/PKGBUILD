# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Leif Middelschulte <leif dot middelschulte at gmail dot com>

pkgname=elev8-git
_pkgname=elev8
pkgver=0.1.0.1158.e2f5ba1
pkgrel=1
pkgdesc="JavaScript bindings for the Enlightenment Foundataion Libraries - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1')
depends=('elementary>=1.7.99' 'v8')
makedepends=('git')
options=('!libtool')
source=("git://git.enlightenment.org/bindings/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  for i in v_maj v_min v_mic; do
    local _$i=$(grep -m 1 $i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done

  echo $_v_maj.$_v_min.$_v_mic.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install
}
