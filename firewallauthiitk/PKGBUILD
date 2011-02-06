# Contributor: Praneeth Bodduluri <lifeeth at gmail dot com>

pkgname=firewallauthiitk
pkgver=0.1
pkgrel=1
pkgdesc="Firewall authentication scripts for IIT Kanpur"
arch=('i686' 'x86_64')
url="http://bitbucket.org/lifeeth/firewallauth/"
license=('MIT')
depends=('python')
source=("http://bitbucket.org/lifeeth/firewallauth/downloads/firewallauthiitk-0.1.tar.gz")
md5sums=('ce6744f9d8e8991c9699891c7a788e5c')

build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/etc/$pkgname
  cp * $pkgdir/etc/$pkgname
  mkdir -p $pkgdir/etc/rc.d/
  cp initscripts/* $pkgdir/etc/rc.d/
}

