# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=abrt-netbook-git
pkgver=20110219
pkgrel=1
pkgdesc="Control Panel Applet for abrt"
arch=('i686' 'x86_64')
url="http://meego.com"
license=('GPL')
groups=('meego')
depends=('meego-gnome-control-center-git')
makedepends=('git' 'intltool')
provides=('abrt-netbook')
conflicts=('abrt-netbook')
options=('!libtool')
source=('mx-header-path.patch')
md5sums=('64a5dc56b4791056535ddbb8669560da')

_gitroot="git://gitorious.org/meego-netbook-ux/abrt-netbook.git"
_gitname="abrt-netbook"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  patch -Np0 -i ${srcdir}/mx-header-path.patch

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
