# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=filestore
pkgver=12.04.0
pkgrel=1
pkgdesc="A dmedia hashing protocol and file layout."
arch=('any')
url="https://launchpad.net/filestore/"
license=('AGPL3')
depends=('python' 'pyskein')
makedepends=('python-sphinx')
source=("https://launchpad.net/$pkgname/trunk/11.09/+download/$pkgname-$pkgver.tar.gz")
md5sums=('419d9e7be15d00c1eb27e50f0523833d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1
}
