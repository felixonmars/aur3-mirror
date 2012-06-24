# Maintainer: Sebastian Wiesner <lunaryorn googlemail com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=pastemacs
pkgver=0.3
pkgrel=5
pkgdesc="Access pocoo pastebin from emacs using lodgeitlib"
arch=('any')
url='http://pypi.python.org/pypi/pastemacs/'
license=('GPL2')
depends=('pymacs' 'python2-lodgeitlib')
makedepends=('python2-distribute')
source=( "http://pypi.python.org/packages/source/p/$pkgname/$pkgname-${pkgver}.tar.gz" )
md5sums=('85b2c809611d52df1928ea0baf185ff4')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # pocoo died, changing default to paste.pound-python.org
  sed -i s+paste.pocoo.org+paste.pound-python.org+ $pkgname.py
  python2 setup.py install --root="$pkgdir" -O1
}
