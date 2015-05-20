# Contributor: Mildred Ki'Lya <mildred.fr>
pkgname=sys-pc-tool-x64
pkgver=5.18
pkgrel=1
pkgdesc="Syride GPS tool"
arch=('x86_64')
url="https://www.syride.com/"
license=()
depends=('libcurl-gnutls')
source=(https://www.syride.com/downloads/sys-pc-tool-$pkgver-1_amd64.deb)
md5sums=('57593401bd03408766652ebb8e739551')

build() {
  cd "$srcdir"
  test -f data.tar.xz
}

package() {
  cd "$pkgdir"
  tar xf "$srcdir/data.tar.xz"
  mv lib/udev usr/lib/
  rmdir lib
}

# vim:set ts=2 sw=2 et:
