# Maintainer: Martin F. Schumann <mfs@mfs.name>
# based on Ronald van Haren's <ronald.archlinux.org> PKGBUILD for lyx

pkgname=lyx-ng
pkgver=2.0.4
pkgrel=2
pkgdesc="An advanced WYSIWYM document processor & LaTeX front-end"
arch=('i686' 'x86_64')
url="http://www.lyx.org"
depends=('qt' 'texlive-core' 'python2' 'imagemagick' 'enchant' 'boost-libs' 'libmythes')
makedepends=('boost')
conflicts=('lyx')
optdepends=('rcs: built-in version control system'
            'texlive-latexextra: float wrap support')
license=('GPL')
source=(ftp://ftp.lip6.fr/pub/lyx/stable/2.0.x/lyx-$pkgver.tar.xz
        lyx.desktop lyxrc.dist)
backup=('etc/lyx/lyxrc.dist')
install=lyx.install
options=('emptydirs')
sha1sums=('4d384060553c74912e13f98e1788a6f978c58c2e'
          'e2b8f6d6cdeec41e1d5795167f5557e4a6ea28ad'
          '56416642cc3da2a13b87b84e6b87c1a239f3d09a')
	
build() {
  cd "${srcdir}/lyx-${pkgver}"
  find . -type f -exec sed -i 's|#!.*python|#!/usr/bin/env python2|' {} +
  sed -i 's|"python|"python2|' lib/configure.py src/support/os.cpp
  export CXXFLAGS="$CXXFLAGS -fpermissive"
  ./configure --prefix=/usr \
    --with-frontend=qt4 --without-included-boost \
    --without-included-mythes
  make
}

package() {
  cd "${srcdir}/lyx-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # install desktop entry
  install -Dm644 "${srcdir}/lyx.desktop" \
    "${pkgdir}/usr/share/applications/lyx.desktop"
  install -Dm644 "lib/images/lyx.png" \
    "${pkgdir}/usr/share/pixmaps/lyx.png"

  # install default config file
  install -Dm644 "${srcdir}/lyxrc.dist" "${pkgdir}/etc/lyx/lyxrc.dist"
  ln -sf /etc/lyx/lyxrc.dist "${pkgdir}/usr/share/lyx/lyxrc.dist"
}
