# Maintainer: Daniel Krueger <keenbug gmail.com>
pkgname=guile-gnome-gstreamer-git
pkgver=20120410
pkgrel=1
pkgdesc="Binding between Guile Scheme and Gstreamer."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/guile-gnome/"
license=('GPL2')
depends=('guile>=1.6.4' 'g-wrap>=1.9.13' 'guile-gnome-platform' 'gstreamer0.10' libffi patch)
provides=('guile-gnome-gstreamer')
makedepends=('git')
install=guile-gnome-gstreamer-git.install
options=(!libtool)
source=('guile2-fix.patch')
md5sums=('03a534f1990872463f3e78cf9be246b2')

_gitroot="git://git.sv.gnu.org/guile-gnome.git"
_gitname="guile-gnome-platform"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname --branch gstreamer
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  patch -p1 -i $srcdir/guile2-fix.patch

  #
  # BUILD HERE
  #

  ./autogen.sh --prefix=/usr
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}
