# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
pkgname=primax_scan
pkgver=0.93beta3
pkgrel=1
pkgdesc="The Primax Scanner Driver Project for Linux/UN*X"
arch=(i686)
url="http://primax.sourceforge.net/index.html"
license=('GPL')
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://ornellas.apanela.com/dokuwiki/_media/software:$pkgname-$pkgver.tar.gz?id=software%3Ayaprimaxgui&cache=cache")
noextract=()
md5sums=("7eab5e313b81d225754863b25dbafd2e")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  chmod +w lp.c
  sed -i 's#asm/io.h#sys/io.h#' lp.c
  sed -i 's#asm/io.h#sys/io.h#' primax_scan.c
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
