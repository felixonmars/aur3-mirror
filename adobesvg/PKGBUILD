# Contributor: David Fuhr <david.fuhr@web.de>
pkgname=adobesvg
pkgver=3.01
pkgrel=1
pkgdesc="Experience data-driven, interactive, and personalized graphics on the web"
arch=(i686)
url="http://www.adobe.com/svg/viewer/install/"
license=('custom')
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://download.adobe.com/pub/adobe/magic/svgviewer/linux/3.x/${pkgver}x88/en/$pkgname-${pkgver}x88-linux-i386.tar.gz)
noextract=()
md5sums=('fc619d96a81d9fa54e42532ca57b09ca')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  install -d "$startdir/pkg/usr/local/adobesvg"
  install -D -m 0644 *.so "$startdir/pkg/usr/local/adobesvg/"

  # installing mozilla plugin
  install -D -g root -m 0755 -o root libNPSVG3.so "$startdir/pkg/opt/mozilla/lib/plugins/libNPSVG3.so"

  # copying license
  install -D -m 0444 LICENSE.txt "$startdir/pkg/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
