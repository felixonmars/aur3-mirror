# Contributor: yescalona <yescalona\at\ug\dot\uchile\dot\cl>

pkgname=python2-corebio
_pkgname=CoreBio
pkgver=0.5.0
pkgrel=1
pkgdesc="A python toolkit for computational biology."
arch=(any)
url="http://code.google.com/p/corebio/"
license=(BSD)
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://corebio.googlecode.com/svn/dist/$_pkgname-$pkgver.tar.gz)
md5sums=('09100ae0507e7aa061d994251cde07e4')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  # Remember to install licenses if the license is not a common license!
  install -D -m644 $srcdir/$_pkgname-$pkgver/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
