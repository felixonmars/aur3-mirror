# Maintainer: Bodil Stokke <bodil@bodil.org>

pkgname=fortune-mod-horse_ebooks
pkgver=1.0
pkgrel=1
pkgdesc="Fortune quotes from @horse_ebooks, via http://horsefortun.es/"
arch=('any')
license=('GPL')
url=('http://horsefortun.es/')
depends=('fortune-mod')
horsetag="3753"
source=("http://horsefortun.es/fortune/${horsetag}")
md5sums=('aa5521b13a73e3394abde0fef25e78c9')

build() {
    cd "${srcdir}"
    strfile ${horsetag}
}

package() {
    cd "${srcdir}"
    install -d "${pkgdir}/usr/share/fortune"
    install -m644 ${horsetag} "${pkgdir}/usr/share/fortune/horse_ebooks"
    install -m644 ${horsetag}.dat "${pkgdir}/usr/share/fortune/horse_ebooks.dat"
}
