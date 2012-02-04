# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=sdl-13
_prever=5538
pkgver=1.3.0.pre_${_prever}
pkgrel=2
pkgdesc="Next gen of SDL: A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard"
arch=('i686' 'x86_64')
url="http://www.galaxygameworks.com"
license=('zlib')
conflicts=('sdl')
depends=('libx11' 'libxcursor' 'libxrandr' 'libxinerama' 'libxext' 'libxxf86vm' 'mesa')
source=(http://www.libsdl.org/tmp/SDL-1.3.0-$_prever.tar.gz)

build() {
  cd "${srcdir}/SDL-1.3.0-${_prever}"

if [[ "$CARCH" == "x86_64" ]]; then
	_enable_sse2=enable
else
	_enable_sse2=disable
fi

  ./configure --prefix=/usr \
	--enable-alsa \
	--enable-x11-shared \
	--${_enable_sse2}-sse2
  make
}

package() {
  cd "${srcdir}/SDL-1.3.0-${_prever}"

  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
md5sums=('2ea23676fb244554496c9e0e1ed41284')
