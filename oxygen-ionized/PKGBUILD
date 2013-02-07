# Contributor: Vinzenz Vietzke <vinz@vinzv.de>
pkgname=oxygen-ionized
pkgver=1.0
pkgrel=1
pkgdesc="Greenish KDE icon theme based on Oxygen 4.6.2 to match any distro."
arch=(i686 x86_64)
depends=('hicolor-icon-theme')
makedepends=('cmake','kde4-filesystem','libqt4-devel','fudpes')
url="http://kde-look.org/content/show.php/Oxygen+Ionized+%28Oxygen+green%29?content=149460"
license=('CC-BY-SA')
source=(http://mirror.vinzv.de/manjaro/aur/pkg-src/oxygen-ionized/oxygen-ionized_v1.tar.gz)
md5sums=('8777cdf2b15c7433778a202dec134239')

build() {
  mkdir -p "$pkgdir/usr/share/icons"
  cd "$pkgdir/usr/share/icons"
  mv "$srcdir/OxygenRefitoxygen-ionized_v1" .
  find -type f -print0 | xargs -0 chmod 644
}
