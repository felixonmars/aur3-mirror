# Maintainer: Jeffrey Pohlmeyer <yetanothergeek at gmail dot com>

pkgname=fxite
pkgver=0.92
pkgrel=1
pkgdesc="The Free eXtensible Text Editor"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fxite/"
license=('GPL3')
depends=('fox>=1.6' 'lua51')
source=(http://fxite.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('5421f9688072eff5a2ba417e1057721c')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --with-system-lua
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver 
  make DESTDIR=$pkgdir install || return 1
}

