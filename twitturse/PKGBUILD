# Maintainer: Erus <erus.iluvatar@gmail.com>

pkgname=twitturse
pkgver=0.1.1
pkgrel=1
pkgdesc="An ncurses client, writter in C for Twitter"
url="http://www.nicosphere.net/twitturse-un-client-ncurses-ecrit-en-c-pour-twitter-1765/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxml2' 'curl')
source=(http://src.nicosphere.net/twitturse/$pkgname-$pkgver.tar.bz2)
md5sums=('8bfb3f826d160558855aff618d0b5b1b')

build() {
  cd $srcdir/$pkgname
  
  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install || return 1

}
