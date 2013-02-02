# Maintainer: nwxxeh <nwxxeh@gmail.com>

pkgname=tekkit
pkgver=latest
pkgrel=314
pkgdesc="Alter the world, traverse its skies and dive into its seas. Use technology and magic to build and destroy as you see fit, with your friends and against your enemies."
arch=(any)
license=('custom')
url="http://www.technicpack.net/tekkit/"
depends=('java-runtime' 'xorg-server-utils' 'openal')
noextract=('technic-launcher.jar')
source=(tekkit http://mirror.technicpack.net/Technic/technic-launcher.jar
         tekkit.desktop tekkit.png tekkit.install)

md5sums=('71e5d27ca414026add6ac59dd39b71e4'
         '90439147d67bd0edd08a48dc972fb8f6'
         '399591cac83defc96dbffc45656acfa2'
         '75a86ae01d87a5a567121b2e87b2e1bb'
         '651da358130cf724fe22df570b108838')

install='tekkit.install'

build() {
    cd "$srcdir" || return 1

    install -D -m755 "${srcdir}/tekkit"         "${pkgdir}/usr/bin/tekkit"
    install -D -m644 "${srcdir}/technic-launcher.jar"     "${pkgdir}/usr/share/tekkit/technic-launcher.jar"

    # Desktop launcher with icon
    install -D -m644 "${srcdir}/tekkit.desktop" "${pkgdir}/usr/share/applications/tekkit.desktop"
    install -D -m644 "${srcdir}/tekkit.png"     "${pkgdir}/usr/share/pixmaps/tekkit.png"
}

# vim:set ts=4 sw=4 et: