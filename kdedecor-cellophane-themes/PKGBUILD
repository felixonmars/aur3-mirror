# Contributor: fancris3 <fancris3 at aol.com>
pkgname=kdedecor-cellophane-themes
pkgver=1
pkgrel=2
pkgdesc="This is the data package for KDE window decoration Cellophane. kwin decors + color schemes "
arch=(i686 x86_64)
url="http://www.digilanti.org/cellophane/"
license=('GPL')
depends=('kdedecor-cellophane')
source=(http://www.archpkg.rodp.net/src/CELLOPHANE.tar.bz2)
md5sums=('caba9ce25ee0df3e548dd4b61b10461b')

build() {
  cd CELLOPHANE

  mkdir ../color-schemes
  mkdir -p ${startdir}/pkg/opt/kde/share/apps/kdisplay/color-schemes
  mkdir -p $startdir/pkg/opt/kde/share/apps/kwin/cellophane

  find -name "*.kcsrc" -exec mv "{}" ../color-schemes/ ";"
  find ../color-schemes/ -name "*.kcsrc" -exec install -m644 "{}" ${startdir}/pkg/opt/kde/share/apps/kdisplay/color-schemes/ ";"

  cp -r * $startdir/pkg/opt/kde/share/apps/kwin/cellophane
}
