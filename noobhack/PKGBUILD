# Maintainer: Elliott Seyler <emhs08@gmail.com>
pkgname=noobhack
pkgver=0.3
pkgrel=1
pkgdesc="Nethack is hard. Noobhack makes it easier."
arch=('any')
url="http://samfoo.github.io/noobhack/"
license=('LGPL3')
groups=()
depends=('python2')
optdepends=('nethack: for local play')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=('https://pypi.python.org/packages/source/n/noobhack/noobhack-0.3.tar.gz#md5=27ddf6bba1d43826ca2f4b95ecb79908')
md5sums=('27ddf6bba1d43826ca2f4b95ecb79908')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
