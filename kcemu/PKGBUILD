# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=kcemu
pkgver=0.5.1
pkgrel=2
pkgdesc="An emulator of the KC85 and other Z80 based microcomputers"
arch=('i686' 'x86_64')
url="http://kcemu.sourceforge.net/"
license=('GPL')
depends=('gtk2' 'libsndfile' 'libtheora' 'libxmu' 'xvidcore' 'z80ex')
makedepends=('netpbm')
source=("http://downloads.sourceforge.net/${pkgname}/KCemu-${pkgver}.tar.gz"
        "${pkgname}.patch")
md5sums=('7811c6e49ee19d0e7c09668b20798ffc'
         '68d75237b66f4d0b150454e022cc6865')

build() {
  cd "${srcdir}/KCemu-${pkgver}"

  patch -Np1 -i ../${pkgname}.patch

  ./configure \
    --prefix=/usr \
    --disable-libaudiofile \
    --disable-libflac \
    --disable-libdirac \
    --disable-libschroedinger \
    --disable-libavformat \
    --disable-libgif \
    --disable-libvncserver \
    --disable-libmp3lame
  make
}

package() {
  cd "${srcdir}/KCemu-${pkgver}"

  make "DESTDIR=${pkgdir}" install

  # Install a desktop entry
  install -Dm644 images/kcemu-icon.png "${pkgdir}/usr/share/pixmaps/kcemu-icon.png"
  install -Dm644 debian/${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
