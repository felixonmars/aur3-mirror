# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=wmfishtime
pkgver=1.24
pkgrel=2
pkgdesc="A clock that also simulates a fish tank"
arch=('i686' 'x86_64')
url="http://www.ne.jp/asahi/linux/timecop/"
license=('GPL')
depends=('gtk2')
source=("http://www.ne.jp/asahi/linux/timecop/software/${pkgname}-${pkgver}.tar.gz"
        "makefile.patch")
md5sums=('8723b7c6a58b8c41a1dd5973ede4b296'
         '97d0e75face49ade8164afd4fcce6345')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ../makefile.patch
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
