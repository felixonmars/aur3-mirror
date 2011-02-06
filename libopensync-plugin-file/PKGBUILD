# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
pkgname=libopensync-plugin-file
pkgver=0.22
pkgrel=1
pkgdesc='File plugin for OpenSync'
url='http://www.opensync.org'
license=('LGPL')
arch=('i686' 'x86_64')
depends=('libopensync')
source=(http://www.opensync.org/download/releases/$pkgver/$pkgname-$pkgver.tar.bz2)
options=('!libtool')
md5sums=('d600836ab5182751d07ea42c6b997eb4')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}
