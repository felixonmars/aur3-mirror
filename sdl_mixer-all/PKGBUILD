# Contributor: rabyte <rabyte__gmail>
# Contributor: Roberto Carvajal <roberto@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Lukas Sabota <punkrockguy318@cocmast.net> (Timidity Patch)

pkgname=sdl_mixer-all
pkgver=1.2.8
pkgrel=1
pkgdesc="A simple multi-channel audio mixer"
arch=('i686' 'x86_64')
url="http://www.libsdl.org/projects/SDL_mixer/"
license=('LGPL2')
depends=('sdl>=1.2.10' 'libmikmod' 'audiofile' 'libmad')
makedepends=('libtremor')
provides=('sdl_mixer')
conflicts=('sdl_mixer')
options=('!libtool')
source=(http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-$pkgver.tar.gz \
        timidity-path.diff)
md5sums=('0b5b91015d0f3bd9597e094ba67c4d65'
         '9e94ae8dab5e5f85b99c0939d8c2c20e')

build() {
  cd $startdir/src/SDL_mixer-$pkgver

  patch -Np1 -i ../timidity-path.diff || return 1

  ./configure --prefix=/usr --enable-music-libmikmod --enable-native-midi-gpl \
    --enable-music-ogg-tremor --enable-music-mp3-mad-gpl
  make || return 1
  make DESTDIR=$startdir/pkg install
}
