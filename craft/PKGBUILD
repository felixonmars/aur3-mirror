# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=craft
pkgver=3.5
pkgrel=2
pkgdesc="A strategy game similar to Warcraft and Dune II"
arch=('i686' 'x86_64')
url="http://libregamewiki.org/CRAFT:_The_Vicious_Vikings"
license=('custom')
depends=('gcc-libs' 'libx11')
source=("http://www.ibiblio.org/pub/linux/games/strategy/craftcc35.tar.Z"
        "${pkgname}.patch"
        "${pkgname}-getline.patch"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.sh")
md5sums=('e55d412d330f28798d10d13ab28596c0'
         '92bafe8da34d532e255a9f5c46b5ad45'
         'b219a305de89efa832626da9996dba07'
         '88a47988dd17ceb8338f1bc66db90fd8'
         'e948872501cf0fb46b2483d87a87316f'
         '72c195d88008549f85000f2a5836ba87')

build() {
  cd "${srcdir}"

  # Apply patches
  patch -Np1 -i "${pkgname}.patch"
  patch -Np1 -i "${pkgname}-getline.patch"

  # Fix game speed on modern computers
  sed -i 's/min_cycle_time  50/min_cycle_time  2500/g' craft.hc

  # Compile
  ./install
}

package() {
  cd "${srcdir}"

  # Remove backup copies
  rm hcraft/{.windefaults.params~,pic_cata_new~,#m1.cmap#,*.old}
  rm hcraft/edit/.windefaults.params~

  # Install game files
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r buttons hcraft "${pkgdir}/opt/${pkgname}"
  install -m755 "${pkgname}" "${pkgdir}/opt/${pkgname}"
  install -m644 ".windefaults.params" "${pkgdir}/opt/${pkgname}"

  # Install launcher
  install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install pixmap and .desktop file
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/pic"
  install -m644 html/*.{gif,html} "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 html/pic/*.gif "${pkgdir}/usr/share/doc/${pkgname}/pic"

  # Install license
  sed -n "54,61p" README > COPYING
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
