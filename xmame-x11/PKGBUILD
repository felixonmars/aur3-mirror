# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# maintainer: gebjgd <robinking623623@yahoo.de>
pkgname=xmame-x11
pkgver=0.106
pkgrel=1
pkgdesc="Multiple Arcade Machine Emulator with OpenGL/XV support"
arch=(i686 x86_64)
url='http://x.mame.net'
license=('GPL')
depends=('libgl' 'libxv' 'expat>=2.0' 'sdl' 'zlib')
conflicts=('xmame-sdl')
source=(http://caltaxcn.googlecode.com/files/xmame-${pkgver}.tar.bz2
	 makefile.unix-x11.patch)
md5sums=('b2b18d32a03ebd4d9c9476fbb93695ca'
'2c259c52c241bd507d799db550c78faf')
options=('!makeflags')

build() {
  cd ${startdir}/src/xmame-${pkgver}
  patch -Np0 -i ${startdir}/src/makefile.unix-x11.patch || return 1
  [ -z "${CC}" ] || sed -i "s/CC\t= gcc/CC\t= ${CC}/" makefile.unix
  sed -i "s/^CFLAGS =/CFLAGS = ${CFLAGS}/" makefile.unix

  make PREFIX=/usr || return 1
  make PREFIX=${startdir}/pkg/usr install

  # symlink for xmame
  cd ${startdir}/pkg/usr/bin
  ln -s xmame.x11 xmame

  chown -R root:root ${startdir}/pkg/usr
}


