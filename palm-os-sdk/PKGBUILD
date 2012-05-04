# Maintainer: Chuan Ji <jichuan89@gmail.com>
pkgname=palm-os-sdk
pkgver=5.0r3
pkgrel=2
epoch=
pkgdesc='Palm OS SDK'
arch=('i686' 'x86_64')
url='http://www.accessdevnet.com/index.php/Garnet-OS-SDK-68K-R3-PRC-tools-Generic-UNIX/View-category.html'
license=('custom')
depends=()
makedepends=('tar')
install='palm-os-sdk.install'
source=('palmos-sdk-5.0r3-1.tar.gz.tar')
md5sums=('0a275806b7d984aad89e45bea7cb782d')
options=('!strip')

package() {
  cd "$pkgdir"
  mkdir -p opt/palmdev
  cd opt/palmdev
  tar xf "$srcdir/palmos-sdk-5.0r3-1.tar.gz.tar"
}
