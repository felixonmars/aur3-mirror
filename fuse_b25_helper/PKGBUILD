# Maintainer: Benjamin M. <benmoran56@gmail.com>
pkgname=fuse_b25_helper
pkgver=0.9
pkgrel=1
pkgdesc='Helper script and systemd unit file for automatically managing virtual fuse_b25 devices.'
arch=('any')
url='http://github.com/benmoran56/fuse_b25_helper'
license=('GPL')
makedepends=('git')
depends=('python3' 'fuse_b25')
provides=('fuse_b25_helper')
source=('git://github.com/benmoran56/fuse_b25_helper.git')
md5sums=('SKIP')

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/etc/systemd/system/
  install -m 0755 $srcdir/fuse_b25_helper/fuse_b25_helper.py $pkgdir/usr/bin
  install $srcdir/fuse_b25_helper/fuse_b25_helper.service $pkgdir/etc/systemd/system/fuse_b25_helper.service
}

