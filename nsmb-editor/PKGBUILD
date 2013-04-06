# Maintainer : Konrad Borowski <glitchmr@myopera.com>
pkgname=nsmb-editor
pkgver=367
_commit=5a8973e1
pkgrel=1
pkgdesc='New Super Mario Bros. editor'
arch=any
url='http://nsmbhd.net/download/'
license='GPL3'
depends='mono'
makedepends='icoutils'
source=("https://github.com/Dirbaio/NSMB-Editor/archive/$_commit.tar.gz"
        "nsmbe.desktop"
        "nsmbe")
md5sums=('c5e2da73c2b2246c86f8b0315a0fb274'
         '59575edf9a654e7a26cff20c7e5f3478'
         '201d740c5883e0ca9a402102f309815e')

build() {
  cd "NSMB-Editor-$_commit"*
  xbuild
  cd NSMBe*
  # Extract Windows icon
  icotool -x *.ico
}
package() {
  cd "NSMB-Editor-$_commit"*/NSMBe*
  mkdir -p "$pkgdir"/usr/{bin,lib/nsmbe,share/{applications,pixmaps}}

  # Manual copying because no "make install"
  cp nsmbe_1_*.png "$pkgdir/usr/share/pixmaps/nsmbe.png"
  cp -r bin/Release/* "$pkgdir/usr/lib/nsmbe/"
  cd ../..
  cp nsmbe.desktop "$pkgdir/usr/share/applications/"
  cp nsmbe "$pkgdir/usr/bin"
}
