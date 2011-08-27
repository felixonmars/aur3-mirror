# Contributor: yescalona <yescalona<at>ug<dot>uchile<dot>cl>

pkgname=python-pyquante
_pkgname=PyQuante
pkgver=1.6.4
pkgrel=1
pkgdesc="Python Quantum Chemistry  is an open-source package for quantum chemistry programming written in Python, Numerical Python, and C."
arch=('i686' 'x86_64')
url="http://pyquante.sourceforge.net/"
license=('BSD')
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://downloads.sourceforge.net/project/${pkgname:7:9}/${_pkgname}-${pkgver:0:3}/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.gz)
md5sums=('01727ce8b5be0377e450112d30bbe403')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  # Remember to install licenses if the license is not a common license!
  install -D -m644 $srcdir/$_pkgname-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

