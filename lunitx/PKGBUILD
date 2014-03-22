# Maintainer: perlawk

pkgname=lunitx 
_pkgname=lunit 
pkgver=0.7
pkgrel=1 
pkgdesc="Lunitx is an extension of lunit for lua."
url="https://github.com/dcurrie/lunit"
arch=(any)
license=('GPL')
depends=('lua')
install=
source=( https://github.com/dcurrie/lunit/archive/master.zip)

_install() {
	ver=$1
  install -m755 -d "$loc"$ver/lunitx "$loc"$ver/lunit  "$pkgdir"/usr/bin
	install -m755 -t "$loc"$ver/lunitx lunitx/*
	install -m755 -t "$loc"$ver/lunit lunit/*
  install -m755 -t "$loc"$ver lunit.lua lunitx.lua
}

package() {
	loc="$pkgdir/usr/share/lua/5."
  cd "$srcdir"/$_pkgname-master/lua
	_install 1
	_install 2

  install -m755 ../extra/lunit.sh "$pkgdir"/usr/bin/lunit
}
md5sums=('8bb5bc6a5b07bc578db560e6c32d47a6')
