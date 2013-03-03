# Contributor: Iru Cai <mytbk920423@gmail.com>

pkgname=yais
pkgver=0.3
pkgrel=1
pkgdesc="Yet Another Installation Script for Archlinux"
arch=('any')
url="https://github.com/mytbk/yais"
license=('GPL')
depends=('arch-install-scripts')
optdepends=(
  'vim: a good editor'
  'gparted: partitioning tool with GUI')
source=("https://raw.github.com/mytbk/$pkgname/master/packages/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('ff485414d77706f8d2f90ee8746e785f')

build() {
  true
}

package() {
  cd "${srcdir}/yais"
  make DESTDIR="${pkgdir}" install
#make an /arch/setup link
  mkdir ${pkgdir}/arch
  ln -s /usr/bin/yais ${pkgdir}/arch/setup
}

# vim:set ts=2 sw=2 et:
