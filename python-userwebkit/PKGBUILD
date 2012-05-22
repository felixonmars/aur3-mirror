# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=python-userwebkit
_pkgname=userwebkit
pkgver=12.04.0
pkgrel=1
pkgdesc="A library that allows WebKitGtk apps to talk to a local per-user CouchDB"
arch=('any')
url="https://launchpad.net/userwebkit/"
license=('LGPL3')
depends=('python' 'python-microfiber' 'python-gobject' 'libwebkit3')
source=("https://launchpad.net/$_pkgname/trunk/12.04/+download/$_pkgname-$pkgver.tar.gz")
md5sums=('cc8fec964b08dd62dbbb947eed162d6a')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1
}
