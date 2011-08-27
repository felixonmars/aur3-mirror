# Contributor: PirateJonno <j@skurvy.no-ip.org>
pkgname=dumb-autotools
_pkgname=dumb
pkgver=0.9.3
pkgrel=2
pkgdesc="An IT, XM, S3M and MOD player library"
arch=('i686' 'x86_64')
url="http://dumb.sourceforge.net/"
license=('custom:dumb')
groups=()
depends=('allegro')
makedepends=('autoconf' 'automake')
optdepends=()
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=
source=("http://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.gz" "http://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver-autotools.tar.gz")
noextract=()
md5sums=('f48da5b990aa8aa822d3b6a951baf5c2' '3e345d643060880bab7c574774c4b35b')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  
  install -D -m644 licence.txt \
    "$pkgdir/usr/share/licenses/$_pkgname/licence.txt"
  
  make DESTDIR="$pkgdir/" install
}
