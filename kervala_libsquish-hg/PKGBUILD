# Maintainer: Jorge Araya <jorgean@lavabit.com>

pkgname=kervala_libsquish-hg
pkgver=220
pkgrel=1
pkgdesc="Open source DXT compression library, kervala's version"
arch=('i686' 'x86_64')
url="http://code.google.com/p/libsquish/"
license=('MIT')
makedepends=('mercurial' 'gcc-libs')
provides=('libsquish')
conflicts=('libsquish')
source=()

_hgroot="http://hg.kervala.net"
_hgrepo="packaging"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "${_hgroot}/${_hgrepo}"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build/squish"
  make
}

package() {
  cd "$srcdir/$_hgrepo-build/squish"
  mkdir -p ${pkgdir}/usr/local/include
  mkdir -p ${pkgdir}/usr/local/lib
  make -e INSTALL_DIR="$pkgdir/usr/local" install
}

# vim:set ts=2 sw=2 et:
