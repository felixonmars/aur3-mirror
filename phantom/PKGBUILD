# Maintainer: Angel Velasquez <angvp@archlinux.org>  
# Contributor: Vsevolod Balashov <vsevolod@balashov.name>, Kevin Zuber <uKev@knet.eu>
pkgname=phantom
pkgver=r30.2011.09.12.181357
_realver=r30-2011-09-12-181357
pkgrel=1
pkgdesc="System for generic, decentralized, unstoppable internet anonymity"
arch=(i686 x86_64)
url="http://code.google.com/p/phantom/"
license=(HESSLA)
depends=(libxml2 openssl protobuf protobuf-c)
source=(http://$pkgname.googlecode.com/files/$pkgname-$_realver.tar.gz)
md5sums=('be6bc864241a59d6f407d56352e6bf82' )

build() {
  cd $srcdir/$pkgname/protos
  ./generate_protos.sh
  cd $srcdir/$pkgname/src
  make
}

package() {
  cd $srcdir/$pkgname/src
  mkdir -p $pkgdir/usr/bin
  install -Dm755 phantom $pkgdir/usr/bin/phantom
  install -Dm755 phantomd $pkgdir/usr/bin/phantomd
}
