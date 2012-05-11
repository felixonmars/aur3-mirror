# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

pkgname=gtklick
pkgver=0.6.4
pkgrel=2
pkgdesc="A graphical frontend for the klick metronome application"
arch=('any')
url="http://das.nasophon.de/gtklick/"
license=('GPL')
depends=('klick' 'python2-pyliblo' 'pygtk')
makedepends=('desktop-file-utils')
install="$pkgname.install"
source=("http://das.nasophon.de/download/$pkgname-$pkgver.tar.gz")
md5sums=('47596c45e3b691cc78fa410bf320085f')

build() {
  cd "$pkgname-$pkgver"
  python2 setup.py build
}

package(){
  cd "$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir"

  # python2 fix
  sed -i "s/python/&2/" `find "$pkgdir" -name $pkgname.py`
}

# vim:set ts=2 sw=2 et:
