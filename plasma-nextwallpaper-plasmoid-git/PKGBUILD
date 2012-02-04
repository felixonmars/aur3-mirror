# Contributor: Ajsin Roman <aysin.roman@gmail.com>

pkgname=plasma-nextwallpaper-plasmoid-git
pkgver=20090927
pkgrel=1
pkgdesc="Simple applet that changes the current wallpaper (when in slideshow mode) on command."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Next+wallpaper?content=94251"
license=('GPL')
groups=()
depends=('kdebase-workspace')
makedepends=('gcc' 'cmake' 'automoc4')
conflicts=('plasma-nextwallpaper-plasmoid')
install=
source=()
md5sums=()

_gitroot="git://github.com/dpalacio/plasma-nextwallpaper.git"
_gitname="plasma-nextwallpaper"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
      cd $_gitname && git pull origin || return 1
      msg "The local files are updated."
  else
      git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd ${srcdir}
  [ -d $_gitname-build ] && rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd ${srcdir}/$_gitname-build
  
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
