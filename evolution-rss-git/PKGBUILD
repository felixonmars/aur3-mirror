# Maintainer: Matthias Meulien <orontee@gmail.com>
_pkgname=evolution-rss
pkgname=$_pkgname-git
pkgver=20121105
pkgrel=1
pkgdesc="Plugin for Evolution Mail that enables reading of RSS/RDF/ATOM feeds"
arch=('i686' 'x86_64')
url="http://gnome.eu.org/index.php/Evolution_RSS_Reader_Plugin"
license=('GPL')
depends=('evolution')
makedepends=('git' 'gnome-common' 'intltool')
provides=("$_pkgname=pkgver")
conflicts=("$_pkgname")
options=('!libtool')
install=$_pkgname.install

_gitroot="git://git.gnome.org/evolution-rss"
_gitname="evolution-rss"

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

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var

  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir/" install
}
