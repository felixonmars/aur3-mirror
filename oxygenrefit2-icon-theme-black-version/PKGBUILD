# Contributor: Vinzenz Vietzke <vinz@archlinux.us>
pkgname=oxygenrefit2-icon-theme-black-version
pkgver=2.0
pkgrel=1
pkgdesc="Black version of Oxygen-Refit 2 icon theme for GNOME"
arch=(i686 x86_64)
depends=()
makedepends=('findutils')
url="http://www.gnome-look.org/content/show.php/Oxygen-Refit+2+-+Black+Version?content=83623"
license=('LGPL3')
source=(http://archmirror.de/aur/OxygenRefit2-black-version-$pkgver.tar.bz2)
md5sums=('67b0e1a0736d32a1a1f3e0b5185258db')

build() {
  mkdir -p "$pkgdir/usr/share/icons"
  cd "$pkgdir/usr/share/icons"
  mv "$srcdir/OxygenRefit2-black-version" .
  find -type f -print0 | xargs -0 chmod 644
}
