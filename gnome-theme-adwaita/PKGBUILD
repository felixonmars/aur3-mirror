# $Id: PKGBUILD 198035 2013-10-30 12:24:24Z allan $
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=gnome-theme-adwaita
_pkgname=gnome-themes-standard
pkgver=3.10.0
pkgrel=1
pkgdesc="Default themes for the GNOME desktop (Adwaita only)"
arch=(i686 x86_64)
url="http://www.gnome.org"
license=(GPL2)
depends=(librsvg)
makedepends=(intltool gtk2 gtk3)
groups=(gnome)
replaces=(gnome-themes gnome-themes-standard)
conflicts=(gnome-themes gnome-themes-standard)
options=('!emptydirs')
source=(http://ftp.yandex.ru/mirrors/ftp.gnome.org/sources/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.xz)
sha256sums=('812c6cfc534fced921dc327b436e70020d8979529284bb59d72d6f37af1f4b38')

build() {
  cd $_pkgname-$pkgver
  sed -i 's/HighContrast//' "themes/Makefile.in"
  sed -i 's/backgrounds//' "themes/Adwaita/Makefile.in"
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
