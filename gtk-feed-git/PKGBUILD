# Contributor: Henri Häkkinen <henux@users.sourceforge.net>

pkgname=gtk-feed-git
pkgver=
pkgrel=3
pkgdesc="A lightweight GTK+ 2.0 feed reader."
arch=('i686' 'x86_64')
url="http://henux.nor.fi/projects/gtk-feed.php"
license=('GPL')
depends=('gtk2' 'libxml2')
makedepends=('git')
provides=()
conflicts=()
source=()
md5sums=()

_gitroot="git://github.com/henux/gtk-feed.git"
_gitname="gtk-feed"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git-pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -r "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
