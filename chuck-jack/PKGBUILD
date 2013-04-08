# $Id: PKGBUILD 8039 2010-01-13 23:44:57Z giovanni $ Contributor: Jiri 
# Prochazka <ojirio@gmail.com> Contributor: Jeff Mickey 
# <jeff@archlinux.org> Contributor: tardo <tardo@nagi-fanboi.net>
pkgname=chuck-jack 
pkgver=1.3.1.3 
pkgrel=1
pkgdesc="Concurrent, on-the-fly audio programming language. JACK version." 
arch=(any) 
url="http://chuck.cs.princeton.edu/" 
license=('GPL') 
depends=('gcc-libs' 'libsndfile') 
optdepends=('chuck-extra: documentation and examples') 
makedepends=('bison' 'flex') 
source=(http://chuck.cs.princeton.edu/release/files/chuck-$pkgver.tgz) 

build() {
  cd $srcdir/chuck-$pkgver/src
  make linux-jack || return 1
  install -D -m 755 chuck $pkgdir/usr/bin/chuck-jack
}
md5sums=('e0d3a64b27477eb2af6375cfa50bb4d7')
