# Maintainer: Liu Wei <mylwjef@gmail.com>

pkgname=nali
pkgver=0.2.1
pkgrel=1
pkgdesc='Get IP Geolocation with QQwry.dat'
arch=('i686' 'x86_64')
url="https://code.google.com/p/qqwry/"
optdepends=('dig')
license=('GPL')
source=("https://github.com/lwjef/nali/tarball/$pkgver")
md5sums=('d261d5d6e85e6d5a9b20921ff9c86e86')

build() {
    cd ${srcdir}/lwjef-${pkgname}*
    ./configure --prefix=/usr
    make
}

package() {
    mkdir -p ${pkgdir}/usr/share/${pkgname}/
    mkdir -p ${pkgdir}/usr/bin/
    cd ${srcdir}/lwjef-${pkgname}*

    install -Dm755 bin/qqwrynali ${pkgdir}/usr/bin
    install -Dm755 bin/nali ${pkgdir}/usr/bin
    install -Dm755 bin/nali-traceroute ${pkgdir}/usr/bin
    install -Dm755 bin/nali-tracepath ${pkgdir}/usr/bin
    install -Dm755 bin/nali-dig ${pkgdir}/usr/bin
    install -Dm755 bin/nali-nslookup ${pkgdir}/usr/bin
    install -Dm755 bin/nali-ping ${pkgdir}/usr/bin
    install -Dm755 bin/nali-update ${pkgdir}/usr/bin
    install -Dm644 share/QQWry.Dat ${pkgdir}/usr/share/${pkgname}/
    install -Dm644 share/nali.pl ${pkgdir}/usr/share/${pkgname}/
}
