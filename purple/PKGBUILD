# Maintainer: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
pkgname=purple
pkgver=11.03.2
pkgrel=3
pkgdesc="Get word definitions and synonyms quickly and easily"
arch=('i686' 'x86_64')
url="https://launchpad.net/purple/"
license=('GPL3')
depends=('python-distutils-extra>=2.18' 'python-simplejson' 'python2-storm' )
source=(http://launchpad.net/purple/trunk/${pkgver}/+download/purple_${pkgver}.tar.gz)
md5sums=(dc8db0a11a0edab85098530f3d296b08)

build() {
  cd "$srcdir/$pkgname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --prefix /usr --root $pkgdir/ 
}
