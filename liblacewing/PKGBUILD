# Maintainer: James McLaughlin <jamie@lacewing-project.org>
pkgname=liblacewing
pkgver=0.3.1
pkgrel=1
pkgdesc="Cross-platform, high-level I/O library for C/C++"
arch=('i686' 'x86_64')
url="http://lacewing-project.org/"
license=('BSD')
groups=()
depends=('openssl')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://github.com/udp/lacewing/tarball/0.3.1/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=(17017d8eded2de8d1db51fb54842d1c2)

build() {
  cd "$srcdir/udp-lacewing-080fb5b"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/udp-lacewing-080fb5b"

  make DESTDIR="$pkgdir/" install

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
