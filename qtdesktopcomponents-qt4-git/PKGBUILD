# Maintainer: spider-mario <spidermario@free.fr>
pkgname=qtdesktopcomponents-qt4-git
pkgver=20130322
pkgrel=1
pkgdesc="Qt Quick components styled with QStyle"
arch=('i686' 'x86_64')
url="http://qt-project.org/wiki/QtDesktopComponents"
license=('custom:BSD')
depends=('qt4')
makedepends=('git')
provides=('qtdesktopcomponents-qt4' 'qt-components-desktop-qt4' 'qt-desktop-components-qt4')
conflicts=('qtdesktopcomponents-qt4' 'qt-components-desktop-qt4' 'qt-desktop-components-qt4')
source=('git+https://git.gitorious.org/qt/qtquickcontrols.git#branch=qt4')
sha512sums=(SKIP)

build() {
  cd "$srcdir/qtquickcontrols"

  qmake-qt4
  make
}

package() {
  cd "$srcdir/qtquickcontrols"

  make INSTALL_ROOT="$pkgdir/" install

  install --directory "$pkgdir/usr/bin"
  install qmldesktopviewer/qmldesktopviewer "$pkgdir/usr/bin/"

  install --directory "$pkgdir/usr/share/licenses/$pkgname"
  cp header.BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
