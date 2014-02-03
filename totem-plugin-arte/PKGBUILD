# Contributor: Stefan Kirrmann <stefan.kirrmann at gmail dot com>

pkgname=totem-plugin-arte
pkgver=3.2.1
pkgrel=1
pkgdesc="Arte+7 plugin for Totem (only available for IPs in Austria, Belgium, France, Germany and Switzerland)"
arch=("i686" "x86_64")
url="https://gitorious.org/totem-plugin-arte"
license=('GPL')
depends=('totem>=3.6.0' 'vala>=0.15.0' 'libsoup>=2.4' 'totem-plparser' 'gstreamer0.10-bad-plugins' 'libpeas>=1.2.0' 'gsettings-desktop-schemas')
install="totem-plugin-arte.install"
source=(http://wenner.ch/files/public/mirror/totem-plugin-arte/${pkgname}-${pkgver}.tar.gz)
md5sums=('0ed8b84ad1e5a46a290f67779b51e5b7')

build() {
  cd $srcdir/$pkgname-$pkgver
  sed -i '/glib-compile-schemas.*/d' Makefile
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

