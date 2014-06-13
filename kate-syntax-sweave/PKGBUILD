# Maintainer: Luigi Ranghetti <luigi.ranghetti (at) gmail.com>

pkgname=kate-syntax-sweave
pkgver=0.1
pkgrel=2
pkgdesc="Sweave syntax highlighting for KDE Katepart."
arch=('i686' 'x86_64')
url=('http://kde-files.org/content/show.php?content=165676')
license=('LGPL')
depends=('kdesdk-kate')
source=(http://kde-files.org/CONTENT/content-files/165676-sweave.xml)
md5sums=('8b146c17bd1bf64d284e0b22f9da2e5d')

build() {
        cd $srcdir
}

package() {
  install -Dm755 "$srcdir"/165676-sweave.xml "$pkgdir"/usr/share/apps/katepart/syntax/sweave.xml
}
