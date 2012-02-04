# Contributor: Sebastian Wiesner <lunaryorn googlemail com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=lodgeitlib
pkgver=0.6
pkgrel=2
pkgdesc="Command line script and client library for pocoo pastebin"
arch=('any')
url='http://packages.python.org/lodgeitlib'
license=('custom:MIT')
depends=('setuptools' 'python2-pygments' 'python-configobj')
makedepends=('python-sphinx')
source=("http://pypi.python.org/packages/source/l/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('dd8934865e70725ffb0808c450aaaf8b')

package()
{
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" -O1
  python2 setup.py build_manpages
  python2 setup.py install_manpages --install-dir "$pkgdir/usr/share/man"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
