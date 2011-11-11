pkgname=elfkickers
pkgver=3.0a
pkgrel=1
pkgdesc="A collection of programs for dealing with the ELF file format"
arch=(i686 x86_64)
license=(GPL)
depends=('gcc')
makedepends=('make')
source=(http://www.muppetlabs.com/~breadbox/pub/software/ELFkickers-${pkgver}.tar.gz)
url="http://www.muppetlabs.com/~breadbox/software/elfkickers.html"
md5sums=('0e70f027d13858856e7efae51a37868c')

build() {
  cd ${startdir}/src/ELFkickers-${pkgver}
  make || return 1
  mkdir -p ${pkgdir}/usr/bin ${pkgdir}/usr/share/man/man1
  make prefix=${pkgdir}/usr install
}
