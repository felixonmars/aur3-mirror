#Maintainer: Jarek Sedlacek
pkgname=obpager
pkgver=1.8
pkgrel=8
pkgdesc="Pager for OpenBox writen in C++"
arch=('i686' 'x86_64')
url="http://obpager.sourceforge.net/"
license=('GPL')
depends=('gcc-libs' 'libxext')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
_aururl="http://aur.archlinux.org/packages/obpager/obpager"
source=("http://downloads.sourceforge.net/obpager/$pkgname-$pkgver.tar.gz" "obpager.patch")

noextract=()
md5sums=('2a76036df57042751079de913cb0f216'
         'f096f7718a1b47f8adb034e21e398ab8')

build() {
  unset LDFLAGS
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i../obpager.patch
  make || return 1
  install -d "$pkgdir/usr/bin"
  make DESTDIR=$pkgdir/usr/bin install
}
