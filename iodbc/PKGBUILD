# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages

pkgname=iodbc
pkgver=3.52.7
pkgrel=1
pkgdesc="Independent Open DataBase Connectivity for Linux, MacOS X and Unix systems"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.iodbc.org"
source=("http://www.iodbc.org/downloads/iODBC/lib$pkgname-$pkgver.tar.gz")
md5sums=('ddbd274cb31d65be6a78da58fc09079a')

build() {
	cd $srcdir/lib$pkgname-$pkgver

	./configure --prefix=/usr \
    --with-iodbc-inidir=/etc \
    --disable-gtktest || return 1
  
	make || return 1
}

package() {
	cd $srcdir/lib$pkgname-$pkgver
  
  make DESTDIR=$pkgdir install || return 1

  # Licenses
  mkdir -p $pkgdir/usr/share/license/$pkgname/ || return 1
  install -Dm444 LICENSE $pkgdir/usr/share/license/$pkgname/ || return 1
  install -Dm444 LICENSE.LGPL $pkgdir/usr/share/license/$pkgname/ || return 1
  install -Dm444 LICENSE.BSD  $pkgdir/usr/share/license/$pkgname/ || return 1
}

# vim:set ts=2 sw=2 et:
