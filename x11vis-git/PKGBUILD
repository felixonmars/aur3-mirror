# Maintainer: Your Name <youremail@domain.com>
pkgname=x11vis-git
pkgver=20110802
pkgrel=3
pkgdesc="X11 visualizer"
arch=(i686 x86_64)
url="http://www.x11vis.org/"
license=('GPL')
groups=()
depends=(perl-json-xs perl-xml-twig perl-twiggy perl-io-all perl-dancer perl-moose perl-anyevent perl-moosex-singleton)
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="https://github.com/x11vis/x11vis.git"
_gitname="x11vis"

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

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
