# Maintainer: Devin Smittle <dzs6w3@gmail.com>
pkgname=snewpy  
pkgver=0.0.3.0
pkgrel=2
pkgdesc="A CLI front-end for Warcraft III using libsnewpy."
url="https://sourceforge.net/projects/snewpy/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libsnewpy')
makedepends=()
conflicts=()
replaces=()
backup=()
install=snewpy.install
source=($pkgname-$pkgver.tar.gz)
md5sums=('58ff1a00dc1358c601c39832f311a474')
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --disable-set-suid
  make || return 1
  make DESTDIR=$startdir/pkg install
}