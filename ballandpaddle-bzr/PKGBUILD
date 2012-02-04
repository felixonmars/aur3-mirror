# Maintainer: Eric P. Hutchins <hutchiep190@potsdam.edu>
pkgname=ballandpaddle-bzr
pkgver=114
pkgrel=1
pkgdesc="an extensible ball and paddle game for GNU"
arch=(i686)
url="http://www.gnu.org/software/ballandpaddle/"
license=('GPL3')
depends=(sdl sdl_image sdl_mixer sdl_ttf guile)
makedepends=(gettext sdl sdl_image sdl_mixer sdl_ttf guile gtkmm 'bzr')

_bzrtrunk="http://bzr.savannah.gnu.org/r/ballandpaddle"
_bzrmod="ballandpaddle"

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [ -d $_bzrmod ] ; then
    cd ${_bzrmod} && bzr --no-plugins pull ${_bzrtrunk} -r ${pkgver}
    msg "The local files are updated."
  else
    bzr --no-plugins branch ${_bzrtrunk} ${_bzrmod} -q -r ${pkgver}
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"

  #
  # BUILD HERE
  #

  autoreconf -if
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_bzrmod-build"
  make DESTDIR="$pkgdir/" install
} 
