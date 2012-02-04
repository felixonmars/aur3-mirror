# Contributor: Gleb Sinyavsky <zhulik.gleb@gmail.com>

pkgname=ztasklist
pkgver=2.9
pkgrel=1
pkgdesc="Simple organizer written in c++ and qt"
arch=('i686' 'x86_64')
url="http://gleb-zhulik.ru/ztasklist"
license=('GPL')
depends=('qt' 'phonon')
source=("http://gleb-zhulik.ru/$pkgname-$pkgver.tar.gz")
md5sums=('d4bd438a1081a079eac66045f7237093')

build() {
  cd $srcdir/$pkgname
  qmake || return 1
  make || return 1
  make INSTALL_ROOT="$pkgdir/" install || return 1
} 
