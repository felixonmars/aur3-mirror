# Maintainer: ava1ar <mail(at)ava1ar(dot)info>

pkgname=pbsdk
pkgver=1.1.0
pkgrel=2
pkgdesc="Unoficial SDK for PocketBook devices"
arch=('i686' 'x86_64')
url="http://pbsdk.vlasovsoft.net/"
license=('GPL')
options=('!strip')
source=("http://dl.dropbox.com/u/33538054/${pkgname}/${pkgname}-linux-1.1.0.deb")
sha1sums=('3de42a8667f683e7b8ce7a18cf150f3ede342623')

package() {
  cd ${srcdir}
  bsdtar -xf pbsdk-linux-${pkgver}.deb data.tar.gz
  bsdtar -xf data.tar.gz
  rm data.tar.gz
  mv usr "${pkgdir}"
}
