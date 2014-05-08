# Maintainer: Zohar Malamant <dotfloat gmail com>
pkgname=doom64ex-svn
_kex=doom64ex
_wadgen=wadgen
pkgver=v2.5.r66.ga9229dc
pkgrel=1
pkgdesc="A port of Doom64"
arch=('i686' 'x86_64')
license=('GPL')
url='http://doom64ex.sourceforge.net/'
depends=('sdl2_net' 'glu' 'fluidsynth' 'libpng')
makedepends=('git' 'cmake')
install='doom64ex-svn.install'
source=("$_kex::git+https://github.com/MP2E/kexplus"
		"$_wadgen::git+https://github.com/MP2E/Wadgen"
		"doom64ex.tar.gz")
md5sums=('SKIP'
         'SKIP'
         '4850dc6248f379c2c736b902df932988')

pkgver() {
  cd ${srcdir}/${_kex}
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_kex"
  # patch -p1 -i ../doom64ex.patch

  # Build Kex engine (the actual game)
  mkdir -p "$srcdir/$_kex/build"
  cd "$srcdir/$_kex/build"
  cmake ..
  make

  # Build WadGen
  mkdir -p "$srcdir/$_wadgen/build"
  cd "$srcdir/$_wadgen/build"
  cmake -DUSE_SDL2=true ..
  make
}

package() {
  # Install Kex engine
  install -D -m755 "$srcdir/$_kex/build/src/doom64ex" "$pkgdir/usr/bin/doom64ex"
  install -d "$pkgdir/usr/share/man/man6"
  gzip -9c "$srcdir/doom64ex.6" > "$pkgdir/usr/share/man/man6/doom64ex.6.gz"
  install -D -m755 "$srcdir/doom64ex.desktop" "$pkgdir/usr/share/applications/doom64ex.desktop"
  install -D -m755 "$srcdir/doom64ex.png" "$pkgdir/usr/share/pixmaps/doom64ex.png"

  # Install WadGen
  install -D -m755 "$srcdir/$_wadgen/build/src/wadgen" "$pkgdir/usr/bin/doom64ex-wadgen"
  install -d "$pkgdir/usr/share/games/doom64/Content"
  cp -rf "$srcdir/$_wadgen/Content/" "$pkgdir/usr/share/games/doom64/"
#  Copy DOCS
#  install -d "$pkgdir/usr/share/doc/doom64ex"
#  cp -rf "$srcdir/$_svnmod-build/src/kex/DOCS/" "$pkgdir/usr/share/doc/doom64ex/"
}

# vim:set ts=2 sw=2 et:
