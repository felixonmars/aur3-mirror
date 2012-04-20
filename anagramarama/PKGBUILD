# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Yumi Nanako <yumileroy [at] yahoo.com>

pkgname=anagramarama
pkgver=0.4
pkgrel=1
pkgdesc="A cross-platform multilingual anagram finding game"
arch=('i686' 'x86_64')
url="http://code.google.com/p/anagramarama/"
license=('GPL')
depends=('sdl_mixer')
source=("http://anagramarama.googlecode.com/files/${pkgname}-src-${pkgver}.tar.gz"
        "${pkgname}.patch"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('e392cdabf9df167eacf812a9802456d5'
         'b8fb3837d6f70c7743d5a4444fd0bb38'
         'a658dce0e5083b9fdb75bea690a0df39'
         'd37d55fe6d68b033bf1e24053aff9e94')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "../${pkgname}.patch"
  make -f makefile.linux
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install binary
  install -Dm755 ag "${pkgdir}/usr/bin/${pkgname}"

  # Install data files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r audio i18n "${pkgdir}/usr/share/${pkgname}"

  # Install pixmap and .desktop file
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install readme
  install -Dm644 readme "${pkgdir}/usr/share/doc/${pkgname}/README"
}
