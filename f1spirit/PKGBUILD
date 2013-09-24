# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Tobias Heimfarth <emaildotobias@yahoo.com.br>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>
# Contributor: Márcio Carneiro <marciocr@gmail.com>

pkgname=f1spirit
pkgver=0.rc9.1615
pkgrel=4
pkgdesc="Remake of Konami's MSX classic game F1-Spirit"
arch=('i686' 'x86_64')
url="http://www.braingames.getput.com/f1spirit/"
license=('custom')
depends=('curl' 'mesa' 'sdl_image' 'sdl_mixer' 'sdl_net' 'glu')
source=("http://braingames.jorito.net/f1spirit/f1spirit.src_0.rc9-1615.tgz"
        "${pkgname}.patch"
        "${pkgname}.sh")
md5sums=('304935124a1bf48a4de9b39077655fe9'
         '50815b1f072df4149c2e5f291af2aaaa'
         '981ae5c34bdbb1065ea6e0bfb316ce14')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch --follow-symlinks -p0 -i "${srcdir}/${pkgname}.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install game files
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r demos graphics sound tracks "${pkgdir}/opt/${pkgname}"
  install -m755 "${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"
  install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install docs
  sed -n "/The BRAIN GAMES team/,/scaned original manual/p" readme.txt > CREDITS
  install -Dm644 CREDITS "${pkgdir}/usr/share/licenses/${pkgname}/CREDITS"
  install -Dm644 readme.txt "${pkgdir}/usr/share/doc/${pkgname}/README"

  # Install the pixmap and desktop file
  cd build/linux
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
