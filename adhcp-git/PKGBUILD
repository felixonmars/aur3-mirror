# Maintainer: Julian Leyh <julian@vgai.de>

pkgname=adhcp-git
pkgver=20111215
pkgrel=1
pkgdesc="implementation of the DHCP protocol in Ada"
arch=('i686' 'x86_64')
url="http://codelabs.ch/adhcp/"
license=('GPL')
depends=('gcc-ada' 'libalog' 'libdbusada')
makedepends=('git')
checkdepends=('ahven' 'netcat6')
provides=('adhcp')
source=()
md5sums=()

_gitroot=http://git.codelabs.ch/git/adhcp.git
_gitname=adhcp

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  make
}

check() {
  cd "$srcdir/$_gitname-build"
  make tests
}

package() {
  cd "$srcdir/$_gitname-build"

  msg "Installing library..."
  make DESTDIR="$pkgdir/usr" install
}
