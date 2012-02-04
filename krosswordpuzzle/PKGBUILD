# Maintainer: Anders Lund <anders@alweb.dk>
pkgname=krosswordpuzzle
pkgver=0.15.6.3
pkgrel=2
pkgdesc="Krossword playing game and editor for KDE 4"
url="http://kde-apps.org/content/show.php/KrossWordPuzzle?content=111726"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('kdebase-runtime' 'kdegames-libkdegames')
source=("http://publictransport.horizon-host.com/data/krosswordpuzzle-${pkgver}-l10n.tar.gz")
install=krosswordpuzzle.install
 
build() {
  cd "${srcdir}/${pkgname}-${pkgver}-l10n"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}
 
package() {
  cd "${srcdir}/${pkgname}-${pkgver}-l10n"
  make DESTDIR="${pkgdir}" install
}
md5sums=('0be594abbfe63bc5ac675c7699ed1926')
