# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: kaivalagi <m_buck@hotmail.com>

pkgname=conkyemail-bzr
pkgver=34
pkgrel=2
pkgdesc="Provides Email info, for use in Conky."
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~conky-companions/+junk/conkyemail"
license=('GPL3')
depends=('python2' 'python2-keyring')
makedepends=('bzr')
install=$pkgname.install
source=(bzr+http://bazaar.launchpad.net/~conky-companions/+junk/conkyemail)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/conkyemail"
  printf "%s" "$(bzr revno)"
}

build() {
  cd "$srcdir/conkyemail"
  python2 setup.py build || return 1
}

package() {
  cd "$srcdir/conkyemail"
  python2 setup.py install --root=$pkgdir || return 1
  install -D -m644 README $pkgdir/usr/share/conkyemail/README || return 1
}
