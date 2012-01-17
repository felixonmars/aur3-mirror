pkgname=xmonad-log-applet-gnome-git
pkgver=20120117
pkgrel=1
pkgdesc="An applet that will display Xmonad log information (GNOME3)"
arch=('i686' 'x86_64')
url="https://github.com/alexkay/xmonad-log-applet"
license=('BSD3')
depends=('gnome-panel>=3.0.0')
makedepends=('git' 'make' 'gnome-panel>=3.0.0')

_gitroot="git://github.com/alexkay/xmonad-log-applet.git"
_gitname="xmonad-log-applet"

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
  git clone -l "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh --with-panel=gnome3
  make || return 1
  make DESTDIR=$pkgdir install

  rm -rf "$srcdir/$_gitname-build"
} 
