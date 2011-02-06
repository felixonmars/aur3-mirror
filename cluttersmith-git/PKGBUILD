# Contributor: atie H. <atie.at.matrix@gmail.com>

pkgname=cluttersmith-git
pkgver=20100810
pkgrel=1
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
license=('LGPL')
depends=('clutter-git' 'json-glib-git' 'mx')
options=('!libtool')
source=()
md5sums=()

_gitroot="git://git.clutter-project.org/cluttersmith"
_gitname="cluttersmith"

build() {
  msg "Connecting to git.clutter-project.org GIT server...."

  if [ -d "$srcdir/$_gitname" ] ; then
    cd "$srcdir/$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  if [ -d "$srcdir/$_gitname-build" ] ; then
    cd "$srcdir/$_gitname-build" && git pull origin
  else
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  fi

  cd $srcdir/$_gitname-build

  msg "Starting build"
  ./autogen.sh --prefix=/usr
  make -j2
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
}