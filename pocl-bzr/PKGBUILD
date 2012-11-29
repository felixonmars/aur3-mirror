# Maintainer: Jon Nordby <jononor@gmail.com>

_pkgname=pocl
pkgname=$_pkgname-bzr
pkgver=444
pkgrel=1
pkgdesc="Portable OpenCL is animplementation of OpenCL which can be easily adapted for new targets"
arch=(i686 x86_64)
url="https://launchpad.net/pocl"
license=('GPL')
groups=()
depends=()
makedepends=('bzr' 'clang')
provides=($_pkgname)
conflicts=($_pkgname)
install=
source=()
md5sums=() #generate with 'makepkg -g'

_bzrtrunk=lp:pocl
_bzrmod=$_pkgname

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [[ -d "$_bzrmod" ]]; then
    cd "$_bzrmod" && bzr pull "$_bzrtrunk" -r "$pkgver"
    msg "The local files are updated."
  else
    bzr branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"

  #
  # BUILD HERE
  #
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_bzrmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
