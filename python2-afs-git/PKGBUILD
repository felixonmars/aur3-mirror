# Maintainer: Andres Erbsen <andreser@mit.edu>
pkgname=python2-afs-git
pkgver=0.2.2.r0.g42630c3
pkgrel=1
pkgdesc="Python AFS bindings"
arch=('any')
url="https://github.com/mit-athena/python-afs"
license=('GPL')
groups=()
depends=('python2' 'openafs')
makedepends=('python2' 'cython2' 'python2-setuptools' 'openafs' 'krb5')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("$pkgname"::'git://github.com/mit-athena/python-afs.git')
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
