# Contributor: Vinzenz Vietzke <vinz@archlinux.us>
pkgname=oxygenrefit2-icon-theme-orange-version
pkgver=2.0
pkgrel=1
pkgdesc="Orange version of Oxygen-Refit 2 icon theme for GNOME"
arch=(i686 x86_64)
depends=()
makedepends=('findutils')
url="http://www.gnome-look.org/content/show.php/Oxygen-Refit+2+-+Orange+Version?content=83003"
license=('LGPL3')
source=(http://archmirror.de/aur/OxygenRefit2-orange-version-$pkgver.tar.bz2)
md5sums=('85368d04f2f9d012ef244080782020a7')

build() {
  mkdir -p "$pkgdir/usr/share/icons"
  cd "$pkgdir/usr/share/icons"
  mv "$srcdir/OxygenRefit2-orange-version" .
  find -type f -print0 | xargs -0 chmod 644
}
