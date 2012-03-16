pkgname=elliptics
pkgrel=1
pkgver=2.13.0.2
pkgdesc="A new DHT implementation from the author of the in-kernel distributed filesystem POHMELFS"
arch=('i686' 'x86_64')
url="http://ioremap.net/projects/elliptics"
license=('GPL')
makedepends=('make' 'gcc' 'git' 'autoconf' 'automake')
optdepends=('fcgi' 'tokyotyrant' 'libatomic' 'db')
source=("$pkgname-$pkgver::http://www.ioremap.net/cgi-bin/gitweb.cgi?p=elliptics.git;a=snapshot;h=7c38a140ac68952e57c5b03c8dea134cf10d9585;sf=tgz")
md5sums=('f581b4788582556d183c843acd691137')

build() {
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"
  export LDFLAGS="${LDFLAGS//,--as-needed}"
  export LDFLAGS="${LDFLAGS//--as-needed}"
  cd "$srcdir/elliptics-05d3a4f"

  msg "Done, building elliptics..."
  ./autogen.sh
  env PYTHON=/usr/bin/python2 ./configure --prefix=/usr
  make
  make DESTDIR="$startdir/pkg/" install
}
md5sums=('c152ff65900af639d3a684265c8a2fdc')
