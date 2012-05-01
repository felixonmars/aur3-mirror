# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=unmass
pkgver=0.92
pkgrel=1
pkgdesc="A tool to extract game archives"
arch=('i686' 'x86_64')
url="http://mirex.mypage.sk/"
license=('GPL')
depends=('gcc-libs')
source=("http://mirex.mypage.sk/FILES/${pkgname}-${pkgver}.tar.gz")
md5sums=('17d3216936025cfc674f7f4e2b8e3e6b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/kdev_cmd"
  cp ../src/* src
  ./configure --prefix=/usr
  sed -i "s/DEFS = /&-DUNIX /" src/Makefile
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/kdev_cmd"
  make DESTDIR="${pkgdir}" install
  ln -s "/usr/bin/${pkgname}_kdev" "${pkgdir}/usr/bin/${pkgname}"
}
