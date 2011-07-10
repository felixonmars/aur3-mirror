# Contributor: wido <widomaker2k7@gmail.com>

pkgname=lxbdplayer
pkgver=0.2.1
pkgrel=2
pkgdesc="a simple software for read easily a bluray disc."
arch=('i686' 'x86_64')
depends=('mplayer' 'java-runtime')
provides=(lxbdplayer)
license=(GPL3)
url="http://sourceforge.net/projects/lxbdplayer/"
source=(http://prdownloads.sourceforge.net/${pkgname}/${pkgname}_${pkgver}_all.deb)
md5sums=('0a329606852dcf862dff09777cd1c4b0')

build(){
    cd ${srcdir}
    ar p ${pkgname}_${pkgver}_all.deb data.tar.gz | tar zx

    install -Dm755 ${srcdir}/usr/bin/lxbdplayer ${pkgdir}/usr/bin/lxbdplayer
    install -Dm644 ${srcdir}/usr/share/applications/lxbdplayer.desktop ${pkgdir}/usr/share/applications/lxbdplayer.desktop
    install -Dm644 ${srcdir}/usr/share/doc/lxbdplayer/copyright ${pkgdir}/usr/share/doc/lxbdplayer/copyright
    install -Dm755 ${srcdir}/usr/share/lxbdplayer/lxBDPlayer.jar ${pkgdir}/usr/share/lxbdplayer/lxBDPlayer.jar
    #install -Dm644 ${srcdir}/usr/share/lxbdplayer/showkeys_x86.so ${pkgdir}/usr/share/lxbdplayer/showkeys_x86.so || return 1
    #install -Dm644 ${srcdir}/usr/share/lxbdplayer/showkeys_x86_64.so ${pkgdir}/usr/share/lxbdplayer/showkeys_x86_64.so || return 1

    install -Dm644 ${srcdir}/usr/share/menu/lxbdplayer ${pkgdir}/usr/share/menu/lxbdplayer
    install -Dm644 ${srcdir}/usr/share/pixmaps/lxBDPlayer.png ${pkgdir}/usr/share/pixmaps/lxBDPlayer.png
}
