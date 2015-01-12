# Maintainer: quequotion <quequotion@bugmenot.com>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Maintainer: Roberto Carvajal <roberto@archlinux.org>

pkgname=lib32-mjpegtools
pkgver=2.1.0
pkgrel=1
pkgdesc="Set of tools that can do recording of videos and playback, simple cut-and-paste editing and the MPEG compression of audio and video (32bit)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://mjpeg.sourceforge.net/"
depends=(lib32-{sdl,gcc-libs,lib{jpeg,png}}) #lib32-libdv cannot be built
makedepends=('gtk2' 'v4l-utils')
optdepends=('gtk2: glav GUI')
options=('!makeflags')
source=(http://downloads.sourceforge.net/sourceforge/mjpeg/mjpegtools-${pkgver}.tar.gz)
md5sums=('57bf5dd78976ca9bac972a6511b236f3')

prepare() {
  cd mjpegtools-${pkgver}
  sed -i -e '/ARCHFLAGS=/s:=.*:=:' configure
}

build() {

  cd mjpegtools-${pkgver}

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export LDFLAGS='-m32'
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --lib{,exec}dir=/usr/lib32 \
              --program-suffix="-32" --host="i686-unknown-linux-gnu" \
              --enable-largefile --without-libdv 
  make

}

package() {
  cd mjpegtools-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m644 mpeg2enc/mpeg2syntaxcodes.h "${pkgdir}/usr/include/mjpegtools/mpeg2enc/"

  rm -rf "${pkgdir}"/{etc,usr/{share,include}} # needs bin
}
