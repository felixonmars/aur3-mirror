# Maintainer: Matthew Bauer <mjbauer95@gmail.com>
_pkgname=ips-patcher
pkgname=$_pkgname-git
pkgver=20110827
pkgrel=1
pkgdesc="GTK-based ips patcher"
arch=('i686' 'x86_64')
url="https://github.com/BlockoS/ips-patcher"
license=('GPL3')
groups=()
depends=()
makedepends=('git' 'gcc' 'automake' 'autoconf')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot='https://github.com/BlockoS/ips-patcher.git'
_gitname=$_pkgname

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
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
