# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=ep128emu
pkgver=2.0.9.1
pkgrel=2
pkgdesc="An emulator of the Enterprise 128 computer"
arch=('i686' 'x86_64')
url="http://ep128emu.enterpriseforever.com/"
license=('GPL')
depends=('fltk' 'portaudio' 'libsndfile' 'dotconf' 'mesa')
makedepends=('scons' 'python')
install=ep128emu.install
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2 \
  http://ep128emu.enterpriseforever.com/roms/${pkgname}_roms.bin \
  ep128emu-config.sh \
  ep128emu.desktop \
  ep128emu.png)
md5sums=('b57dba643300b556a80396be8d74f0b6'
         'ee95ae5920a76adf89eec556b9a5097e'
         'c44ed6444913517c1579c220e05711e1'
         'e15690d80697bf2e51a7d181663e5e59'
         'b8e174fcfb606c59318f810fbeb73b6d')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  # scons
  sed -i "s/disableSDL = 0/disableSDL = 1/" SConstruct
  sed -i "s/disableLua = 0/disableLua = 1/" SConstruct
  scons
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  # install emulator
  install -m755 -d "${pkgdir}"/usr/bin
  install -m755 -t "${pkgdir}"/usr/bin/ ep128emu makecfg tapeedit
  install -m755 -d "${pkgdir}"/usr/lib
  install -m644 -t "${pkgdir}"/usr/lib/ libep128.a libep128emu.a
  # install roms
  install -Dm644 ${srcdir}/${pkgname}_roms.bin "${pkgdir}"/usr/share/${pkgname}/roms/${pkgname}_roms.bin
  install -Dm755 ${srcdir}/${pkgname}-config.sh "${pkgdir}"/usr/bin/${pkgname}-config
  # install desktop file
  install -Dm644 ${srcdir}/ep128emu.desktop "${pkgdir}"/usr/share/applications/ep128emu.desktop
  install -Dm644 ${srcdir}/ep128emu.png "${pkgdir}"/usr/share/pixmaps/ep128emu.png
}
