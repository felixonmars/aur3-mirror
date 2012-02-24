# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=judith
pkgver=1.0
pkgrel=1
pkgdesc="A narrative art game with eerie atmosphere"
arch=('i686' 'x86_64')
url="http://distractionware.com/blog/2009/04/judith/"
license=('custom:open_source')
depends=('fmodex' 'gcc-libs' 'sdl')
makedepends=('qt')
install="${pkgname}.install"
source=("http://distractionware.com/games/${pkgname}_linux.tar.gz"
        "${pkgname}.patch"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.sh"
        "COPYRIGHT")
md5sums=('a2edecf8474f30633d63f901d644fed1'
         '25ca9afe8ec1ece705adb4c6032d13bd'
         'f8c9d5cfd8bd2020800eb1e67fef46e7'
         '7e9275afaa61cc37a748f7a38294dbc2'
         'c02c1be384b5663d51c1b068976c4b55'
         'd6c2ccf4fcc3fad8b5f08fd737c23b17')

build() {
  cd "${srcdir}/${pkgname}/src"

  # Compile
  rm "../${pkgname}"
  patch -Np2 -i "../../${pkgname}.patch"
  qmake
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  # Install game files
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r data "${pkgdir}/opt/${pkgname}"
  install -Dm755 "${pkgname}" "${pkgdir}/opt/${pkgname}"

  # Set permissions
  chgrp games "${pkgdir}/opt/${pkgname}/data/save.dat"
  chmod g+w "${pkgdir}/opt/${pkgname}/data/save.dat"

  # Install launcher
  install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install pixmap and .desktop file
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install readme and copyright
  install -Dm644 README.rtf "${pkgdir}/usr/share/doc/${pkgname}/README.rtf"
  install -Dm644 ../COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
