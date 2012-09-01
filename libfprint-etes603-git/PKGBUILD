# Maintainer: Christian Gerhorst <christiangerhorst@gmail.com>

pkgname=libfprint-etes603-git
pkgver=20120901
pkgrel=1
epoch=
pkgdesc="EgisTec ES603 support for libfprint"
arch=('x86_64')
url="http://code.google.com/p/etes603/"
license=('GPL')
groups=()
depends=(libusb nss gdk-pixbuf2)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(libfprint)
conflicts=(libfprint)
replaces=()
backup=()
options=()
install=
changelog=
source=(fix-configure.diff fix-autogen.diff)
noextract=()

_gitroot=https://code.google.com/p/etes603/
_gitname=etes603

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

  patch -i "$srcdir/fix-configure.diff"
  patch -i "$srcdir/fix-autogen.diff"

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

md5sums=('316d77bc54d7be565bedce02d818a177'
         '52e8aeb05f4f0fce50367940dfe91946')
