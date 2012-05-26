# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=sabre
pkgver=0.2.4b
pkgrel=2
pkgdesc="A flight simulator with fighter planes of the Korean War era"
arch=('i686' 'x86_64')
url="http://www.happypenguin.org/show?Sabre"
license=('GPL')
depends=('bash' 'dialog' 'gcc-libs' 'sdl')
source=("http://archive.debian.org/debian/pool/main/s/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
        "http://archive.debian.org/debian/pool/main/s/${pkgname}/sabre_0.2.4b-26.diff.gz"
        "00-install-paths.patch"
        "01-missing-include.patch"
        "02-fix-shift-key.patch"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('ebab5cab09e6fdf3059a72525693d05b'
         '95359495933881a5672de770e0b0e389'
         '8be08658ffa097f8413c369945bd5c19'
         '8177937f28252d06643a33f96053f5fd'
         '07fe3fb93118419872ee7b59a86fc5fc'
         '076f7411a8e68e11b76c3f3d94b69fc2'
         '73224f413839e948494cbd138a5596cc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}.orig"

  # Apply Debian patches
  patch -Np1 -i ../sabre_0.2.4b-26.diff
  for i in debian/patches/*.diff; do patch -Np1 -i ${i}; done

  # Apply Arch patches
  patch -Np1 -i ../00-install-paths.patch
  patch -Np1 -i ../01-missing-include.patch
  patch -Np1 -i ../02-fix-shift-key.patch

  # Compile SDL version
  ./configure --without-svgalib
  make

  cd sdlsrc
  cp ../src/main.C .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}.orig"

  # Remove unneeded files
  rm -f {scenarios,lib,lib/tzp}/{Makefile,distrib}*

  # Install binary and launcher
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 sdlsrc/sabresdl RunSabreSDL "${pkgdir}/usr/bin"

  # Install data files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r scenarios lib "${pkgdir}/usr/share/${pkgname}"
  install -m755 flySDL "${pkgdir}/usr/share/${pkgname}/scenarios"

  # Install a desktop entry
  install -Dm644 ../${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 \
    CONTRIBUTORS COPYING HISTORY INSTALL JOYSTICK.README \
    README REQUIREMENTS TODO TROUBLE_SHOOTING WHATSNEW \
    doc/*.txt sdlsrc/SDL_PORT_README \
    "${pkgdir}/usr/share/doc/${pkgname}"
}
