# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>
pkgname=python2-ciscoconfparse
pkgver=0.9.4
pkgrel=1
pkgdesc="Parse through Cisco IOS-style configurations and retrieve portions of the config using a variety of query methods"
arch=('any')
url="http://www.pennington.net/py/ciscoconfparse/"
license=('GPL')
groups=()
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=('https://pypi.python.org/packages/source/c/ciscoconfparse/ciscoconfparse-0.9.4.tar.gz')
md5sums=('3bf97cbc5affccead84fbd8c0513ce25')

package() {
  cd "$srcdir/ciscoconfparse-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
