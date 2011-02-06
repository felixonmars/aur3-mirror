pkgname=python-jswebkit
pkgver=0.0.3
pkgrel=3
pkgdesc='simple GTK+ HTML5 rich text editor'
arch=('any')
url='http://code.google.com/p/gwrite/'
license=('LGPL')
depends=('python2' 'cython')
source=("http://gwrite.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('514ed4dd5e540d160fcdac9c3c607371')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir} || return 1
}
