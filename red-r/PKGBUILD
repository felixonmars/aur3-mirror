# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=red-r
pkgver=1.7.5
pkgrel=2
pkgdesc="A visual programming interface for R"
depends=('python-rpy' 'python-matplotlib' 'python-imaging' 'pyqwt' 'docutils')
makedepends=('setuptools')
arch=('any')
license=('GPL')
source=("http://r-orange.googlecode.com/files/RedR.zip")
url="http://www.red-r.org/"
md5sums=('3079240e6cd665815995b8a1d03f35cd')

build() {
  _source="$srcdir/usr/lib/python2.6/dist-packages/Red-R"
  _target="$pkgdir`python2 -c 'from distutils.sysconfig import get_python_lib; print get_python_lib()'`"
  install -d "$_target"
  install -d "$pkgdir/usr/bin"
  cp -r "$_source" "$_target"
  echo "#!/bin/bash" > "$pkgdir/usr/bin/RedR"
  echo "python2 $_target/Red-R/canvas/red-RCanvas.pyw" >> "$pkgdir/usr/bin/RedR"
  chmod a+x "$pkgdir/usr/bin/RedR"
}

