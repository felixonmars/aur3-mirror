# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: punkrockguy318 (http://bbs.archlinux.org/viewtopic.php?t=4936)

pkgname=python-xmms
pkgver=2.07
pkgrel=1
pkgdesc="Python module extensions for XMMS"
arch=('i686' 'x86_64')
url="http://people.via.ecp.fr/~flo/"
license=('GPL')
depends=('python2' 'xmms')
source=(http://people.via.ecp.fr/~flo/2002/PyXMMS/dist/pyxmms-$pkgver.tar.bz2)
md5sums=('a2d4ef98242c21d4360ea2e2747112b3')

build() {
  cd "$srcdir/pyxmms-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/pyxmms-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
