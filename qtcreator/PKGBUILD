# $Id$
# Maintainer: Federico Cinelli <cinelli@aur.archlinux.org>

pkgname=qtcreator
_pkgname=qt-creator
pkgver=2.7.0rc
_pkgver=2.7.0-rc
pkgrel=1
pkgdesc='Lightweight, cross-platform integrated development environment'
arch=('i686' 'x86_64')
url='http://qt-project.org'
license=('LGPL')
depends=('qt5-quick1' 'qt5-tools' 'perl')
makedepends=('qt5-script' 'qt5-declarative' 'qt5-doc' 'kdesdk-dev-utils' 'qtscriptgenerator' 'fcitx-qt5')
options=('docs')
provides=('qtcreator')
replaces=('qtcreatpr<=2.7.0')
optdepends=('gdb: for the debugger'
            'cmake: for cmake project support'
            'openssh-askpass: for ssh support'
            'git: for git support'
            'mercurial: for mercurial support'
            'bzr: for bazaar support'
            'valgrind: for analyze support')
install=qtcreator.install
source=('http://releases.qt-project.org/qtcreator/2.7.0-rc/qt-creator-2.7.0-rc-src.tar.gz'    
	'qtcreator.desktop')
md5sums=('5c4baef738b00cfdf53739ffd1434234' '82888d4be900e7833d768050a135cd37')

build() {
  cd "$srcdir/$_pkgname-$_pkgver-src"
  qmake -r
  make
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver-src"

  make INSTALL_ROOT="$pkgdir/usr/" install
  make INSTALL_ROOT="$pkgdir/usr/" install_docs

  install -Dm644 "$srcdir/qtcreator.desktop" "$pkgdir/usr/share/applications/qtcreator.desktop"
  install -Dm644 "$srcdir/$_pkgname-$_pkgver-src/LGPL_EXCEPTION.TXT" "$pkgdir/usr/share/licenses/qtcreator/LGPL_EXCEPTION.TXT"
}
