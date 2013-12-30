# Maintainer: Alex Brick <alex@alexrbrick.com>
pkgname=pymazon
pkgver=0.9.1
pkgrel=4
pkgdesc="A Python-based downloader for the Amazon MP3 store."
arch=(any)
url="http://code.google.com/p/pymazon/"
license=('GPL3')
makedepends=('mercurial')
depends=('python2' 'python2-crypto')
optdepends=('pygtk: Gtk2 interface' 'pyqt: Qt interface')
source=('hg+https://code.google.com/r/michaelstrecke-pymazon/#revision=4d87b954a4db')
noextract=()
md5sums=('SKIP')

build() {
  cd "$srcdir/michaelstrecke-pymazon"
  python2 setup.py build
}

check() {
  cd "$srcdir/michaelstrecke-pymazon"
  python2 setup.py check
}

package() {
  cd "$srcdir/michaelstrecke-pymazon"
  python2 setup.py install --prefix=$pkgdir/usr/
}

# vim:set ts=2 sw=2 et:
