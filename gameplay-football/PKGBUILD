# Maintainer: Vasco Nunes <vascomfnunes@gmail.com>

pkgname=gameplay-football
pkgver=0.8
pkgrel=2
pkgdesc="A 3D football game"
arch=(i686 x86_64)
url="http://www.properlydecent.com/"
license=('custom:nonfree')
depends=('sdl_image' 'sdl_ttf' 'openal' 'libpng')
makedepends=()

md5sums=('5b349c81d8cd608c31f8f6c80e718ebe'
         'ddd96f9f7181b0b7be3073c28dae5a1c'
         'db144b5c695a9a5035cc9342124d3803'
         '964191dbdf982ed42c118acafdbc42d6')

[ "$CARCH" = "x86_64" ] && depends=('lib32-sdl_image' 'lib32-sdl_ttf' 'lib32-openal' 'lib32-libpng')

source=(http://www.properlydecent.com/releases/GameplayFootballPublicBeta08_linux.tar.gz
    gameplay-football.desktop
    gameplay-football
    gameplay-football.png)

package() {
    mkdir -p "${pkgdir}"/opt/gameplay-football
    cd "${pkgdir}"/opt/gameplay-football
    rm -rf *
    mv -f "${srcdir}"/GameplayFootballPublicBeta08/* "${pkgdir}"/opt/gameplay-football/
    chmod 775 "${pkgdir}"/opt/gameplay-football
    chown -R root:games "${pkgdir}"/opt/gameplay-football
    chmod 666 "${pkgdir}"/opt/gameplay-football/football.config
    install -Dm755 "${srcdir}"/gameplay-football "${pkgdir}"/usr/bin/$pkgname
    install -Dm644 "${srcdir}"/gameplay-football.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
    install -Dm644 "${srcdir}"/gameplay-football.png "${pkgdir}"/usr/share/pixmaps/gameplay-football.png
}
