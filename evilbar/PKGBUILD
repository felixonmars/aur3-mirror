# Maintainer: corvolino <corvolino@archlinux.com.br>

pkgname=evilbar
pkgver=1.2.1
pkgrel=5
pkgdesc="Small ncurses based bar designed to match the coolness of evilwm."
url="http://freshmeat.net/projects/evilbar"
license=("GPL")
arch=('i686' 'x86_64')
depends=('ncurses' 'xmms')
source=(http://freshmeat.net/projects/$pkgname-$pkgver.tar.gz)
md5sums=('fb93267570c167c4c9bfad65b88ee4bb')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$pkgdir/usr install
}



