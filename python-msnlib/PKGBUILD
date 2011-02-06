# Contributor: Roberto Alsina@kde.org
pkgname=python-msnlib
pkgver=3.6
pkgrel=1
pkgdesc="A Python MSN messenger protocol library and client"
arch=( 'i686' )
url="http://auriga.wearlab.de/~alb/msnlib/"
license=('custom:OSL')
source=(http://auriga.wearlab.de/~alb/msnlib/files/3.6/msnlib-$pkgver.tar.bz2)
md5sums=('86fed2bb0ef4e75f388a1032fb1fed0a')

build() {
  cd "$srcdir/msnlib-$pkgver"
  python setup.py bdist_dumb || return 1
  cd $startdir/pkg
  tar xzvf $startdir/src/msnlib-$pkgver/dist/msnlib-3.6.linux-i686.tar.gz
  install -D $startdir/src/msnlib-3.6/doc/LICENSE $startdir/pkg/usr/share/licenses/python-msnlib/COPYING
}

# vim:set ts=2 sw=2 et:
