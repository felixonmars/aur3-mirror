# Contributor: Andrew Fischer <andrew_at_lightningtoads.com>

pkgname=toadlet-hg
pkgver=1417
pkgrel=1
pkgdesc="The toadlet engine is a versatile software toolkit for building powerful and efficient applications across a range of operating systems and mobile devices."
arch=('i686' 'x86_64')
license=("LGPL")
conflicts=('toadlet')
provides=('toadlet')
makedepends=('cmake>=2.8.6' 'mercurial')
depends=('zlib' 'zziplib' 'giflib' 'libjpeg' 'libpng' 'glew' 'freetype2' 'openal' 'mxml')
optdepends=('ffmpeg: video/audio conversion and playback (recommended)' 'sidplay2-libs: enables playback of C64 SID filesi (for fun)')
url="http://code.google.com/p/toadlet"
source=()
noextract=()
md5sums=()

_hgroot="https://code.google.com/p"
_hgrepo="toadlet"

build() {
  _kernelver=$(eval 'uname -r')

  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot"/"$_hgrepo" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_hgrepo/build-$_kernelver"
  mkdir -p "$srcdir/$_hgrepo/build-$_kernelver"
  cd "$srcdir/$_hgrepo/build-$_kernelver"

  cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    .. || return 1
}

package() {
  _kernelver=$(eval 'uname -r')
  cd "$srcdir/$_hgrepo/build-$_kernelver"
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}

# vim:set ts=2 sw=2 et:
