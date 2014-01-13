# Maintainer: Zifei Tong <soariez@gmail.com>

pkgname=abi-dumper
pkgver=0.99.7
pkgrel=1
pkgdesc="A tool to dump ABI of an ELF object containing DWARF debug info"
arch=('any')
url="https://github.com/lvc/abi-dumper"
license=('GPL')
depends=(elfutils perl vtable-dumper)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/lvc/abi-dumper/archive/${pkgver}.tar.gz)
md5sums=('6a51053416adfd2237eafe2cb0fae14f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr"
  perl Makefile.pl -install --prefix=/usr --destdir="${pkgdir}"
}
