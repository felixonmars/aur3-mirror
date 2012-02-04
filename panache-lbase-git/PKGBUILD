# Contributor: feufochmar <feufochmar@d-20.fr>
pkgname=panache-lbase-git
pkgver=20100212
pkgrel=1
pkgdesc="A desktop environment based on QT4 from Logram"
arch=('i686' 'x86_64')
url="http://www.logram-project.org/"
license=('GPL')
depends=('panache-llibs-git' 'panache-lartworks-git')
makedepends=('git')
provides=()
source=('startlogram.patch' 'magellan.patch' 'logram.desktop')
md5sums=('458531c7c3fa1d830c18cc53b7c3d107'
         '28739a3f2f8dbd58569da1a4b9225e42'
         '05f71059c2c00481eb5edeedb1ededca')

_gitroot="git://gitorious.org/logram/desktop.git"
_gitname="desktop"

build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  msg "Applying patches"
  # Qt sysconfdir is /etc on ArchLinux, not /etc/xdg
  patch -p0 < startlogram.patch
  patch -p0 < magellan.patch

  msg "Starting make..."

  cd $_gitname
  cd lbase

  ## clear tmp
  make clean

  #
  # BUILD HERE
  #

  make || return 1
  make DESTDIR="$pkgdir" install || return 1

  #desktop file
  mkdir -p $pkgdir/etc/X11/sessions/
  install -m 644 -p $startdir/logram.desktop $pkgdir/etc/X11/sessions/
}
