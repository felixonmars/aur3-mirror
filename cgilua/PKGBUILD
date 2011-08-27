# Maintainer: Laszlo Papp <djszapi @ archlinux us>
pkgname=cgilua
pkgver=5.1.3
pkgrel=1
pkgdesc="A tool for building CGI scripts with Lua"
arch=('i686' 'x86_64')
url="http://www.keplerproject.org/cgilua/"
license=('GPL')
source=(http://luaforge.net/frs/download.php/3970/$pkgname-$pkgver.tar.gz)
md5sums=('2ced64596d89ef899575090f7bf083be')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s/\/usr\/local/$(PWD)..\/..\/pkg\/usr/g" Makefile || return 1
  make install || return 1
}

