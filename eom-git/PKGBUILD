# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=eom-git
pkgver=20110218
pkgrel=1
pkgdesc="Eye of MeeGo"
arch=('i686' 'x86_64')
url="http://meego.com"
license=('GPL')
groups=('meego')
depends=('gnome-common' 'clutter-gesture' 'clutter-gst' 'clutter-box2d'
        'gio-sharp')
makedepends=('git' 'intltool')
provides=('eom')
conflicts=('eom')
source=('clutter-gst.patch')
md5sums=('ac7a36803e0fe87e916a5762a7946cf8')

_gitroot="git://gitorious.org/meego-netbook-ux/eom.git"
_gitname="eom"

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

  patch -Np0 -i ${srcdir}/clutter-gst.patch

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
