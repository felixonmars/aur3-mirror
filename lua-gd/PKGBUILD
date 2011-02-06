# Contributor: EdwardXXIV <blei42@gmail.com>
# Maintainer: Laszlo Papp <djszapi at archlinux us>

pkgname=lua-gd
pkgver=2.0.33r2
pkgrel=2
pkgdesc="An image manipulation library based on the GD library."
arch=('i686' 'x86_64')
url="http://lua-gd.luaforge.net/"
license=('GPL')
depends=('gd' 'lua')
source=("http://luaforge.net/frs/download.php/1592/$pkgname-$pkgver.tar.gz"
        'Makefile.arch')
md5sums=('69e9c07ce208ce13d4373177c2e24df0'
         '7c50ec3b6c2b93f80d599ca1a07c2b10')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make -f ../Makefile.arch || return 1
  install -D -m755 gd.so $pkgdir/usr/lib/lua/5.1/gd.so
}
