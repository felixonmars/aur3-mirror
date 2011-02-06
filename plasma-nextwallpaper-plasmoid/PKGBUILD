# Contributor: Ajsin Roman <aysin.roman@gmail.com>

pkgname=plasma-nextwallpaper-plasmoid
pkgver=0.2.1
pkgrel=1
pkgdesc="Simple applet that changes the current wallpaper (when in slideshow mode) on command."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Next+wallpaper?content=94251"
license=('GPL')
groups=()
depends=('kdebase-workspace')
makedepends=('gcc' 'cmake' 'automoc4')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://kde-look.org/CONTENT/content-files/94251-nextwallpaper-cpp.tar.gz)
noextract=()
md5sums=('28fa75eaf8cd17a220528252b9781124')

build() {
  cd "$srcdir/nextwallpaper"
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
