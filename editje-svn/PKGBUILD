# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: fuji

pkgname=editje-svn
_pkgname=editje
pkgver=84490
pkgrel=1
pkgdesc="Edje editor oriented towards UI design, not just being a GUI over the edc syntax."
url="http://trac.enlightenment.org/e/wiki/Editje"
arch=('any')
license=('LGPL3')
depends=('python2-efl-git' 'python2-elementary' 'python2-edje' 'python2-ecore')
makedepends=('subversion')
source=("svn+http://svn.enlightenment.org/svn/e/trunk/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/$_pkgname"

  LC_ALL=C svn info | awk '/Last Changed Rev/ {print $4}'
}

prepare() {
# set scripts to run with python2
  sed -i 's/env python/python2/g' "$srcdir/$_pkgname/editje-bin"
}

build() {
  cd "$srcdir/$_pkgname"

  PYTHON=/usr/bin/python2 \
  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"
  
  make DESTDIR="$pkgdir" install
}
