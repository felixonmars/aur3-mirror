# Maintainer: wifiextender <aaron_caffrey at hotmail dot com>

pkgname=blk
pkgver=11.f92e238
pkgrel=1
pkgdesc="Backup Like King. CLI Backup solution in python3."
arch=('any')
url="https://github.com/wifiextender/Backup-Like-King"
license=('GPL3')
depends=('python3')
makedepends=('git')
source=('git+https://github.com/wifiextender/Backup-Like-King.git')
md5sums=('SKIP')

package() {
  cd $srcdir

  # Program
  install -d $pkgdir/usr/bin/
  cp -rf Backup-Like-King/blk $pkgdir/usr/bin/
  chmod +x $pkgdir/usr/bin/blk

}

pkgver() {
  cd $srcdir/Backup-Like-King
  echo $(git rev-list --count master).$(git rev-parse --short master)
}