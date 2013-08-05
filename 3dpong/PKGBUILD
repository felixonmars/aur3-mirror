#Contributor: Kevin Edmonds <edmondskevin@hotmail.com>
#Contributor: Tanner Danzey <arkaniad@gmail.com>
pkgname=3dpong
pkgver=0.5
pkgrel=4
pkgdesc="one- or two-player, three dimensional sports game, based on Pong"
url="http://www.newbreedsoftware.com/3dpong/index2.php3"
depends=(libx11)
source=(ftp://ftp.billsgames.com/unix/x/3dpong/src/$pkgname-$pkgver.tar.gz)
md5sums=('91594c0fd5def93053d911e037f5a383')
license="GPL"
arch=('x86_64' 'i686')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  make PREFIX=$pkgdir/usr DESTDIR=$pkgdir install
}

