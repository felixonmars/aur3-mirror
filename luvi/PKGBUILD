# Maintainer: Adrian Sinclair <adrian@adrusi.com>
# Upstream URL: https://github.com/luvit/luvi

pkgname=luvi
pkgver=0.5.5
pkgrel=1
pkgdesc="A project in-between luv and luvit."
arch=('x86_64')
url="https://github.com/luvit/luvi"
license=('APACHE')
depends=('luajit' 'libuv')
source=("https://codeload.github.com/luvit/luvi-binaries/tar.gz/v$pkgver")
sha256sums=('de5ecf28a4c64e21f8f8800c7f39d36bfaf3c3be80420c36cb35554c4975c6d3')

package() {
  cd "$srcdir/luvi-binaries-$pkgver/Linux_$CARCH"
  ls
  chmod +x luvi
  mkdir -p usr/bin
  mv luvi usr/bin
  chmod -R g-w usr
  mv usr "$pkgdir"
}
