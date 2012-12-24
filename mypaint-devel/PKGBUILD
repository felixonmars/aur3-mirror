# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=mypaint-devel
pkgver=1.1.0.rc1
_pkgname=mypaint
_pkgver=1.1.0-rc1
_dirver=1.1.0
pkgrel=2
pkgdesc="A fast and easy painting application for digital painters, with brush dynamics"
arch=('i686' 'x86_64')
url="http://mypaint.intilinux.com/"
license=('GPL')
makedepends=('scons>=0.97' 'swig>=1.3.39')
depends=('pygtk' 'python2-numpy' 'ppl' 'json-c' 'lcms2')
conflicts=('mypaint' 'mypaint-git')
provides=('mypaint')
[ "$CARCH" = "i686" ] && optdepends=('psyco (improved performance)')
install='mypaint.install'
source=(http://download.gna.org/$_pkgname/$_pkgname-$_pkgver.tar.bz2)
md5sums=('0aad46bbc223f1f2c2cb02c0f35c88c1')

build() {
  cd $srcdir/$_pkgname-$_dirver
  
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  scons
}

package() {
  cd $srcdir/$_pkgname-$_dirver
  scons prefix="$pkgdir"/usr install
}

