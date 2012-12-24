# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=zapps
pkgver=0.5.1
pkgrel=1
pkgdesc="A fork of Yapps to work around a bug."
arch=('any')
url="https://github.com/zedshaw/zapps"
license=('MIT')
depends=('python2')
source=("http://www.dexy.it/external-dependencies/$pkgname-$pkgver.tar.gz")
md5sums=('3cbd32961dfa67f07cc18c6e6e85a358')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" -O1
}
