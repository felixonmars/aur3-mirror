# Maintainer: Chris van Dijk (quigybo) <quigybo at hotmail dot com>

pkgname=python2-nosqlite
_pkgbasename=nosqlite
pkgver=0.2
pkgrel=1
pkgdesc="A lightweight zeroconf noSQL document-oriented forking Python SQLite networked authenticated XMLRPC database server"
url="http://code.google.com/p/nosqlite/"
license=('BSD')
arch=('any')
depends=(python2 sqlite3)
makedepends=(python2-distribute)
source=(http://nosqlite.googlecode.com/files/${_pkgbasename}-${pkgver}.tar.gz
        setup_install.patch)
md5sums=('2d2146654695ef7b876e5746c705bfc2'
         '7add5a04d43f4f4175ef0239e7e7c35d')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  patch -Np1 < "${srcdir}"/setup_install.patch
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 README.txt "${pkgdir}/usr/share/licenses/${pkgname}/README"
}

# vim:set ts=2 sw=2 et:
