# Maintainer:  Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Eugen Zagorodniy <https://github.com/ezag>
# Contributor: Ronald van Haren <ronald at archlinux dot org>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>

pkgname=qwt5
pkgver=5.2.3
pkgrel=2
pkgdesc="Qt Widgets for Technical Applications (version 5.X)"
arch=('i686' 'x86_64')
url="http://qwt.sourceforge.net/"
depends=('qt4')
license=("custom:${pkgname}")
source=("http://downloads.sourceforge.net/sourceforge/qwt/qwt-$pkgver.tar.bz2" \
        "qwtconfig-archlinux.pri")
md5sums=('7d37a11d02bc7d095d0ca6427ec97b8d'
         '5d66906ce26a751c3b5573a36c756ddd')

prepare() {
  # copy our config file to the right place
  install -Dm644 "${srcdir}/qwtconfig-archlinux.pri" "${srcdir}/qwt-${pkgver}/qwtconfig.pri"
}

build() {
  cd "${srcdir}/qwt-${pkgver}"
  qmake-qt4 qwt.pro
  make
}

package() {
  cd "${srcdir}/qwt-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" QTDIR=/usr install
  # install licence
  install -Dm644 "${srcdir}/qwt-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # move html docs to proper place and move man pages to avoid conflict
  # with qwt from [extra]
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  mv "${pkgdir}/usr/share/html" "${pkgdir}/usr/share/doc/${pkgname}/"
  cd "${pkgdir}/usr/share/man/man3"
  find * -type f -exec mv {} qwt5-{} \;
}
