# Contributor: Vinzenz Vietzke <vinz@vinzv.de>
pkgname=oxygenrefit2-icon-theme-green-version
pkgver=2.0
pkgrel=1
pkgdesc="Green version of Oxygen-Refit 2 icon theme for GNOME"
arch=(i686 x86_64)
depends=()
makedepends=('findutils')
url="http://www.gnome-look.org/content/show.php/Oxygen-Refit+2+-+Green+Version?content=84683"
license=('LGPL3')
source=(http://mirror.vinzv.de/manjaro/aur/pkg-src/oxygenrefit2-icon-theme-green-version/OxygenRefit2-green-version.tar.bz2)
md5sums=('6267f402a52e6424a03a68712d986217')

build() {
  mkdir -p "$pkgdir/usr/share/icons"
  cd "$pkgdir/usr/share/icons"
  mv "$srcdir/OxygenRefit2-green-version" .
  find -type f -print0 | xargs -0 chmod 644
}
