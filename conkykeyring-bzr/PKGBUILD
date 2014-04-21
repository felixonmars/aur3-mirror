# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: kaivalagi <m_buck@hotmail.com>

pkgname=conkykeyring-bzr
pkgver=4
pkgrel=1
pkgdesc="Tool to store/edit/delete passwords for use in the conky scripts that utilise stored passwords"
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~conky-companions/+junk/conkykeyring"
license=('GPL3')
depends=('python2' 'python2-keyring')
makedepends=('bzr')
install=
source=(bzr+http://bazaar.launchpad.net/~conky-companions/+junk/conkykeyring)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/conkykeyring"
  printf "%s" "$(bzr revno)"
}

build() {
  cd "$srcdir/conkykeyring"
  python2 setup.py build || return 1
}

package() {
  cd "$srcdir/conkykeyring"
  python2 setup.py install --root=$pkgdir || return 1
}
