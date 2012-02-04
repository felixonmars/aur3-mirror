# Maintainer: Laszlo Papp <djszapi2 at gmail com>
pkgname=gpicp
pkgver=0.1.1
pkgrel=1
pkgdesc="Linux GUI front end for picp."
arch=('i686')
url="http://home.pacbell.net/theposts/picmicro/"
license=('GPL')
depends=('sdl')
source=('http://home.pacbell.net/theposts/picmicro/gpicp-0.1.1.tar.gz'
        'Makefile.diff'
        'Makegdasm.diff'
        'Makegpicp.diff')
md5sums=('336b9470f78de1afa136cf3f9fc6c0bd'
         '6cdc1eea1374d3eeddb2c089bffc96d6'
         '2ce21352287059c96c53ba5d8688aad3'
         '23e0386f0320d08a21380e731266ee79')

build() {
  patch "$srcdir/$pkgname-$pkgver/Makefile" Makefile.diff || return 1
  patch "$srcdir/$pkgname-$pkgver/Makegdasm" Makegdasm.diff || return 1
  patch "$srcdir/$pkgname-$pkgver/Makegpicp" Makegpicp.diff || return 1
  cd $srcdir/$pkgname-$pkgver
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
