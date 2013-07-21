# Maintainer: Spencer Liang <iceeight@gmail.com>
pkgname=oplop
pkgver=1.6.1
pkgrel=1
pkgdesc="Generate account passwords based on account nicknames and a master password."
arch=('any')
url="https://github.com/brettcannon/oplop"
license=('Apache')
depends=('python')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/O/Oplop/Oplop-$pkgver.tar.bz2")
md5sums=("0dcf603cec61d92e83530587ce1b1d71")

package() {
  cd "$srcdir/Oplop-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
