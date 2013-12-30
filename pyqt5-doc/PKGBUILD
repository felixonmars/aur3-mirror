# Contributors: Andrea Scarpino <andrea@archlinux.org> - Nicolás Adamo

pkgname=pyqt5-doc
pkgver=5.1.1
pkgrel=1
pkgdesc='PyQt5 Documentation'
dst_dir=/usr/share/doc/${pkgname}
arch=('any')
url='http://www.riverbankcomputing.com/software/pyqt/intro'
license=('custom')
options=('docs' '!strip')
source=("http://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-${pkgver}/PyQt-gpl-${pkgver}.tar.gz")
md5sums=('10d41924d5252b75f3f9fe1a7c193e6d')

package() {
  install -d "${pkgdir}"/usr/share/doc/pyqt5-doc
  mv ${srcdir}/PyQt-gpl-${pkgver}/doc/html "${pkgdir}"/usr/share/doc/pyqt5-doc
  mv ${srcdir}/PyQt-gpl-${pkgver}/examples "${pkgdir}"/usr/share/doc/pyqt5-doc
  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  install ${srcdir}/PyQt-gpl-${pkgver}/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}
}
