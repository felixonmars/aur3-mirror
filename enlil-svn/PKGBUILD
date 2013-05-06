# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=enlil-svn
_pkgname=enlil
pkgver=82148
pkgrel=2
pkgdesc="EFL based library for photo management"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1')
depends=('efreet' 'ethumb' 'libiptcdata')
makedepends=('subversion')
options=('!libtool')
source=("svn+http://svn.enlightenment.org/svn/e/trunk/$_pkgname"
        'azyver.patch')
md5sums=('SKIP'
         'cca4b8935c05e6c33efbe1197a910f34')

pkgver() {
  cd "$SRCDEST/$_pkgname"

  LC_ALL=C svn info | awk '/Last Changed Rev/ {print $4}'
}

prepare() {
  cd "$srcdir/$_pkgname"
# Look for only the versions of azy that work
  patch -Np0 < ../azyver.patch
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
