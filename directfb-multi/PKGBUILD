# Maintainer: lks <lukasgraetz [et] web [dot] de>
# Contributor: Georgios N. Tsalikis <aliverius@tsalikis.net>

# adopted from directfb
# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=directfb-multi
pkgver=1.7.5
pkgrel=1
pkgdesc="A thin library that provides hardware graphics acceleration, input device handling and abstraction, integrated windowing system on top of the Linux Framebuffer Device"
arch=(armv7h 'i686' 'x86_64')
url="http://www.directfb.org"
license=('LGPL')
depends=('linux-fusion>=9.0.0' 'xorg-server' 'gcc-libs' 'libjpeg' 'sdl' 'libpng' 'freetype2' 'libdrm' 'libgl' 'mesa')
options=('!libtool')
provides=("directfb=${pkgver}")
conflicts=("directfb")
source=(http://www.directfb.org/downloads/Core/DirectFB-${pkgver%.*}/DirectFB-${pkgver}.tar.gz
	85-directfb.rules)
install=directfb.install
sha1sums=('13f769b5fc0a38b123968761fad3058bc923b01f'
          '69b26f93725f2c17016d7d04692c33bc47ac14e9')

build() {
  cd DirectFB-${pkgver}
  msg "$(gettext "You may need to select: --with-gfxdrivers=list,of,drivers")"
  ./configure --prefix=/usr --sysconfdir=/etc --enable-static \
    --enable-zlib --enable-x11 --enable-sdl --disable-vnc --disable-osx \
    --enable-video4linux2 --enable-voodoo \
    --enable-mesa --enable-drmkms \
    --disable-tests --enable-multi --disable-unique \
    --with-gfxdrivers=all --disable-trace --disable-debug
  make
}

package() {
  cd DirectFB-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}/85-directfb.rules" "${pkgdir}/etc/udev/rules.d/85-directfb.rules"
}
