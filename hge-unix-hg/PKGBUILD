# Maintainer: Harley Laue <losinggeneration@gmail.com>
pkgname=hge-unix-hg
pkgver=171
pkgrel=1
pkgdesc="A C/C++ library for creating hardware accelerated 2D games."
arch=(i686 x86_64)
url="http://code.google.com/p/hge-unix/"
license=('zlib')
depends=(sdl openal libpng libjpeg libvorbis)
makedepends=('mercurial')
provides=('hge-unix')
conflicts=('hge-unix')

_hgroot=https://code.google.com/p
_hgrepo=hge-unix

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  [ -d "$srcdir/$_hgrepo/build" ] && rm -rf "$srcdir/$_hgrepo/build"
  mkdir "$srcdir/$_hgrepo/build"
  cd "$srcdir/$_hgrepo/build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SINGLE_LIB=ON ..
  make
}

package() {
  cd "$srcdir/$_hgrepo/build"
  make DESTDIR="$pkgdir/" install
  install -D -m644 "$srcdir/$_hgrepo/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
