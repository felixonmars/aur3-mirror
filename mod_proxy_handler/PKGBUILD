# Maintainer: Progandy <my+archmph@progandy.de>
pkgname=mod_proxy_handler
pkgver=0.2
pkgrel=1
pkgdesc="Simple Apache 2.4+ module providing Set/AddHandler support for mod_proxy"
arch=(x86_64 i686 armv6h)
url="https://gist.github.com/progandy/6ed4eeea60f6277c3e39/"
license=('Apache')
depends=("apache>=2.4")
makedepends=(libtool)
install=proxy_handler.install
source=("https://gist.githubusercontent.com/progandy/6ed4eeea60f6277c3e39/raw/5762a2542a18cd41ed6694bb0c4bd13109b649ad/mod_proxy_handler.c")

build() {
  cd "$srcdir"

  apxs -c -o mod_proxy_handler.so -c *.c
}

package() {
  cd "$srcdir"

  install -d "${pkgdir}/usr/lib/httpd/modules"
  libtool --mode=install cp mod_proxy_handler.la "${pkgdir}/usr/lib/httpd/modules"
}

# vim:set ts=2 sw=2 et:
md5sums=('173c6249fea4816862fc49b02b0044f9')
