# Maintainer: Abelardo Ricart <aricart AT gmail DOT com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=galapix-git
pkgver=0.2.0.r12.g00237ba
pkgrel=1
pkgdesc="A zoomable image viewer for large collections of images"
arch=('i686' 'x86_64')
url="https://code.google.com/p/galapix/"
license=('GPL3')
depends=('boost' 'curl' 'glew' 'imagemagick' 'libexif' 'libjpeg' 'libpng' 'mesa' 'sdl' 'sqlite3' 'sdl2')
optdepends=('xcftools: XCF format support'
'gimp-ufraw: RAW format support'
)
makedepends=('git' 'scons' 'patch' 'gtkglextmm' 'libglademm')
source=('git+https://code.google.com/p/galapix/'
'imagemagick_plugin.patch'
'png_string_fix.patch')
md5sums=('SKIP'
'74ee0c4132088bb5657ac73d9d263636'
'968f20516e7092ec5f4bc1ed695f3dfd')

_gitroot="https://code.google.com/p/galapix/"
_gitname=galapix

pkgver() {
	cd "$srcdir/galapix"
	echo $( git describe --long | sed -r 's/^galapix-//;s/([^-]*-g)/r\1/;s/-/./g' )
}

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
  cd "$srcdir/$_gitname-build/src/plugins"
  patch -p0 < "${srcdir}/imagemagick_plugin.patch"
  patch -p0 < "${srcdir}/png_string_fix.patch"
  cd "$srcdir/$_gitname-build"
  scons
}

package() {
  cd "$srcdir/$_gitname-build"

  install -D -m755 build/galapix.sdl ${pkgdir}/usr/bin/galapix
}
