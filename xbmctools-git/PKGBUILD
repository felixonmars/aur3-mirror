# Maintainer : Jo De Boeck <deboeck.jo@gmail.com>

pkgname=xbmctools-git
provides=('xbmctools')
conflicts=('xbmctools')
pkgver=1.0.r2.g8b8d9a6
pkgrel=1
arch=('any')
license=('GPL2')
pkgdesc="Set of tools to interface with XBMC"
url="http://github.com/grimpy/"
depends=('python2')
makedepends=('python2-distribute' 'git')

source=("$pkgname"::'git://github.com/grimpy/xbmctools.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root=${pkgdir} --optimize=1
}
