# Maintainer: Zane Ashby <zane.a@demonastery.org>
pkgname=wacomwebplugin
pkgver=0.3.0
pkgrel=1
pkgdesc="An implementation of the Wacom Tablet Plugin, on Linux."
arch=('i686' 'x86_64')
url="https://github.com/ZaneA/WacomWebPlugin"
license=('GPL3')
makedepends=('libx11' 'xorg-xinput' 'npapi-sdk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ZaneA/WacomWebPlugin/archive/v${pkgver}.tar.gz")
md5sums=('ac25285a639280cb9d92a912e0ee6b63')

build() {
  cd "$srcdir/WacomWebPlugin-$pkgver"

  make
}

package() {
  cd "$srcdir/WacomWebPlugin-$pkgver"

  install -D -m755 npWacomWebPlugin.so "${pkgdir}/usr/lib/mozilla/plugins/npWacomWebPlugin.so"
}
