# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Dominika Solarz <dominikasolarz@gmail.com>

pkgname=hhh
pkgver=1.0
pkgrel=2
pkgdesc="Help Hannah's Horse: an arcade game based on Pacman and Fastfood"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/hannah/"
license=('GPL' 'custom')
depends=('gcc-libs' 'sdl_image' 'sdl_mixer' 'sdl_ttf')
source=("http://downloads.sourceforge.net/hannah/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop")
md5sums=('526b7fc05029f7b842d7ee89f61f8783'
         '45d8fef304c6e5a25234c5fd006670a1')

build() {
  cd "${srcdir}/${pkgname}-2008-03-29"

  # Fix installation paths
  sed -e "s_local/games_share_" \
      -e "s_local/bin_bin_" \
      -i Makefile

  make
}

package() {
  cd "${srcdir}/${pkgname}-2008-03-29"

  # Install game files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r blue carrot freeze hannah images invert invis \
        maps newanim pink red sounds stop *.{ogg,png,ttf} \
        "${pkgdir}/usr/share/${pkgname}"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install a desktop entry
  install -Dm644 hannah/default/hannah_down1.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install licenses and readme
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE Ray* Stans* "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
