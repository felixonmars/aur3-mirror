# Maintainer: Jakub Kozisek <nodevel at gmail dot com>

pkgname=qtquickcontrols-qt4-git
pkgver=20130325
pkgrel=1
pkgdesc="Qt Quick components relevant to desktop developers (Former Qt Desktop Components). Qt 4 version."
arch=('any')
url="http://qt-project.org/wiki/QtDesktopComponents"
license=('LGPL')
depends=('qt4>=4.7.0')
makedepends=('git')
provides=('qtquickcontrols-qt4' 'qtdesktopcomponents' 'qt-components-desktop' 'qt-desktop-components')
conflicts=('qtdesktopcomponents' 'qt-components-desktop' 'qt-desktop-components' 'qtquickcontrols-qt4')
replaces=('qtquickcontrols-qt4' 'qt-components-desktop' 'qt-desktop-components')

_gitname="qtquickcontrols"
_gitroot="git://gitorious.org/qt/qtquickcontrols/$_gitname.git"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git checkout qt4 && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
    cd "$_gitname" && git checkout qt4
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  qmake
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make INSTALL_ROOT="$pkgdir/" install

  install --directory "$pkgdir/usr/bin"
  install qmldesktopviewer/qmldesktopviewer "$pkgdir/usr/bin/"

  install --directory "$pkgdir/usr/share/licenses/$pkgname"
  cp header.BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
