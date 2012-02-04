# Contributor: Vinzenz Vietzke <vinz@archlinux.us>
pkgname=oxygenrefit2-icon-theme-white-version
pkgver=2.0
pkgrel=1
pkgdesc="White version of Oxygen-Refit 2 icon theme for GNOME"
arch=(i686 x86_64)
depends=()
makedepends=('findutils')
url="http://www.gnome-look.org/content/show.php/Oxygen-Refit+2+-+White+Version?content=85054"
license=('LGPL3')
source=(http://archmirror.de/aur/OxygenRefit2-white-version-$pkgver.tar.bz2)
md5sums=('9019e0d60b8b421555a914dc28f4c465')

build() {
  mkdir -p "$pkgdir/usr/share/icons"
  cd "$pkgdir/usr/share/icons"
  mv "$srcdir/OxygenRefit2-white-version" .
  find -type f -print0 | xargs -0 chmod 644
}
