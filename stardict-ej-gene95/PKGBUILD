# Maintainer: jeneshicc <jeneshicc@gmail.com>
pkgname=stardict-ej-gene95
pkgver=2.4.2
pkgrel=3
pkgdesc="English-Japanese dictionary for Stardict"
arch=('any')
url="http://stardict.sourceforge.net"
license=('GPL')
source=(http://reciteword.cosoft.org.cn/stardict-iso/stardict-dic/ja/${pkgname}-${pkgver}.tar.bz2)

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    install -d ${pkgdir}/usr/share/stardict/dic/
    install -m 644 ./* $pkgdir/usr/share/stardict/dic/
}
md5sums=('e63960542dd74afb63ada5108d7e5e9a')
