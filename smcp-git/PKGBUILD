# Maintainer: Clément Guérin <geecko.dev@free.fr>

pkgname=smcp-git
pkgver=220514
pkgrel=1
pkgdesc="A flexible CoAP stack for embedded devices and computers. draft-ietf-core-coap-13 compatible."
arch=('i686' 'x86_64')
url="https://github.com/darconeous/smcp"
license=('MIT')
makedepends=('gcc' 'git')
source=("smcp::git://github.com/darconeous/smcp.git")
md5sums=('SKIP')
options=('staticlibs')

build() {
  cd smcp

  ./bootstrap.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd smcp

  make check
}

package() {
  cd smcp

  make DESTDIR="$pkgdir" install
}
