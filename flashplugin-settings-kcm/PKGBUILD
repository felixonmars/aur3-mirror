# Contributor: Jekyll Wu<adaptee [at] gmail [dot] com>

pkgname=flashplugin-settings-kcm
pkgver=10.3.183.10
pkgrel=1
pkgdesc='KDE control module for setting up flashplugin(32 bit only)'
url='http://get.adobe.com/flashplayer'
license=('custom')
arch=('i686')
depends=("flashplugin=${pkgver}" "kdebase-workspace" )
install=('kcm.install')
source=('http://fpdownload.macromedia.com/get/flashplayer/current/install_flash_player_10_linux.tar.gz')

build() {

    # control module
    install -D -m755 ${srcdir}/usr/lib/kde4/kcm_adobe_flash_player.so \
                     ${pkgdir}/usr/lib/kde4/kcm_adobe_flash_player.so

    # serice entry
    install -D -m644 ${srcdir}/usr/share/kde4/services/kcm_adobe_flash_player.desktop \
                     ${pkgdir}/usr/share/kde4/services/kcm_adobe_flash_player.desktop

}
md5sums=('f04482fcfa0ccd081447d15341762978')
