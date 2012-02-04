# Contributor: yannsen <ynnsen@gmail.com>
pkgname=ethos
pkgver=0.2.2
pkgrel=6
pkgdesc="Plugin framework for GLib"
url="http://git.dronelabs.com/ethos/about/"
license="LGPL"
depends=(python gtk2)
makedepends=(intltool vala)
source=(http://ftp.dronelabs.com/sources/$pkgname/0.2/$pkgname-$pkgver.tar.gz)
md5sums=('36cf1ef444a224556bba4d441c400300')
arch=('i686' 'x86_64')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
