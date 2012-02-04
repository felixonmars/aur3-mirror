# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=cbase
pkgver=1.3.5
pkgrel=1
pkgdesc="A C Foundation Library"
arch=('i686' 'x86_64')
url="http://www.hyperrealm.com/main.php?s=cbase"
license=('LGPL2')
depends=('expat')
options=('!libtool')
source=(http://www.hyperrealm.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('931eac69238f607effcc2ce71c6cc0f5')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr --enable-static=no
  make || return 1
  make DESTDIR=$pkgdir install

  rm $pkgdir/usr/share/info/dir
  gzip -9 $pkgdir/usr/share/info/*
  
}

# vim:set ts=2 sw=2 et:
