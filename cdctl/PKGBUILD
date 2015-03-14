# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: portix <portix@gmx.de>

pkgname=cdctl
pkgver=0.15
pkgrel=3
pkgdesc="utility to control your cd/dvdrom drive"
url="http://cdctl.sourceforge.net"
license=(custom)
depends=('glibc')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz
        cdctl.diff )
md5sums=('0c969093d6845021f23f90ec1334d524'
         '7cb1ccd8c68b49d35ee9430323db39bc')


prepare() {
    cd ${srcdir}/${pkgname}-${pkgver}

    patch  -p1 -i $srcdir/cdctl.diff
}

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    ./configure
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}

    install -Dm 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
    install -Dm 644 README ${pkgdir}/usr/share/${pkgname}/README
    install -Dm 644 NEWS ${pkgdir}/usr/share/${pkgname}/NEWS
    install -Dm 644 NUTSANDBOLTS ${pkgdir}/usr/share/${pkgname}/NUTSANDBOLTS
    install -Dm 644 cdctl.1 ${pkgdir}/usr/share/man/man1/cdctl.1
    install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
