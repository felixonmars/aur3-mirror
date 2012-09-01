# Maintainer: <predrg@gmail.com>

pkgname=blueproxy
pkgver=1.3
pkgrel=1
pkgdesc="Blueproxy is a simple proxy server to convert Bluetooth RFCOMM connections into TCP connections."
url="http://anil.recoil.org/projects/blueproxy.html"
arch=('x86_64' 'i686')
license=('MIT')
depends=('bluez')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=''
source=("http://anil.recoil.org/projects/${pkgname}-${pkgver}.tar.gz")
md5sums=('bac65859ddc54efb11767ea835d9c40d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/"{bin,man/man1}
  make prefix="${pkgdir}/usr" install
  for f in AUTHORS README; do
      install -Dm644 $f "$pkgdir/usr/share/doc/$pkgname/$f"
  done
}
