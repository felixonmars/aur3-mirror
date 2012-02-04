# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=gliv-git
pkgver=20111026
pkgrel=1
pkgdesc="OpenGL image viewer."
url="http://guichaz.free.fr/gliv/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtkglext')
makedepends=('git')
provides=('gliv')
conflicts=('gliv')

source=()
md5sums=()

_gitroot="git://repo.or.cz/gliv.git"
_gitname="gliv"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  if [ -d ${srcdir}/$_gitname-build ]; then
    rm -rf ${srcdir}/$_gitname-build
  fi
  cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build

  cd ${srcdir}/$_gitname-build

  ./configure --prefix=/usr
  sed -i 's:pixmaps |:pixmaps $(datadir)/applications |:;s:vendor=gnome:vendor=gnome --dir=$(datadir)/applications:' Makefile
  make
}

package() {
  cd ${srcdir}/$_gitname-build

  make prefix="$pkgdir/usr" install
}
