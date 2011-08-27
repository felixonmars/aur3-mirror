# Maintainer: Yejun Yang <yejunx AT gmail DOT com>
pkgname=ec2arch
pkgver=1.0
pkgrel=3
pkgdesc="Initial script for EC2"
arch=(any)
url="https://github.com/yejun/ec2arch/raw/master/ec2"
license=('BSD')
depends=(initscripts)
source=(ec2)
md5sums=('156636b587cf757fd3a938d0d2b957c2')

build() {
  cd "$srcdir"
}

package() {
  cd "$srcdir"
  install -m755 -D ec2 "$pkgdir/etc/rc.d/ec2"
}

# vim:set ts=2 sw=2 et:
