# Maintainer: oliver < a t >  first . in-berlin . de

pkgname=any-dl
pkgver=0.9.4.b
pkgrel=1
pkgdesc="Generic video downloader for principially any site."
arch=('i686' 'x86_64')
license=('GPL3')
source=(http://www.first.in-berlin.de/software/tools/any-dl/any-dl-0.9.4b.tgz)
md5sums=('a7f3c92c972dc53069b4d7936116aae6')
url="http://www.first.in-berlin.de/software/tools/any-dl/"


build() {
cd ${srcdir}/${pkgname}-${pkgver}
make
}


package() {
install -Dm 644 any-dl ${pkgdir}/usr/bin/   # install to Arch-Linux path
}
