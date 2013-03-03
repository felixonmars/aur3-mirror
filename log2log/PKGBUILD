# Maintainer: Igor Duarte Cardoso <igordcard@gmail.com>
pkgname=log2log
pkgver=1.0.0
pkgrel=5
pkgdesc="Can't download Meebo chat logs? Shot that Adium duck? Pidgin poop? Log2Log: The all-in-one solution to chat log conversion!"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/log2log/"
license=('GPL3')
depends=('qt4>=4.3.0')
provides=(log2log)
conflicts=(log2log)
source=("https://downloads.sourceforge.net/sourceforge/log2log/sources/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('5b9334061a1ebd1ed75ef3f5d6b62e09')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake-qt4
  make DESTDIR=${pkgdir}
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
}
