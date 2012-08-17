# Contributor: Stefano Zamprogno <mie.iscrizioni@gmail.com>

pkgname=python-qt4-doc
pkgver=4.9.4
pkgrel=1
pkgdesc="Examples and Reference (docs) for Python Qt4 toolkit"
arch=(any)
url="http://riverbankcomputing.co.uk/software/pyqt/intro"
license=('GPL')
install="python-qt4-doc.install"
provides=('python-qt4-doc')
replaces=('python-qt4-doc')
conflicts=('python-qt4-doc')
source=("http://riverbankcomputing.com/static/Downloads/PyQt4/PyQt-x11-gpl-${pkgver}.tar.gz")
md5sums=('a0b6a820633366365af5124ddbd059c7'
)

package() {
  mkdir -p ${pkgdir}/usr/share/doc/python-qt4-doc
  cp -r ${srcdir}/PyQt-x11-gpl-${pkgver}/examples ${pkgdir}/usr/share/doc/python-qt4-doc/
  cp -r ${srcdir}/PyQt-x11-gpl-${pkgver}/doc/* ${pkgdir}/usr/share/doc/python-qt4-doc/
}
