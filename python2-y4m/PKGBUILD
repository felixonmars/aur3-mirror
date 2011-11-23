# Contributor: Wes Brown <wesbrown18@gmail.com>
pkgname=python2-y4m
pkgver=0.1.3
pkgrel=0
pkgdesc="This is the Python interface to the y4m library providing mjpegtools hooks."
arch=('i686' 'x86_64')
url=("http://www.freenet.org.nz/y4m/")
license=('GPL')
depends=('python2' 'mjpegtools' 'netpbm')
makedepends=('pyrex')
source=("patchfile.patch" "http://www.freenet.org.nz/y4m/y4m-${pkgver}.tar.gz" )
md5sums=('408f76f71cfd272e1b47baf31d537017' 'f963c8c53ef5f19a96a4cd267052a142')

build() {
  cd "$srcdir"
  echo $PWD
  cd "$srcdir/y4m-${pkgver}"
  patch --strip 1 < ../../patchfile.patch
  python2 setup.py build install --root="${pkgdir}" || return 1
}

# vim:set ts=2 sw=2 et:
