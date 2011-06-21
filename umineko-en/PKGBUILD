# Maintainer: Linus Sjögren <thelinx@unreliablepollution.net>
# Very much inspired by the "ut2004" package.

pkgname=umineko-en
pkgver=4.4
pkgrel=2
pkgdesc="A Japanese murder mystery doujin soft visual novel. English patched by The Witch Hunt."
arch=('i686' 'x86_64')
url="http://07th-expansion.net/umi/Main.htm"
license=('custom: "commercial"')
depends=('onscripter-en')
conflicts=('umineko')
options=(!strip !zipman)
install=umineko-en.install
source=('http://m.witch-hunt.com/get/5/%5BWH%5D_Umineko_English_v4.4.zip'
        'umineko-en.desktop'
        'install.sh'
        'umineko-en.sh')

build() {
  # Create directories
  install -d $pkgdir/usr/share/{applications,pixmaps}

  install -d $pkgdir/usr/games/umineko

  # Install english patch
  cp -r "$srcdir/[WH] Umineko English/" "$pkgdir/usr/games/umineko/[WH] Umineko English/"

  # Install scripts
  install -D -m 555 $srcdir/install.sh \
    $pkgdir/usr/games/umineko/install.sh
  install -D -m 555 $srcdir/umineko-en.sh \
    $pkgdir/usr/games/umineko/umineko-en.sh

  # Install desktop file
  install -D -m 644 $srcdir/umineko-en.desktop \
    $pkgdir/usr/share/applications/umineko-en.desktop

}

md5sums=('5ea6579f15022bd886eb9870ab70e1ec'
         '916a7cbce2d20b8b42b9aa686b0aa3a8'
         '5050abc8c792d5af0878a64cbf5f0f40'
         '3960f9c75b9e71a48c0ba6ba446a9aaf')

# vim:set ts=2 sw=2 et:
