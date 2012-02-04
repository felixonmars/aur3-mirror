
# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Nicklas Overgaard <nicklas@isharp.dk>
pkgname=sony-laptop-zseries-git
pkgver=20111001
pkgrel=1
pkgdesc="Adaption and extension for Sony Z-series laptops (and maybe others)"
arch=(any)
url="http://gitorious.org/sony-laptop-zseries"
license=('GPL')
groups=()
depends=('linux>=2.6.39')
makedepends=('git')
provides=('sony-laptop-zseries')
conflicts=()
replaces=()
backup=()
options=()
install=sony-laptop-zseries.install
source=(make.patch)
noextract=()
md5sums=('cc0f8f31fff437afb934cd0477002ffb')

_gitroot=git://gitorious.org/sony-laptop-zseries/sony-laptop-zseries.git
_gitname=sony-laptop-zseries

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
  # Patch makefile
  #
  patch -i ../make.patch -p1
  #
  # BUILD HERE
  #
  make all
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

