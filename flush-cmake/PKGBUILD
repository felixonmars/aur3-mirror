pkgname=flush-cmake
pkgver=20120510
pkgrel=2
pkgdesc="GTK+ based BitTorrent client"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/flush/"
license=('GPL')
depends=('libconfig' 'libtorrent-rasterbar' 'libglademm' 'libnotify' 'dbus-core' 'gtk2')
makedepends=('boost' 'git')
install=${pkgname}.install
conflicts=('flush' 'flush-new' 'flush-git')
replaces=('flush' 'flush-new' 'flush-git')

_gitroot="git://github.com/Atterratio/flush.git"
_gitname="${pkgname}"

build() {   
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname
  fi
  
  git checkout cmake
  
  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  
  cd "${srcdir}/${pkgname}"
    cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDEBUG_MODE=0 \
    -Wno-dev
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}/" install
}
