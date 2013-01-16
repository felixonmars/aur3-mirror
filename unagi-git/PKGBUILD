# Contributor: Laurent Ollagnier <laurent + aur at xenbox dot fr>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname="unagi-git"
pkgver=20130108
pkgrel=1
pkgdesc="Compositing manager for implementing effects with regular window managers."
arch=('i686' 'x86_64')
url="http://projects.mini-dweeb.org/projects/unagi"
license=('GPL3')
conflicts=('unagi')
provide=('unagi')
depends=("libxcb>=1.4" "xcb-proto>=1.6" "xproto" "confuse" "libxdg-basedir>=1.0.0" "xcb-util-keysyms" "xcb-util-renderutil" "xcb-util-wm" "xcb-util-image" "libev")
makedepends=("pkgconfig")

_gitroot="git://rcs-git.duckcorp.org/projects/unagi/unagi.git"
_gitname="unagi"
build() {
  cd "$srcdir/"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  [ -d "$srcdir/$_gitname-build" ] && rm -rf "$srcdir/$_gitname-build"
  git clone -l "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  cd "$srcdir/$_gitname-build"
  mkdir m4
  ./autogen.sh
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" includedir="/usr/include/unagi" install

  # Remove libtool files.
  find $pkgdir -name "*.la" | xargs rm
}
