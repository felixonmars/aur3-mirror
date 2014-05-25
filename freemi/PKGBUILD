# Maintainer: Nicolas LLOBERA <nllobera at gmail dot com>

pkgname=freemi
pkgver=2.0.8
pkgrel=3
pkgdesc="FreeMi UPnP Media Server est un serveur UPnP audio/vidéo pour la FreeBox."
arch=('any')
url="http://freemiupnp.fr"
license=('Apache')
depends=('mono')
backup=('opt/FreeMi/user.config')
source=(http://freemiupnp.fr/download/FreeMiMono.zip FreeMi.desktop FreeMi.png)
md5sums=('54cbba661bf244d1021cd87b75b1c2ff'
         '4f9f1e0d8151cd9be06ef4ca83ce85c7'
         '911c71f4a6b320f605f6b8915e6beee0')

package() {
    cd "${srcdir}"
    
    install -D -m 644 FreeMi.desktop "${pkgdir}/usr/share/applications/FreeMi.desktop"
    install -D -m 644 FreeMi.png "${pkgdir}/opt/FreeMi/FreeMi.png"
    install -D -m 666 /dev/null "${pkgdir}/opt/FreeMi/user.config"
    
    rm FreeMi.desktop
    rm FreeMiMono.zip
    rm FreeMi.png
    cp -R . "${pkgdir}/opt/FreeMi"
}
