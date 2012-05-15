# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=xfirepower
pkgver=0.84
pkgrel=2
pkgdesc="A multiplayer tank game which is playable over the Internet"
arch=('i686' 'x86_64')
url="http://www.happypenguin.org/show?Firepower"
license=('custom')
depends=('libxpm')
makedepends=('imake')
source=("http://www.ibiblio.org/pub/linux/games/multiplayer/tank/${pkgname}-${pkgver}.tar.gz"
        "00-libsprite.patch"
        "01-mouse-buttons.patch"
        "02-file-paths.patch"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "LICENSE")
md5sums=('7f2251554c339727f6ee7351b97c0b38'
         'c14cf010ce957f01fb133f2a180f3731'
         'c5128f4a85ea8e7972eb4f373b65fc0e'
         'b399c9b7d5050df0dc98bda1f41bc235'
         'f3f203d8071ee51d48e26f1cdf1d18da'
         '56e0be0b587f9434c7e5e212b124b357'
         'caf918cb2ce53b45eb4d40a075db2c16')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Apply patches
  patch -Np1 -i ../00-libsprite.patch
  patch -Np1 -i ../01-mouse-buttons.patch
  patch -Np1 -i ../02-file-paths.patch

  # Fix paths to maps
  sed -i "s_maps/_/usr/share/${pkgname}/maps/_" server/maps.list

  # Compile server
  cd server
  make

  # Compile client
  cd ../client
  xmkmf
  make Makefiles

  # We don't have a man page, so skip this step
  sed -i "/all.*(MANNEWSUFFIX)/d" Makefile

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install binaries
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 server/xfireserv client/xfire "${pkgdir}/usr/bin"

  # Install maps and motd file
  mkdir -p "${pkgdir}/usr/share/${pkgname}/maps"
  install -m644 server/maps/*.map "${pkgdir}/usr/share/${pkgname}/maps/"
  install -m644 server/maps.list "${pkgdir}/usr/share/${pkgname}"
  install -m644 server/.motd "${pkgdir}/usr/share/${pkgname}/motd"

  # Install a desktop entry
  install -Dm644 ../${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -m644 server/maps/README "${pkgdir}/usr/share/doc/${pkgname}/README_MAPS"

  # Install a license file
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
