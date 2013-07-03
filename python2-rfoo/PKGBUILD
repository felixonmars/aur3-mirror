# Maintainer: gadget3000 <gadget3000@msn.com>
pkgname=python2-rfoo
pkgver=1.3.0
pkgrel=1
pkgdesc="A Fast Python RPC package"
arch=('i686' 'x86_64')
url="https://code.google.com/p/rfoo/"
license=('BSD') #TODO: Install the license into /usr/share/licenses
#groups=()
depends=('python2')
makedepends=('cython2')
#provides=()
#conflicts=()
#replaces=()
#backup=()
options=(!emptydirs)
#install=
source=(https://rfoo.googlecode.com/files/rfoo-${pkgver}.tar.gz)
md5sums=('def659ff85f14de51b455e88510b7f4b')

package() {
  cd "$srcdir/rfoo-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
