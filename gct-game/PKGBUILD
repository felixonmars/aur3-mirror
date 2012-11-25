# Maintainer: Ivo Nunes <ivo@ivonunes.net>

pkgname=gct-game
pkgver=201105
pkgrel=1
pkgdesc="Game based on GTA 1 and GTA 2"
arch=(i686 x86_64)
_arch=x86
url="http://gct-game.net"
license=('custom:nonfree')
depends=('wxgtk' 'sdl_image' 'sdl_ttf' 'openal' 'libpng' 'nvidia-cg-toolkit')
makedepends=()

md5sums=('46d79e80acd75235ea206a4a8f79af14'
    	 '73adcb3fc70a1ad871ec05a50241201b'
	     '3d3b8b62b47e6d9e19f35f09af3c9cac'
	     '2501378149ed9e80c457e3c6e612d971')

[ "$CARCH" = "x86_64" ] && md5sums[0]='30d8ac22eb0d417abf912886f1ad89cc'
[ "$CARCH" = "x86_64" ] && _arch=x86_64

source=(http://gct-game.net/files/GCT-may-2011-linux-$_arch.tar.gz
	gct-game.desktop
	gct-game
	gct-game.png)

package() {
        mkdir -p "${pkgdir}"/opt/GCT
        cd "${pkgdir}"/opt/GCT
        rm -rf *
        mv -f "${srcdir}"/GCT-may-2011-linux-$_arch/* "${pkgdir}"/opt/GCT/
        rm -rf install.sh
        chmod 775 "${pkgdir}"/opt/GCT
        chown -R root:games "${pkgdir}"/opt/GCT
        install -Dm755 "${srcdir}"/gct-game "${pkgdir}"/usr/bin/$pkgname
        install -Dm644 "${srcdir}"/gct-game.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
        install -Dm644 "${srcdir}"/gct-game.png "${pkgdir}"/usr/share/pixmaps/gct-game.png
}
