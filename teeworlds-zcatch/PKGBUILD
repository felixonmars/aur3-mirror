# Maintainer: josephgbr <rafael.f.f1@gmail.com>

# NOTE: compatible with teeworlds version 0.6.3

pkgname=teeworlds-zcatch
pkgver=0.4.8
pkgrel=1
pkgdesc="A customized server by TT <3 where only one Tee will survive"
arch=('i686' 'x86_64')
url="http://www.teeworlds.com/forum/viewtopic.php?id=7958"
license=('custom')
depends=('gcc-libs')
makedepends=('python' 'bam' 'mesa' 'unzip')
provides=('teeworlds-zcatch-server')
conflicts=('teeworlds-zcatch-server')
source=("https://github.com/Teetime/teeworlds/archive/v$pkgver.tar.gz"
        'README' 'server.sh.in' 'zcatch.cfg')
md5sums=('eaa08d15210a646046c01fe5a3f8d5a2'
         '9760f9ca9c669c6a6a78a5824759c552'
         '529146a3b13993770fa414f66c67fa26'
         'faef06e99dac762e0d3d4391a5e92b41')
build() {
  cd teeworlds-$pkgver
  bam server_release
}

package() {
  cd teeworlds-$pkgver
  install -Dm755 zcatch_srv "$pkgdir"/usr/share/$pkgname/teeworlds_srv
  install -Dm644 ../zcatch.cfg "$pkgdir"/usr/share/$pkgname/server.cfg
  install -Dm755 ../server.sh.in "$pkgdir"/usr/bin/${pkgname}_srv
  sed -i "s/@MODNAME@/$pkgname/" "$pkgdir"/usr/bin/${pkgname}_srv
  install -Dm644 license.txt "$pkgdir"/usr/share/licenses/$pkgname/license
  install -Dm644 "$srcdir/README" "$pkgdir"/usr/share/doc/$pkgname/README
}

