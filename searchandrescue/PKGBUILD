# Maintainer: Martynas Januskauskas <martynas@januskauskas.eu>
pkgname=searchandrescue
pkgver=1.5.0
pkgrel=3
pkgdesc="A flight simulator in which your mission is finding and rescuing people in distress"
arch=('i686' 'x86_64')
url="http://searchandrescue.sourceforge.net/"
license=('GPL')
depends=('libxmu' 'libxpm' 'mesa' 'sdl_mixer')
options=('!buildflags')
source=("http://downloads.sourceforge.net/project/${pkgname}/Program/SearchAndRescue-${pkgver}.tar.gz"
        "http://downloads.sourceforge.net/project/${pkgname}/Data_Files/SearchAndRescue-data-1.3.0.tar.gz"
        "desktop-entry.patch"
        "${pkgname}.sh")
noextract=("SearchAndRescue-data-1.3.0.tar.gz")
md5sums=('369a14bd6d9eb613abff099aea955e95'
         '53d6986bd53e7e2b5de0d7bd996a1910'
         'ee5536cd2b23491faf0b23ac27ebe667'
         '617227e7db32b6f8d3e19f711609b343')

build() {
  cd "${srcdir}/${pkgname}_${pkgver}"

  # Apply a patch to fix desktop entry warnings
  patch -Np1 -i ../desktop-entry.patch

  # Fix installation paths
  sed -e "s_share/games_share_" \
      -e "s_/games_/bin_" \
      -i sar/Makefile.install.UNIX

  ./configure Linux --disable=Y2
  make all
}

package() {
  cd "${srcdir}/${pkgname}_${pkgver}"

  make DESTDIR="${pkgdir}" install

  # Install data files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  bsdtar --no-same-owner -xf ../SearchAndRescue-data-1.3.0.tar.gz \
    -C "${pkgdir}/usr/share/${pkgname}"

  # Install a launcher
  install -Dm755 ../${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"

  # Install a desktop entry
  install -Dm644 SearchAndRescue.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
