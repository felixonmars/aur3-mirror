# $Id: 21155555adfdfa0847d0df16306f08764479e45c $
# Maintainer: Ido Rosen <ido@kernel.org>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
# 

pkgname='lmctfy-git'
pkgdesc="The open source version of Google’s container stack, which provides Linux application containers."
pkgver=0.1.0.19.407ec2e
pkgrel=2
arch=('i686' 'x86_64')
url='https://github.com/google/lmctfy'
license=('Apache')
depends=()
makedepends=('protobuf') # these are only available on AUR: 'gflags' 're2'
options=()
source=('lmctfy-git::git+https://github.com/google/lmctfy.git')
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "0.1.0.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make all
}

check() {
  cd "${srcdir}/${pkgname}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}"
  
  # Install binaries:
  install -dm755                      "${pkgdir}/usr/bin"
  install -m755 bin/lmctfy/cli/lmctfy "${pkgdir}/usr/bin"

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
