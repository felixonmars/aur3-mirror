# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>

pkgname=dkms-intel-rst
pkgver=0.01
pkgrel=1
pkgdesc="Kernel module for Intel Rapid Start Technology"
arch=('i686' 'x86_64')
url=("https://bitbucket.org/kassick/intel-rst/")
license=('GPL')
depends=('dkms')
makedepends=('git')
optdepends=('linux-headers: needed if using ARCH provided kernel'
        'linux-lts-headers: needed if using the archlinux lts kernel')
install='intel-rst.install'
source=('git+https://bitbucket.org/kassick/intel-rst.git#commit=161712a89055a598d5548ab1a0d57a7b770e6e45')
sha512sums=('SKIP')
_gitname=intel-rst

package() {
  cd "${_gitname}"
  install -dm755 "${pkgdir}/usr/src/intel-rst-${pkgver}/"
  for i in "${srcdir}/${_gitname}/"{Makefile,intel-rst.c}; do
    install -m644 "${i}" "${pkgdir}/usr/src/intel-rst-${pkgver}/"
  done
  install -m644 "dkms.conf" "${pkgdir}/usr/src/intel-rst-${pkgver}/dkms.conf"
}

