# Maintainer: David Scholl <djscholl at gmail dot com> 
pkgname=python-rpy
pkgver=1.0.3
pkgrel=4
pkgdesc="A very simple, yet robust, Python interface to the R Programming Language."
arch=('i686' 'x86_64')
url="http://rpy.sourceforge.net/"
license=('MPL' 'GPL' 'LGPL')
depends=('python-numpy' 'r')
source=("http://downloads.sourceforge.net/sourceforge/rpy/rpy-$pkgver.tar.gz")
md5sums=('10fd4904f622e5647638817279933900')

build() {
  cd $srcdir/rpy-$pkgver
  sed -i "s:Rlapack:lapack:" setup.py
  sed -i "s:os.path.join(RHOME.strip(), 'include'):'/usr/include/R':" setup.py
  sed -i "/^    version/s/\[0-9\]/\[0-9\]+/g" rpy_tools.py
  sed -i "/^#include/s/Rdevices.h/Rembedded.h/" src/RPy.h
  python2 setup.py install --prefix=/usr --root=$pkgdir || return 1
}
