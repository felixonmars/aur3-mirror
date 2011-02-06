# Maintainer: Aliaksiej Artamonaŭ <aliaksiej.artamonau@gmail.com>

pkgname=java-bcel
pkgver=5.2
pkgrel=1
pkgdesc='A library to analyze, create and manipulate Java classfiles'
arch=('i686' 'x86_64')
url='http://jakarta.apache.org/bcel/'
license=('APACHE')
depends=('java-runtime')

source=("http://apache.osuosl.org/jakarta/bcel/binaries/bcel-${pkgver}.tar.gz")
md5sums=('19bffd7f217b0eae415f1ef87af2f0bc')

build() {
    install -d -m755 ${pkgdir}/usr/share/java/bcel || return 1
    install -m655 \
        ${srcdir}/bcel-${pkgver}/bcel-${pkgver}.jar \
        ${pkgdir}/usr/share/java/bcel/bcel.jar || return 1
}
