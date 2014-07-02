# Maintainer: Márton Barthalos <barthalosmarton AT yahoo DOT com>

pkgname=sipcmd
pkgver=0
pkgrel=2
pkgdesc="Command line SIP/H.323/RTP softphone"
arch=(i686 x86_64)
url="https://github.com/tmakkonen/$pkgname"
depends=(opal)
license=('unknown')
source=("https://github.com/tmakkonen/$pkgname/archive/master.zip")
md5sums=('14bfc17b05e3ee93daaa2c0806a427e3')

build() {
  cd $srcdir/$pkgname-master
  make
}

package() {
  cd $srcdir/$pkgname-master
  install -D -m755 sipcmd $pkgdir/usr/bin/sipcmd
}
