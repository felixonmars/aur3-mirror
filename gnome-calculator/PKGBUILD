# Maintainer: Yosef Or Boczko <yosefor3@walla.com>

pkgname=gnome-calculator
pkgver=3.8.0
pkgrel=1
pkgdesc="GNOME Scientific calculator"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3' 'dconf')
makedepends=('intltool' 'yelp-tools')
groups=('gnome-extra')
options=(!emptydirs)
url="http://www.gnome.org"
install=$pkgname.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/${pkgver::3}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('7db18629bd7e17ab65b771d554eeef0cd3cf7985a86e5a82c755c42c1b092824')
replace=('gcalctool')
conflict=('gcalctool') # /usr/applications/gcalctool.desktop

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
		       --disable-schemas-compile \
		       --localstatedir=/var
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
