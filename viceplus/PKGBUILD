# Contributor: grimi <grimi@poczta.fm>

pkgname=viceplus
_pkgname=VICEplus
pkgver=1.1
pkgrel=3
pkgdesc="VICEplus is a fork of VICE. Its most important extension currently is C64DTV support."
arch=('i686' 'x86_64')
url="http://viceplus.wiki.sourceforge.net/"
license=('GPL')
depends=('alsa-lib' 'gtk2' 'gtkglext' 'lame' 'libgl' 'libjpeg' 'libpng' 'libungif' \
         'libxrandr' 'readline' 'sdl_sound')
makedepends=('pkgconfig')
provides=('vice')
conflicts=('vice')
replaces=('vice')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('098fe3808484914c4bd4e4a3882e11c8')

build() {
  cd "$srcdir/${_pkgname}-v${pkgver}"
  ./configure --prefix=/usr --enable-fullscreen --enable-romdownload  --without-esd \
              --enable-ethernet --with-sdl --enable-gnomeui
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}

