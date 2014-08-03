# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
pkgname=ext4_utils
pkgver=1.0
pkgrel=1
pkgdesc="Tools for working with ROM from Samsung Galaxy S II. This package contains the tools to convert the img-files obtained from SGS2 to img-files that can be mounted and  the script creates a new img-file 
from a specified folder that is suitable for flashing."
arch=("armv7h")
url="https://github.com/YuLaw/ext4-utils.git"
license=('Apache2')
groups=('system')
depends=()
makedepends=('gcc' 'make')
source=("ext4_utils::git+https://github.com/YuLaw/ext4-utils.git")
md5sums=("SKIP")

build() {
  cd $srcdir/$pkgname
  make || return 1
}

package() {
  mkdir -p $pkgdir/usr/bin
  install  $srcdir/$pkgname/make_ext4fs $pkgdir/usr/bin/
  install  $srcdir/$pkgname/simg2img $pkgdir/usr/bin/
  install  $srcdir/$pkgname/mkuserimg.sh $pkgdir/usr/bin/
}
