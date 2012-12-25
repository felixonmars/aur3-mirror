# Maintainer: Solkin <inbox@tomlaw.com>
# Author: Solkin <inbox@tomlaw.com>

pkgname=siphon
pkgver=1.0
pkgrel=2
epoch=
pkgdesc="Utility to send files via direct connection, written in C"
arch=('i686' 'x86_64')
url="https://github.com/solkin/siphon"
license=('GPL')
groups=()
depends=('glibc')
makedepends=('gcc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname-$pkgver.zip)
noextract=()
md5sums=('443ef762c1e5affb026a9db1e2473284')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  #  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
