# Maintainer: Isaac Dupree <id@isaac.cedarswampstudios.org>
# Contributor: yannsen <ynnsen@gmail.com>
pkgname=libchamplain-git
arch=('i686' 'x86_64')
pkgver=20101117
pkgrel=1
pkgdesc="A C library providing a ClutterActor to display maps"
url="http://projects.gnome.org/libchamplain/"
license=(GPL)
depends=(libsoup-gnome clutter-gtk)
makedepends=()
options=()
provides=(libchamplain)
conflicts=(libchamplain)
_gitroot="git://git.gnome.org/libchamplain"
_gitname="libchamplain"
source=()
md5sums=()

build() {
  cd ${srcdir}
  msg "Connecting to $pkgname GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
          cd $_gitname && git pull origin
          msg "The local files are updated."
  else
          git clone $_gitroot
  fi

  cd ${srcdir}/$_gitname
  ./autogen.sh --prefix=/usr 
  make
}

package() {
  cd ${srcdir}/$_gitname
  make DESTDIR=$pkgdir install
}
