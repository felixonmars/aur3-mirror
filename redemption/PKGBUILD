# Maintainer: Martin Potier <mpo@wallix.com>
pkgname=redemption
pkgver=0.5.6
pkgrel=0
pkgdesc="A RDP proxy that plays nice with protocols"
arch=('i686' 'x86_64')
url="https://github.com/wallix/redemption"
license=('GPL')
groups=()
depends=('boost-libs' 'openssl' 'glibc' 'libx11')
makedepends=('boost' 'cmake' 'make' 'gcc')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/wallix/$pkgname/tarball/$pkgver")
noextract=()
md5sums=('e90437ddcf94f754fcab8582aba9bc39') #generate with 'makepkg -g'

build() {
  if [[ ! -d $srcdir/$pkgname-$pkgver ]]
  then
    mv "$srcdir/wallix-redemption-c7b239d" "$srcdir/$pkgname-$pkgver"
  fi

  cd "$srcdir/$pkgname-$pkgver"

  if [[ ! -d "build" ]]
  then
    mkdir "build"
  fi

  cd "build"
  cmake ..
  make 2> log

  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  cd "build"

  make install DESTDIR=$pkgdir
}
