# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: Ronan RABOUIN <darkbaboon@gmail.com>

pkgname=maxr
pkgver=0.2.8
pkgrel=1
pkgdesc="M.A.X. Reloaded is an open source remake of the classic strategy game"
arch=('i686' 'x86_64')
url="http://www.maxr.org/"
license=('GPL' 'FDL')
depends=('gcc-libs' 'sdl_mixer' 'sdl_net')
install="${pkgname}.install"
source=("http://www.maxr.org/downloads/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop")
md5sums=('8e586cbdbf81f0a6f2a3bb9ca865c193'
         '35ae16344adf55c0cce4f61da5d39646')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # Install a desktop entry
  install -Dm644 data/${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 data/MANUAL ABOUT AUTHORS CHANGELOG "${pkgdir}/usr/share/doc/${pkgname}"

  # Install license files
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING* "${pkgdir}/usr/share/licenses/${pkgname}"
}
