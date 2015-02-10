# Maintainer:Hugo Jiménez Hernández  <hugo@igeko.es>

pkgname=clowds
pkgver=0.0.3a
pkgrel=1
pkgdesc="Synchronize all your files securely and easily with any cloud storage service"
arch=('x86_64')
license=('custom')
url="http://www.clowds.net/"
depends=('qt5-base')
source=(http://clowds.net/download/clowds_pro64_last.tar.gz
        clowds.desktop clowds.png LICENSE)
md5sums=('8cb735d7c2b023270489d4fca36a85da'
         'dc06af2c2c14abf75c999c44700c130f'
         '43e0ce2bd2bda2df533cea51a54b435a'
         '76c125b7f08e0b4103c9d0b85b07bc71')


package() {
    cd "$srcdir"
    tar zxf clowds_pro64_last.tar.gz
    install -D -m755 "${srcdir}/Clowds"     "${pkgdir}/usr/bin/clowds"

    # Desktop launcher with icon
    install -D -m644 "${srcdir}/clowds.desktop" "${pkgdir}/usr/share/applications/clowds.desktop"
    install -D -m644 "${srcdir}/clowds.png"     "${pkgdir}/usr/share/pixmaps/clowds.png"

    # License
    install -D -m644 "${srcdir}/LICENSE"           "${pkgdir}/usr/share/igeko/clowds/LICENSE"

}

# vim:set ts=4 sw=4 et:
