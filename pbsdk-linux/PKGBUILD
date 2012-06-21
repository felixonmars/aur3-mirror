# Maintainer: Your Name <youremail@domain.com>
pkgname=pbsdk-linux
pkgver=1.1.0
pkgrel=1
epoch=0
pkgdesc="SDK for PocketBook 301+,302,360,360+,602,603,902,903"
arch=('i686' 'x86_64')
url="http://pbsdk.vlasovsoft.net/"
license=('GPL')
groups=()
depends=()
makedepends=(deb2targz tar)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("http://dl.dropbox.com/u/33538054/pbsdk/$pkgname-$pkgver.deb")
noextract=("$pkgname-$pkgver.deb")
md5sums=('9bdd9f4f1b4e9d132dc363e54b01a419')


build() {
  cd "$srcdir"
  deb2targz "$pkgname-$pkgver.deb"
}

package() {
  cd "$pkgdir"
  tar -zxvf "$srcdir/$pkgname-$pkgver.tar.gz"
}

# vim:set ts=2 sw=2 et:
