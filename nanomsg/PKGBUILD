# Maintainer: KokaKiwi <admin@kokaelkiwi.eu>
# Contributor: James Bulmer <nekinie@gmail.com>

pkgname="nanomsg"
pkgver=0.5
pkgrel=1
pkgdesc="A socket library that provides several common communication patterns"
arch=("i686" "x86_64")
url="http://nanomsg.org/"
license=("MIT")
depends=("glibc")

makedepends=(
  "asciidoc"
  "xmlto"
)

source=("http://download.nanomsg.org/nanomsg-${pkgver}-beta.tar.gz")
md5sums=("65a79eabfc33e7a55e2293e12c367f73")

build() {
  cd "${srcdir}/nanomsg-${pkgver}-beta/"
  ./configure --prefix="/usr" --enable-doc="yes"
  make
}

package() {
  cd "${srcdir}/nanomsg-${pkgver}-beta/"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/nanomsg-${pkgver}-beta/COPYING" "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
}
