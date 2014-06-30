# $Id: 7aaecba3458bc81538fd699d59eab71520e33307 $
# Maintainer: Ido Rosen <ido@kernel.org>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
# 

pkgname='lmctfy'
pkgdesc="The open source version of Google’s container stack, which provides Linux application containers."
pkgver=0.4.5
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/google/lmctfy'
license=('Apache')
depends=('gflags' 're2' 'apparmor')
makedepends=('protobuf' 'gflags' 're2') # these are only available on AUR: 'gflags' 're2'
options=()
source=(https://github.com/google/lmctfy/archive/${pkgver}.tar.gz)
sha512sums=('c385023953de7b3bea09284ad6a7ee8b29cbf97b7427d6f49dbe7fa9b6d3bccaf00a0bbdd06db028c96fd62bc9e3d0df2df3292dd7cb21c3a2f44dee12971789')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make all
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # Install binaries:
  install -dm755                      "${pkgdir}/usr/bin"
  install -m755 bin/lmctfy/cli/lmctfy "${pkgdir}/usr/bin"
  install -m755 bin/nscon/cli/lmctfy-nscon "${pkgdir}/usr/bin"
  install -m755 bin/nscon/lmctfy-nsinit "${pkgdir}/usr/bin"

  # Install static library:
  install -dm755                  "${pkgdir}/usr/lib"
  install -m644 bin/liblmctfy.a   "${pkgdir}/usr/lib"
  install -m644 bin/lmctfy_cli.a  "${pkgdir}/usr/lib"

  # Install header files:
  install -dm755                      "${pkgdir}/usr/include"
  install -m644 include/lmctfy.h      "${pkgdir}/usr/include"
  install -m644 include/lmctfy.proto  "${pkgdir}/usr/include"

  # Install LICENSE file:
  install -dm755                  "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE           "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install documentation:
  install -dm755                  "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 AUTHORS           "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 CONTRIBUTORS      "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 LICENSE           "${pkgdir}/usr/share/doc/${pkgname}"
}
