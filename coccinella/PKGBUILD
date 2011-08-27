# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=coccinella
pkgver=0.96.20
pkgrel=1
pkgdesc="A free and open-source cross-platform communication tool based on jabber with a built-in whiteboard for improved collaboration with other people."
arch=(any)
url="http://thecoccinella.org/"
license=('GPL')
depends=('tkpng' 'tktreectrl')
optdepends=('snack: sound support')
conflicts=('coccinella-bin')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/Coccinella-${pkgver}Src.tar.gz"
        "$pkgname.desktop")
md5sums=('7d4fd6fb492f99e785b208aedb1d1e3e'
         '3368bf4dbcec9ff12031c52d3898ca4c')

build() {
  cd "${srcdir}/Coccinella-${pkgver}Src"

  # Remove unneded stuff
  rm -rf bin

  # Permission fixes
  find . -type d -exec chmod 755 {} \;
  chmod 755 Coccinella.tcl
}

package() {
  cd "${srcdir}/Coccinella-${pkgver}Src"

  # Bin
  install -d "$pkgdir/usr/"{bin,share/$pkgname}
  ln -s "/usr/share/$pkgname/Coccinella.tcl" "$pkgdir/usr/bin/coccinella"

  # Data
  cp -a `find . -mindepth 1 -maxdepth 1 -type d` Coccinella.tcl "$pkgdir/usr/share/$pkgname"

  # Desktop file and pixmaps
  install -Dm 644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm 644 themes/Oxygen/icons/128x128/coccinella2.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
