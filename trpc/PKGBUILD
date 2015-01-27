# Maintainer : Rob McCathie <korrode AT gmail>
# Contributor: Xemertix <arch88(at)katamail(dot)com>

pkgname=trpc
pkgver=20120628
pkgrel=2
pkgdesc="The TreeP programming language compiler"
arch=('i686' 'x86_64')
url="http://fsinapsi.altervista.org"
license=("GPL")
depends=("trpc-libs=${pkgver}" "libpng" "libjpeg-turbo")
source=("${url}/code/treep/trp-${pkgver}.zip")
sha1sums=('efddf46157e765a0134e474d2ee01a8fa6c6ca65')

build() {
  cd "${srcdir}/trp-${pkgver}/compiler"
  make bootstrap
}

package() {
  install -Dm755 "${srcdir}/trp-${pkgver}/compiler/trpc" "${pkgdir}/usr/bin/trpc"
}
