# Maintainer: Marcin Skory <armitage at q84fh dot net>
pkgname=softvms
pkgver=1.9
pkgrel=1
pkgdesc="An emulator capable of running VMS/VMU games."
arch=('i686' 'x86_64')
url="http://mc.pp.se/dc/sw.html"
license=('unknown')
depends=('libsm' 'libice' 'libx11' 'sdl' 'glibc' 'util-linux' 'libxcb' 'libxau' 'libxdmcp')
makedepends=()
source=(http://mc.pp.se/dc/files/$pkgname.tar.gz)
md5sums=('d2728202be200ff68b2f92af9b809894')
sha1sums=('90052ac4dce049c5afd0b7068984d7041f52a3f4')
sha256sums=('d4874546ad590f42e21c7c83fb12b3733e2b33c81b1452c1d14a4e5df8860b94')
sha384sums=('43e7268155bcb99229222319d9c370af9a4268fb98f8212fbcdde76b0c990bc16dfb87cceea8edcdad587b0c85f1e3b7')
sha512sums=('413a0661a69e92ff016dfe3ae93968355171e5b060c9c1dc7d78260e15f83b479b946d42bfabf69393542b5ab0f1e6330068fe3290cbf652af8fa4b21941a10e')
install="$pkgname.install"
options=('!buildflags')

build() {
  cd "$srcdir/vms"
  ./configure --prefix=/usr
  make vms
}

package() {
  cd "$srcdir/vms"
  install -Dm755 vms $pkgdir/usr/bin/vms
}

# vim:set ts=2 sw=2 et:
