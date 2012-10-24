# Upstream Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: qwak <qwak@w8.pl>
# Contributor: ThatGuyJon <theonereddragon@gmail.com>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgname=sdl_mixer
pkgname=libx32-$_pkgname
pkgver=1.2.12
pkgrel=0.1
pkgdesc="A simple multi-channel audio mixer (x32 ABI)"
arch=('x86_64')
url="http://www.libsdl.org/projects/SDL_mixer/"
license=('LGPL' 'GPL')
depends=("$_pkgname=${pkgver}" 'libx32-sdl>=1.2.12' 'libx32-libvorbis' 'libx32-libmikmod' 'libx32-smpeg')
makedepends=('gcc-multilib-x32')
options=('!libtool')
source=("http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-${pkgver}.tar.gz")
md5sums=('e03ff73d77a55e3572ad0217131dc4a1')

build() {
  cd "${srcdir}/SDL_mixer-${pkgver}"

  export CC='gcc -mx32'
  export PKG_CONFIG_PATH='/usr/libx32/pkgconfig'

  sed -e "/CONFIG_FILE_ETC/s/\/etc\/timidity.cfg/\/etc\/timidity++\/timidity.cfg/" \
      -e "/DEFAULT_PATH/s/\/etc\/timidity/\/etc\/timidity++/" \
      -e "/DEFAULT_PATH2/s/\/usr\/local\/lib\/timidity/\/usr\/lib\/timidity/" \
      -i timidity/config.h

  ./configure \
	--prefix=/usr \
	--libdir=/usr/libx32
  make
}

package() {
  cd "${srcdir}/SDL_mixer-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # Remove uneeded header files
  rm -rf "$pkgdir/usr/include"
}
