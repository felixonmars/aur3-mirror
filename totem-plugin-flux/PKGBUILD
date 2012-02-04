# Maintainer: archtux <antonio.arias99999@gmail.com

pkgname=totem-plugin-flux
pkgver=0.3.1
pkgrel=3
pkgdesc="Totem plugin for streaming French Live radios/TV, audio & video podcasts(Arte+7, Canal+) etc..."
arch=("i686" "x86_64")
url="http://www.manatlan.com/page/totem-plugin-flux"
license=('GPL2')
depends=('gstreamer0.10-bad-plugins')
source=(http://www.manatlan.com/files/${pkgname}_${pkgver}_sources.tar.gz)
md5sums=('d0f3b62d07ca197f6f84a8cb43135410')

build() {

  mkdir -p $pkgdir/usr/lib/totem/plugins
  cp -R $srcdir/flux $pkgdir/usr/lib/totem/plugins
}
