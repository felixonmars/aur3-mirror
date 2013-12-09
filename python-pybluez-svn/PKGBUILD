# $Id: PKGBUILD 66132 2012-02-23 01:40:38Z spupykin $
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-pybluez-svn
pkgver=55
pkgrel=1
pkgdesc="Python wrapper for the BlueZ Bluetooth stack"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pybluez/"
license=('GPL')
provides=('python-pybluez')
conflicts=('python-pybluez')
replaces=('python-pybluez')
depends=('python' 'bluez-libs')
source=('svn+http://pybluez.googlecode.com/svn/branches/python3')
sha512sums=('SKIP')

pkgver() {
  cd "$SRCDEST/python3"
  svnversion | tr -d [A-z]
}

package() {
  cd $srcdir/python3
  python setup.py install --root=$pkgdir
}
