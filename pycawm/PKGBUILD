# Maintainer: kozec <kozec at kozec dot com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Vincent Berset <msieurhappy@gmail.com>

pkgname=pycawm
pkgver=0.2
pkgrel=3
pkgdesc="A reparenting window manager written in python which can be easily extended/modified."
arch=('i686' 'x86_64')
conflicts=('pycawm-svn')
license=('GPL3')
url="http://pycawm.last-exile.org"
depends=('python2' 'python2-xlib' 'python-imaging')
makedepends=()
install=$pkgname.install
source=("$url/sources/$pkgname-$pkgver.tar.bz2" 'makefile_python.patch' "pycawm_launcher.patch")

build() {
  msg "Python-transition --> 2to3"
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
       -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      $(find $srcdir -name '*.py')

  msg "Python-transition: Special Case 1"
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
       -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      $(find $srcdir/ -name 'pycawm_*')

  msg "Python-transition: Special Case 2"
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
       -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      $(find $srcdir/$pkgname-$pkgver/utils -name 'pyca*')

  cd $srcdir/$pkgname-$pkgver

  msg "Python-transition: Special Case 3"
  patch -Np1 -i ../pycawm_launcher.patch

  msg "Add Makefile patch"
  patch -p1 -i ../makefile_python.patch
  
  make DESTDIR=$pkgdir prefix=/usr install
}
md5sums=('2daaa916b86d946d5127433060ee1d35'
         '082d426b7d2b12ec9b7a370e6c072d6a'
         '0242f6ab43d317e6ae8798148652f673')
