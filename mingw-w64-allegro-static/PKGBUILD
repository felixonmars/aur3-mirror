pkgname=mingw-w64-allegro-static
pkgver=5.0.10
pkgrel=1
pkgdesc="Portable library mainly aimed at video game and multimedia programming (mingw-w64)"
arch=(any)
url="http://alleg.sourceforge.net"
license=("custom")
makedepends=(mingw-w64-gcc
mingw-w64-cmake
mingw-w64-freetype
mingw-w64-physfs
mingw-w64-libvorbis
mingw-w64-flac
mingw-w64-libpng
mingw-w64-openal
mingw-w64-dumb
mingw-w64-libjpeg-turbo)
depends=(mingw-w64-crt)
optdepends=(
"mingw-w64-dumb: allegro_audio"
"mingw-w64-flac: allegro_audio"
"mingw-w64-freetype: allegro_font"
"mingw-w64-libjpeg-turbo: allegro_image"
"mingw-w64-libpng: allegro_image"
"mingw-w64-libvorbis: allegro_audio"
"mingw-w64-openal: allegro_audio"
"mingw-w64-physfs: allegro_physfs")
options=(!strip !buildflags staticlibs)
source=("http://downloads.sourceforge.net/alleg/allegro-$pkgver.tar.gz")
conflicts=(mingw-w64-allegro)
provides=(mingw-w64-allegro)
sha256sums=('71b81080f34f6e485edd0c51f22923c18ff967d5db438e591e6f3885d5bdcda1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "$srcdir/allegro-$pkgver"
  sed -i "s,DS3DALG_DEFAULT,GUID_NULL,g" "addons/audio/dsound.cpp"
}

build() {
  cd "$srcdir/allegro-$pkgver"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DSHARED=OFF \
      -DDUMB_LIBRARY=/usr/${_arch}/lib/libdumb.a \
      -DWANT_DEMO=OFF \
      -DWANT_DOCS=OFF \
      -DWANT_EXAMPLES=OFF \
      -DWANT_TESTS=OFF \
      -DFREETYPE_LIBRARY=/usr/${_arch}/lib/libfreetype.a \
      -DFLAC_LIBRARY=/usr/${_arch}/lib/libFLAC.a \
      -DOGG_LIBRARY=/usr/${_arch}/lib/libogg.a \
      -DOPENAL_LIBRARY=/usr/${_arch}/lib/libOpenAL32.dll.a \
      -DPHYSFS_LIBRARY=/usr/${_arch}/lib/libphysfs.a \
      -DVORBISFILE_LIBRARY=/usr/${_arch}/lib/libvorbisfile.a \
      -DVORBIS_LIBRARY=/usr/${_arch}/lib/libvorbis.a \
      -DZLIB_LIBRARY=/usr/${_arch}/lib/libz.a \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/allegro-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.a' -exec ${_arch}-strip -g {} \;
  done
}
