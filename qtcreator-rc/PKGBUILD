# $Id: PKGBUILD 29451 2010-10-14 12:18:43Z icelaya $
# Maintainer: Imanol Celaya <ornitorrincos@archlinux-es.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Contributor: thotypous <matiasΘarchlinux-br·org>
# Contributor: delor <bartekpiech gmail com>

pkgname=qtcreator-rc
pkgver=2.4.0
_pkgver=${pkgver}-rc
pkgrel=2
_qtver=4.7.1
pkgdesc='Lightweight, cross-platform integrated development environment, with Quick a QMLDesigner support'
arch=('i686' 'x86_64')
url='http://qt.nokia.com/products/developer-tools'
license=('LGPL')
depends=('qt>=4.7')
optdepends=('qt-doc: for the integrated Qt documentation'
            'gdb: for the debugger'
            'openssh-askpass: for ssh support')
provides=('qtcreator')
options=(docs)
source=("http://get.qt.nokia.com/qtcreator/qt-creator-${_pkgver}-src.tar.gz"
        'qtcreator.desktop')
md5sums=('1967144101796674ce6e994e66213f81'
         '2c3ffbd66845b37be9804f2966815a10')
build() {

  mkdir ${srcdir}/build
  cd ${srcdir}/build

  qmake ${srcdir}/qt-creator-${_pkgver}-src/qtcreator.pro
  make
}

package() {
  cd ${srcdir}/build
  make INSTALL_ROOT="${pkgdir}/usr/" install

  install -Dm644 ${srcdir}/qtcreator.desktop \
    ${pkgdir}/usr/share/applications/qtcreator.desktop
  install -Dm644 ${srcdir}/qt-creator-${_pkgver}-src/LGPL_EXCEPTION.TXT \
    ${pkgdir}/usr/share/licenses/qtcreator/LGPL_EXCEPTION.TXT
}

# vim: sw=2:ts=2 et:
