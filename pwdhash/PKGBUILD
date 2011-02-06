# Maintainer: Sebastian Wiesner <lunaryorn googlemail com>
pkgname=pwdhash
pkgver=0.2.1
pkgrel=5
pkgdesc="Site-specific password generator"
arch=('any')
url='http://lunaryorn.de/code/pwdhash.html'
license=('MIT')
depends=('setuptools')
optdepends=('pyqt: enable the GUI frontend')
source=( "http://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz" )
md5sums=('382ad3f959403f5e3ea061bd0f7e3d3e')

build()
{
  cd "$srcdir/$pkgname-$pkgver" || return 1
  python2 setup.py install --root="$pkgdir" -O1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
