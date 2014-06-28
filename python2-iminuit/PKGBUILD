# Maintainer: Georg Sieber <g.sieber@gmail.com>
# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
pkgname=python2-iminuit
pkgver=1.1.1
pkgrel=1
pkgdesc="Interactive Minimization Tools based on MINUIT"
arch=('i686', 'x86_64')
url="https://github.com/iminuit/iminuit"
license=('MIT', 'LGPL2')
depends=('python2')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/i/iminuit/iminuit-${pkgver}.tar.gz")
md5sums=('d2a05f890eac4bd5a392f49d056ef6a6')

package() {
  cd "$srcdir/iminuit-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
