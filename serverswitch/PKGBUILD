# Syco <SycoLTH at gmail dot com>

pkgname=serverswitch
pkgver=2.3
pkgrel=0
pkgdesc="GNOME daemon switch applet written in Java/GTK."
arch=('i686' 'x86_64')
url="http://www.albertorinaudo.info"
license=('GPL')
install='post.install'
depends=('jre' 'java-gnome')
source=(ServerSwitch.jar
        ServerSwitch.png
        ServerSwitch
        ServerSwitch.desktop
        ServerSwitch_auto.desktop)
md5sums=('22445a54bb2ad86bf7403aed1f0e13d8'
         '95932d3fe2e03e4903ecb3be8c44323b'
         'd2732da3de9b07da585225d7c95dd81e'
         '3f150e9c30cb1b558376a5f4ec727907'
         '34108e9b3d9a7b84d2295c6fb3d8ee15')

build () {
    install -D -m 644 ${srcdir}/ServerSwitch.jar ${pkgdir}/opt/ServerSwitch/ServerSwitch.jar
    install -D -m 644 ${srcdir}/ServerSwitch.png ${pkgdir}/opt/ServerSwitch/ServerSwitch.png
    install -D -m 755 ${srcdir}/ServerSwitch ${pkgdir}/usr/bin/ServerSwitch
    install -D -m 755 ${srcdir}/ServerSwitch.desktop ${pkgdir}/usr/share/applications/ServerSwitch.desktop
    install -D -m 755 ${srcdir}/ServerSwitch_auto.desktop ~/.config/autostart/ServerSwitch.desktop
    ln -s /usr/share/java/ ${pkgdir}/opt/ServerSwitch/lib
}
