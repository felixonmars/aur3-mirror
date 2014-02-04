# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=bzrtools-bzr
pkgver=787
pkgrel=2
pkgdesc="Useful collection of utilities (all plugins, right now) for bzr."
arch=('any')
url="https://code.launchpad.net/~andrewsomething/bzrtools/kill_get_ancestry"
license=('GPL')
depends=('bzr')
provides=('bzrtools')
conflicts=('bzrtools')
source=("bzrtools::bzr+https://code.launchpad.net/~andrewsomething/bzrtools/kill_get_ancestry")
md5sums=('SKIP')
_bzrmod=bzrtools

pkgver() {
  cd $srcdir/$_bzrmod
  bzr revno
}

prepare() {
  cd $srcdir/$_bzrmod
  # python 2 fix
  for _file in test.py check-release.py
  do
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' ${_file}
  done
}

package() {
  cd $srcdir/$_bzrmod
  python2 setup.py install --root=$pkgdir
}
