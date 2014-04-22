# PKGBUILD for pluma-trailsave
pkgname=pluma-trailsave
pkgver=1.1
pkgrel=1
pkgdesc="Pluma plugin that strips trailing spaces when saving"
arch=(i686 x86_64)
url="http://www.github.com/daggerbot/pluma-trailsave"
license=('zlib')
depends=('pluma>=1.8.0' 'pluma<2.0.0')
source=("https://github.com/Daggerbot/pluma-trailsave/archive/${pkgver}.tar.gz")
sha256sums=('1515a57cb7b01522717b30ffe7daf074983e1e522ab73618471363302599eb2c')

build() {
  :
}

package() {
  mkdir -p "$pkgdir/usr/lib/pluma/plugins"
  cd "$srcdir/pluma-trailsave-${pkgver}"
  cp -f trailsave.pluma-plugin "$pkgdir/usr/lib/pluma/plugins"
  cp -f trailsave.py "$pkgdir/usr/lib/pluma/plugins"
}
