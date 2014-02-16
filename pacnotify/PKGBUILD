# Maintainer: Stephan Seemöwe <sseemoewe@gmail.com>
pkgname=pacnotify
pkgver=0.11
pkgrel=2
pkgdesc="A script to look for updates and display them via libnotify."
arch=(any)
url="https://bitbucket.org/sseemoewe/pacnotify"
license=('GPL3')
depends=(libnotify)
source=("https://bitbucket.org/sseemoewe/$pkgname/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('dcd08d1bed7f95f3b706ad8f1190677af22cd9fd9172ffab1eed9ea81ec4c329')
package() {
	cd $srcdir/$pkgname
	make DESTDIR=${pkgdir} install
}
