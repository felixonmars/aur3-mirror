# Contributor: naquad <naquad@gmail.com>
pkgname=http_load
pkgver=2006.3.12
pkgrel=1
pkgdesc="http_load is a webserver performance testing tool."
arch=(i686 x86_64)
url="http://www.acme.com/software/http_load/"
license=('GPL')
groups=('network')
makedepends=("pkgconfig")
provides=('http_load')
source=(http://www.acme.com/software/http_load/http_load-12mar2006.tar.gz)
md5sums=('d1a6c2261f8828a3f319e86ff0517219') #generated with 'makepkg -g'

build() {
  cd "$startdir/src/http_load-12mar2006"

  sed -ie 's#/usr/local/#/usr/#g' Makefile
  make || return 1
  mkdir -p "$startdir/pkg/usr/"{share/man/man1,bin}
  cp http_load "$startdir/pkg/usr/bin/"
  cp http_load.1 "$startdir/pkg/usr/share/man/man1"
}

# vim:set ts=2 sw=2 et:
