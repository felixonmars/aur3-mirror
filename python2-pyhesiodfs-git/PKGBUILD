# Maintainer: Andres Erbsen <andreser@mit.edu>
pkgname=python2-pyhesiodfs-git
pkgver=1.1.r0.ga955db3
pkgrel=1
pkgdesc="Hesiod automounter for Athena lockers"
arch=('any')
url="https://github.com/ebroder/pyhesiodfs"
license=('GPL')
groups=()
depends=('python2-athena-locker-support-git' 'openafs' 'python-fuse')
makedepends=('python2')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("$pkgname"::'git://github.com/mit-athena/pyhesiodfs.git')
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

