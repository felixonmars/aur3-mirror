 # $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
 # Maintainer: nobange <nobange@poczta.onet.pl>
 pkgname=kaffeine-premiere-epg-plugin
 pkgver=0.0.1
 pkgrel=1
 pkgdesc="Plugin, that grabs the EPG from Premiere 'Direkt' Channels & the Sports Feeds (Astra 19.2E - Prov. ID: 0501)."
 arch=('i686' 'x86_64')
 license=('GPL')
 url="http://mtrons.googlepages.com/kaffeine"
 depends=('kaffeine')
 makedepends=('gcc-libs')
 source=(http://mtrons.googlepages.com/$pkgname-$pkgver.zip)
 md5sums=('c92039e4f73cdca4e8cfc3c12b021dad')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make prefix=$startdir/pkg/opt/kde install
}