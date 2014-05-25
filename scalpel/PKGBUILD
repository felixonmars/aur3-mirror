# Maintainer: Meta Mantra <m3tamantra at gmail dot com>
# Contributor: DrZaius <lou at fakeoutdoorsman dot com>
# Contributor: Adam Wolk <netprobe at gmail dot com>

pkgname=scalpel
pkgver=r2
pkgrel=4
pkgdesc="A frugal, high performance file carver"
url="https://github.com/sleuthkit/scalpel"
license=('GPL2')
depends=('tre')
source=("git+https://github.com/sleuthkit/scalpel")
md5sums=('SKIP')
arch=('i686' 'x86_64')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  sed -i 's|#define SCALPEL_DEFAULT_CONFIG_FILE "scalpel.conf"|#define SCALPEL_DEFAULT_CONFIG_FILE "/etc/scalpel/scalpel.conf"|' src/scalpel.h
}

build() {
  cd "${srcdir}/${pkgname}"
  ./bootstrap
  ./configure --with-pic --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 scalpel.conf "${pkgdir}/etc/${pkgname}/scalpel.conf"
}

