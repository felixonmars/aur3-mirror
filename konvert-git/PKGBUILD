# Maintainer: wifiextender <aaron_caffrey at hotmail dot com>

pkgname=konvert-git
pkgver=12.496dd35
pkgrel=1
pkgdesc="ImageMagick alternative in python"
arch=('any')
url="https://github.com/wifiextender/konvert"
license=('GPL3')
depends=('python2-pillow' 'ghostscript' 'python2')
makedepends=('git')
source=('git+https://github.com/wifiextender/konvert.git')
md5sums=('SKIP')

package() {
  cd $srcdir

  # Program
  install -d $pkgdir/usr/bin/
  cp -rf konvert/konvert $pkgdir/usr/bin/

}

pkgver() {
  cd $srcdir/konvert
  echo $(git rev-list --count master).$(git rev-parse --short master)
}