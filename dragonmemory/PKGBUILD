# Contributer: Rikles (style.boubou@gmail.fr)
pkgname=dragonmemory
pkgver=1.0
pkgrel=2
pkgdesc="Simple and fun memory game."
arch=('any')
url="http://dragontech.net/index.php/games-en"
license=('GPL')
depends=('sdl' 'sdl_mixer' 'sdl_image')
makedepends=('tar')
source=(${pkgname} http://dragontech.net/index.php/games-en?file=tl_files/dragontech/Software/DragonMemory/DragonMemory-${pkgver}.tgz ${pkgname}.desktop ${pkgname}.png)
noextract=("DragonMemory-${pkgver}.tgz")
md5sums=('c6e76ec2dcbc0cb6f63aa280bf26e233'
         'fb7d282fff66274357e50dd93f77a2e9'
         '738056d30ff38083f588b5611cd5f5ac'
         '69d4d37f7f8c9c2264f9bace31965b6e')

build() {
  tar -xf "${srcdir}/DragonMemory-${pkgver}.tgz"
}

package() {
  mkdir -p "${pkgdir}/usr/share/games/"
  cp -r "${srcdir}/Dragon Memory" "${pkgdir}/usr/share/games"
  install -D -m 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  chmod 755 "${pkgdir}/usr/share/games/Dragon Memory/${pkgname}"

	# Desktop launcher with icon
  install -D -m 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${srcdir}/${pkgname}.png"     "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

}
