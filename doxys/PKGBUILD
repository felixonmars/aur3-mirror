# Contributor: Tong Chunli piggy1983@163.com
# Maintainer: Tong Chunli piggy1983@163.com
pkgname=doxys
pkgver=1_15
pkgrel=1
pkgdesc="A code documentation tool for C++/C"
url="http://www.doxys.dk/doxys_homepage/index.html"
license=("GPL")
#install=doxys.install
source=(http://www.doxys.org/download/doxys_${pkgver}_src.zip)
md5sums=('82ccae1ad58355042a8d28151d9d0612')
arch=("i686" "x86_64")

build() {
    cd "${srcdir}/${pkgname}_${pkgver}_0_src"
    ./configure --prefix "${pkgdir}/usr"
    make
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/${pkgname}_${pkgver}_0_src/build/doxys" "${pkgdir}/usr/bin/doxys"
}
 
