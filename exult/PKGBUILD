# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Neutral END
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Adam Griffiths

pkgname=exult
pkgver=1.4.9rc1
pkgrel=4
pkgdesc="A recreation of the Ultima 7 engine"
arch=('i686' 'x86_64')
url="http://exult.sourceforge.net/"
license=('GPL')
depends=('alsa-lib' 'libgl' 'libglade' 'libvorbis' 'sdl')
optdepends=('timidity++: alternative MIDI player')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://downloads.sourceforge.net/${pkgname}/${pkgname}_audio.zip"
        "${pkgname}.patch"
        "${pkgname}.desktop"
        "${pkgname}.install"
        "${pkgname}.png")
md5sums=('c17a48cc0377aa67264aaaf441cb1bb2'
         '1905328f00bbbfee33812c1942bc7880'
         '21092464c0330dbca8e37db9b54772f8'
         '5d138819b3cb5f88ebe24c0024bd2790'
         '09f7a16d5964f000734b2f7be25a263d'
         '2049dd8751d7f90a4bc5bd9f97a0d99d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Apply diffs from SVN to fix errors
  patch -Np1 -i ../${pkgname}.patch

  ./configure \
    --prefix=/usr \
    --enable-shared \
    --disable-static \
    --enable-opengl \
    --enable-exult-studio \
    --with-timidity=/etc/timidity++ \
    --with-icondir=/usr/share/pixmaps

  make LDFLAGS=-lX11
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # Install audio files
  mkdir -p "${pkgdir}/usr/share/${pkgname}/music"
  install -m644 ../music/*.ogg "${pkgdir}/usr/share/${pkgname}/music"
  install -m644 ../*.flx "${pkgdir}/usr/share/${pkgname}"
  install -m644 ../*.txt "${pkgdir}/usr/share/${pkgname}"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs/images docs/*.html "${pkgdir}/usr/share/doc/${pkgname}"
}
