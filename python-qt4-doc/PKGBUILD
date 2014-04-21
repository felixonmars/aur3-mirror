# Contributor: Stefano Zamprogno <mie.iscrizioni@gmail.com>

pkgname=python-qt4-doc
pkgver=4.10.4
pkgrel=1
pkgdesc="Examples and Reference (docs) for Python Qt4 toolkit"
arch=(any)
url="http://riverbankcomputing.co.uk/software/pyqt/intro"
license=('GPL')
install="python-qt4-doc.install"
provides=('python-qt4-doc')
replaces=('python-qt4-doc')
conflicts=('python-qt4-doc')
source=("http://downloads.sourceforge.net/pyqt/PyQt-x11-gpl-${pkgver}.tar.gz")
md5sums=('20940f6b2c957269cdd02d0efe537515')

package() {
  mkdir -p ${pkgdir}/usr/share/doc/python-qt4-doc
  cp -r ${srcdir}/PyQt-x11-gpl-${pkgver}/examples ${pkgdir}/usr/share/doc/python-qt4-doc/
  cp -r ${srcdir}/PyQt-x11-gpl-${pkgver}/doc/* ${pkgdir}/usr/share/doc/python-qt4-doc/
}
