# Maintainer: Andre "Osku" Schmidt <andre.osku.schmidt@googlemail.com>

pkgname=gedit-cossa-plugin-git
pkgver=20110528
pkgrel=1
pkgdesc="Gedit plugin for GTK+3 themes design"
arch=('i686' 'x86_64')
url="http://blogs.gnome.org/carlosg/2011/05/28/introducing-cossa-a-gtk-theme-previewer-for-gedit/"
license=('GPL')
depends=('gedit')
makedepends=('git' 'gnome-common' 'intltool' 'gedit')
options=('!libtool')
provides=('gedit-cossa-plugin')
conflicts=('gedit-cossa-plugin')

_gitroot="git://git.gnome.org/gedit-cossa"
_gitname="gedit-cossa"

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

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
