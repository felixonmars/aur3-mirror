pkgname=libeblob
pkgrel=1
pkgver=0.14.2
pkgdesc="A new DHT implementation from the author of the in-kernel distributed filesystem POHMELFS"
arch=('i686' 'x86_64')
url="http://ioremap.net/projects/libeblob"
license=('GPL')
makedepends=('make' 'gcc' 'git' 'autoconf' 'automake')
optdepends=('fcgi' 'tokyotyrant' 'libatomic' 'db')
source=("$pkgname-$pkgver::http://www.ioremap.net/cgi-bin/gitweb.cgi?p=eblob.git;a=snapshot;h=d02a45f6d294e70c5c7159e17a01293e1e9db3be;sf=tgz")
md5sums=('0c369068220fcb8a61a5d1019ca07100')

build() {
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"
  export LDFLAGS="${LDFLAGS//,--as-needed}"
  export LDFLAGS="${LDFLAGS//--as-needed}"
  cd "$srcdir/eblob-d02a45f"

  ./autogen.sh
  PYTHON_VERSION=2 ./configure --prefix=/usr
  make
  make DESTDIR="$pkgdir" install
}
