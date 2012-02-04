# Maintainer: Sychopx <infinity.illusion AT gmail DOT com>

pkgname=bitmate
pkgver=unknown
pkgrel=1
pkgdesc="BitTorrent client based on Vuze, BT for the Less Privileged."
arch=('i686')
url='http://www.dritte.org/bitmate.html'
license=('GPL')
depends=('java-runtime')
optdepends=('xulrunner: needed for browsing the vuze content')
conflicts=('vuze')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}.tar.gz")
md5sums=("086d5e8df9977aa1cc943526f3b69b90")

build() {
    install -d ${pkgdir}/usr/share
    cp -r ${pkgname} ${pkgdir}/usr/share

    install -Dm 755 ${pkgname}/vuze ${pkgdir}/usr/bin/vuze
    sed -i 's%#PROGRAM_DIR="/home/username/apps/azureus"%PROGRAM_DIR="/usr/share/bitmate"%' ${pkgdir}/usr/bin/vuze

    install -Dm644 ${pkgname}/vuze.png ${pkgdir}/usr/share/pixmaps/vuze.png
    install -Dm644 ${pkgname}/vuze.desktop ${pkgdir}/usr/share/applications/vuze.desktop
}
