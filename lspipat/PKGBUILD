# Submitter: perlawk
# Maintainer: perlawk

pkgname=lspipat
pkgver=0.1
pkgrel=2
pkgdesc="SNOBOL/SPITBOL Patterns for Lua."
url="http://luaforge.net/projects/lspipat"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('lua' 'spipat')
install=
source=("http://files.luaforge.net/releases/lspipat/lspipat-source/$pkgver/${pkgname}-${pkgver}.tar.gz") 

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
  make
}
 
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
md5sums=('5eab5acf13d19e9a47865c93b1810095')
