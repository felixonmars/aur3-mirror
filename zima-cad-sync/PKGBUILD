# Maintainer: Otakar Haška <ota.haska@seznam.cz>

pkgname=zima-cad-sync
_pkgname=ZIMA-CAD-Sync
pkgver=1.2.1
pkgrel=1
pkgdesc="A simple utility for synchronising CAD data between local working directory and remote directory on FTP server"
arch=('i686' 'x86_64')
url="http://www.zima-engineering.cz/projekty/ZIMA-CAD-Sync/"
license=('GPL')
depends=('qt4' 'quazip')
source=(http://www.zima-engineering.cz/projekty/ZIMA-CAD-Sync/download/$_pkgname-$pkgver-src.tar.gz $pkgname.desktop)

build() {
  cd "$srcdir/$_pkgname-$pkgver-src"
  qmake-qt4
  make || return 1
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  cd "$srcdir/$_pkgname-$pkgver-src"
  install -m755 $_pkgname ${pkgdir}/usr/bin/

  # The .desktop shortcut...
  mkdir -p ${pkgdir}/usr/share/pixmaps ${pkgdir}/usr/share/applications
  install -m644 gfx/icon.png  ${pkgdir}/usr/share/pixmaps/zima-cad-sync.png
  install -m644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/

}
md5sums=('76c103e6f746e209b3383c8e6c9f0c74'
         'c0536b3298ece8a92748008f5b5934dc')
