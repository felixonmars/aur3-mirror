# Maintainer: Alastair Stuart <alastair@muto.so>

_pkgname=alacarte
pkgname=$_pkgname-git
pkgver=20120307
pkgrel=1
pkgdesc="Menu editor for GNOME"
arch=('any')
url="http://git.gnome.org/browse/alacarte/"
license=('LGPL')
depends=('python2-gobject' 'gnome-menus2' 'gnome-panel' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('git' 'gnome-common' 'intltool' 'pygtk' 'automake-1.12')
provides=('alacarte')
conflicts=('alacarte')
install=$_pkgname.install

_gitroot="git://git.gnome.org/alacarte"
_gitname="alacarte"

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

  #
  # BUILD HERE
  #

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
               PYTHON=/usr/bin/python2
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir/" install
}
