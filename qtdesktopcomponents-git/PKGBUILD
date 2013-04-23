# Maintainer: spider-mario <spidermario@free.fr>
pkgname=qtdesktopcomponents-git
pkgver=20130405
pkgrel=1
pkgdesc="Qt Quick components styled with QStyle"
arch=('i686' 'x86_64')
url="http://qt-project.org/wiki/QtDesktopComponents"
license=('custom:BSD')
depends=('qt5-declarative')
makedepends=('git')
provides=('qtdesktopcomponents' 'qt-components-desktop' 'qt-desktop-components')
conflicts=('qtdesktopcomponents' 'qt-components-desktop' 'qt-desktop-components')
replaces=('qt-components-desktop' 'qt-desktop-components')
source=('git+https://git.gitorious.org/qt/qtquickcontrols.git#commit=5fd9dec6595a4c41d789ef4648253525168c04d4') # newer revisions require Qt 5.1
sha512sums=(SKIP)

prepare() {
  # fix hard-coded path
  echo DESTDIR="$pkgdir/usr/lib/qt/qml/QtDesktop/" >> "$srcdir/qtquickcontrols/src/qtdesktop/qtdesktop.pro"

  # https://bugreports.qt-project.org/browse/QTBUG-29838
  echo "VERSION = 5.0.2" >> "$srcdir/qtquickcontrols/src/qtdesktop/qtdesktop.pro"
}

build() {
  cd "$srcdir/qtquickcontrols"

  qmake-qt5
}

package() {
  cd "$srcdir/qtquickcontrols"

  # make in package() because it tries to mkdir something in $pkgdir…
  make

  make INSTALL_ROOT="$pkgdir/" install

  install --directory "$pkgdir/usr/share/licenses/$pkgname"
  cp header.BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
