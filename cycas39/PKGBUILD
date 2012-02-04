# Contributor: Joaquim Coimbra <joaca_rj@yahoo.com.br>
pkgname=cycas39
pkgver=en_3.90_5_i386
pkgrel=1
pkgdesc="A simple yet powerful CAD for architecture"
arch=('i686' 'x86_64')
url="http://www.cycas.de/"
license=('unknown')
groups=('office')
depends=()
makedepends=('deb2targz')
source=('http://www.papierdrachen.de/cycas_linux/cycas39-en_3.90-5_i386.deb')
noextract=('$pkgname-en_3.90-5_i386.deb')
md5sums=('d9ca1269214ce154a60db61e0d3786fa')

build() {
  cd "$startdir/"
  mkdir "$startdir/pkg"
  deb2targz $pkgname-en_3.90-5_i386.deb
  tar -xvvzf $pkgname-en_3.90-5_i386.tar.gz -C "$startdir/pkg"
  mkdir "$startdir/pkg/usr/bin"
  mv "$startdir/pkg/usr/local/bin/cycas39" "$startdir/pkg/usr/bin"
  mv "$startdir/pkg/usr/local/bin/cycas39_verbose" "$startdir/pkg/usr/bin"
  rmdir "$startdir/pkg/usr/local/bin"
  rmdir "$startdir/pkg/usr/local"
  }

# vim:set ts=2 sw=2 et:
