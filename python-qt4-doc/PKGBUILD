# Contributor: Stefano Zamprogno <mie.iscrizioni@gmail.com>

pkgname=python-qt4-doc
pkgver=4.7.2
_pkgver=4.7.2
pkgrel=1
pkgdesc="Examples and Reference (docs) for Python Qt4 toolkit"
arch=('i686' 'x86_64')
url="http://riverbankcomputing.co.uk/software/pyqt/intro"
license=('GPL')
install="python-qt4-doc.install"
provides=('python-qt4-doc')
replaces=('python-qt4-doc')
conflicts=('python-qt4-doc')
source=("http://riverbankcomputing.com/static/Downloads/PyQt4/PyQt-x11-gpl-${_pkgver}.tar.gz")
md5sums=('e7782e9146ec8aa0e76bcdb0ca5b9491')

build() {
  mkdir -p ${pkgdir}/usr/share/doc/python-qt4-doc
  cp -r ${srcdir}/PyQt-x11-gpl-${_pkgver}/examples ${pkgdir}/usr/share/doc/python-qt4-doc/
  cp -r ${srcdir}/PyQt-x11-gpl-${_pkgver}/doc/* ${pkgdir}/usr/share/doc/python-qt4-doc/
}
