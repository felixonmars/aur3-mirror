# Maintainer: Jan Böhringer <janboe@gmail.com>

pkgname=pidgin-knotify
pkgver=0.2.1
pkgrel=1
pkgdesc="Plugin to use the native notifications of KDE4"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pidgin-knotify/"
license=('GPL')
depends=('pidgin' 'kdebase-runtime')
source=(http://pidgin-knotify.googlecode.com/files/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('b416649ab2ddca73c2a1fa3bf16d040f')
