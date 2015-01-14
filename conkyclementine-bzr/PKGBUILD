# Contributor: kaivalagi <m_buck@hotmail.com>
# Maintainer: blades <blades@gecko.org.uk>

pkgname=conkyclementine-bzr
pkgver=r8
pkgrel=1
pkgdesc="Provides Clementine info, for use in Conky."
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~conky-companions/+junk/conkyclementine"
license=('GPL3')
depends=('python2')
makedepends=('bzr')
install=$pkgname.install
_bzrbranch="~conky-companions/+junk"
_bzrmod="conkyclementine"
source=("conkyclementine::bzr+http://bazaar.launchpad.net/${_bzrbranch}/${_bzrmod}")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/conkyclementine"
  printf "r%s" "$(bzr revno)"
}

build() {
  cd $srcdir/conkyclementine
  python setup.py build
}

package() {
  cd $srcdir/conkyclementine
  python setup.py install --root=$pkgdir
  install -D -m644 README $pkgdir/usr/share/conkyclementine/README
}
