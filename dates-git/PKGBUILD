# Maintainer: Robert Chmielowiec <robert@chmielowiec.net>
pkgname=dates-git
_pkgname=dates
pkgver=20100411
pkgrel=1
pkgdesc="Dates is a small, lightweight calendar that uses Evolution Data Server as a backend (Git version)"
url="http://pimlico-project.org/dates.html"
license="GPL"
depends=('gtk2' 'evolution-data-server>=1.6' 'atk' 'libgnome>=2.8' 'libbonobo>=2.13' 'gnome-vfs>=2.13.98' 'perlxml')
makedepends=('git' 'intltool')
arch=('i686' 'x86_64')
provides=($_pkgname)
replaces=($_pkgname)

_gitroot=git://git.gnome.org/dates
_gitname=dates
 	
build() {
  cd $srcdir
  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
    cd $_pkgname
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}


