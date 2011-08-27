# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Laurent Prevost <laurent.prevost@gmail.com>
pkgname=mplayer-toyunda
pkgver=0.9
pkgrel=1
pkgdesc="Epitamime Mplayer version with Toyunda support"
arch=(i686 x86_64)
url="http://www.darkbsd.org/"
license=('GPL')
groups=()
depends=('libxxf86dga' 'libxv' 'libmad' 'giflib' 'cdparanoia' 'libxinerama'
         'sdl' 'lame' 'libtheora' 'xvidcore' 'zlib' 'libmng' 'libxss' 'live-media'
         'libgl' 'aalib' 'jack-audio-connection-kit' 'libcaca' 'gcc43'
         'x264>=20090416' 'faac' 'lirc-utils' 'ttf-dejavu' 'libxvmc' 'libjpeg>=7')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.darkbsd.org/~darksoul/MPlayer-0.9X-Toyunda-undead-gcc4-local.tar.bz2)
noextract=()
md5sums=(9e83d6a788b127c1801a6f5555cb538d) #generate with 'makepkg -g'

build() {
  cd "$srcdir/MPlayer-0.9X-Toyunda-undead-gcc4-local"

  ./configure --prefix=/usr --cc=gcc-4.3
  make
}

package() {
  cd "$srcdir/MPlayer-0.9X-Toyunda-undead-gcc4-local"

  make DESTDIR="$pkgdir/" install
}
