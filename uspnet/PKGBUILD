# Maintainer: Paulo Matias <matiasΘarchlinux-br·org>

pkgname="uspnet"
pkgver=0.1
pkgrel=1
pkgdesc="Application to login into the campus wireless network at Universidade de Sao Paulo"
arch=('i686' 'x86_64')
url="http://code.google.com/p/uspnet/"
license=('BSD')
depends=('pyopenssl')
optdepends=('pyqt: for Qt4 GUI dialogs'
            'pygtk: for Gtk GUI dialogs')
source=("http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('6519e95dd86d67edfef49a12754e7697')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix /usr --root "${pkgdir}" || return 1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

