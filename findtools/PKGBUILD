# Maintainer: trile7 at gmail dot com

pkgname=findtools
pkgver=0.3.4
pkgrel=3
pkgdesc="Bash script to find files/folders and do something with the result"
arch=(any)
url=https://github.com/tri1976/bashscripts/tree/master/findtools
license=(GPL3)
depends=(coreutils bash sed)
changelog=$pkgname.readme
source=(https://raw.githubusercontent.com/tri1976/bashscripts/master/$pkgname/$pkgname
        https://raw.githubusercontent.com/tri1976/bashscripts/master/$pkgname/$pkgname.readme)
md5sums=('665290d131fab4c07113f325670079f4'
         'd3032e9ae2d9423b8ac44299582a0a12')

package() {
  mkdir -p $pkgdir/usr/bin
  install -Dm 0755 $startdir/$pkgname $pkgdir/usr/bin/$pkgname
}