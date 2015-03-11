# Maintainer: Andrew Grigorev <andrew@ei-grad.ru>

_pkgbase=btier
pkgname=btier-dkms
pkgver=1.3.11
pkgrel=1
pkgdesc="btier creates an automated tiered blockdevice (DKMS)"
arch=('i686' 'x86_64')
url="http://www.lessfs.com/"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
install=${pkgname}.install
source=("http://sourceforge.net/projects/tier/files/btier-1.3.11/btier-1.3.11.tar.gz/download"
        'dkms.conf'
        'Makefile')
md5sums=('65aa71b8d4cd4b927a7ec69b5d53ecc7'
         '361009d4e917d46b5f2e897a2d41e9e5'
         'fb912b4c01744fc95a03e5955106710e')

build() {
  cd ${_pkgbase}-${pkgver}
  msg2 "Building cli"
  make clionly
}

package() {

  msg2 "Copy cli..."
  cd ${_pkgbase}-${pkgver}/cli
  install -Dm755 -t "${pkgdir}/usr/bin/" btier_setup
  cd ../..

  msg2 "Copy dkms.conf..."
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  msg2 "Set name and version"
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  msg2 "Copy sources for dkms..."
  cp -r ${_pkgbase}-${pkgver}/kernel/btier/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  cp Makefile "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

}
