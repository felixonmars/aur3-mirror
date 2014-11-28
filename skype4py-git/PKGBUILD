# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Marty Plummer (The_NetZ) <ntzrmtthihu777 (at) gmail (dot) com>

pkgname=skype4py-git
pkgver=1.0.35.r7.g8d59590
pkgrel=1
pkgdesc="Python wrapper for the Skype API"
arch=('any')
url="https://github.com/awahlig/skype4py/"
license=('BSD')
depends=('python2-dbus' 'python2-gobject2' 'skype')
makedepends=('git' 'python2-distribute')
provides=('skype4py' 'skype4py-svn')
conflicts=('skype4py' 'skype4py-svn')
source=($pkgname::git+https://github.com/awahlig/skype4py.git)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  python2 setup.py build
}

package() {
  cd $pkgname
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 Skype4Py/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
