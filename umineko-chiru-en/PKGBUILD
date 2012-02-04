# Maintainer: Linus Sjögren <thelinx@unreliablepollution.net>
# Very much inspired by the "ut2004" package.

pkgname=umineko-chiru-en
pkgver=4.1
pkgrel=1
pkgdesc="A Japanese murder mystery doujin soft visual novel. English patched by The Witch Hunt."
arch=('i686' 'x86_64')
url="http://07th-expansion.net/umi/Main.htm"
license=('custom: "commercial"')
depends=('onscripter-en')
conflicts=('umineko-chiru')
options=(!strip !zipman)
install=umineko-chiru-en.install
source=('http://m.witch-hunt.com/get/30/%5BWH%5D_Umineko_EP8_English_v4.1.zip'
        'umineko-chiru-en.desktop'
        'install.sh'
        'umineko-chiru-en.sh')

build() {
  # Create directories
  install -d $pkgdir/usr/share/{applications,pixmaps}

  install -d $pkgdir/usr/games/umineko-chiru

  # Install english patch
  cp -r "$srcdir/[WH] Umineko Chiru English/" "$pkgdir/usr/games/umineko-chiru/[WH] Umineko Chiru English/"

  # Install scripts
  install -D -m 555 $srcdir/install.sh \
    $pkgdir/usr/games/umineko-chiru/install.sh
  install -D -m 555 $srcdir/umineko-chiru-en.sh \
    $pkgdir/usr/games/umineko-chiru/umineko-chiru-en.sh

  # Install desktop file
  install -D -m 644 $srcdir/umineko-chiru-en.desktop \
    $pkgdir/usr/share/applications/umineko-chiru-en.desktop

}

md5sums=('8b88b1555ca15c15b2088bba91afad58'
         '4e95073a9cabcca1a900db305a8a7471'
         'aa8100fcefc0b5758ebc13bf438cb1f4'
         '57d01896b282aecbe7317752ca90819f')

# vim:set ts=2 sw=2 et:
