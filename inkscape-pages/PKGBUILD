# Maintainer: Damjan Dimitrioski <damjandimitrioski@gmail.com>
pkgname=inkscape-pages
pkgver=1.2.1
pkgrel=1
epoch=
pkgdesc="Inkscape multiple pages support"
arch=(any)
url="https://sourceforge.net/projects/inkscape-pages"
license=('GPLv2')
groups=()
depends=(python2 inkscape python2-lxml)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=install
changelog=
source=(https://downloads.sourceforge.net/project/inkscape-pages/1.2/linux_mac/inkscape-pages-1.2.1.tar.gz)
noextract=()
md5sums=('fe3ef3843f27ebefa5ef91db37406ffe')

package() {
  cd "$srcdir"
  INKSCAPE_EXTENSIONS_DIR="$pkgdir/usr/share/inkscape/extensions"
  INKSCAPE_EXTENSIONS_KEYS_DIR="$pkgdir/usr/share/inkscape/extensions/../keys/"
  lang="en"
  mkdir -p "$pkgdir/tmp/"
  mkdir -p "$INKSCAPE_EXTENSIONS_DIR"
  mkdir -p "$INKSCAPE_EXTENSIONS_KEYS_DIR"
  #cp `inkscape -x`/../keys/default.xml $INKSCAPE_EXTENSIONS_KEYS_DIR
  
  #cat `inkscape -x`/../keys/default.xml
 #echo "===================="
  
  cd "$pkgname-$pkgver"  
  echo `pwd`;
  ls
  
  cp modules/*.py "$INKSCAPE_EXTENSIONS_DIR"
  cp modules/$lang/* "$INKSCAPE_EXTENSIONS_DIR"
  cp install_shortcuts.py "$pkgdir/tmp/"
  cp keys.xml "$pkgdir/tmp/"
  #./install_shortcuts.py -i keys.xml -o "$INKSCAPE_EXTENSIONS_KEYS_DIR"/default.xml
  
  #cat "$INKSCAPE_EXTENSIONS_KEYS_DIR"/default.xml
}
