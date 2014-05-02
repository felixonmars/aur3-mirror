# Maintainer: bitwave <aur [at] oomlu [d0t] de>
# Contributor: Andrew Zuban <and.zuban@gmail.com>
pkgname=novacoin
pkgver=0.4.4.6
_version=${pkgver}-nvc-update3
pkgrel=1
pkgdesc="NovaCoin - a hybrid scrypt PoW + PoS based cryptocurrency."
arch=('i686' 'x86_64')
url="http://novacoin.org"
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4')
provides=('novacoin')
conflicts=('novacoin')
install=novacoin.install
license=('MIT')
sha1sums=('a51f7efc8cb47191e6ab0b58952a4bfb45208792'
          '92d0b71ff1922fcd4175a47bdd6d54638b9c1d76')

source=("https://github.com/novacoin-project/novacoin/archive/v${_version}.tar.gz"
	"${pkgname}.desktop")

build() {
    cd "${srcdir}/${pkgname}-${_version}"

    qmake-qt4
    make
    cd src
    make ${MAKEFLAGS} -f makefile.unix novacoind
}

package() {
    mkdir -p ${pkgdir}/usr/bin
    install -D -m755 "${srcdir}/${pkgname}-${_version}/novacoin-qt" ${pkgdir}/usr/bin
    install -D -m755 "${srcdir}/${pkgname}-${_version}/src/novacoind" "${pkgdir}/usr/bin"
    install -D -m644 "${srcdir}/${pkgname}-${_version}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "${srcdir}/${pkgname}-${_version}/src/qt/res/icons/${pkgname}-128.png" \
"${pkgdir}/usr/share/pixmaps/${pkgname}128.png"
    mkdir -p ${pkgdir}/usr/share/applications
    install -D -m644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/
}