# Maintainer: Tevin Zhang <mail2tevin {at} gmail {dot} com>

pkgname=cloudi
pkgver=0.4.2
pkgrel=1
pkgdesc="Convenient online En<->Zh dictionary for command line users"
arch=('any')
url="https://github.com/tevino/cloudi"
license=('MIT')
makedepends=('python2-distribute')
depends=('xsel' 'python2>=2.6')
source=(http://pypi.python.org/packages/source/c/${pkgname}/${pkgname}-$pkgver.tar.gz)
md5sums=('74fc394f5bedd1d04abde62e484f41f7')

build() {
    cd $srcdir/${pkgname}-$pkgver
    python2 setup.py install --root=$pkgdir
}
