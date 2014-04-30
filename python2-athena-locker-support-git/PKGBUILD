# Maintainer: Andres Erbsen <andreser@mit.edu>
pkgname=python2-athena-locker-support-git
pkgver=10.4.7.r0.gba61c53
pkgrel=1
pkgdesc="Python Athena locker support"
arch=('any')
url="https://github.com/mit-athena/locker-support"
license=('GPL')
groups=()
depends=('python2-afs-git' 'python2-pyhesiod')
makedepends=('python2')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("$pkgname"::'git://github.com/mit-athena/locker-support.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
